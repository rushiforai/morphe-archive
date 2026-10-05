package app.ckzombies.patches.compat

import app.ckzombies.patches.screen.TOUCH_METHODS
import app.ckzombies.patches.screen.TouchFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/ckzombies/extension/ExternalStorage;"
private const val TOUCH_EDGE = "Lapp/ckzombies/extension/TouchEdge;"

/**
 * Instead of returning null when `file.big` is missing, creates its directory and lets the
 * game's own `GluDownloadResMgr.createDummyPrimaryResource()` write a placeholder, then returns
 * the file. The registers are the method's own: the file is still in the register the null
 * would overwrite, and the `if-nez` condition register is dead at that point.
 */
internal val resourceFilePatch = bytecodePatch {
    execute {
        val matches = FindResourceFileFingerprint.instructionMatches
        val scratch = matches[2].getInstruction<OneRegisterInstruction>().registerA
        val nullMatch = matches[3]
        val nullConst = nullMatch.getInstruction<NarrowLiteralInstruction>()
        if (nullConst.narrowLiteral != 0) throw PatchException("findResourceFile: expected const/4 0x0")
        val file = (nullConst as OneRegisterInstruction).registerA
        if (file == scratch) throw PatchException("findResourceFile: file and scratch registers collide")

        FindResourceFileFingerprint.method.apply {
            removeInstruction(nullMatch.index)
            addInstructions(
                nullMatch.index,
                """
                    invoke-virtual {v$file}, Ljava/io/File;->getParentFile()Ljava/io/File;
                    move-result-object v$scratch
                    invoke-virtual {v$scratch}, Ljava/io/File;->mkdirs()Z
                    invoke-virtual {v$file}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
                    move-result-object v$scratch
                    invoke-static {v$scratch}, Lcom/glu/platform/android/resdl/GluDownloadResMgr;->createDummyPrimaryResource(Ljava/lang/String;)V
                """,
            )
        }
    }
}

/**
 * Makes `GluOpenFeint.initialize()` return at once. Its `m_initialized` flag then never becomes
 * true, and every other OpenFeint call in the game checks that flag first, so no OpenFeint code
 * runs at all. The game already logs "Making a community call without initializing OF" on
 * every such call and carries on.
 */
internal val openFeintPatch = bytecodePatch {
    execute {
        GluOpenFeintInitializeFingerprint.method.addInstruction(0, "return-void")
    }
}

/**
 * Android 11 and later no longer let an app create `Android/data/<package>/` with a plain
 * `mkdirs()`; asking the framework for the directories creates them. `onCreate` has no spare
 * register, so the call lives in the extension.
 */
internal val externalStoragePatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        ZombSniperOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, $EXTENSION_CLASS->prepare(Landroid/content/Context;)V",
        )
    }
}

/**
 * From API 21 `bindService` throws on an implicit Intent, and the native caller does not clear
 * the exception. Both binds get `setPackage("com.android.vending")` right after the Intent is
 * built, using the constructor's string register, which the next instruction overwrites anyway.
 */
internal val explicitServiceIntentPatch = bytecodePatch {
    execute {
        for (fingerprint in listOf(BindMarketBillingServiceFingerprint, LicenseCheckAccessFingerprint)) {
            val constructor = fingerprint.instructionMatches[1]
            val call = constructor.getInstruction<FiveRegisterInstruction>()
            val intent = call.registerC
            val scratch = call.registerD
            val method = fingerprint.method
            val next = method.getInstruction(constructor.index + 1)
            if (next.opcode != Opcode.CONST_4 || (next as OneRegisterInstruction).registerA != scratch) {
                throw PatchException("${method.name}: v$scratch is still live after the Intent constructor")
            }
            method.addInstructions(
                constructor.index + 1,
                """
                    const-string v$scratch, "com.android.vending"
                    invoke-virtual {v$intent, v$scratch}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
                """,
            )
        }
    }
}

/** Each touch method starts by clamping its x and y, `p1` and `p2`, to 0. */
internal fun clampTouch(touch: MutableMethod) {
    val registers = touch.implementation?.registerCount ?: throw PatchException("${touch.name} has no code")
    // p0 is this, then x, y and the pointer id; x and y must be below v16 for invoke-static.
    if (registers - 2 > 15) throw PatchException("${touch.name} has $registers registers, too many to reach y")
    touch.addInstructions(
        0,
        """
            invoke-static {p1}, $TOUCH_EDGE->clamp(I)I
            move-result p1
            invoke-static {p2}, $TOUCH_EDGE->clamp(I)I
            move-result p2
        """,
    )
}

/**
 * The engine packs each touch position into 14 bits per axis, so a negative one arrives as 16384
 * minus the distance. A view that does not start at the screen's edge, as beside a camera cutout,
 * gets negative positions from a finger that runs past it, and the store's item strip took such a
 * swipe for a jump of thousands of pixels and vanished off screen. The extension's `TouchEdge`
 * clamps every position the four touch methods pass on.
 */
internal val touchEdgePatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        for (name in TOUCH_METHODS) clampTouch(TouchFingerprint(name).method)
    }
}
