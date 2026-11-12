package dev.utaa.linimal.patches.features.readers

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.literal
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.utaa.linimal.patches.features.googleauth.googleAuthFailureDiagnosticsPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses

private const val EXTENSION_PACKAGE = "Ldev/utaa/linimal/extension/features/readers"
private const val BRIDGE_TYPE = "$EXTENSION_PACKAGE/ReadReceiptReadersBridge;"
private const val HOOKS_TYPE = "$EXTENSION_PACKAGE/ReadReceiptReadersHooks;"
private const val CONTEXT = "Landroid/content/Context;"

private const val HOOK_READ_COUNT_BOUND =
    "$HOOKS_TYPE->onReadCountBound($TEXT_VIEW$STRING${"J"}$STRING)$VOID"
private const val HOOK_CONTEXT_MENU_BUILT =
    "$HOOKS_TYPE->onContextMenuBuilt($OBJECT$OBJECT$STRING${"J"}$STRING)$VOID"

private const val HOOK_MESSAGE_BOUND =
    "$HOOKS_TYPE->onMessageBound($TEXT_VIEW$STRING${"J"}$STRING$BOOLEAN)$VOID"

private const val BRIDGE_READ_COUNT_BOUND = "onReadCountBound"
private const val BRIDGE_MESSAGE_BOUND = "onMessageBound"

/** 行の時刻表示 `chat_ui_row_timestamp` の 26.16.0 の ID。行の view 群の constructor が holder に包みます。 */
private const val ROW_TIMESTAMP_ID = 0x7f0b0864
private const val BRIDGE_CONTEXT_MENU_BUILT = "onContextMenuBuilt"
/** extension の `ReadReceiptReadersBridge.OWN_MID_METHOD_NAME` と一致させます。 */
private const val BRIDGE_OWN_MID = "myMid"
/** extension の `ReadReceiptReadersBridge.SYNC_METHOD_NAME` と一致させます。 */
private const val BRIDGE_SYNC_READ_RANGE = "syncReadRange"

/**
 * 長押しメニューの layout。`chat_ui_message_context_menu_content` / `_row` / `_item` の 26.16.0 の ID で、
 * 3 つを同じメソッドで inflate するのはメニューを組み立てる 1 か所だけです。
 */
private const val CONTEXT_MENU_CONTENT_LAYOUT = 0x7f0e0154
private const val CONTEXT_MENU_ITEM_LAYOUT = 0x7f0e0155
private const val CONTEXT_MENU_ROW_LAYOUT = 0x7f0e0156

/** ReadCountManager が全トークの既読範囲を同期する coroutine の DebugMetadata。 */
private const val READ_RANGE_SYNC_SOURCE =
    "jp.naver.line.android.readcount.ReadCountManager\$syncAllNonOpenChatReadCounts\$2"

/** ReadCountManager を保持する DataManagerHolder の生成元。factory の class 名は文字列で残ります。 */
private const val DATA_MANAGER_HOLDER_FACTORY = "jp.naver.line.android.DataManagerHolderFactory"

private const val FULL_SYNC = "FULL_SYNC"

private val ROW_BIND_PATCH_IDS = listOf(
    PatchId.READ_RECEIPT_READERS_ICONS_ROW_BIND,
    PatchId.READ_RECEIPT_READERS_TAP_ROW_BIND,
)
private val MESSAGE_BIND_PATCH_IDS = listOf(
    PatchId.READ_RECEIPT_READERS_OTHERS_COUNT_MESSAGE_BIND,
    PatchId.READ_RECEIPT_READERS_OTHERS_ICONS_MESSAGE_BIND,
)
private val CONTEXT_MENU_PATCH_IDS = listOf(PatchId.READ_RECEIPT_READERS_CONTEXT_MENU)
private val SERVER_SYNC_PATCH_IDS = listOf(PatchId.READ_RECEIPT_READERS_SERVER_SYNC)

/** `ChatMessageCommonViewData.toString()`。chat ID・server message ID・送信者を読む field の出所です。 */
private val messageCommonToStringFingerprint = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(MESSAGE_COMMON_MARKER, SERVER_MESSAGE_ID_MARKER, SENDER_MID_MARKER),
)

