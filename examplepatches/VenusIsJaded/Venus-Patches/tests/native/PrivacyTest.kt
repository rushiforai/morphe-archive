package app.venus.patches

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.morphe.patcher.patch.Patch
import java.security.MessageDigest
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.zip.ZipFile

/** Detached method assembly and in-memory HBC fixtures only. Never runs Patcher or writes an APK. */
private data class Quad<A, B, C, D>(val a: A, val b: B, val c: C, val d: D)

fun main(args: Array<String>) {
    val groups = listOf(HbcPrivacy.analytics, HbcPrivacy.telemetry, HbcPrivacy.crash)
    val natives = NativePrivacy.crash + NativePrivacy.telemetry + NativePrivacy.attribution + NativePrivacy.advertising
    check(natives.size == 137 && natives.distinct().size == natives.size)
    check(groups.flatten().size == 102 && groups.flatten().map { it.offset }.distinct().size == 102)
    check(HbcPrivacy.resolvedPromise.last() == 6.toByte())
    // Cross-check every opcode constant against scripts/hbc/ops.txt (Hermes 250829098 BytecodeList.def)
    // so an opcode number typo like LoadParam=52 (DivN) instead of 137 can never pass build validation.
    val opsTable = File("scripts/hbc/ops.txt").readLines().associate { line ->
        val parts = line.trim().split(Regex("\\s+"))
        parts[1] to Pair(parts[0].toInt(), parts.drop(2))
    }
    val expectedOps = mapOf(
        HbcPrivacy.OP_NEW_OBJECT to "NewObject",
        HbcPrivacy.OP_GET_GLOBAL to "GetGlobalObject",
        HbcPrivacy.OP_GET_BY_ID to "GetById",
        HbcPrivacy.OP_TRY_GET_BY_ID to "TryGetById",
        HbcPrivacy.OP_CALL1 to "Call1",
        HbcPrivacy.OP_CALL2 to "Call2",
        HbcPrivacy.OP_RET to "Ret",
        HbcPrivacy.OP_LOAD_PARAM to "LoadParam",
        HbcPrivacy.OP_LOAD_CONST_STRING to "LoadConstString",
        HbcPrivacy.OP_LOAD_UNDEFINED to "LoadConstUndefined",
        HbcPrivacy.OP_LOAD_FALSE to "LoadConstFalse",
    )
    for ((code, name) in expectedOps) {
        check(opsTable[name]?.first == code) { "HBC98 opcode mismatch for $name: got $code, expected ${opsTable[name]?.first}" }
    }
    // Every stub must decode into whole HBC98 instructions (1.3.6 used NewFastArray by mistake and misdecoded).
    fun hbcLength(op: Int) = when (op) {
        HbcPrivacy.OP_GET_GLOBAL, HbcPrivacy.OP_NEW_OBJECT, HbcPrivacy.OP_RET, HbcPrivacy.OP_LOAD_UNDEFINED, HbcPrivacy.OP_LOAD_FALSE -> 2
        HbcPrivacy.OP_LOAD_PARAM -> 3
        HbcPrivacy.OP_CALL1, HbcPrivacy.OP_LOAD_CONST_STRING -> 4; HbcPrivacy.OP_CALL2 -> 5; HbcPrivacy.OP_GET_BY_ID, HbcPrivacy.OP_TRY_GET_BY_ID -> 6
        else -> error("Unexpected opcode $op in privacy stub")
    }
    for (stub in listOf(HbcPrivacy.resolvedPromise, HbcPrivacy.resolvedEmptyObject, HbcPrivacy.returnUndefined,
        HbcPrivacy.returnFalse, HbcPrivacy.returnEmptyObject, HbcPrivacy.returnEmptyString, HbcPrivacy.callParam2)) {
        var pc = 0; var last = -1
        while (pc < stub.size) { last = stub[pc].toInt() and 255; pc += hbcLength(last) }
        check(pc == stub.size && last == HbcPrivacy.OP_RET) { "Privacy stub does not decode to whole instructions" }
    }
    check(HbcPrivacy.resolvedEmptyObject.size == 23 && HbcPrivacy.resolvedEmptyObject[14].toInt() == HbcPrivacy.OP_NEW_OBJECT)
    check(HbcPrivacy.returnUndefined.contentEquals(byteArrayOf(147.toByte(), 6, 118, 6)))
    val privacy = listOf(disableAnalytics, disableCrashReporting, disableTelemetry, disableAttribution, disableAdvertisingIdentifiers)
    fun graph(selected: List<Patch<*>>): List<Patch<*>> {
        val visited = linkedSetOf<Patch<*>>()
        val active = mutableSetOf<Patch<*>>()
        fun visit(patch: Patch<*>) {
            if (patch in visited) return
            check(active.add(patch)) { "Dependency cycle" }
            patch.dependencies.forEach { visit(it) }
            active.remove(patch)
            visited.add(patch)
        }
        selected.forEach { visit(it) }
        return visited.toList()
    }
    for (selection in 0..31) for (withSettings in listOf(false, true)) {
        val selected = privacy.filterIndexed { i, _ -> selection and (1 shl i) != 0 }
        val ordered = graph(selected + if (withSettings) listOf(venusSettings) else emptyList())
        val needsLoader = withSettings || selected.any { it in privacy.take(3) }
        check(ordered.count { it === packagedDiscordBundle } == if (needsLoader) 1 else 0)
        if (!withSettings) check(venusSettings !in ordered)
        // Any selection gets the passkey hint, exactly once.
        check(ordered.count { it === passkeyErrorHint } == if (selected.isNotEmpty() || withSettings) 1 else 0)
        check(ordered.count { it === discordBundleGuard } == if (selected.isNotEmpty() || withSettings) 1 else 0)
        for ((i, patch) in ordered.withIndex()) check(patch.dependencies.all { ordered.indexOf(it) < i })
    }
    check(privacy.all { it.default && it.options.values.isEmpty() })
    if (args.isEmpty()) {
        // CI can validate output against the same digests without distributing proprietary APK content.
        println("PASS: privacy target/stub definitions; set VENUS_ORIGINAL_APK for read-only APK ABI validation")
        return
    }
    val apk = File(args[0])
    val original = ZipFile(apk).use { zip -> zip.getInputStream(zip.getEntry("assets/index.android.bundle")).readBytes() }
    HbcPrivacy.verifyOriginal(original)
    checkHermesSelections(original, groups)
    for (case in 0..3) checkHermesCorruption(original, case)
    checkHermesComposition(original, groups, args.getOrNull(1))
    val dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
    val methods = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes.flatMap { it.methods } }
    // Assemble the shared loader in isolation and verify that it cannot select a file/OTA loader.
    val loader = MutableMethod(methods.single { it.definingClass == "Lcom/facebook/react/runtime/ReactInstance;" && it.name == "loadJSBundle" })
    pinPackagedDiscordBundle(loader)
    val loaderPrefix = loader.implementation!!.instructions.take(5)
    check(loaderPrefix.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string } == listOf("assets://index.android.bundle"))
    check(loaderPrefix.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name } == listOf("createAssetLoader"))
    // Launch OTA checks return no Future; a check with a callback runs Discord's own code unchanged.
    val otaMethod = methods.single { it.definingClass == BUNDLE_UPDATER && it.name == "checkForUpdate" && it.parameterTypes.size == 2 }
    val otaUntouched = otaMethod.implementation!!.instructions.map { it.opcode }
    val ota = MutableMethod(otaMethod)
    skipLaunchOtaChecks(ota)
    val otaGuarded = ota.implementation!!.instructions.toList()
    check(ota.implementation!!.registerCount == otaMethod.implementation!!.registerCount)
    check(otaGuarded.size == otaUntouched.size + OTA_GUARD_SIZE) { "OTA guard is ${otaGuarded.size - otaUntouched.size} instructions" }
    check(otaGuarded.drop(OTA_GUARD_SIZE).map { it.opcode } == otaUntouched) { "Discord's own OTA code changed" }
    check(otaGuarded.take(OTA_GUARD_SIZE).map { it.opcode } == listOf(Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN_OBJECT, Opcode.NOP))
    check((otaGuarded[0] as OneRegisterInstruction).registerA == ota.implementation!!.registerCount - 1) { "OTA guard must test the callback" }
    // Quest Completer's User-Agent guard, assembled on Discord's real interceptor (a detached fixture, not a Patcher run).
    val interceptorMethod = methods.single { it.definingClass == USER_AGENT_INTERCEPTOR && it.name == "intercept" }
    val untouched = interceptorMethod.implementation!!.instructions.map { it.opcode }
    val interceptor = MutableMethod(interceptorMethod)
    keepDesktopQuestAgent(interceptor)
    val guarded = interceptor.implementation!!.instructions.toList()
    check(interceptor.implementation!!.registerCount == interceptorMethod.implementation!!.registerCount) { "Guard changed the register count" }
    check(guarded.size == untouched.size + QUEST_AGENT_GUARD_SIZE) { "Guard is ${guarded.size - untouched.size} instructions, expected $QUEST_AGENT_GUARD_SIZE" }
    check(guarded.drop(QUEST_AGENT_GUARD_SIZE).map { it.opcode } == untouched) { "Discord's own User-Agent code changed" }
    // The last added instruction is the nop both branches land on; the 13 before it are the guard itself.
    check(guarded[QUEST_AGENT_GUARD_SIZE - 1].opcode == Opcode.NOP)
    val guard = guarded.take(QUEST_AGENT_GUARD_SIZE - 1)
    check(guard.map { it.opcode } == listOf(Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CONST_STRING, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.CONST_STRING, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
        Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT)) { "Guard opcodes: ${guard.map { it.opcode }}" }
    check(guard.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string } == listOf("User-Agent", QUEST_DESKTOP_AGENT))
    // Both if-eqz jump past the guard to the label's nop, just before Discord's own first instruction.
    val guardUnits = guard.sumOf { it.codeUnits }
    for (index in listOf(5, 9)) {
        val at = guard.take(index).sumOf { it.codeUnits }
        check(at + (guard[index] as OffsetInstruction).codeOffset == guardUnits) { "Guard branch $index lands at the wrong place" }
        check((guard[index] as OneRegisterInstruction).registerA == 1)
    }
    // Only v0-v2 and the Chain parameter (p1 = v4 of 5) are touched.
    val parameter = interceptor.implementation!!.registerCount - 1
    for (instruction in guard) {
        val regs = when (instruction) {
            is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                instruction.registerF, instruction.registerG).take(instruction.registerCount)
            is OneRegisterInstruction -> listOf(instruction.registerA)
            else -> emptyList()
        }
        check(regs.all { it in 0..2 || it == parameter }) { "Guard touches register outside v0-v2/p1: $regs" }
    }
    val calls = guard.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
    check(calls.map { it.definingClass + "->" + it.name } == listOf("Lokhttp3/Interceptor\$Chain;->h", "Lokhttp3/Request;->a",
        "Ljava/lang/String;->startsWith", "Lokhttp3/Interceptor\$Chain;->a"))
    for (call in calls.filter { it.definingClass != "Ljava/lang/String;" })
        check(methods.any { it.definingClass == call.definingClass && it.name == call.name && it.returnType == call.returnType &&
            it.parameterTypes.map { p -> p.toString() } == call.parameterTypes.map { p -> p.toString() } }) { "Unresolved host call $call" }
    check((guard[10] as FiveRegisterInstruction).let { it.registerC == parameter && it.registerD == 0 }) { "Guard must proceed with the original request" }
    // Force system font: assembled on Discord's real font lookup and Application.onCreate (detached fixtures).
    val fontMethod = methods.single { it.definingClass == FONT_MANAGER && it.name == "getTypeface" &&
        it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", FONT_STYLE, "Landroid/content/res/AssetManager;") }
    val fontOriginal = fontMethod.implementation!!.instructions.map { it.opcode }
    val font = MutableMethod(fontMethod)
    useSystemFont(font)
    val fontGuarded = font.implementation!!.instructions.toList()
    check(font.implementation!!.registerCount == fontMethod.implementation!!.registerCount) { "Font guard changed the register count" }
    check(fontGuarded.size == fontOriginal.size + SYSTEM_FONT_GUARD_SIZE) { "Font guard is ${fontGuarded.size - fontOriginal.size} instructions" }
    check(fontGuarded.drop(SYSTEM_FONT_GUARD_SIZE).map { it.opcode } == fontOriginal) { "Discord's own font lookup changed" }
    val fontGuard = fontGuarded.take(SYSTEM_FONT_GUARD_SIZE - 1)
    check(fontGuard.map { it.opcode } == listOf(Opcode.SGET_BOOLEAN, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT,
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.RETURN_OBJECT)) { "Font guard opcodes: ${fontGuard.map { it.opcode }}" }
    check(fontGuarded[SYSTEM_FONT_GUARD_SIZE - 1].opcode == Opcode.NOP)
    val fontUnits = fontGuard.sumOf { it.codeUnits }
    for (index in listOf(1, 6)) {
        val at = fontGuard.take(index).sumOf { it.codeUnits }
        check(at + (fontGuard[index] as OffsetInstruction).codeOffset == fontUnits) { "Font guard branch $index lands at the wrong place" }
    }
    // p1 = family name, p2 = TypefaceStyle: only v0 is written.
    val fontRegs = font.implementation!!.registerCount
    check(fontRegs == 6) { "Font lookup has $fontRegs registers, expected 6" }
    check((fontGuard[2] as FiveRegisterInstruction).registerC == fontRegs - 2) { "getNearestStyle must run on the TypefaceStyle parameter" }
    check((fontGuard[4] as FiveRegisterInstruction).let { it.registerC == fontRegs - 3 && it.registerD == 0 }) { "Font guard passes the wrong family" }
    for (instruction in fontGuard) if (instruction is OneRegisterInstruction) check(instruction.registerA == 0) { "Font guard writes outside v0" }
    check(((fontGuard[0] as ReferenceInstruction).reference as FieldReference).let { it.definingClass == SYSTEM_FONT && it.name == "enabled" && it.type == "Z" })
    check(((fontGuard[2] as ReferenceInstruction).reference as MethodReference).let { ref -> methods.any { it.definingClass == ref.definingClass &&
        it.name == "getNearestStyle" && it.returnType == "I" && it.parameterTypes.isEmpty() && it.accessFlags and 1 != 0 } }) { "getNearestStyle is gone" }
    val appCreate = methods.single { it.definingClass == "Lcom/discord/MainApplication;" && it.name == "onCreate" && it.parameterTypes.isEmpty() }
    val app = MutableMethod(appCreate)
    readSystemFontSetting(app)
    val appCode = app.implementation!!.instructions.toList()
    check(appCode.size == appCreate.implementation!!.instructions.count() + 1 && appCode[0].opcode == Opcode.INVOKE_SUPER &&
        appCode[1].opcode == Opcode.INVOKE_STATIC && (appCode[1] as FiveRegisterInstruction).registerC == app.implementation!!.registerCount - 1 &&
        ((appCode[1] as ReferenceInstruction).reference as MethodReference).let { it.definingClass == SYSTEM_FONT && it.name == "init" }) { "Font setting must load right after super.onCreate()" }
    // Every branch and try range must land on an instruction start. 1.5.0's first build put two guards in getSize,
    // Morphe re-encoded the first one's branches into the middle of an instruction, and Android froze Discord at boot.
    fun checkBranches(method: MutableMethod, label: String) {
        val code = method.implementation!!.instructions.toList()
        val starts = HashSet<Int>(); val at = IntArray(code.size); var pc = 0
        for ((i, instruction) in code.withIndex()) { at[i] = pc; starts += pc; pc += instruction.codeUnits }
        for ((i, instruction) in code.withIndex()) if (instruction is OffsetInstruction)
            check(at[i] + instruction.codeOffset in starts) { "$label: branch at ${at[i]} lands inside an instruction" }
        for (block in method.implementation!!.tryBlocks) {
            check(block.startCodeAddress in starts) { "$label: try block starts inside an instruction" }
            block.exceptionHandlers.forEach { check(it.handlerCodeAddress in starts) { "$label: handler inside an instruction" } }
        }
    }
    checkBranches(font, "Font guard"); checkBranches(interceptor, "User-Agent guard")
    // Pastelize reply text (#45): assembled on Discord's real reply preview text lambda (a detached fixture).
    val replyMethod = methods.single { it.definingClass == REPLY_PREVIEW && it.name.startsWith("configureReply\$lambda\$") &&
        it.returnType == "Lkotlin/Unit;" && it.parameterTypes.map { p -> p.toString() } == listOf("Lcom/discord/chat/bridge/structurabletext/StructurableText;", REPLY_PREVIEW, BRIDGE_MESSAGE, "I") }
    val replyOriginal = replyMethod.implementation!!.instructions.map { it.opcode }
    val reply = MutableMethod(replyMethod)
    pastelReplyText(reply)
    val replyCode = reply.implementation!!.instructions.toList()
    check(reply.implementation!!.registerCount == replyMethod.implementation!!.registerCount) { "Reply guard changed the register count" }
    check(replyCode.size == replyOriginal.size + PASTEL_REPLY_GUARD_SIZE) { "Reply guard is ${replyCode.size - replyOriginal.size} instructions" }
    check(replyCode.drop(PASTEL_REPLY_GUARD_SIZE).map { it.opcode } == replyOriginal) { "Discord's own reply text code changed" }
    check(replyCode[PASTEL_REPLY_GUARD_SIZE - 1].opcode == Opcode.NOP)
    val replyGuard = replyCode.take(PASTEL_REPLY_GUARD_SIZE)
    // Only v0-v2 are written, and Discord's own code writes them before it reads them.
    for (instruction in replyGuard) if (instruction is OneRegisterInstruction && instruction.opcode != Opcode.IF_EQZ && instruction.opcode != Opcode.IF_NEZ)
        check(instruction.registerA in 0..2) { "Reply guard writes outside v0-v2" }
    val replyRegs = reply.implementation!!.registerCount
    check((replyGuard[0] as TwoRegisterInstruction).registerB == replyRegs - 2) { "Reply guard must read the replied message (p2)" }
    check(replyGuard.any { it is TwoRegisterInstruction && it.opcode == Opcode.MOVE_OBJECT_FROM16 && it.registerB == replyRegs - 3 }) { "Reply guard must read the preview (p1)" }
    check(replyCode[PASTEL_REPLY_GUARD_SIZE].opcode == Opcode.MOVE_OBJECT_FROM16) { "Discord's code no longer starts by moving its parameters" }
    for (call in replyGuard.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference })
        check(methods.any { it.definingClass == call.definingClass && it.name == call.name && it.returnType == call.returnType &&
            it.parameterTypes.map { p -> p.toString() } == call.parameterTypes.map { p -> p.toString() } } ||
            call.definingClass == "Ljava/lang/Integer;" || call.definingClass == "Landroid/widget/TextView;") { "Unresolved reply guard call $call" }
    val dexClasses = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
    for (field in replyGuard.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference })
        check(dexClasses.any { c -> c.type == field.definingClass && c.fields.any { it.name == field.name && it.type == field.type } }) { "Unresolved reply guard field $field" }
    checkBranches(reply, "Reply guard")
    // Message highlights (#60) and Bulk delete (#94): assembled on Discord's real HighlightedMessageDrawer.drawHighlight (a detached fixture).
    val gutterMethod = methods.single { it.definingClass == HIGHLIGHT_DRAWER && it.name == "drawHighlight" && it.parameterTypes.size == 4 }
    val gutterOriginal = gutterMethod.implementation!!.instructions.map { it.opcode }
    val gutter = MutableMethod(gutterMethod)
    scaleMessageGutterWidth(gutter)
    val gutterCode = gutter.implementation!!.instructions.toList()
    check(gutter.implementation!!.registerCount == gutterMethod.implementation!!.registerCount) { "Gutter guard changed the register count" }
    check(gutterCode.size == gutterOriginal.size + MESSAGE_GUTTER_GUARD_SIZE) { "Gutter guard is ${gutterCode.size - gutterOriginal.size} instructions" }
    check(gutterCode.drop(MESSAGE_GUTTER_GUARD_SIZE).map { it.opcode } == gutterOriginal) { "Discord's own drawHighlight code changed" }
    check(gutterCode[MESSAGE_GUTTER_GUARD_SIZE - 1].opcode == Opcode.NOP)
    val gutterGuard = gutterCode.take(MESSAGE_GUTTER_GUARD_SIZE)
    for (instruction in gutterGuard) if (instruction is OneRegisterInstruction && instruction.opcode != Opcode.IF_EQZ && instruction.opcode != Opcode.IF_NEZ)
        check(instruction.registerA in 0..2) { "Gutter guard writes outside v0-v2" }
    for (field in gutterGuard.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference })
        check(dexClasses.any { c -> c.type == field.definingClass && c.fields.any { it.name == field.name && it.type == field.type } }) { "Unresolved gutter guard field $field" }
    checkBranches(gutter, "Gutter guard")
    check(try { scaleMessageGutterWidth(gutter); false } catch (_: app.morphe.patcher.patch.PatchException) { true }) { "A second gutter guard was accepted" }
    // Passkey hint: assembled on Discord's one security key reject (a detached fixture, not a Patcher run).
    val rejectMethod = methods.single { it.definingClass == SECURITY_KEY_MODULE && it.name == "reject" &&
        it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Throwable;") }
    val rejectOriginal = rejectMethod.implementation!!.instructions.map { it.opcode }
    val reject = MutableMethod(rejectMethod)
    explainPasskeyError(reject)
    val rejectCode = reject.implementation!!.instructions.toList()
    check(reject.implementation!!.registerCount == 6 && rejectMethod.implementation!!.registerCount == 6) { "Security key reject register count changed" }
    check(rejectCode.size == rejectOriginal.size + PASSKEY_HINT_GUARD_SIZE &&
        rejectCode.drop(PASSKEY_HINT_GUARD_SIZE).map { it.opcode } == rejectOriginal) { "Discord's own reject changed" }
    check(rejectCode[PASSKEY_HINT_GUARD_SIZE - 1].opcode == Opcode.NOP)
    check(rejectCode.take(PASSKEY_HINT_GUARD_SIZE).mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string } ==
        listOf(RP_ID_ERROR, PASSKEY_HINT))
    // Only v0-v1 and the message (p2 = v4) are written; the error code and cause reach Discord as they came.
    for (instruction in rejectCode.take(PASSKEY_HINT_GUARD_SIZE)) if (instruction is OneRegisterInstruction && instruction.opcode != Opcode.IF_EQZ &&
        instruction.opcode != Opcode.IF_NEZ) check(instruction.registerA in 0..1 || instruction.registerA == 4) { "Passkey hint writes v${instruction.registerA}" }
    checkBranches(reject, "Passkey hint")
    check(try { explainPasskeyError(reject); false } catch (_: app.morphe.patcher.patch.PatchException) { true }) { "A second passkey hint was accepted" }
    // Every passkey and security key failure still reaches this one reject.
    val rejectCallers = methods.filter { m -> m.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
        r.definingClass == SECURITY_KEY_MODULE && r.name == "reject" && r.parameterTypes.size == 3 } == true } == true }.map { it.definingClass + "->" + it.name }.toSet()
    check(rejectCallers == setOf("$SECURITY_KEY_MODULE->reject", "$SECURITY_KEY_MODULE->reject\$default", "$SECURITY_KEY_MODULE->access\$reject")) { "Security key reject callers changed: $rejectCallers" }
    // Force system emojis: the one native emoji picture lookup, its reopen bridge and the launch-time setting read.
    val emojiMethod = methods.single { it.definingClass == SURROGATES && it.name == "toAssetUrl-impl" &&
        it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;") && it.returnType == "Ljava/lang/String;" }
    check(emojiMethod.accessFlags and 8 != 0) { "toAssetUrl-impl is no longer static" }
    val emojiOriginal = emojiMethod.implementation!!.instructions.map { it.opcode }
    val emoji = MutableMethod(emojiMethod)
    useSystemEmoji(emoji)
    val emojiCode = emoji.implementation!!.instructions.toList()
    check(emoji.implementation!!.registerCount == 3 && emojiMethod.implementation!!.registerCount == 3) { "Emoji lookup register count changed" }
    check(emojiCode.size == emojiOriginal.size + SYSTEM_EMOJI_GUARD_SIZE && emojiCode.drop(SYSTEM_EMOJI_GUARD_SIZE).map { it.opcode } == emojiOriginal) { "Discord's own emoji lookup changed" }
    val emojiGuard = emojiCode.take(SYSTEM_EMOJI_GUARD_SIZE - 1)
    check(emojiGuard.map { it.opcode } == listOf(Opcode.SGET_BOOLEAN, Opcode.IF_EQZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
        Opcode.IF_EQZ, Opcode.RETURN_OBJECT) && emojiCode[SYSTEM_EMOJI_GUARD_SIZE - 1].opcode == Opcode.NOP) { "Emoji guard opcodes: ${emojiGuard.map { it.opcode }}" }
    for (instruction in emojiGuard) if (instruction is OneRegisterInstruction) check(instruction.registerA == 0) { "Emoji guard writes outside v0" }
    check((emojiGuard[2] as FiveRegisterInstruction).let { it.registerCount == 1 && it.registerC == 2 }) { "Emoji guard must pass the surrogates parameter" }
    check(((emojiGuard[2] as ReferenceInstruction).reference as MethodReference).let { it.definingClass == SYSTEM_EMOJI && it.name == "url" })
    checkBranches(emoji, "Emoji guard")
    // No caller depends on Discord's asset URL beyond loading it as a picture.
    val emojiCallers = methods.filter { m -> m.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
        r.definingClass == SURROGATES && r.name == "toAssetUrl-impl" } == true } == true }.map { it.definingClass + "->" + it.name }.sorted()
    check(emojiCallers == listOf("Lcom/discord/emoji/RenderableEmoji\$Unicode;->getUrl", "Lcom/discord/emoji_picker/EmojiPickerItem\$Emoji;->getUnicodeUrl")) { "Emoji lookup callers changed: $emojiCallers" }
    val videoOriginal = methods.single { it.definingClass == FILE_MODULE && it.name == "getVideoDimensions" }
    check(videoOriginal.implementation!!.instructions.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "getVideoDimensions is only supported on iOS" }) { "getVideoDimensions now does real work on Android" }
    val video = MutableMethod(videoOriginal)
    systemEmojiBridge(video)
    val videoCode = video.implementation!!.instructions.toList()
    check(videoCode.size == videoOriginal.implementation!!.instructions.count() + SYSTEM_EMOJI_BRIDGE_SIZE &&
        videoCode.drop(SYSTEM_EMOJI_BRIDGE_SIZE).map { it.opcode } == videoOriginal.implementation!!.instructions.map { it.opcode }) { "Discord's own getVideoDimensions changed" }
    check(((videoCode[0] as ReferenceInstruction).reference as StringReference).string == "venus-emoji-v1:")
    check(videoCode[SYSTEM_EMOJI_BRIDGE_SIZE - 2].opcode == Opcode.RETURN_VOID && videoCode[SYSTEM_EMOJI_BRIDGE_SIZE - 1].opcode == Opcode.NOP)
    for (instruction in videoCode.take(SYSTEM_EMOJI_BRIDGE_SIZE)) if (instruction is OneRegisterInstruction) check(instruction.registerA == 0) { "Emoji bridge writes outside v0" }
    checkBranches(video, "Emoji bridge")
    check(try { systemEmojiBridge(video); false } catch (_: app.morphe.patcher.patch.PatchException) { true }) { "A second guard in getVideoDimensions was accepted" }
    // Font and emoji settings both load right after super.onCreate(), in either order, with nothing else moved.
    val both = MutableMethod(appCreate)
    readSystemFontSetting(both); readSystemEmojiSetting(both)
    val bothCode = both.implementation!!.instructions.toList()
    check(bothCode.size == appCreate.implementation!!.instructions.count() + 2 && bothCode[0].opcode == Opcode.INVOKE_SUPER &&
        bothCode.drop(3).map { it.opcode } == appCreate.implementation!!.instructions.drop(1).map { it.opcode } &&
        bothCode.subList(1, 3).map { ((it as ReferenceInstruction).reference as MethodReference).definingClass }.toSet() == setOf(SYSTEM_FONT, SYSTEM_EMOJI)) { "Setting reads must sit right after super.onCreate()" }
    checkBranches(both, "MainApplication.onCreate")
    // The voice and font bridges each own one FileModule method, never the same one.
    fun fileMethod(name: String) = methods.single { it.definingClass == FILE_MODULE && it.name == name &&
        it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", PROMISE) && it.returnType == "V" }
    for ((name, install, size, prefix) in listOf(
        Quad("getSize", ::voiceBridge, VOICE_BRIDGE_SIZE, "venus-voice-v1:"),
        Quad("fileExists", ::systemFontBridge, SYSTEM_FONT_BRIDGE_SIZE, "venus-font-v1:"))) {
        val original = fileMethod(name)
        val bridge = MutableMethod(original)
        install(bridge)
        val code = bridge.implementation!!.instructions.toList()
        check(bridge.implementation!!.registerCount == original.implementation!!.registerCount) { "$name bridge changed the register count" }
        check(code.size == original.implementation!!.instructions.count() + size) { "$name bridge is ${code.size - original.implementation!!.instructions.count()} instructions" }
        check(code.drop(size).map { it.opcode } == original.implementation!!.instructions.map { it.opcode }) { "Discord's own $name changed" }
        check(code[size - 2].opcode == Opcode.RETURN_VOID && code[size - 1].opcode == Opcode.NOP)
        check(((code[0] as ReferenceInstruction).reference as StringReference).string == prefix)
        val parameters = bridge.implementation!!.registerCount - 3
        for (instruction in code.take(size)) if (instruction is OneRegisterInstruction) check(instruction.registerA in 0..1) { "$name bridge writes outside v0-v1" }
        check(code.take(size).filterIsInstance<FiveRegisterInstruction>().all { ins ->
            listOf(ins.registerC, ins.registerD, ins.registerE).take(ins.registerCount).all { it == 0 || it >= parameters } }) { "$name bridge reads a clobbered local" }
        checkBranches(bridge, "$name bridge")
        // A second Venus guard in the same method is refused at patch time instead of shipping broken branches.
        val refused = try { voiceBridge(bridge); false } catch (_: app.morphe.patcher.patch.PatchException) { true }
        check(refused) { "A second guard in $name was accepted" }
    }
    // The settings-language bridge owns readAsset(uri, encoding, promise): the URI is p1, the Promise p3.
    run {
        val original = methods.single { it.definingClass == FILE_MODULE && it.name == "readAsset" && it.returnType == "V" &&
            it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;", PROMISE) }
        val bridge = MutableMethod(original)
        languageBridge(bridge)
        val code = bridge.implementation!!.instructions.toList()
        check(bridge.implementation!!.registerCount == original.implementation!!.registerCount) { "readAsset bridge changed the register count" }
        check(code.size == original.implementation!!.instructions.count() + LANGUAGE_BRIDGE_SIZE) { "readAsset bridge is ${code.size - original.implementation!!.instructions.count()} instructions" }
        check(code.drop(LANGUAGE_BRIDGE_SIZE).map { it.opcode } == original.implementation!!.instructions.map { it.opcode }) { "Discord's own readAsset changed" }
        check(code[LANGUAGE_BRIDGE_SIZE - 2].opcode == Opcode.RETURN_VOID && code[LANGUAGE_BRIDGE_SIZE - 1].opcode == Opcode.NOP)
        check(((code[0] as ReferenceInstruction).reference as StringReference).string == "venus-i18n-v1:")
        val parameters = bridge.implementation!!.registerCount - 4
        for (instruction in code.take(LANGUAGE_BRIDGE_SIZE)) if (instruction is OneRegisterInstruction) check(instruction.registerA in 0..1) { "readAsset bridge writes outside v0-v1" }
        check(code.take(LANGUAGE_BRIDGE_SIZE).filterIsInstance<FiveRegisterInstruction>().all { ins ->
            listOf(ins.registerC, ins.registerD, ins.registerE).take(ins.registerCount).all { it == 0 || it >= parameters } }) { "readAsset bridge reads a clobbered local" }
        checkBranches(bridge, "readAsset bridge")
        check(try { languageBridge(bridge); false } catch (_: app.morphe.patcher.patch.PatchException) { true }) { "A second guard in readAsset was accepted" }
    }
    // The Material You bridge owns getFileHash(uri, algorithm, double, promise): URI p1, Promise p5. Discord's JS never calls it.
    run {
        val original = methods.single { it.definingClass == FILE_MODULE && it.name == "getFileHash" && it.returnType == "V" &&
            it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;", "D", PROMISE) }
        val bridge = MutableMethod(original)
        materialYouBridge(bridge)
        val code = bridge.implementation!!.instructions.toList()
        check(bridge.implementation!!.registerCount == original.implementation!!.registerCount) { "getFileHash bridge changed the register count" }
        check(code.size == original.implementation!!.instructions.count() + MATERIAL_YOU_BRIDGE_SIZE) { "getFileHash bridge is ${code.size - original.implementation!!.instructions.count()} instructions" }
        check(code.drop(MATERIAL_YOU_BRIDGE_SIZE).map { it.opcode } == original.implementation!!.instructions.map { it.opcode }) { "Discord's own getFileHash changed" }
        check(code[MATERIAL_YOU_BRIDGE_SIZE - 2].opcode == Opcode.RETURN_VOID && code[MATERIAL_YOU_BRIDGE_SIZE - 1].opcode == Opcode.NOP)
        check(((code[0] as ReferenceInstruction).reference as StringReference).string == "venus-monet-v1:")
        val parameters = bridge.implementation!!.registerCount - 6
        for (instruction in code.take(MATERIAL_YOU_BRIDGE_SIZE)) if (instruction is OneRegisterInstruction) check(instruction.registerA in 0..1) { "getFileHash bridge writes outside v0-v1" }
        check(code.take(MATERIAL_YOU_BRIDGE_SIZE).filterIsInstance<FiveRegisterInstruction>().all { ins ->
            listOf(ins.registerC, ins.registerD, ins.registerE).take(ins.registerCount).all { it == 0 || it >= parameters } }) { "getFileHash bridge reads a clobbered local" }
        val dispatch = code.take(MATERIAL_YOU_BRIDGE_SIZE).filterIsInstance<FiveRegisterInstruction>().single { ins ->
            ((ins as ReferenceInstruction).reference as MethodReference).definingClass == SYSTEM_COLORS }
        check(dispatch.registerC == parameters + 1 && dispatch.registerE == parameters + 5) { "getFileHash bridge passes the wrong URI or Promise" }
        checkBranches(bridge, "getFileHash bridge")
        check(try { materialYouBridge(bridge); false } catch (_: app.morphe.patcher.patch.PatchException) { true }) { "A second guard in getFileHash was accepted" }
    }
    // Material You's native colors: one swap at the top of applySaturationFactor(I)I, the choke point of every theme
    // color Discord's native views draw with. Only v0 is written besides the color parameter itself.
    run {
        val original = methods.single { it.definingClass == COLOR_UTILS && it.name == "applySaturationFactor" &&
            it.parameterTypes.map { p -> p.toString() } == listOf("I") && it.returnType == "I" }
        check(original.accessFlags and 8 != 0) { "applySaturationFactor is no longer static" }
        val guarded = MutableMethod(original)
        materialYouNativeColors(guarded)
        val code = guarded.implementation!!.instructions.toList()
        val regs = guarded.implementation!!.registerCount
        check(regs == original.implementation!!.registerCount) { "Native color guard changed the register count" }
        check(code.size == original.implementation!!.instructions.count() + MATERIAL_YOU_NATIVE_SIZE) { "Native color guard is ${code.size - original.implementation!!.instructions.count()} instructions" }
        check(code.drop(MATERIAL_YOU_NATIVE_SIZE).map { it.opcode } == original.implementation!!.instructions.map { it.opcode }) { "Discord's own saturation code changed" }
        check(code.take(MATERIAL_YOU_NATIVE_SIZE).map { it.opcode } == listOf(Opcode.SGET_BOOLEAN, Opcode.IF_EQZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.NOP)) { "Native color guard opcodes" }
        check(((code[0] as ReferenceInstruction).reference as FieldReference).let { it.definingClass == SYSTEM_COLORS && it.name == "enabled" && it.type == "Z" })
        check((code[0] as OneRegisterInstruction).registerA == 0 && (code[3] as OneRegisterInstruction).registerA == regs - 1) { "Native color guard writes the wrong registers" }
        check((code[2] as FiveRegisterInstruction).let { it.registerCount == 1 && it.registerC == regs - 1 }) { "Native color guard must pass the color parameter" }
        check(((code[2] as ReferenceInstruction).reference as MethodReference).let { it.definingClass == SYSTEM_COLORS && it.name == "remap" && it.returnType == "I" })
        val units = code.take(MATERIAL_YOU_NATIVE_SIZE - 1).sumOf { it.codeUnits }
        check(code[0].codeUnits + (code[1] as OffsetInstruction).codeOffset == units) { "Native color guard branch lands at the wrong place" }
        checkBranches(guarded, "applySaturationFactor")
        check(try { materialYouNativeColors(guarded); false } catch (_: app.morphe.patcher.patch.PatchException) { true }) { "A second guard in applySaturationFactor was accepted" }
        // The only callers are Discord's getColorCompat variants, so the swap covers exactly the theme colors.
        val callers = methods.filter { m -> m.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
            r.definingClass == COLOR_UTILS && r.name == "applySaturationFactor" } == true } == true }.map { it.name }.toSet()
        check(callers == setOf("getColorCompat")) { "applySaturationFactor callers changed: $callers" }
        // Direct brand color reads: each gets the swap right after its result, on the same register, nothing else moved.
        for ((owner, name, parameters) in MATERIAL_YOU_DIRECT_READS) {
            val source = methods.single { it.definingClass == owner && it.name == name && it.parameterTypes.map { p -> p.toString() } == parameters }
            val method = MutableMethod(source)
            val count = materialYouDirectColors(method)
            val before = source.implementation!!.instructions.toList()
            val after = method.implementation!!.instructions.toList()
            check(count == 1 && after.size == before.size + 2) { "$owner->$name: $count direct color reads" }
            val at = before.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r -> r.name == "getColor" && r.definingClass == "Landroid/content/Context;" } == true }
            val register = (before[at + 1] as OneRegisterInstruction).registerA
            check(after.subList(0, at + 2).map { it.opcode } == before.subList(0, at + 2).map { it.opcode } &&
                after.drop(at + 4).map { it.opcode } == before.drop(at + 2).map { it.opcode }) { "$owner->$name: Discord's code moved" }
            check((after[at + 2] as FiveRegisterInstruction).let { it.registerCount == 1 && it.registerC == register } &&
                ((after[at + 2] as ReferenceInstruction).reference as MethodReference).name == "remap" &&
                (after[at + 3] as OneRegisterInstruction).registerA == register) { "$owner->$name: swap on the wrong register" }
            checkBranches(method, "$owner->$name")
        }
        // Font, emoji and Material You all load right after super.onCreate(), with nothing else moved.
        val all = MutableMethod(appCreate)
        readSystemFontSetting(all); readSystemEmojiSetting(all); readMaterialYouColors(all)
        val allCode = all.implementation!!.instructions.toList()
        check(allCode.size == appCreate.implementation!!.instructions.count() + 3 && allCode[0].opcode == Opcode.INVOKE_SUPER &&
            allCode.drop(4).map { it.opcode } == appCreate.implementation!!.instructions.drop(1).map { it.opcode } &&
            allCode.subList(1, 4).map { ((it as ReferenceInstruction).reference as MethodReference).definingClass }.toSet() == setOf(SYSTEM_FONT, SYSTEM_EMOJI, SYSTEM_COLORS)) { "Setting reads must sit right after super.onCreate()" }
        checkBranches(all, "MainApplication.onCreate with Material You")
    }
    // Keep Bluetooth audio clear in calls: each hands-free AudioManager call in com.discord.audio becomes a static call to
    // Handsfree with the same registers. Nothing else in the method moves, and no hands-free call is left behind.
    run {
        val handsfreeNames = HANDSFREE_CALLS.keys.map { it.substringBefore('(') }.toSet()
        for (site in HANDSFREE_SITES) {
            val source = methods.single { it.definingClass == site.owner && it.name == site.name && it.parameterTypes.map { p -> p.toString() } == site.parameters }
            val method = MutableMethod(source)
            val count = keepBluetoothA2dp(method)
            check(count == site.calls) { "${site.owner}->${site.name}: $count hands-free calls, expected ${site.calls}" }
            val before = source.implementation!!.instructions.toList()
            val after = method.implementation!!.instructions.toList()
            check(method.implementation!!.registerCount == source.implementation!!.registerCount && after.size == before.size) { "${site.name}: code size or registers changed" }
            var swapped = 0
            for (i in before.indices) {
                val old = (before[i] as? ReferenceInstruction)?.reference as? MethodReference
                if (old != null && old.definingClass == AUDIO_MANAGER && old.name in handsfreeNames && before[i].opcode == Opcode.INVOKE_VIRTUAL) {
                    val new = after[i]
                    val ref = (new as ReferenceInstruction).reference as MethodReference
                    check(new.opcode == Opcode.INVOKE_STATIC && ref.definingClass == HANDSFREE && ref.name == old.name &&
                        ref.parameterTypes.map { it.toString() } == listOf(AUDIO_MANAGER) + old.parameterTypes.map { it.toString() } && ref.returnType == old.returnType) { "${site.name}: bad swap $ref" }
                    val a = before[i] as FiveRegisterInstruction; val b = new as FiveRegisterInstruction
                    check(listOf(a.registerCount, a.registerC, a.registerD, a.registerE) == listOf(b.registerCount, b.registerC, b.registerD, b.registerE)) { "${site.name}: swap changed registers" }
                    swapped++
                } else check(after[i].opcode == before[i].opcode && after[i].codeUnits == before[i].codeUnits) { "${site.name}: Discord's code moved at $i" }
            }
            check(swapped == site.calls)
            checkBranches(method, "${site.owner}->${site.name}")
        }
        // Every hands-free call Discord's audio code makes is covered, so none still reaches Android directly.
        val all = methods.filter { it.definingClass.startsWith("Lcom/discord/audio/") }.flatMap { m -> (m.implementation?.instructions ?: emptyList()).mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { r -> r.definingClass == AUDIO_MANAGER && r.name in handsfreeNames }?.let { m } } }
        check(all.size == HANDSFREE_SITES.sumOf { it.calls }) { "Discord makes ${all.size} hands-free calls; Venus covers ${HANDSFREE_SITES.sumOf { it.calls }}" }
        val created = MutableMethod(appCreate)
        readHandsfreeContext(created)
        val code = created.implementation!!.instructions.toList()
        check(code.size == appCreate.implementation!!.instructions.count() + 1 && code[0].opcode == Opcode.INVOKE_SUPER &&
            ((code[1] as ReferenceInstruction).reference as MethodReference).definingClass == HANDSFREE) { "Handsfree.init must sit right after super.onCreate()" }
        checkBranches(created, "MainApplication.onCreate with Handsfree")
    }
    fun resolveHost(ref: MethodReference): Boolean = methods.any {
        it.definingClass == ref.definingClass && it.name == ref.name && it.returnType == ref.returnType &&
            it.parameterTypes.map { parameter -> parameter.toString() } == ref.parameterTypes.map { parameter -> parameter.toString() } && it.accessFlags and 1 != 0
    }
    for (target in natives) {
        val originalMethod = methods.single { target.matches(it) }
        check(originalMethod.name != "<init>" && originalMethod.name != "<clinit>")
        val fixture = MutableMethod(originalMethod)
        target.install(fixture) // Detached assembler fixture, not a Patcher invocation.
        val instructions = fixture.implementation!!.instructions
        check(fixture.implementation!!.registerCount == originalMethod.implementation!!.registerCount)
        val firstReturn = instructions.indexOfFirst { it.opcode in listOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_OBJECT) }
        check(firstReturn in 0..15)
        val prefix = instructions.take(firstReturn + 1)
        for (instruction in prefix) {
            val regs = when (instruction) {
                is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD,
                    instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                is ThreeRegisterInstruction -> listOf(instruction.registerA, instruction.registerB, instruction.registerC)
                is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
                is OneRegisterInstruction -> listOf(instruction.registerA)
                else -> emptyList()
            }
            check(regs.all { it in 0 until fixture.implementation!!.registerCount })
        }
        val calls = prefix.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
        if (target.result == NativePrivacy.Result.NO_AD_ID) {
            // new-instance, "", true, <init>(String, boolean), return it. The constructor must exist and only store the two fields.
            check(prefix.map { it.opcode } == listOf(Opcode.NEW_INSTANCE, Opcode.CONST_STRING, Opcode.CONST_4, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT))
            check(((prefix[1] as ReferenceInstruction).reference as StringReference).string == "" && (prefix[2] as WideLiteralInstruction).wideLiteral == 1L)
            val init = calls.single()
            check(init.name == "<init>" && init.definingClass == target.returns && init.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Z"))
            val constructor = methods.single { it.definingClass == init.definingClass && it.name == "<init>" &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Z") }
            check(constructor.implementation!!.instructions.map { it.opcode } == listOf(Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN, Opcode.RETURN_VOID)) {
                "Ad ID constructor of ${init.definingClass} does more than store its fields" }
        } else if (target.result == NativePrivacy.Result.PROMISE_EMPTY_ARRAY) {
            // Arguments.createArray() then Promise.resolve(that array): Discord's JS reads .length on it.
            check(calls.map { it.definingClass + "->" + it.name } == listOf("Lcom/facebook/react/bridge/Arguments;->createArray",
                "Lcom/facebook/react/bridge/Promise;->resolve")) { "Empty-array stub calls: $calls" }
            check(calls.all { resolveHost(it) }) { "Missing public array ABI" }
            check((prefix.first() as TwoRegisterInstruction).registerB == originalMethod.implementation!!.registerCount - 1)
            check((prefix[2] as OneRegisterInstruction).registerA == 1 && (prefix[3] as FiveRegisterInstruction).let { it.registerC == 0 && it.registerD == 1 })
        } else if (target.result.name.startsWith("PROMISE")) {
            check(calls.single().definingClass == "Lcom/facebook/react/bridge/Promise;" && calls.single().name == "resolve")
            val move = prefix.first() as TwoRegisterInstruction
            check(move.registerB == originalMethod.implementation!!.registerCount - 1)
        } else if (target.result == NativePrivacy.Result.AF_SUCCESS) {
            check(calls.single().name == "onSuccess" && prefix.any { it.opcode == Opcode.IF_EQZ })
        } else if (target.result in listOf(NativePrivacy.Result.EMPTY_MAP, NativePrivacy.Result.PROFILE_START, NativePrivacy.Result.AD_ID_MAP)) {
            check(calls.all { resolveHost(it) }) { "Missing public map ABI" }
            check(calls.first().definingClass == "Lcom/facebook/react/bridge/Arguments;" && calls.first().name == "createMap")
            // Symbolically execute only the detached stub: catches result-shape and borrowed-register bugs.
            val regs = arrayOfNulls<Any>(fixture.implementation!!.registerCount)
            val promise = Any()
            regs[regs.size - 1] = promise
            var lastResult: Any? = null
            var returned: Any? = null
            var resolved: Any? = null
            var resolveCount = 0
            for (i in prefix) {
                val reg = i as? OneRegisterInstruction
                val ref = (i as? ReferenceInstruction)?.reference
                when (i.opcode) {
                    Opcode.MOVE_OBJECT_FROM16 -> { val move = i as TwoRegisterInstruction; regs[move.registerA] = regs[move.registerB] }
                    Opcode.CONST_STRING -> regs[reg!!.registerA] = (ref as StringReference).string
                    Opcode.CONST_4 -> regs[reg!!.registerA] = (i as WideLiteralInstruction).wideLiteral.toInt()
                    Opcode.MOVE_RESULT_OBJECT -> regs[reg!!.registerA] = lastResult
                    Opcode.RETURN_OBJECT -> returned = regs[reg!!.registerA]
                    Opcode.RETURN_VOID -> Unit
                    Opcode.INVOKE_STATIC, Opcode.INVOKE_INTERFACE -> {
                        val method = ref as MethodReference
                        val r = i as FiveRegisterInstruction
                        when (method.name) {
                            "createMap" -> lastResult = linkedMapOf<String, Any?>()
                            "putNull" -> map(regs[r.registerC])[regs[r.registerD] as String] = null
                            "putBoolean" -> map(regs[r.registerC])[regs[r.registerD] as String] = regs[r.registerE] == 1
                            "resolve" -> { check(regs[r.registerC] === promise); resolved = regs[r.registerD]; resolveCount++ }
                            else -> error("Unexpected map-stub call")
                        }
                    }
                    else -> error("Unexpected map-stub opcode ${i.opcode}")
                }
            }
            when (target.result) {
                NativePrivacy.Result.EMPTY_MAP -> check(returned is Map<*, *> && returned.isEmpty())
                NativePrivacy.Result.PROFILE_START -> check(returned == mapOf("started" to false))
                NativePrivacy.Result.AD_ID_MAP -> check(resolveCount == 1 && resolved == mapOf("googleAdvertisingId" to null, "isLimitAdTrackingEnabled" to true))
                else -> error("Unexpected result")
            }
        } else if (target.result.name.startsWith("CALLBACK")) {
            check(calls.single().definingClass == "Lcom/facebook/react/bridge/Callback;" && calls.single().name == "invoke")
            check(resolveHost(calls.single())) { "Unresolved callback ABI: ${calls.single()}" }
            val registers = arrayOfNulls<Any>(fixture.implementation!!.registerCount)
            val callback = Any()
            registers[registers.size - 1] = callback
            var pending: Any? = null
            var invocations = 0
            var values: List<Any?>? = null
            for (instruction in prefix) {
                val one = instruction as? OneRegisterInstruction
                when (instruction.opcode) {
                    Opcode.MOVE_OBJECT_FROM16 -> {
                        val move = instruction as TwoRegisterInstruction
                        registers[move.registerA] = registers[move.registerB]
                    }
                    Opcode.CONST_4 -> registers[one!!.registerA] = null
                    Opcode.CONST_STRING -> registers[one!!.registerA] =
                        (((instruction as ReferenceInstruction).reference) as StringReference).string
                    Opcode.SGET_OBJECT -> {
                        val field = ((instruction as ReferenceInstruction).reference) as FieldReference
                        check(field.definingClass == "Ljava/lang/Boolean;" && field.name == "FALSE")
                        registers[one!!.registerA] = false
                    }
                    Opcode.FILLED_NEW_ARRAY -> {
                        val filled = instruction as FiveRegisterInstruction
                        check(filled.registerCount == 1)
                        pending = listOf(registers[filled.registerC])
                    }
                    Opcode.MOVE_RESULT_OBJECT -> registers[one!!.registerA] = pending
                    Opcode.INVOKE_INTERFACE -> {
                        val invoke = instruction as FiveRegisterInstruction
                        check(registers[invoke.registerC] === callback)
                        values = registers[invoke.registerD] as List<Any?>
                        invocations++
                    }
                    Opcode.RETURN_VOID -> Unit
                    else -> error("Unexpected callback guard opcode")
                }
            }
            check(invocations == 1 && values?.size == 1)
            val expected: Any? = when (target.result) {
                NativePrivacy.Result.CALLBACK_FALSE -> false
                NativePrivacy.Result.CALLBACK_EMPTY_STRING -> ""
                else -> null
            }
            check(values == listOf(expected)) { "Disabled callback contract changed" }
        } else if (target.result == NativePrivacy.Result.THROWABLE_STRING) {
            check(calls.single().definingClass == "Ljava/lang/Throwable;" && calls.single().name == "toString")
        } else check(calls.isEmpty())
    }
    println("PASS: 102 pinned HBC targets (none sharing a body with another function), all 7 HBC selection combinations, valid footers, unchanged unrelated bytes, rejection of changed inputs, 137 exact native ABIs and assembled register-safe early-return/Promise/callback guards, native result shapes, 64 dependency selections, cached-bundle pinning, corrupt-header/footer rejection combined prelude compatibility the Quest Completer desktop User-Agent guard, the Force system font guards, the passkey error hint and one branch-safe guard per FileModule bridge (getSize, fileExists, readAsset); no APK patched")
}


