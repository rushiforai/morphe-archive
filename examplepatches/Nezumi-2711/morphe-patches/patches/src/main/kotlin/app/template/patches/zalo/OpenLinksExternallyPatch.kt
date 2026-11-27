package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.BuilderSwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val STRING = "Ljava/lang/String;"
private const val ZALO_WEB_VIEW = "Lcom/zing/zalo/ui/zviews/ZaloWebView;"
private const val BASE_ZALO_VIEW = "Lcom/zing/zalo/ui/zviews/BaseZaloView;"
private const val DIALOG_VIEW = "Lcom/zing/zalo/zview/DialogView;"
private const val CHAT_ROW = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;"
private const val OPEN_EXTERNALLY = "$EXTERNAL_LINKS->openExternally(Ljava/lang/Object;Ljava/lang/String;)Z"
private const val ORIGINAL = "nezumi_link_original"
private const val HANDLED = "nezumi_link_handled"

/** Zalo's link opener (only runtime reader of "Chọn cách mở link"): mode read, domain check, ACTION_VIEW opener. */
private object JumpLinkOpenFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", STRING, "I", STRING, "I", "Landroid/os/Bundle;"),
    filters = listOf(
        string("JUMP_LINK_MODE_SETTING_\${UserID}"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(STRING), returnType = STRING,
            location = MatchAfterImmediately()),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf("I", STRING, "Z"), returnType = "I"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(STRING), returnType = "Z"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf("Landroid/content/Context;", STRING), returnType = "V"),
        string("EXTRA_WEB_URL"),
        string("EXTRA_SOURCE_LINK"),
    ),
)

/** ChatView handler that opens a link-preview video card in OAVideoPlaylistView; supplies the card model types. */
private object OaVideoPlaylistFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/ChatView;",
    returnType = "V",
    parameters = listOf("L", "L"),
    filters = listOf(
        string("EXTRA_OA_VIDEO_STRING"),
        string("EXTRA_STRING_ORIGINAL_VIDEO_ID"),
        string("EXTRA_INT_ORIGINAL_VIDEO_TYPE"),
    ),
)

/** Zalo Video card tap: forwards the card's share URL to the in-app channel player. */
private object ZaloVideoCardFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRowZaloVideo;",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE_RANGE,
            parameters = listOf("I", STRING, STRING, STRING, STRING, STRING, STRING), returnType = "V"),
        string("ChatRowZaloVideo"),
    ),
)

/** Feed/comment link span click (type 5 = plain web link). */
private object FeedSpanClickFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(STRING, "Landroid/content/Context;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = ZALO_WEB_VIEW, name = "Companion"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(STRING), returnType = "Landroid/os/Bundle;"),
        string("EXTRA_SOURCE_LINK"),
        string("EXTRA_SOURCE_PARAM"),
        string("ENABLE_CALL_VIA_ZALO_IN_PHONE_NUMBER_POPUP%s"),
    ),
)

/** Same span click when a feed screen (FeedCallbackZaloView) handles it. */
private object FeedCallbackSpanClickFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/social/presentation/common_components/other/FeedCallbackZaloView;",
    returnType = "V",
    parameters = listOf("L", STRING),
    filters = listOf(
        string("ENABLE_CALL_VIA_ZALO_IN_PHONE_NUMBER_POPUP%s"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = ZALO_WEB_VIEW, name = "Companion"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(STRING), returnType = "Landroid/os/Bundle;"),
        string("EXTRA_SOURCE_LINK"),
        string("extra_source_open_oa"),
    ),
)

/** Group board / pinned / My Cloud link opener (Zalo deeplinks first, then ZaloWebView). */
private object BoardLinkOpenFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "Landroid/content/Context;", STRING),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = ZALO_WEB_VIEW, name = "Companion"),
        fieldAccess(opcode = Opcode.SGET, name = "str_msg_link_not_found"),
        methodCall(definingClass = "Lcom/zing/zalo/utils/ToastUtils;", name = "n"),
    ),
)

