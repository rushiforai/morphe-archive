package dev.utaa.linimal.patches.features.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val INITIALIZER_PACKAGE = "Lcom/linecorp/line/square/ad/impl/initializer/"
private const val BASE_CHAT_FACTORY = "${INITIALIZER_PACKAGE}SquareBaseChatAdInitializerFactory;"

/** 上部広告の 4 実装（トーク、スレッドのトーク、スレッドホーム、ノート）の Factory。 */
private val HEADER_AD_FACTORIES = listOf(
    BASE_CHAT_FACTORY,
    "${INITIALIZER_PACKAGE}SquareThreadChatAdInitializerFactory;",
    "${INITIALIZER_PACKAGE}SquareThreadHomeAdInitializerFactory;",
    "${INITIALIZER_PACKAGE}SquareNoteAdInitializerFactory;",
)
private val AD_TYPE_VALUES = setOf("LAD", "GOOGLE", "NONE")
private const val VIEW_STUB = "Landroid/view/ViewStub;"
private const val HOOK = "Ldev/utaa/linimal/extension/features/SquareAdsHooks;->shouldSuppressAds()Z"
private const val TYPE_GATE_LABEL = "linimal_square_ad_type_official"
private const val EMBEDDED_GATE_LABEL = "linimal_square_ad_embedded_official"

/** 型の決定（1 件）と埋め込み広告の入口（1 件）。 */
internal const val SQUARE_ADS_TARGET_COUNT = 2

/**
 * オープンチャットの広告をまとめて表示しないようにします。
 *
 * <p>上部の広告（トーク、スレッドのトーク、スレッドホーム、ノート一覧・お知らせ一覧・ノート詳細）は、
 * どれも広告の種類（LAD / GOOGLE / NONE）を決める 1 つの method を通り、NONE なら広告枠を作らずに
 * 終わります。設定 ON のときはこの method が NONE を返すようにします。トークのメッセージ一覧に挟まる
 * 埋め込み広告は別の入口から作られるため、その入口を設定 ON のときだけ何もせず返します。</p>
 *
 * <p>どちらも広告枠を作る前で止めるので、その枠の広告の読み込みは始まりません。ホーム広告と同じく
 * 通信の遮断ではなく、枠を作らない段階で止めています。</p>
 */
val squareAdsPatch = bytecodePatch(
    name = "Hide OpenChat ads",
    description = "オープンチャットのトーク、スレッド、ノートの広告を表示しないようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(smartChannelAdsPatch)

    execute {
        val ids = listOf(PatchId.SQUARE_ADS_TYPE_GATE, PatchId.SQUARE_ADS_EMBEDDED_GATE)
        val implementations = HEADER_AD_FACTORIES.map { factory ->
            classDefByOrNull(factory)?.let(::createdComponentType)?.let { classDefByOrNull(it) }
        }
        val found = implementations.count { it != null }
        if (found != HEADER_AD_FACTORIES.size) {
            recordUnappliedFeatureStatus(ids, SQUARE_ADS_TARGET_COUNT, found.coerceAtMost(1), "SquareAdsImplementationNotFound")
            return@execute
        }
        val baseChat = implementations.first()!!

        // 型の決定 method は、トークの実装が呼ぶ「Enum を返す 3 引数の invoke-virtual」1 件です。
        val typeGateCall = adTypeCall(baseChat.methods.flatMap { it.instructionList() })
        // 4 実装の中で、それぞれがこの method を 1 回ずつ呼ぶことを確かめます（4 実装の外の呼び出しは数えません）。
        val callCounts = implementations.map { impl ->
            impl!!.methods.sumOf { method -> method.instructionList().count { it.invokes(typeGateCall) } }
        }
        val adType = typeGateCall?.let { adTypeAfterCall(baseChat, it) }
        if (typeGateCall == null || callCounts.any { it != 1 } || adType == null ||
            !isAdTypeEnum(classDefByOrNull(adType))
        ) {
            recordUnsafeFeatureStatus(ids, SQUARE_ADS_TARGET_COUNT, SQUARE_ADS_TARGET_COUNT, "SquareAdsTypeGateNotFound")
            return@execute
        }

        // override されると、サブクラス経由の呼び出しに注入が効かなくなるため、final の method に限ります。
        val typeGateClass = mutableClassDefByOrNull(typeGateCall.definingClass)
        val typeGate = typeGateClass?.methods?.singleOrNull { it.matches(typeGateCall) }
            ?.takeIf { isNotOverridable(it, typeGateClass.accessFlags) }
        val embedded = mutableClassDefByOrNull(baseChat.type)?.methods?.singleOrNull(::isEmbeddedAdEntry)
        val typeGateRegister = typeGate?.let(::earlyReturnRegister)
        val embeddedRegister = embedded?.let(::earlyReturnRegister)
        if (typeGate == null || embedded == null || typeGateRegister == null || embeddedRegister == null ||
            !isSafeInjectionIndex(typeGate.implementation, 0) || !isSafeInjectionIndex(embedded.implementation, 0)
        ) {
            recordUnsafeFeatureStatus(ids, SQUARE_ADS_TARGET_COUNT, SQUARE_ADS_TARGET_COUNT, "SquareAdsShapeMismatch")
            return@execute
        }

        injectAdTypeGate(typeGate, typeGateRegister, adType)
        injectEmbeddedGate(embedded, embeddedRegister)
        ids.forEach { id ->
            patchStatusCollector.record(
                patchId = id,
                expectedTargetCount = SQUARE_ADS_TARGET_COUNT,
                actualTargetCount = SQUARE_ADS_TARGET_COUNT,
                reason = "SquareAdsGuarded",
            )
        }
    }
}

