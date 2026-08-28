package app.nullwaypoint.patches.crunchyroll.pip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.nullwaypoint.patches.shared.Constants.COMPATIBILITY_CRUNCHYROLL
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private val PLAYBACK_ACTIVITIES = setOf(
    "com.crunchyroll.watchscreen.screen.WatchScreenActivity",
    "com.crunchyroll.watchscreen.screen.offline.OfflineWatchScreenActivity",
    "com.crunchyroll.watchscreen.screen.xr.AdaptiveWatchScreenActivity",
)

@Suppress("unused")
private val crunchyrollPictureInPictureManifestPatch = resourcePatch(
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement
                .getElementsByTagName("application")
                .item(0) as? Element
                ?: throw PatchException(
                    "AndroidManifest.xml does not contain an application element."
                )

            var modifiedActivities = 0
            val activities = application.getElementsByTagName("activity")

            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                val activityName = activity.getAttribute("android:name")

                if (activityName !in PLAYBACK_ACTIVITIES) continue

                activity.setAttribute(
                    "android:supportsPictureInPicture",
                    "true",
                )
                activity.setAttribute(
                    "android:resizeableActivity",
                    "true",
                )

                activity.mergeConfigChanges(
                    "screenSize",
                    "smallestScreenSize",
                    "screenLayout",
                    "orientation",
                )

                modifiedActivities++
            }

            if (modifiedActivities == 0) {
                throw PatchException(
                    "No Crunchyroll playback activity was found in AndroidManifest.xml."
                )
            }
        }
    }
}

@Suppress("unused")
val crunchyrollPictureInPicturePatch = bytecodePatch(
    name = "Enable Picture-in-Picture",
    description = "Enables Crunchyroll's native Picture-in-Picture while respecting playback state.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    dependsOn(crunchyrollPictureInPictureManifestPatch)

    execute {
        with(PictureInPictureProviderFingerprint) {
            val configMatchIndex = instructionMatches.first().index

            val instructions = method.implementation?.instructions
                ?: throw PatchException(
                    "Crunchyroll's Picture-in-Picture provider has no implementation."
                )

            val getterReference = instructions
                .drop(configMatchIndex + 1)
                .mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference
                }
                .firstOrNull { reference ->
                    reference.returnType == "Z" &&
                        reference.parameterTypes.isEmpty()
                }
                ?: throw PatchException(
                    "Could not locate Crunchyroll's Picture-in-Picture config getter."
                )

            val getterClass = mutableClassDefBy(
                getterReference.definingClass
            )

            val getterMethod = getterClass.methods.firstOrNull { candidate ->
                candidate.name == getterReference.name &&
                    candidate.returnType == "Z" &&
                    candidate.parameterTypes.isEmpty()
            } ?: throw PatchException(
                "Could not resolve Crunchyroll's Picture-in-Picture config getter."
            )

            getterMethod.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        with(PictureInPictureAutoEnterFingerprint) {
            val setAutoEnterCall = instructionMatches.last()
            val enabledRegister = setAutoEnterCall.instruction.invokeRegister(1)

            method.addInstructions(
                setAutoEnterCall.index,
                """
                    const/16 v$enabledRegister, 0x0
                """,
            )
        }

        with(WatchScreenUserLeaveHintFingerprint) {
            val postCall = instructionMatches.first()
            val runnableRegister = postCall.instruction.invokeRegister(1)
            val returnInstruction = method.getInstruction(postCall.index + 1)

            method.replaceInstruction(
                postCall.index,
                """
                    invoke-interface/range {v$runnableRegister .. v$runnableRegister}, Ljava/lang/Runnable;->run()V
                """,
            )

            // Use the method's existing return as the branch target.
            method.addInstructionsWithLabels(
                postCall.index,
                """
                    invoke-virtual {p0}, Lcom/crunchyroll/watchscreen/screen/WatchScreenActivity;->getPlayerView()Lcom/crunchyroll/player/presentation/playerview/PlayerViewLayout;
                    move-result-object v0

                    if-eqz v0, :skipPip

                    invoke-virtual {v0}, Lcom/crunchyroll/player/presentation/playerview/PlayerViewLayout;->isPlaying()Z
                    move-result v0

                    if-eqz v0, :skipPip
                """,
                ExternalLabel(
                    "skipPip",
                    returnInstruction,
                ),
            )
        }
    }
}

private fun Instruction.invokeRegister(position: Int): Int {
    return when (this) {
        is FiveRegisterInstruction -> {
            if (position >= registerCount) {
                throw PatchException(
                    "Invoke instruction does not contain register $position."
                )
            }

            when (position) {
                0 -> registerC
                1 -> registerD
                2 -> registerE
                3 -> registerF
                4 -> registerG
                else -> throw PatchException(
                    "Invalid invoke register position: $position."
                )
            }
        }

        is RegisterRangeInstruction -> {
            if (position >= registerCount) {
                throw PatchException(
                    "Invoke/range instruction does not contain register $position."
                )
            }

            startRegister + position
        }

        else -> throw PatchException(
            "Unsupported invoke instruction format: ${javaClass.simpleName}."
        )
    }
}

private fun Element.mergeConfigChanges(vararg required: String) {
    val configChanges = getAttribute("android:configChanges")
        .split('|')
        .map { it.trim() }
        .filter { it.isNotEmpty() }
        .toMutableSet()

    configChanges.addAll(required)

    setAttribute(
        "android:configChanges",
        configChanges.joinToString("|"),
    )
}