/** QR scan result for a non-Zalo URL (direct open when the confirmation popup is disabled). */
private object QrInvalidLinkFingerprint : Fingerprint(
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET, name = "qrcode_link_invalid_do_open"),
        string("DISPLAY_OPEN_LINK_POPUP_FROM_QR"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(STRING), returnType = "Landroid/os/Bundle;"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("Ljava/lang/Class;", "Landroid/os/Bundle;", "I"), returnType = "V"),
    ),
)

/** "Open" button of the QR link confirmation dialogs (invalid link / link check error). */
private object QrDialogOpenFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(DIALOG_VIEW),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = ZALO_WEB_VIEW, name = "Companion"),
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(STRING), returnType = "Landroid/os/Bundle;"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("Ljava/lang/Class;", "Landroid/os/Bundle;", "I"), returnType = "V"),
    ),
)

private val Instruction.methodRef get() = (this as? ReferenceInstruction)?.reference as? MethodReference
private val Instruction.fieldRef get() = (this as? ReferenceInstruction)?.reference as? FieldReference
private val MutableMethod.code get() = implementation!!.instructions

/** Register of smali parameter `p[n]` (p0 = `this` for instance methods; wide parameters take two). */
private fun MutableMethod.paramRegister(n: Int): Int {
    val sizes = parameterTypes.map { val type = it.toString(); if (type == "J" || type == "D") 2 else 1 }
    val isStatic = accessFlags and AccessFlags.STATIC.value != 0
    val first = implementation!!.registerCount - sizes.sum() - (if (isStatic) 0 else 1)
    val slots = (if (isStatic) emptyList() else listOf(1)) + sizes
    return first + slots.take(n).sum()
}

private val MutableMethod.thisRegister get() = paramRegister(0)

/** Registers read and written by one instruction (wide reads are over-approximated). */
private fun Instruction.registerAccess(): Pair<List<Int>, List<Int>> {
    val op = opcode
    fun written(register: Int) = if (op.setsWideRegister()) listOf(register, register + 1) else listOf(register)
    return when (this) {
        is FiveRegisterInstruction ->
            listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount) to emptyList()
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList() to emptyList()
        is ThreeRegisterInstruction -> {
            val reads = mutableListOf(registerB, registerB + 1, registerC, registerC + 1)
            if (op.setsRegister()) reads to written(registerA) else (reads + registerA + (registerA + 1)) to emptyList()
        }
        is TwoRegisterInstruction -> {
            val reads = mutableListOf(registerB, registerB + 1)
            if (op.setsRegister()) reads to written(registerA) else (reads + registerA + (registerA + 1)) to emptyList()
        }
        is OneRegisterInstruction ->
            if (op.setsRegister() && op != Opcode.CHECK_CAST) emptyList<Int>() to written(registerA)
            else listOf(registerA, registerA + 1) to emptyList()
        else -> emptyList<Int>() to emptyList()
    }
}

/**
 * Low registers that are dead at [index]: on the straight-line path from [index] they are written before
 * being read, or never read before a return. Scanning stops (conservatively) at the first branch or throw.
 */
private fun MutableMethod.deadRegistersAt(index: Int): List<Int> {
    val decided = linkedMapOf<Int, Boolean>()
    for (instruction in code.drop(index)) {
        val (reads, writes) = instruction.registerAccess()
        reads.forEach { decided.putIfAbsent(it, false) }
        writes.forEach { decided.putIfAbsent(it, true) }
        val op = instruction.opcode
        if (op == Opcode.RETURN_VOID || op == Opcode.RETURN || op == Opcode.RETURN_OBJECT || op == Opcode.RETURN_WIDE) {
            (0 until implementation!!.registerCount).forEach { decided.putIfAbsent(it, true) }
            break
        }
        if (op == Opcode.THROW || instruction is OffsetInstruction) break
    }
    return decided.filter { it.value && it.key < 16 }.keys.sorted()
}

private fun MutableMethod.scratch(index: Int, count: Int, vararg reserved: Int): List<Int> {
    val free = deadRegistersAt(index).filter { it !in reserved }
    check(free.size >= count) { "$definingClass->$name: not enough free registers at $index ($free)" }
    return free.take(count)
}

