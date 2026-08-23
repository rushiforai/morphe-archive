package com.fivemobile.thescore

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.Compatibility

private val COMPATIBILITY_THESCORE = Compatibility(
    name = "theScore",
    packageName = "com.fivemobile.thescore"
)

// ==========================================
// RESOURCE PATCHES
// ==========================================

val adRemovalResources = resourcePatch {
    compatibleWith(COMPATIBILITY_THESCORE)
    execute {
        // --- 1. Feed & Banner Ads ---
        val adFiles = listOf(
            "res/layout/layout_big_box_ad.xml",
            "res/layout/layout_banner_ad.xml",
            "res/layout/layout_ad_container.xml"
        )

        adFiles.forEach { filePath ->
            try {
                val layoutFile = get(filePath)
                var content = layoutFile.readText()

                content = content.replace(Regex("""android:layout_height="[^"]+""""), """android:layout_height="0.0dip"""")
                content = content.replace(Regex("""android:layout_margin[a-zA-Z]*="[^"]+""""), "")

                if (!content.contains("""android:visibility="gone"""")) {
                    content = content.replaceFirst("android:layout_width=", """android:visibility="gone" android:layout_width=""")
                }
                layoutFile.writeText(content)
            } catch (e: Exception) {
                // Failsafe
            }
        }

        // --- 2. Splash Screen Ads ---
        try {
            val splashFile = get("res/layout/layout_fullscreen_startup_form.xml")
            var splashContent = splashFile.readText()

            val adViews = mapOf(
                "@id/fullscreen_splash_ad" to "ImageView",
                "@id/splash_video" to "SurfaceView",
                "@id/video_sponsor" to "SurfaceView",
                "@id/image_sponsor" to "ImageView"
            )

            adViews.forEach { (id, tag) ->
                val regex = Regex("""<$tag\s+android:id="$id"[\s\S]*?/>""")
                val replacement = """<$tag android:id="$id" android:layout_width="0.0dip" android:layout_height="0.0dip" android:visibility="gone" />"""
                splashContent = splashContent.replace(regex, replacement)
            }
            splashFile.writeText(splashContent)
        } catch (e: Exception) {
            // Failsafe
        }
    }
}

// ==========================================
// BYTECODE PATCHES
// ==========================================

val adRemovalPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Bypasses startup delays and collapses all ad containers.",
    default = true
) {
    compatibleWith(COMPATIBILITY_THESCORE)
    dependsOn(adRemovalResources)

    execute {
        // Splash Ad Logic Bypass
        val fingerprint = Fingerprint(
            name = "invokeSuspend",
            returnType = "Ljava/lang/Object;",
            custom = { _, classDef ->
                classDef.sourceFile == "StartupManager.kt"
            }
        )

        fingerprint.let { match ->
            val instructions = match.method.instructions
            val delayIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_WIDE_16 &&
                        (it as? com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)?.wideLiteral == 2000L
            }

            if (delayIndex != -1) {
                var checkCastIndex = -1
                for (i in delayIndex downTo 0) {
                    if (instructions[i].opcode == Opcode.CHECK_CAST) {
                        checkCastIndex = i
                        break
                    }
                }

                if (checkCastIndex != -1) {
                    val checkCastInst = instructions[checkCastIndex] as OneRegisterInstruction
                    val reg = checkCastInst.registerA

                    match.method.addInstructions(checkCastIndex + 1, "const/4 v$reg, 0x0")
                }
            }
        }
    }
}