package app.morphe.patches.cinematic.user

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.cinematic.extension.sharedExtensionPatch
import app.morphe.patches.cinematic.shared.Constants.COMPATIBILITY_CINEMATIC
import app.morphe.patches.cinematic.shared.morphe.net.live.ent.cinematic.app.CinematicApp
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/cinematic/patches/AnonymousUserPatch;"

@Suppress("unused")
val anonymousUserPatch =
    bytecodePatch(
        name = "Anonymous user",
        description = "Log in as subscribed anonymous user.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_CINEMATIC)

        dependsOn(sharedExtensionPatch)

        execute {
            CinematicApp.OnCreateFingerprint.matchSingle().method.apply {
                addInstruction(
                    0,
                    BuilderInstruction35c(
                        Opcode.INVOKE_STATIC,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        ImmutableMethodReference(EXTENSION_CLASS, name, parameters, returnType),
                    ),
                )
            }
        }
    }