/** Inserted code must be reached by fall-through: a jump to [index] would bypass it. */
private fun MutableMethod.requireFallThrough(index: Int) {
    val targeted = code.any { instruction ->
        when (instruction) {
            is BuilderOffsetInstruction -> instruction.target.location.index == index
            is BuilderSwitchPayload -> instruction.switchElements.any { it.target.location.index == index }
            else -> false
        }
    }
    check(!targeted) { "$definingClass->$name: instruction $index is a branch target" }
}

/** `if (ExternalLinks.openExternally(host, url)) { handled } else { original }`, inserted before [index]. */
private fun MutableMethod.insertExternalOpen(
    index: Int,
    prelude: String,
    host: Int,
    url: Int,
    result: Int,
    handled: String,
    vararg labels: ExternalLabel,
) {
    requireFallThrough(index)
    addInstructionsWithLabels(index, """
        $prelude
        invoke-static {v$host, v$url}, $OPEN_EXTERNALLY
        move-result v$result
        if-eqz v$result, :$ORIGINAL
        $handled
    """.trimIndent(), ExternalLabel(ORIGINAL, code.elementAt(index)), *labels)
}

private fun MutableMethod.registersWrittenBetween(from: Int, until: Int) =
    code.toList().subList(from, until).flatMap { it.registerAccess().second }.toSet()

