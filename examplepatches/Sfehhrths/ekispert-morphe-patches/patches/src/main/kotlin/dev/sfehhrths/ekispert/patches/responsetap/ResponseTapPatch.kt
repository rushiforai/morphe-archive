package dev.sfehhrths.ekispert.patches.responsetap

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import dev.sfehhrths.ekispert.patches.shared.Constants.COMPATIBILITY_EKISPERT
import dev.sfehhrths.ekispert.patches.shared.Constants.EXTENSION_CLASS

@Suppress("unused")
val responseTapPatch = bytecodePatch(
    name = "Response tap",
    description = "Sends route search results, the course opened in the detail screen, " +
            "MyClip courses and transfer-alarm courses to the Ekispert Wear companion app " +
            "(dev.sfehhrths.ekispertwear) for display on a Wear OS watch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_EKISPERT)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. AbsDownloader.d(): right after `new OkHttpClient.Builder()` is constructed,
        //    call ResponseTapPatch.addInterceptor(builder). Application interceptor, so
        //    the body is already decoded (gzip) when we peek at it.
        OkHttpClientBuildFingerprint.insertStaticCallAfterFirstMatch(
            "$EXTENSION_CLASS->addInterceptor(Lokhttp3/OkHttpClient\$Builder;)V",
        )

        // 2. AioApplication.onCreate(): right after super.onCreate(), hand `this` to the
        //    extension so it has a Context for Broadcasts.
        AioApplicationOnCreateFingerprint.insertStaticCallAfterFirstMatch(
            "$EXTENSION_CLASS->onApplicationCreate(Landroid/content/Context;)V",
        )

        // 3. TransferAlarmCourseDAO.b(...): at method entry, pass the single-course XML
        //    (the register later fed to CompressUtils.a) to the extension.
        TransferAlarmCourseSaveFingerprint.insertStaticCallAtMethodStart(
            "$EXTENSION_CLASS->onTransferAlarmCourse(Ljava/lang/String;)V",
        )

        // 5. MyClip entity load: right before IOUtils.toInputStream(xml), pass the XML.
        MyClipCourseLoadFingerprint.let {
            val match = it.firstMatch()
            it.method.addInstruction(
                match.index,
                staticCall(registerCOf(match), "$EXTENSION_CLASS->onMyClipCourse(Ljava/lang/String;)V"),
            )
        }

        // 6. Detail use case f(args): "a detail screen is opening" marker (no arguments).
        DetailOpenFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_CLASS->onDetailOpened()V",
        )

        // 4. Detail presenter page-selected: at method entry, pass (this, index) so the
        //    companion learns which course of the last result the user is looking at.
        DetailCourseSelectedFingerprint.let {
            val (thisReg, indexReg) = it.method.parameterRegisters(count = 2)
            it.method.addInstruction(
                0,
                "invoke-static { v$thisReg, v$indexReg }, $EXTENSION_CLASS->onCourseSelected(Ljava/lang/Object;I)V",
            )
        }
    }
}

/**
 * Registers of `this` and the first [count]-1 parameters (each assumed single-width), i.e.
 * p0..p(count-1). Dalvik places parameters in the highest registers of the frame.
 */
private fun MutableMethod.parameterRegisters(count: Int): List<Int> {
    val impl = implementation ?: throw PatchException("No implementation for $this")
    val paramRegs = 1 /* this */ + parameterTypes.sumOf { if (it.toString() in setOf("J", "D")) 2 else 1 }
    val first = impl.registerCount - paramRegs
    val regs = (first until first + count).toList()
    require(regs.all { it <= 15 }) { "parameter registers $regs exceed v15; use /range" }
    return regs
}

/**
 * Inserts `invoke-static { <registerC of matched invoke> }, [methodDescriptor]` immediately
 * after the fingerprint's first instruction match. The hooks share the shape
 * "invoke-xxx { vN, ... }" where vN is the object we want to pass on (the freshly constructed
 * builder, or `this` of the Application).
 */
context(patchContext: BytecodePatchContext)
private fun Fingerprint.insertStaticCallAfterFirstMatch(methodDescriptor: String) {
    val match = firstMatch()
    method.addInstruction(match.index + 1, staticCall(registerCOf(match), methodDescriptor))
}

/**
 * Inserts `invoke-static { <registerC of matched invoke> }, [methodDescriptor]` as the first
 * instruction of the method. Only valid when the matched register is a parameter that is not
 * reassigned before the match (true for `TransferAlarmCourseDAO.b`, whose String is `p3`).
 */
context(patchContext: BytecodePatchContext)
private fun Fingerprint.insertStaticCallAtMethodStart(methodDescriptor: String) {
    val match = firstMatch()
    method.addInstruction(0, staticCall(registerCOf(match), methodDescriptor))
}

context(patchContext: BytecodePatchContext)
private fun Fingerprint.firstMatch() = instructionMatches.firstOrNull()
    ?: throw PatchException("No instruction match for $this")

private fun registerCOf(match: Match.InstructionMatch) =
    match.getInstruction<FiveRegisterInstruction>().registerC

/** invoke-static (non-range) only addresses v0..v15. */
private fun staticCall(register: Int, methodDescriptor: String) = if (register <= 15) {
    "invoke-static { v$register }, $methodDescriptor"
} else {
    "invoke-static/range { v$register .. v$register }, $methodDescriptor"
}