// Separate JVM frames release large fixtures between phases; keep validation within the 384 MiB heap.
private fun checkHermesSelections(original: ByteArray, groups: List<List<HbcPrivacy.Target>>) {
    val header = ByteBuffer.wrap(original).order(ByteOrder.LITTLE_ENDIAN)
    for (target in groups.flatten()) {
        val small = 128 + target.id * 12
        check(original[small + 11].toInt() and 32 != 0)
        val large = (((header.getInt(small + 4) ushr 14) and 255) shl 24) or (header.getInt(small) and 0x1ffffff)
        check(header.getInt(large) == target.offset && header.getInt(large + 12) == target.size)
        check(original[large + 36].toInt() and 0xc8 == 0) // Normal, no exception handler.
        val firstPointerRegister = header.getInt(large + 20) + header.getInt(large + 24)
        val lowestUsedRegister = when (target.name) {
            "startRecordingAnalyticsEvents" -> 1
            "trackCrash" -> 8
            "scheduleHeartbeatTracking", "recordLateComponentLayout" -> 7
            else -> 6
        }
        check(firstPointerRegister <= lowestUsedRegister) { "Stub uses a non-GC-visible register: ${target.name} #${target.id}" }
        check(header.getInt(large + 28) >= if (target.name == "send") 10 else if (target.promise) 9 else if (target.name == "timeRequire") 8 else lowestUsedRegister + 1)
        if (target.promise) check(original[large + 32].toInt() and 255 >= 2)
    }
    // Hermes deduplicates identical bytecode, so one body can belong to several functions. A stub on a shared
    // body also replaces the others: trackAppUIViewed2 shared createThread_'s and forum posts stopped (#93).
    val owners = HashMap<Int, Int>()
    for (id in 0 until header.getInt(40)) {
        val small = 128 + id * 12
        val offset = if (original[small + 11].toInt() and 32 != 0)
            header.getInt((((header.getInt(small + 4) ushr 14) and 255) shl 24) or (header.getInt(small) and 0x1ffffff))
        else header.getInt(small) and 0x1ffffff
        owners.merge(offset, 1, Int::plus)
    }
    for (target in groups.flatten()) check(owners[target.offset] == 1) { "Shared HBC body: ${target.name} #${target.id}" }
    for (selection in 1..7) {
        var changed = original
        val targets = groups.filterIndexed { i, _ -> selection and (1 shl i) != 0 }.flatten()
        for ((i, group) in groups.withIndex()) if (selection and (1 shl i) != 0) changed = HbcPrivacy.rewrite(changed, group)
        check(changed.contentEquals(HbcPrivacy.rewrite(original, targets))) // Selection order independence.
        check(changed.size == original.size)
        check(HbcPrivacy.digest(changed.copyOf(changed.size - 20), "SHA-1") ==
            changed.takeLast(20).joinToString("") { "%02x".format(it) })
        val restored = changed.copyOf()
        for (target in targets) {
            val stub = HbcPrivacy.stub(target)
            check(changed.copyOfRange(target.offset, target.offset + stub.size).contentEquals(stub))
            check(changed.copyOfRange(target.offset + stub.size, target.offset + target.size).all { it == 0.toByte() })
            original.copyInto(restored, target.offset, target.offset, target.offset + target.size)
        }
        original.copyInto(restored, restored.size - 20, original.size - 20)
        check(restored.contentEquals(original)) { "Unrelated HBC bytes changed" }
    }
}