/** 設定 ON なら広告の種類として NONE を返します。OFF なら元の判定へ進みます。 */
internal fun injectAdTypeGate(method: MutableMethod, register: Int, adType: String) {
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $HOOK
            move-result v$register
            if-eqz v$register, :$TYPE_GATE_LABEL
            sget-object v$register, $adType->NONE:$adType
            return-object v$register
        """.trimIndent(),
        ExternalLabel(TYPE_GATE_LABEL, method.getInstruction(0)),
    )
}

/** 設定 ON なら埋め込み広告の枠を作らずに返ります。OFF なら元の処理へ進みます。 */
internal fun injectEmbeddedGate(method: MutableMethod, register: Int) {
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $HOOK
            move-result v$register
            if-eqz v$register, :$EMBEDDED_GATE_LABEL
            return-void
        """.trimIndent(),
        ExternalLabel(EMBEDDED_GATE_LABEL, method.getInstruction(0)),
    )
}

/** Factory の `createComponent`（bridge でない方）が生成する唯一の型。 */
internal fun createdComponentType(factory: ClassDef): String? =
    factory.methods
        .filter { it.name == "createComponent" && it.returnType != "Ljava/lang/Object;" }
        .singleOrNull()
        ?.instructionList()
        ?.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)
                ?.takeIf { instruction.opcode == Opcode.NEW_INSTANCE }
                ?.type
        }
        ?.singleOrNull()

/** 広告の種類を返す呼び出し。`(場所, String, Continuation) -> Enum` の invoke-virtual が 1 件だけなら、その参照。 */
internal fun adTypeCall(instructions: List<Instruction>): MethodReference? =
    instructions.mapNotNull { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.takeIf {
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                it.returnType == "Ljava/lang/Enum;" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[1].toString() == "Ljava/lang/String;"
        }
    }.distinct().singleOrNull()

/** method そのものか、それを持つ class が final なら、override されない。 */
internal fun isNotOverridable(method: Method, classAccessFlags: Int): Boolean =
    AccessFlags.FINAL.isSet(method.accessFlags) || AccessFlags.FINAL.isSet(classAccessFlags)

/** 呼び出し結果を、呼び出しのあとで最初に check-cast している型。広告の種類の enum です。 */
internal fun adTypeAfterCall(owner: ClassDef, call: MethodReference): String? =
    owner.methods.mapNotNull { method ->
        val instructions = method.instructionList()
        val callIndex = instructions.indexOfFirst { it.invokes(call) }
        if (callIndex < 0) return@mapNotNull null
        instructions.drop(callIndex + 1)
            .firstOrNull { it.opcode == Opcode.CHECK_CAST }
            ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }
    }.singleOrNull()

/** enum 定数が LAD / GOOGLE / NONE のちょうど 3 つである enum かどうか。 */
internal fun isAdTypeEnum(classDef: ClassDef?): Boolean {
    if (classDef == null || !AccessFlags.ENUM.isSet(classDef.accessFlags)) return false
    val constants = classDef.staticFields
        .filter { AccessFlags.ENUM.isSet(it.accessFlags) && it.type == classDef.type }
        .map { it.name }
        .toSet()
    return constants == AD_TYPE_VALUES
}

/** 埋め込み広告の入口。ViewStub を受け取る、戻り値なしの instance method です。 */
internal fun isEmbeddedAdEntry(method: Method): Boolean =
    method.returnType == "V" &&
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.name != "<init>" &&
        method.parameterTypes.any { it.toString() == VIEW_STUB }

/**
 * 先頭へ早期 return を挿入するときに hook の結果を置く register。
 *
 * <p>method の入口では引数以外の register は未初期化で、元の命令列は書き込む前に読むことができません
 * （verifier が拒否します）。先頭が分岐先でないことは [isSafeInjectionIndex] で確かめるので、
 * 引数でない v0 を一時的に使っても元の処理は壊れません。引数以外の register が 1 つ以上あれば 0（v0）を、
 * なければ null を返します。v0 は `if-eqz` などの 4 bit の encoding に必ず収まります。</p>
 */
internal fun earlyReturnRegister(method: Method): Int? {
    val implementation = method.implementation ?: return null
    val parameterRegisters = method.parameterTypes.sumOf { type ->
        if (type.toString() == "J" || type.toString() == "D") 2 else 1
    } + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    val localCount = implementation.registerCount - parameterRegisters
    return if (localCount >= 1) 0 else null
}

private fun Method.instructionList(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Method.matches(ref: MethodReference): Boolean =
    name == ref.name &&
        returnType == ref.returnType &&
        parameterTypes.map { it.toString() } == ref.parameterTypes.map { it.toString() }

private fun Instruction.invokes(ref: MethodReference?): Boolean {
    if (ref == null) return false
    val target = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return target.definingClass == ref.definingClass && target.name == ref.name &&
        target.returnType == ref.returnType &&
        target.parameterTypes.map { it.toString() } == ref.parameterTypes.map { it.toString() }
}