@Suppress("unused")
val openLinksExternallyPatch = bytecodePatch(
    name = "Open links in external browser",
    description = "Applies Zalo's \"Mở bằng trình duyệt web\" choice (Settings > Privacy > Chọn cách mở link) to all " +
        "links, including link-preview video cards, feed and comment links, group board/My Cloud links and " +
        "scanned QR links. Zalo's own links (zalo.me) still open in Zalo. You must select " +
        "\"Mở bằng trình duyệt web\" in that setting; with the default \"Mở bằng Zalo\" nothing changes.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        registerApplied(PatchId.OPEN_LINKS_IN_EXTERNAL_BROWSER)
        // 1. Mode read, Zalo-domain check and browser opener, taken from Zalo's own link opener.
        check(JumpLinkOpenFingerprint.matchAll(1..1).size == 1)
        val gate = JumpLinkOpenFingerprint.instructionMatches
        val keyResolver = gate[1].methodReference
        val modeReader = gate[2].methodReference
        val domainCheckRef = gate[3].methodReference
        val browserOpener = gate[4].methodReference

        val links = mutableClassDefBy(EXTERNAL_LINKS)
        fun replaceStub(name: String, body: String) {
            val stub = links.methods.single { it.name == name }
            check(stub.implementation!!.registerCount == 2) { "Unexpected $name stub registers" }
            val oldSize = stub.implementation!!.instructions.size
            stub.addInstructions(0, body.trimIndent())
            stub.removeInstructions(stub.implementation!!.instructions.size - oldSize, oldSize)
        }
        // jumpLinkMode(key, fallback): same call sequence as Zalo (`t(1, d(key), true)`), default 1 = "Zalo".
        replaceStub("jumpLinkMode", """
            invoke-static {p0}, $keyResolver
            move-result-object p0
            const/4 p1, 0x1
            invoke-static {p1, p0, p1}, $modeReader
            move-result p0
            return p0
        """)
        replaceStub("openInBrowser", """
            invoke-static {p0, p1}, $browserOpener
            return-void
        """)

        // 2. Zalo-domain check: in browser mode only zalo.me / zaloapp.com hosts count as Zalo links
        //    (fixes chat/OA text links, the long-press menu and Zalo's open-in-browser action).
        val domainCheck = mutableClassDefBy(domainCheckRef.definingClass).methods.single {
            it.name == domainCheckRef.name && it.parameterTypes == listOf(STRING) && it.returnType == "Z"
        }
        val domainCode = domainCheck.code.toList()
        check(domainCode.any { it.fieldRef?.let { ref -> ref.definingClass == ZALO_WEB_VIEW && ref.name == "Companion" } == true })
        check(domainCode.count { it.methodRef?.let { ref -> ref.parameterTypes == listOf(STRING, "Ljava/util/List;") && ref.returnType == "Z" } == true } == 3) {
            "Zalo-domain check no longer matches the three server domain lists"
        }
        val domainResult = domainCheck.scratch(0, 1).single()
        domainCheck.requireFallThrough(0)
        domainCheck.addInstructionsWithLabels(0, """
            invoke-static {p0}, $EXTERNAL_LINKS->zaloDomainOverride(Ljava/lang/String;)I
            move-result v$domainResult
            if-ltz v$domainResult, :$ORIGINAL
            if-eqz v$domainResult, :nezumi_not_zalo_domain
            const/4 v$domainResult, 0x1
            return v$domainResult
            :nezumi_not_zalo_domain
            const/4 v$domainResult, 0x0
            return v$domainResult
        """.trimIndent(), ExternalLabel(ORIGINAL, domainCode.first()))

        // 3. Link-preview video card (type 4): the three taps that open OAVideoPlaylistView.
        check(OaVideoPlaylistFingerprint.matchAll(1..1).size == 1)
        val (cardType, cardInfoType) = OaVideoPlaylistFingerprint.originalMethod.parameterTypes.map { it.toString() }
        val cardTaps = mutableListOf<Pair<MutableMethod, Int>>()
        classDefForEach { classDef ->
            classDef.methods.filter { it.implementation != null }.forEach { original ->
                original.implementation!!.instructions.forEachIndexed { index, instruction ->
                    val ref = instruction.methodRef ?: return@forEachIndexed
                    if (instruction.opcode == Opcode.INVOKE_INTERFACE && ref.returnType == "V" &&
                        ref.parameterTypes.map { it.toString() }.let { it.size == 3 && it[1] == cardType && it[2] == cardInfoType }
                    ) {
                        val method = mutableClassDefBy(classDef).methods.single {
                            it.name == original.name && it.parameterTypes == original.parameterTypes &&
                                it.returnType == original.returnType
                        }
                        cardTaps.add(method to index)
                    }
                }
            }
        }
        check(cardTaps.size == 3) { "Expected 3 video card taps, found ${cardTaps.size}" }
        var hrefChain: List<String>? = null
        cardTaps.forEach { (method, callIndex) ->
            val list = method.code.toList()
            val call = list[callIndex] as FiveRegisterInstruction
            val row = call.registerD
            // Nearest `iget-object vX, row, <card>` + `if-eqz vX` guarding the in-app open.
            val ifIndex = (callIndex - 1 downTo 1).first { index ->
                list[index].opcode == Opcode.IF_EQZ && list[index - 1].opcode == Opcode.IGET_OBJECT &&
                    list[index - 1].fieldRef?.type == cardType &&
                    (list[index - 1] as TwoRegisterInstruction).registerA == (list[index] as OneRegisterInstruction).registerA
            }
            check((list[ifIndex - 1] as TwoRegisterInstruction).registerB == row) { "${method.definingClass}: row register" }
            // Href chain used by the row's own fallback: row.message -> message.link -> link.href.
            val messageIndex = list.indices.first { index ->
                index + 1 < list.size && list[index].opcode == Opcode.IGET_OBJECT &&
                    list[index].fieldRef?.definingClass == CHAT_ROW &&
                    list[index + 1].opcode == Opcode.IGET_OBJECT &&
                    list[index + 1].fieldRef?.definingClass == list[index].fieldRef?.type
            }
            val messageField = list[messageIndex].fieldRef!!
            val linkField = list[messageIndex + 1].fieldRef!!
            val hrefField = list.drop(messageIndex + 2).first {
                it.opcode == Opcode.IGET_OBJECT && it.fieldRef?.definingClass == linkField.type && it.fieldRef?.type == STRING
            }.fieldRef!!
            val chain = listOf(messageField, linkField, hrefField).map { it.toString() }
            check(hrefChain == null || hrefChain == chain) { "Inconsistent link href chain: $chain" }
            hrefChain = chain
            check(row < 16)
            val insertAt = ifIndex + 1
            val s = method.scratch(insertAt, 1, row).single()
            method.insertExternalOpen(insertAt, """
                iget-object v$s, v$row, ${chain[0]}
                if-eqz v$s, :$ORIGINAL
                iget-object v$s, v$s, ${chain[1]}
                if-eqz v$s, :$ORIGINAL
                iget-object v$s, v$s, ${chain[2]}
            """.trimIndent(), host = row, url = s, result = s, handled = "return-void")
        }

        // 4. Zalo Video card (type 10): share URL is the 4th argument of the channel-player call.
        check(ZaloVideoCardFingerprint.matchAll(1..1).size == 1)
        run {
            val method = ZaloVideoCardFingerprint.method
            val callIndex = ZaloVideoCardFingerprint.instructionMatches[0].index
            val call = method.code.elementAt(callIndex) as RegisterRangeInstruction
            val shareUrl = call.startRegister + 4
            val row = method.thisRegister
            check(row < 16 && shareUrl < 16)
            val s = method.scratch(callIndex, 1, row, shareUrl).single()
            method.insertExternalOpen(callIndex, "", host = row, url = shareUrl, result = s, handled = "return-void")
        }

        // 5./6. Feed and comment web links (span type 5), both the span itself and the feed screen callback.
        listOf(FeedSpanClickFingerprint, FeedCallbackSpanClickFingerprint).forEach { fingerprint ->
            check(fingerprint.matchAll(1..1).size == 1)
            val method = fingerprint.method
            val matches = fingerprint.instructionMatches
            val companion = matches.first { it.instruction.fieldRef?.name == "Companion" }.index
            val bundleCall = matches.first { it.instruction.methodRef?.returnType == "Landroid/os/Bundle;" }.index
            val list = method.code.toList()
            val typeCheck = list[companion - 1]
            check(typeCheck.opcode == Opcode.IF_NE) { "${method.definingClass}: web link type check not found" }
            val url = (list[bundleCall] as FiveRegisterInstruction).registerC
            val host = if (fingerprint === FeedSpanClickFingerprint) {
                method.paramRegister(2) // Context parameter
            } else {
                // Screen's Ldoc, first argument of the in-app opener call following the bundle.
                val open = list.drop(bundleCall).first { it.opcode == Opcode.INVOKE_STATIC_RANGE } as RegisterRangeInstruction
                check(open.startRegister + 1 == url && open.registerCount == 6)
                open.startRegister
            }
            check(host < 16 && url < 16)
            check(host !in method.registersWrittenBetween(companion, bundleCall) && url !in method.registersWrittenBetween(companion, bundleCall))
            val skip = (method.code.elementAt(companion - 1) as BuilderOffsetInstruction).target.location.instruction!!
            val s = method.scratch(companion, 1, host, url).single()
            method.insertExternalOpen(companion, "", host = host, url = url, result = s,
                handled = "goto :$HANDLED", ExternalLabel(HANDLED, skip))
        }

        // 7. Group board / pinned messages / My Cloud links: after Zalo deeplink handling.
        check(BoardLinkOpenFingerprint.matchAll(1..1).size == 1)
        run {
            val method = BoardLinkOpenFingerprint.method
            val list = method.code.toList()
            val insertAt = list.indexOfFirst {
                it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == "Landroid/os/Bundle;"
            }
            check(insertAt > 0 && list[insertAt - 1].opcode == Opcode.IF_EQZ)
            check(list.take(insertAt).any { it.opcode == Opcode.RETURN_VOID }) { "Deeplink branch must precede the web open" }
            val context = method.paramRegister(1)
            val url = method.paramRegister(2)
            check(url < 16)
            val s = method.scratch(insertAt, 1, context, url).single()
            method.insertExternalOpen(insertAt, "", host = context, url = url, result = s, handled = "return-void")
        }

        // 8. QR scan of a non-Zalo URL, direct path (confirmation popup disabled).
        check(QrInvalidLinkFingerprint.matchAll(1..1).size == 1)
        run {
            val method = QrInvalidLinkFingerprint.method
            val matches = QrInvalidLinkFingerprint.instructionMatches
            val list = method.code.toList()
            val bundleCall = matches[2].index
            val insertAt = (matches[1].index until bundleCall).single {
                list[it].opcode == Opcode.CONST_CLASS &&
                    ((list[it] as ReferenceInstruction).reference as TypeReference).type == ZALO_WEB_VIEW
            }
            check(list[insertAt - 1].methodRef?.let { it.parameterTypes == listOf("I") && it.returnType == "V" } == true)
            val url = (list[bundleCall] as FiveRegisterInstruction).registerC
            val screenCall = (matches[0].index downTo 0).first { list[it].methodRef?.returnType == BASE_ZALO_VIEW }
            check(list[screenCall + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
            val screen = (list[screenCall + 1] as OneRegisterInstruction).registerA
            check(screen !in method.registersWrittenBetween(screenCall + 2, bundleCall))
            check(url !in method.registersWrittenBetween(insertAt, bundleCall))
            check(screen < 16 && url < 16)
            val s = method.scratch(insertAt, 1, screen, url).single()
            method.insertExternalOpen(insertAt, "", host = screen, url = url, result = s, handled = "return-void")
        }

        // 9. QR link confirmation dialogs, "open" button (invalid link and link-check-error variants).
        val dialogs = QrDialogOpenFingerprint.matchAll(2..2)
        dialogs.forEach { match ->
            val method = match.method
            val list = method.code.toList()
            val open = list[match.instructionMatches[2].index] as FiveRegisterInstruction
            val openRef = list[match.instructionMatches[2].index].methodRef!!
            val handler = open.registerC
            val insertAt = (match.instructionMatches[0].index downTo 1).first {
                list[it].opcode == Opcode.CONST_CLASS &&
                    ((list[it] as ReferenceInstruction).reference as TypeReference).type == ZALO_WEB_VIEW
            }
            check(list[insertAt - 1].methodRef?.let {
                it.definingClass == DIALOG_VIEW && it.parameterTypes.isEmpty() && it.returnType == "V"
            } == true) { "${method.definingClass}: dialog dismiss not found" }
            val urlLoad = list.subList(insertAt, match.instructionMatches[1].index).indexOfFirst {
                it.opcode == Opcode.IGET_OBJECT
            } + insertAt
            val urlField = list[urlLoad].fieldRef!!
            check((list[urlLoad] as TwoRegisterInstruction).registerB == method.thisRegister)
            check(list[urlLoad + 1].opcode == Opcode.CHECK_CAST &&
                ((list[urlLoad + 1] as ReferenceInstruction).reference as TypeReference).type == STRING)
            check(method.thisRegister !in method.registersWrittenBetween(insertAt, urlLoad))
            val screenGetter = classDefBy(openRef.definingClass).methods.single {
                it.parameterTypes.isEmpty() && it.returnType == BASE_ZALO_VIEW
            }
            // Keep the handler's post-open bookkeeping (`handler.i(0)`) when the original does it.
            val after = list.getOrNull(match.instructionMatches[2].index + 2)
            val finish = after?.methodRef?.takeIf {
                it.definingClass == openRef.definingClass && it.parameterTypes == listOf("I") && it.returnType == "V" &&
                    list[match.instructionMatches[2].index + 1].opcode == Opcode.CONST_4
            }
            val (s1, s2) = method.scratch(insertAt, 2, handler, method.thisRegister)
            check(handler < 16 && method.thisRegister < 16)
            val handled = if (finish != null) {
                val value = (list[match.instructionMatches[2].index + 1] as NarrowLiteralInstruction).narrowLiteral
                "const/4 v$s1, $value\ninvoke-virtual {v$handler, v$s1}, $finish\nreturn-void"
            } else "return-void"
            method.insertExternalOpen(insertAt, """
                invoke-virtual {v$handler}, ${openRef.definingClass}->${screenGetter.name}()$BASE_ZALO_VIEW
                move-result-object v$s1
                iget-object v$s2, p0, $urlField
                check-cast v$s2, $STRING
            """.trimIndent(), host = s1, url = s2, result = s1, handled = handled)
        }

        registerHooks(PatchId.OPEN_LINKS_IN_EXTERNAL_BROWSER, domainCheck, *cardTaps.map { it.first }.distinct().toTypedArray(),
            ZaloVideoCardFingerprint.method, FeedSpanClickFingerprint.method, FeedCallbackSpanClickFingerprint.method,
            BoardLinkOpenFingerprint.method, QrInvalidLinkFingerprint.method, *dialogs.map { it.method }.toTypedArray())
    }
}