private fun checkHermesCorruption(original: ByteArray, case: Int) {
    val bytes = original.copyOf()
    fun footer() = MessageDigest.getInstance("SHA-1").apply { update(bytes, 0, bytes.size - 20) }
        .digest().copyInto(bytes, bytes.size - 20)
    when (case) {
        0 -> {
            bytes[HbcPrivacy.analytics.first().offset] = 0
            check(runCatching { HbcPrivacy.verifyOriginal(bytes) }.isFailure)
            footer() // Test the body digest with a valid footer.
        }
        1 -> bytes[bytes.size - 1] = (bytes[bytes.size - 1].toInt() xor 1).toByte()
        2 -> {
            val header = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
            val small = 128 + HbcPrivacy.analytics.first().id * 12
            val large = (((header.getInt(small + 4) ushr 14) and 255) shl 24) or (header.getInt(small) and 0x1ffffff)
            bytes[large + 28] = 0
            footer()
        }
        3 -> { bytes[8] = 97; footer() }
    }
    val before = HbcPrivacy.digest(bytes)
    check(runCatching { HbcPrivacy.rewrite(bytes, HbcPrivacy.analytics) }.isFailure)
    check(HbcPrivacy.digest(bytes) == before) { "Rejected fixture was partially changed" }
    // The in-place patch path must reject the same input without touching the file.
    val file = File.createTempFile("venus-corrupt", ".hbc").apply { deleteOnExit(); writeBytes(bytes) }
    try {
        check(runCatching { HbcPrivacy.apply(file, HbcPrivacy.analytics) }.isFailure)
        check(HbcPrivacy.digest(file.readBytes()) == before) { "Rejected file was partially changed" }
        if (case == 0) check(runCatching { HbcPrivacy.verifyOriginal(file) }.isFailure)
    } finally { file.delete() }
}

