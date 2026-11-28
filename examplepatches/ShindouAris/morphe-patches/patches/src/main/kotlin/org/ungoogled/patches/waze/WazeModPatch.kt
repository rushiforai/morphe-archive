package org.ungoogled.patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_WAZE
import org.w3c.dom.Element

private const val EXTENSION = "Lcom/waze/gw/MorpheCompat;"

private const val PUBLIC = 0x1
private const val PRIVATE = 0x2
private const val PROTECTED = 0x4
private const val FINAL = 0x10

/** The Mod's activities and services, its extra permissions and the packages it queries (waze/manifest.xml). */
private val wazeManifestPatch = resourcePatch(
    description = "Declares the Waze Mod's components, permissions and package queries.",
) {
    execute {
        val additions = org.ungoogled.patches.waze.WazeManifestResource::class.java
            .getResourceAsStream("/waze/manifest.xml")
            ?: throw PatchException("waze/manifest.xml is missing from the patches file")
        val fragment = javax.xml.parsers.DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(additions).documentElement

        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val queries = manifest.getElementsByTagName("queries").item(0) as Element
            val existing = { tag: String, name: String ->
                manifest.getElementsByTagName(tag).let { list ->
                    (0 until list.length).any { (list.item(it) as Element).getAttribute("android:name") == name }
                }
            }
            for (i in 0 until fragment.childNodes.length) {
                val child = fragment.childNodes.item(i) as? Element ?: continue
                when (child.tagName) {
                    "queries" -> for (j in 0 until child.childNodes.length) {
                        val q = child.childNodes.item(j) as? Element ?: continue
                        if (q.tagName == "package" && existing("package", q.getAttribute("android:name"))) continue
                        queries.appendChild(manifest.importNode(q, true))
                    }
                    "application" -> for (j in 0 until child.childNodes.length) {
                        val c = child.childNodes.item(j) as? Element ?: continue
                        application.appendChild(manifest.importNode(c, true))
                    }
                    else -> if (!existing(child.tagName, child.getAttribute("android:name"))) {
                        root.insertBefore(manifest.importNode(child, true), application)
                    }
                }
            }
        }
    }
}

private object WazeManifestResource

/** Waze Mod: merges the extension and puts the Mod's hooks into Waze. */
val wazeModPatch = bytecodePatch(
    name = "Waze Mod",
    description = "Adds the Waze Mod to Waze: its alert lists, speed signs, HUD link, settings and more.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeManifestPatch, wazeAssetsPatch, wazeSkinPatch)

    extendWith("extensions/waze.mpe")
    extendWith("extensions/waze-smali.mpe")

    execute {
        applyWazeHooks(loadWazeHooks())

        // MainActivity has no onStop of its own: a new one reports to the floating map.
        addWazeMethod(
            "com/waze/MainActivity", PROTECTED, "onStop", 1,
            """
                invoke-super {p0}, Lcom/waze/ec;->onStop()V
                invoke-static {p0}, Lcom/waze/gw/Gateway;->floatOnStop(Landroid/app/Activity;)V
                return-void
            """,
        )

        // Waze's report menu fragment: tells the floating speedometer to keep off the menu while it is shown.
        addWazeMethod(
            "com/waze/reports_v2/presentation/cc", PUBLIC, "onResume", 2,
            """
                invoke-super {p0}, Lcom/waze/app_nav/a/b;->onResume()V
                const/4 v0, 0x1
                invoke-static {v0}, Lcom/waze/gw/Gateway;->onNativeReportMenuVisibility(Z)V
                return-void
            """,
        )
        addWazeMethod(
            "com/waze/reports_v2/presentation/cc", PUBLIC, "onPause", 2,
            """
                const/4 v0, 0x0
                invoke-static {v0}, Lcom/waze/gw/Gateway;->onNativeReportMenuVisibility(Z)V
                invoke-super {p0}, Lcom/waze/app_nav/a/b;->onPause()V
                return-void
            """,
        )

        // The Android Auto map renderer: a switch the Android Auto surface turns on so that only its surfaces get the
        // speedometer overlay (hooks in com/waze/car_lib/j/a/x and in the renderer's surface method).
        addWazeField("com/waze/map/opengl/ab", PRIVATE, "gwAaOverlay", "Z")
        addWazeMethod(
            "com/waze/map/opengl/ab", PUBLIC or FINAL, "gwEnableAaOverlay", 3,
            """
                const/4 v0, 0x1
                iput-boolean v0, p0, Lcom/waze/map/opengl/ab;->gwAaOverlay:Z
                const-string v0, "WazeGW"
                const-string v1, "AA overlay enabled on the Android Auto map renderer"
                invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                return-void
            """,
        )

        // AverageSpeedCameraNativeManager.c(update): the Mod needs three numbers of the update, which takes a register
        // the method does not have, so the extension reads them.
        findWazeMethod("com/waze/navigate/AverageSpeedCameraNativeManager",
            "c(Lcom/waze/jni/protos/navigate/AverageSpeedCameraZoneUpdate;)V")
            .addInstructions(0, "invoke-static {p1}, $EXTENSION->onAvgSpeedZoneUpdate(Ljava/lang/Object;)V")

        // Waze's settings page builder: remember the page early, add the Mod's button at the end.
        findWazeMethod("com/waze/settings/cv", "x()V").apply {
            addInstructions(
                131, "invoke-static {}, $EXTENSION->attachRememberedSettingsButton()V",
            )
            addInstructions(2, "invoke-static {v0}, $EXTENSION->rememberSettingsRoot(Ljava/lang/Object;)V")
        }

        // NativeManagerBase.onAppBackground lambda: skip the native "app in background" call while the Mod keeps Waze
        // in the foreground.
        findWazeMethod("com/waze/NativeManagerBase", "onAppBackground\$lambda\$0(Lcom/waze/NativeManagerBase;)Lg/ab;")
            .addInstructionsWithLabels(
                3,
                """
                    invoke-static {}, Lcom/waze/gw/Gateway;->shouldPreventShutdown()Z
                    move-result v0
                    if-nez v0, :gw_keep_native_foreground
                """,
                ExternalLabel("gw_keep_native_foreground", 4),
            )
    }
}
