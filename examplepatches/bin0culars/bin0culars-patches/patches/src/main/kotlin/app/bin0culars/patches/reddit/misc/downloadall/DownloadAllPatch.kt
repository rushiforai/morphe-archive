package app.bin0culars.patches.reddit.misc.downloadall

import app.bin0culars.patches.reddit.layout.autoscroll.MainActivityResumeFingerprint
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.smali.ExternalLabel

@Suppress("unused")
val downloadAllPatch =
    patch(
        name = "Download all from gallery",
        description = "Tapping Download on a gallery post asks whether to save just the current item or every item in the gallery.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "download_all_gallery",
                    section = BinocularsModsSection.LINKS,
                    title = "Download all from gallery",
                    summary = "When you tap Download on a gallery post, choose between the current item and all items. Saved to Pictures/Reddit.",
                    default = true,
                ),
            )

            ShareSheetLinkLoadedFingerprint.method.addInstructions(
                0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->setLink(Ljava/lang/Object;)V",
            )

            val launchDownloadMethod = LaunchDownloadActionFingerprint.method
            val originalFirstInstruction = launchDownloadMethod.instructions.firstOrNull()
                ?: throw PatchException("LaunchDownloadActionFingerprint method has no instructions")

            launchDownloadMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->onDownload(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", originalFirstInstruction),
            )

            val placeholderMethod = LaunchOriginalDownloadFingerprint.method
            for (i in placeholderMethod.instructions.indices.reversed()) {
                placeholderMethod.removeInstruction(i)
            }
            val targetClass = launchDownloadMethod.definingClass
            val targetMethodName = launchDownloadMethod.name
            placeholderMethod.addInstructions(
                0,
                """
                    check-cast p0, $targetClass
                    check-cast p1, Lkotlin/jvm/functions/Function1;
                    invoke-virtual { p0, p1 }, $targetClass->$targetMethodName(Lkotlin/jvm/functions/Function1;)V
                    return-void
                """,
            )

            MainActivityResumeFingerprint.method.addInstructions(
                0,
                "invoke-static { p0 }, $EXTENSION_CLASS->onActivityResumed(Landroid/app/Activity;)V",
            )
        }

        finalize {
            resourceXml("res/values/strings.xml").use { strings ->
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_download_title")
                    text = "Download"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_download_this")
                    text = "This one"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_download_all")
                    text = "All %d"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_download_all_started")
                    text = "Downloading %d items…"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_download_all_done")
                    text = "%d items saved to Pictures/Reddit"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_download_all_partial")
                    text = "Saved %1\$d of %2\$d items"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_download_all_failed")
                    text = "Couldn't download the gallery"
                }
            }
        }
    }
