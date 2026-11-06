package app.revanced.patches.scorecounter

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.fingerprint
import app.revanced.util.returnEarlyString
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val adsPatch = resourcePatch(
    name = "Remove ads",
) {
    compatibleWith("net.aasuited.universalscoretracker"("2.14.6"));

    dependsOn(
        bytecodePatch {
            execute {
                bannerAdUnitFingerprint.method.returnEarlyString();
                openAdUnitFingerprint.method.returnEarlyString();
            }
        },
    )

    execute {
        val layoutFiles = listOf(
            "res/layout/activity_player_statistics_with_player_header.xml",
            "res/layout/activity_score_board.xml",
        )

        layoutFiles.forEach { filePath ->
            document(filePath).use { document ->
                fun hideElementById(id: String) {
                    val elements = document.getElementsByTagName("*")
                    for (i in 0 until elements.length) {
                        val element = elements.item(i) as org.w3c.dom.Element
                        if (element.getAttribute("android:id") == "@id/$id") {
                            element.setAttribute("android:visibility", "gone")
                            return
                        }
                    }
                    throw IllegalStateException("Element with id $id not found in $filePath")
                }

                hideElementById("adbanner_container")
            }
        }
    }
}