private fun checkHermesComposition(original: ByteArray, groups: List<List<HbcPrivacy.Target>>, fixtureDirectory: String?) {
    // The streamed in-place path used while patching must equal the in-memory reference rewrite.
    val streamed = File.createTempFile("venus-streamed", ".hbc").apply { deleteOnExit() }
    try {
        streamed.writeBytes(original)
        HbcPrivacy.verifyOriginal(streamed)
        for (group in groups) HbcPrivacy.apply(streamed, group)
        check(streamed.readBytes().contentEquals(HbcPrivacy.rewrite(original, groups.flatten()))) {
            "In-place privacy rewrite differs from the reference rewrite"
        }
        check(runCatching { HbcPrivacy.verifyOriginal(streamed) }.isFailure)
    } finally { streamed.delete() }
    // Optional combined prelude fixture is written only within the build directory, never as an APK.
    if (fixtureDirectory != null) {
        val fixture = File(fixtureDirectory, "privacy-prelude.hbc").apply { parentFile.mkdirs() }
        fixture.writeBytes(HbcPrivacy.rewrite(original, groups.flatten()))
        HbcPrelude.inject(fixture, "void 0;")
        val combined = fixture.readBytes()
        for (t in groups.flatten()) check(combined.copyOfRange(t.offset, t.offset + HbcPrivacy.stub(t).size)
            .contentEquals(HbcPrivacy.stub(t)))
        check(HbcPrivacy.digest(combined.copyOf(combined.size - 20), "SHA-1") ==
            combined.takeLast(20).joinToString("") { "%02x".format(it) })
        fixture.delete()
    }
}

/** A WritableMap stand-in built by the interpreted `createMap` above. */
@Suppress("UNCHECKED_CAST")
private fun map(value: Any?): MutableMap<String, Any?> = value as MutableMap<String, Any?>