/** 自分のアカウントの Profile。`toString()` の marker から mid の field を求めます。 */
private val profileToStringFingerprint = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(PROFILE_MARKER, PROFILE_MID_MARKER),
)

/** 既読ラベルに文言を入れる bind。非難読化の `isReadCountRequired()` と TextView の setText を両方持ちます。 */
private val readCountBindFingerprint = Fingerprint(
    returnType = VOID,
    filters = listOf(
        app.morphe.patcher.methodCall(
            name = READ_COUNT_REQUIRED_METHOD,
            returnType = BOOLEAN,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        app.morphe.patcher.methodCall(
            definingClass = TEXT_VIEW,
            name = "setText",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

/** 時刻の TextView を holder に包む、行の view 群の constructor の候補。 */
private val rowTimestampHolderFingerprint = Fingerprint(
    name = "<init>",
    filters = listOf(literal(ROW_TIMESTAMP_ID)),
)

/** 長押しメニューの格子を組み立てるメソッド。 */
private val contextMenuBuildFingerprint = Fingerprint(
    returnType = VOID,
    filters = listOf(
        literal(CONTEXT_MENU_CONTENT_LAYOUT),
        literal(CONTEXT_MENU_ROW_LAYOUT),
        literal(CONTEXT_MENU_ITEM_LAYOUT),
    ),
)

/** 全トークの既読範囲を同期する coroutine 本体。 */
private val readRangeSyncFingerprint = Fingerprint(
    name = "invokeSuspend",
    custom = { _, classDef -> hasDebugMetadataSource(classDef, READ_RANGE_SYNC_SOURCE) },
)

/** DataManagerHolder を factory から作る singleton key の生成メソッド。 */
private val dataManagerHolderKeyFingerprint = Fingerprint(
    parameters = listOf(CONTEXT),
    strings = listOf(DATA_MANAGER_HOLDER_FACTORY),
)

/**
 * グループと複数人トークで、メッセージを読んだメンバーを表示するための入口を用意します。
 *
 * <h2>既読者のデータ</h2>
 * <p>LINE は NOTIFIED_READ_MESSAGE と getMessageReadRange で受け取ったメンバーごとの既読範囲を
 * `read_notification` DB に保存し、「既読 N」はその範囲を数えて出しています。extension はこの記録を
 * 読み取り専用で参照します。この patch が行うのは、表示の入口の注入と、1 トーク分の同期の呼び出し口の生成だけです。</p>
 *
 * <h2>注入</h2>
 * <ul>
 *   <li>既読ラベルの bind: LINE が文言と表示状態を決めた直後（表示・非表示の両経路）。</li>
 *   <li>長押しメニュー: 格子を組み立て終え、配色を当てる直前。</li>
 *   <li>同期: ReadCountManager が全トークへ行う同期と同じメソッドを、1 トークだけ呼ぶ static method を
 *       extension の器へ生成。</li>
 * </ul>
 * <p>どれも形が一致しない場合は注入せず、その feature を設定画面で利用不可にします。</p>
 */
val readReceiptReadersPatch = bytecodePatch(
    name = "Group readers",
    description = "グループと複数人トークで、メッセージを読んだメンバーを実行時設定で表示できるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch の後段に noOpProbePatch が続きます。
    dependsOn(googleAuthFailureDiagnosticsPatch)

    execute {
        val bridge = mutableClassDefByOrNull(BRIDGE_TYPE)
        if (bridge == null) {
            val ids = ROW_BIND_PATCH_IDS + MESSAGE_BIND_PATCH_IDS + CONTEXT_MENU_PATCH_IDS + SERVER_SYNC_PATCH_IDS
            recordUnsafeFeatureStatus(ids, 1, 1, "ReadReceiptReadersBridgeMissing")
            return@execute
        }

        val messageMatches = messageCommonToStringFingerprint.matchAllOrNull().orEmpty()
        val message = messageMatches.singleOrNull()?.let { match ->
            messageFieldsFromToString(
                match.originalClassDef.type,
                match.originalMethod.implementation?.instructions?.toList().orEmpty(),
            )
        }

        // 入口への注入は既読ラベルの注入より先に行い、同じメソッドの index を互いにずらさないようにします。
        applyMessageBind(bridge, message, messageMatches.size)
        applyRowBind(bridge, message, messageMatches.size)
        applyContextMenu(bridge, message, messageMatches.size)
        applyServerSync(bridge)
        applyOwnMid(bridge)
    }
}

private fun BytecodePatchContext.applyRowBind(bridge: MutableClass, message: MessageFields?, messageCount: Int) {
    if (message == null) {
        recordUnappliedFeatureStatus(ROW_BIND_PATCH_IDS, 1, messageCount, "ReadersRowFieldsNotResolved")
        return
    }
    val matches = readCountBindFingerprint.matchAllOrNull().orEmpty()
    val match = matches.singleOrNull()
    if (match == null) {
        recordUnappliedFeatureStatus(ROW_BIND_PATCH_IDS, 1, matches.size, "ReadersReadCountBindNotUnique")
        return
    }
    val implementation = match.method.implementation
    val instructions = implementation?.instructions?.toList().orEmpty()
    val shape = implementation?.let { readCountBindShape(instructions, exceptionHandlerAddresses(it)) }
    val getter = shape?.let { messageCommonGetter(instructions, it.messageHolderType, message.type) }
    if (shape == null || getter == null) {
        recordUnsafeFeatureStatus(ROW_BIND_PATCH_IDS, 1, 1, "ReadersReadCountBindShapeMismatch")
        return
    }

    val bridgeDescriptor = "($TEXT_VIEW${shape.messageHolderType})$VOID"
    val method = newStaticMethod(
        bridge.type,
        BRIDGE_READ_COUNT_BOUND,
        listOf(TEXT_VIEW, shape.messageHolderType),
        VOID,
        registerCount = 7,
    )
    // v5 = label, v6 = メッセージの view data。
    method.addInstructions(
        0,
        """
            invoke-virtual/range { v6 .. v6 }, ${getter.smali()}
            move-result-object v0
            iget-object v1, v0, ${message.chatId.smali()}
            iget-wide v2, v0, ${message.serverMessageId.smali()}
            iget-object v4, v0, ${message.senderMid.smali()}
            invoke-static { v5, v1, v2, v3, v4 }, $HOOK_READ_COUNT_BOUND
            return-void
        """.trimIndent(),
    )
    bridge.addReadersMethod(method)

    val call = "invoke-static { v${shape.labelRegister}, v${shape.messageRegister} }, " +
        "$BRIDGE_TYPE->$BRIDGE_READ_COUNT_BOUND$bridgeDescriptor"
    // 後ろの位置から入れ、先に入れた命令で前の index がずれないようにします。
    match.method.addInstructions(shape.hiddenInjectionIndex, call)
    match.method.addInstructions(shape.shownInjectionIndex, call)

    recordFeatureStatus(ROW_BIND_PATCH_IDS, 1, 1, "ReadersReadCountBindInjected")
}

/**
 * 受信行を含むすべての行の bind 入口から、時刻の TextView とメッセージを extension へ渡します。
 * 他人のメッセージにだけ、時刻の上へ既読数・既読者のアイコンを描くために使います。
 */
private fun BytecodePatchContext.applyMessageBind(bridge: MutableClass, message: MessageFields?, messageCount: Int) {
    val otherUser = message?.isOtherUserMessage
    if (message == null || otherUser == null) {
        recordUnappliedFeatureStatus(MESSAGE_BIND_PATCH_IDS, 1, messageCount, "ReadersRowFieldsNotResolved")
        return
    }
    val matches = readCountBindFingerprint.matchAllOrNull().orEmpty()
    val match = matches.singleOrNull()
    if (match == null) {
        recordUnappliedFeatureStatus(MESSAGE_BIND_PATCH_IDS, 1, matches.size, "ReadersRowEntryNotUnique")
        return
    }
    val method = match.method
    val implementation = method.implementation
    val instructions = implementation?.instructions?.toList().orEmpty()
    val readCount = implementation?.let { readCountBindShape(instructions, exceptionHandlerAddresses(it)) }
    val getter = readCount?.let { messageCommonGetter(instructions, it.messageHolderType, message.type) }
    if (implementation == null || readCount == null || getter == null) {
        recordUnsafeFeatureStatus(MESSAGE_BIND_PATCH_IDS, 1, 1, "ReadersRowEntryShapeMismatch")
        return
    }

    val holders = rowTimestampHolderFingerprint.matchAllOrNull().orEmpty().mapNotNull { candidate ->
        timestampHolder(
            candidate.originalMethod.implementation?.instructions?.toList().orEmpty(),
            ROW_TIMESTAMP_ID,
        ) { holderType ->
            classDefByOrNull(holderType)?.fields
                ?.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == TEXT_VIEW }
                ?.singleOrNull()
        }
    }
    val parameterTypes = method.parameterTypes.map(CharSequence::toString)
    val resolved = holders.mapNotNull { holder ->
        messageBindEntryShape(
            definingClass = method.definingClass,
            isStatic = AccessFlags.STATIC.isSet(method.accessFlags),
            parameterTypes = parameterTypes,
            registerCount = implementation.registerCount,
            instructions = instructions,
            messageHolderType = readCount.messageHolderType,
            viewsOwnerType = holder.ownerType,
            handlerAddresses = exceptionHandlerAddresses(implementation),
        )?.let { holder to it }
    }.distinctBy { (holder, _) -> holder.holderField.smali() }
    val (holder, entry) = resolved.singleOrNull() ?: run {
        recordUnappliedFeatureStatus(MESSAGE_BIND_PATCH_IDS, 1, resolved.size, "ReadersTimestampHolderNotUnique")
        return
    }

    val holderParameterIndex = entry.parameterTypes.size - 1
    val locals = 6
    val bridgeMethod = newStaticMethod(
        bridge.type,
        BRIDGE_MESSAGE_BOUND,
        entry.parameterTypes,
        VOID,
        registerCount = locals + entry.parameterTypes.size,
    )
    val self = locals
    val messageHolder = locals + holderParameterIndex
    // v0 = 時刻、v1 = chat ID、v2-v3 = server ID、v4 = 送信者、v5 = 他人のメッセージか。
    bridgeMethod.addInstructionsWithLabels(
        0,
        """
            invoke-virtual/range { v$messageHolder .. v$messageHolder }, ${getter.smali()}
            move-result-object v5
            iget-object v1, v5, ${message.chatId.smali()}
            iget-wide v2, v5, ${message.serverMessageId.smali()}
            iget-object v4, v5, ${message.senderMid.smali()}
            iget-boolean v5, v5, ${otherUser.smali()}
            invoke-virtual/range { v$self .. v$self }, ${entry.viewsGetter.smali()}
            move-result-object v0
            if-eqz v0, :linimalReadersNoViews
            iget-object v0, v0, ${holder.holderField.smali()}
            if-eqz v0, :linimalReadersNoViews
            iget-object v0, v0, ${holder.textField.smali()}
            invoke-static/range { v0 .. v5 }, $HOOK_MESSAGE_BOUND
            :linimalReadersNoViews
            return-void
        """.trimIndent(),
    )
    bridge.addReadersMethod(bridgeMethod)

    val descriptor = "(${entry.parameterTypes.joinToString("")})$VOID"
    method.addInstructions(
        0,
        "invoke-static/range { v${entry.firstRegister} .. v${entry.lastRegister} }, " +
            "$BRIDGE_TYPE->$BRIDGE_MESSAGE_BOUND$descriptor",
    )
    recordFeatureStatus(MESSAGE_BIND_PATCH_IDS, 1, 1, "ReadersRowEntryInjected")
}

private fun BytecodePatchContext.applyContextMenu(bridge: MutableClass, message: MessageFields?, messageCount: Int) {
    if (message == null) {
        recordUnappliedFeatureStatus(CONTEXT_MENU_PATCH_IDS, 1, messageCount, "ReadersRowFieldsNotResolved")
        return
    }
    val matches = contextMenuBuildFingerprint.matchAllOrNull().orEmpty()
    val match = matches.singleOrNull()
    if (match == null) {
        recordUnappliedFeatureStatus(CONTEXT_MENU_PATCH_IDS, 1, matches.size, "ReadersContextMenuNotUnique")
        return
    }
    val method = match.method
    val implementation = method.implementation
    val instructions = implementation?.instructions?.toList().orEmpty()
    val shape = implementation?.let {
        contextMenuShape(instructions, exceptionHandlerAddresses(it)) { type ->
            classDefByOrNull(type)?.interfaces?.contains(DIALOG_INTERFACE) == true
        }
    }
    val params = contextMenuParams(method, message.type)
    if (shape == null || params == null || implementation == null) {
        recordUnsafeFeatureStatus(CONTEXT_MENU_PATCH_IDS, 1, 1, "ReadersContextMenuShapeMismatch")
        return
    }
    val parameterRegister = parameterRegister(method, implementation.registerCount, params.parameterIndex)
    if (
        parameterRegister == null ||
        !dev.utaa.linimal.patches.util.registerSurvivesBetween(
            instructions, parameterRegister, -1, shape.injectionIndex,
        )
    ) {
        recordUnsafeFeatureStatus(CONTEXT_MENU_PATCH_IDS, 1, 1, "ReadersContextMenuParameterOverwritten")
        return
    }

    val bridgeDescriptor = "($VIEW${params.paramsType}$OBJECT)$VOID"
    val bridgeMethod = newStaticMethod(
        bridge.type,
        BRIDGE_CONTEXT_MENU_BUILT,
        listOf(VIEW, params.paramsType, OBJECT),
        VOID,
        registerCount = 9,
    )
    // v6 = 格子の container、v7 = メニューの引数、v8 = メニュー本体。
    bridgeMethod.addInstructions(
        0,
        """
            iget-object v0, v7, ${params.viewDataField.smali()}
            iget-object v0, v0, ${params.messageField.smali()}
            iget-object v2, v0, ${message.chatId.smali()}
            iget-wide v3, v0, ${message.serverMessageId.smali()}
            iget-object v5, v0, ${message.senderMid.smali()}
            move-object v0, v6
            move-object v1, v8
            invoke-static/range { v0 .. v5 }, $HOOK_CONTEXT_MENU_BUILT
            return-void
        """.trimIndent(),
    )
    bridge.addReadersMethod(bridgeMethod)

    method.addInstructions(
        shape.injectionIndex,
        """
            move-object/from16 v${shape.scratchRegister}, v$parameterRegister
            invoke-static { v${shape.containerRegister}, v${shape.scratchRegister}, v${shape.dialogRegister} }, $BRIDGE_TYPE->$BRIDGE_CONTEXT_MENU_BUILT$bridgeDescriptor
        """.trimIndent(),
    )
    recordFeatureStatus(CONTEXT_MENU_PATCH_IDS, 1, 1, "ReadersContextMenuInjected")
}

private fun BytecodePatchContext.applyServerSync(bridge: MutableClass) {
    val syncMatches = readRangeSyncFingerprint.matchAllOrNull().orEmpty()
    val syncMatch = syncMatches.singleOrNull()
    if (syncMatch == null) {
        recordUnappliedFeatureStatus(SERVER_SYNC_PATCH_IDS, 1, syncMatches.size, "ReadersSyncCoroutineNotUnique")
        return
    }
    val sync = readRangeSyncShape(syncMatch.originalMethod.implementation?.instructions?.toList().orEmpty())
    val fullSync = sync?.let { shape ->
        classDefByOrNull(shape.reasonType)?.fields?.singleOrNull {
            it.name == FULL_SYNC && it.type == shape.reasonType && AccessFlags.STATIC.isSet(it.accessFlags)
        }
    }
    if (sync == null || fullSync == null) {
        recordUnsafeFeatureStatus(SERVER_SYNC_PATCH_IDS, 1, 1, "ReadersSyncShapeMismatch")
        return
    }

    val keyMatches = dataManagerHolderKeyFingerprint.matchAllOrNull().orEmpty()
    val keyMatch = keyMatches.singleOrNull()
    if (keyMatch == null) {
        recordUnappliedFeatureStatus(SERVER_SYNC_PATCH_IDS, 1, keyMatches.size, "ReadersDataManagerHolderNotUnique")
        return
    }
    val keyType = keyMatch.originalClassDef.type
    val keySuperType = keyMatch.originalClassDef.superclass
    // key の生成メソッドは generic のため戻り値が Object に消去されます。holder は、key を static field に
    // 持つ interface として特定します。
    val holders = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (
            AccessFlags.INTERFACE.isSet(classDef.accessFlags) &&
            classDef.fields.any { it.type == keyType && AccessFlags.STATIC.isSet(it.accessFlags) }
        ) {
            holders += classDef
        }
    }
    val holder = holders.singleOrNull()
    val holderType = holder?.type ?: ""
    val keyField = holder?.fields?.singleOrNull {
        it.type == keyType && AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val managerGetter = holder?.methods?.singleOrNull {
        it.returnType == sync.managerType && it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    if (
        holder == null || keySuperType == null || keyField == null || managerGetter == null ||
        !AccessFlags.INTERFACE.isSet(holder.accessFlags)
    ) {
        recordUnsafeFeatureStatus(SERVER_SYNC_PATCH_IDS, 1, 1, "ReadersDataManagerHolderShapeMismatch")
        return
    }

    // DataManagerHolder の key を読んだ直後に呼ぶ、Context と key から singleton を引く static method。
    val lookupMatches = Fingerprint(
        filters = listOf(
            app.morphe.patcher.fieldAccess(
                definingClass = holderType,
                name = keyField.name,
                type = keyType,
                opcode = Opcode.SGET_OBJECT,
            ),
            app.morphe.patcher.methodCall(
                parameters = listOf(CONTEXT, keySuperType),
                returnType = OBJECT,
                opcode = Opcode.INVOKE_STATIC,
            ),
        ),
    ).matchAllOrNull().orEmpty()
    val lookup = lookupMatches
        .mapNotNull { methodReference(it.instructionMatches[1].instruction) }
        .filter { it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT, keySuperType) }
        .distinctBy { it.smali() }
        .singleOrNull()
    if (lookup == null) {
        recordUnappliedFeatureStatus(SERVER_SYNC_PATCH_IDS, 1, lookupMatches.size, "ReadersSingletonLookupNotUnique")
        return
    }

    val syncInvoke = if (sync.syncOpcode == Opcode.INVOKE_VIRTUAL) "invoke-virtual" else "invoke-interface"
    val method = newStaticMethod(
        bridge.type,
        BRIDGE_SYNC_READ_RANGE,
        listOf(CONTEXT, STRING),
        BOOLEAN,
        registerCount = 7,
    )
    // v5 = Context、v6 = chat ID。thrift の例外を戻り値で返すため、null のときだけ成功です。
    method.addInstructionsWithLabels(
        0,
        """
            sget-object v0, $holderType->${keyField.name}:$keyType
            invoke-static { v5, v0 }, ${lookup.smali()}
            move-result-object v0
            check-cast v0, $holderType
            invoke-interface/range { v0 .. v0 }, $holderType->${managerGetter.name}()${sync.managerType}
            move-result-object v0
            iget-object v1, v0, ${sync.synchronizerField.smali()}
            iget-object v2, v0, ${sync.databaseField.smali()}
            invoke-static/range { v6 .. v6 }, Ljava/util/Collections;->singleton($OBJECT)Ljava/util/Set;
            move-result-object v3
            sget-object v4, ${sync.reasonType}->$FULL_SYNC:${sync.reasonType}
            $syncInvoke { v1, v2, v3, v4 }, ${sync.syncMethod.smali()}
            move-result-object v0
            if-nez v0, :linimalReadersSyncFailed
            const/4 v0, 0x1
            return v0
            :linimalReadersSyncFailed
            const/4 v0, 0x0
            return v0
        """.trimIndent(),
    )
    bridge.addReadersMethod(method)
    recordFeatureStatus(SERVER_SYNC_PATCH_IDS, 1, 1, "ReadersServerSyncBridgeGenerated")
}

/**
 * 自分の mid を返す `myMid(Context)String` を生成します。LINE は Profile を暗号化して保存するため、
 * LINE 自身が使う `(Context)String` の static helper（`getProfile()` の mid をそのまま返すもの）を呼びます。
 *
 * <p>同じ helper が複数の module に重複して存在するため、形を検証したうえで名前順の先頭を使います。
 * 見つからない場合は生成せず、extension は自分の送信行から学習した mid で代用します。そのため
 * feature の可否には影響させず、status にも記録しません。</p>
 */
private fun BytecodePatchContext.applyOwnMid(bridge: MutableClass) {
    val profile = profileToStringFingerprint.matchAllOrNull().orEmpty().singleOrNull() ?: return
    val profileType = profile.originalClassDef.type
    val midField = labeledStringField(
        profileType,
        profile.originalMethod.implementation?.instructions?.toList().orEmpty(),
        PROFILE_MID_MARKER,
    ) ?: return
    val getter = Fingerprint(
        returnType = STRING,
        parameters = listOf(CONTEXT),
        filters = listOf(
            app.morphe.patcher.methodCall(
                name = GET_PROFILE_METHOD,
                returnType = profileType,
                opcode = Opcode.INVOKE_INTERFACE,
            ),
        ),
    ).matchAllOrNull().orEmpty()
        .map { it.originalMethod }
        .filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                isOwnMidGetter(method.implementation?.instructions?.toList().orEmpty(), profileType, midField)
        }
        .minByOrNull { "${it.definingClass}->${it.name}" } ?: return

    val method = newStaticMethod(bridge.type, BRIDGE_OWN_MID, listOf(CONTEXT), STRING, registerCount = 2)
    method.addInstructions(
        0,
        """
            invoke-static/range { v1 .. v1 }, ${getter.definingClass}->${getter.name}($CONTEXT)$STRING
            move-result-object v0
            return-object v0
        """.trimIndent(),
    )
    bridge.addReadersMethod(method)
}

/** メニューの引数から、メッセージの共通 view data へ届く 2 段の field。 */
private data class ContextMenuParams(
    val parameterIndex: Int,
    val paramsType: String,
    val viewDataField: com.android.tools.smali.dexlib2.iface.reference.FieldReference,
    val messageField: com.android.tools.smali.dexlib2.iface.reference.FieldReference,
)

/**
 * メニューを組み立てるメソッドの引数のうち、`<params>.<viewData>.<message>` の形でメッセージの
 * 共通 view data を持つものを 1 つだけ選びます。
 */
private fun BytecodePatchContext.contextMenuParams(method: Method, messageType: String): ContextMenuParams? {
    val candidates = method.parameterTypes.map(CharSequence::toString).withIndex().mapNotNull { (index, type) ->
        val params = classDefByOrNull(type) ?: return@mapNotNull null
        val chains = params.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.mapNotNull { viewData ->
            val holder = classDefByOrNull(viewData.type) ?: return@mapNotNull null
            val message = holder.fields.singleOrNull {
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == messageType
            } ?: return@mapNotNull null
            viewData to message
        }
        val chain = chains.singleOrNull() ?: return@mapNotNull null
        ContextMenuParams(index, type, chain.first, chain.second)
    }
    return candidates.singleOrNull()
}

/** instance method の [parameterIndex] 番目の引数が入る register。wide 型は 2 つ数えます。 */
private fun parameterRegister(method: Method, registerCount: Int, parameterIndex: Int): Int? {
    if (AccessFlags.STATIC.isSet(method.accessFlags)) {
        return null
    }
    val types = method.parameterTypes.map(CharSequence::toString)
    val widths = types.map { if (it == "J" || it == "D") 2 else 1 }
    val parameterRegisters = 1 + widths.sum()
    val offset = 1 + widths.take(parameterIndex).sum()
    return (registerCount - parameterRegisters + offset).takeIf { it >= 0 && widths[parameterIndex] == 1 }
}

private fun hasDebugMetadataSource(classDef: ClassDef, source: String): Boolean =
    classDef.annotations.any { annotation ->
        annotation.elements.any { element ->
            element.name == "c" && (element.value as? StringEncodedValue)?.value == source
        }
    }

/**
 * 空の static method を作ります。末尾の 1〜2 命令は先頭に入れる本体の後ろに残る到達しない命令で、
 * 戻り値の型と矛盾しない形にしています。
 */
private fun newStaticMethod(
    definingClass: String,
    name: String,
    parameterTypes: List<String>,
    returnType: String,
    registerCount: Int,
): MutableMethod {
    val implementation = MutableMethodImplementation(registerCount)
    if (returnType == VOID) {
        implementation.addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
    } else if (returnType.startsWith("L") || returnType.startsWith("[")) {
        implementation.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
        implementation.addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
    } else {
        implementation.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
        implementation.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
    }
    return MutableMethod(
        ImmutableMethod(
            definingClass,
            name,
            parameterTypes.map { ImmutableMethodParameter(it, null, null) },
            returnType,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            implementation,
        ),
    )
}

/** DEX writer は `directMethods` / `virtualMethods` を読むため、両方へ登録します。 */
private fun MutableClass.addReadersMethod(method: MutableMethod) {
    methods.add(method)
    directMethods.add(method)
}
