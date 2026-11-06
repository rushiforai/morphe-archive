package slick.android

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private fun Element.add(
    tag: String,
    vararg attributes: Pair<String, String>,
    text: String? = null,
): Element =
    ownerDocument.createElement(tag).also { e ->
        for ((k, v) in attributes) {
            if (k.startsWith("android:")) e.setAttributeNS("http://schemas.android.com/apk/res/android", k, v) else e.setAttribute(k, v)
        }
        text?.let { e.textContent = it }
        appendChild(e)
    }

private fun Element.items(values: Map<String, String>) = apply { values.forEach { (k, v) -> add("item", "name" to k, text = v) } }

val modMenuResources =
    resourcePatch {
        execute {
            for (name in listOf("Lexend.ttf", "Lexend-OFL.txt")) {
                val target = get("assets/slick/$name")
                target.parentFile.mkdirs()
                val stream =
                    object {}.javaClass.classLoader.getResourceAsStream(name)
                        ?: error("Missing bundled font resource: $name")
                stream.use { input -> target.outputStream().use { input.copyTo(it) } }
            }
            document("AndroidManifest.xml").use { d ->
                val app = d.getElementsByTagName("application").item(0) as Element
                app.add(
                    "activity",
                    "android:name" to "slick.android.CrashReportActivity",
                    "android:exported" to "false",
                    "android:label" to "Slick crash report",
                )
                app.add(
                    "activity",
                    "android:name" to "slick.android.FeatureFlagsActivity",
                    "android:exported" to "false",
                    "android:label" to "Slick feature flags",
                    "android:windowSoftInputMode" to "adjustResize",
                )
                app.add(
                    "activity",
                    "android:name" to "slick.android.FontActivity",
                    "android:exported" to "false",
                    "android:label" to "Slick text font",
                    "android:theme" to "@style/SlickFontPicker",
                )
            }
            document("res/values/strings.xml").use { d ->
                d.documentElement.add("string", "name" to "slick_settings_title", text = "Slick settings")
                d.documentElement.add("string", "name" to "slick_cache_title", text = "Cache cleaner")
            }
            document("res/values/styles.xml").use { d ->
                val root = d.documentElement
                root.add("style", "name" to "SlickFontPicker", "parent" to "@style/Theme.SlackKit.Material3.NoActionBar").items(
                    mapOf(
                        "android:windowIsTranslucent" to "true",
                        "android:windowBackground" to "@android:color/transparent",
                        "android:backgroundDimEnabled" to "false",
                        "android:windowDisablePreview" to "true",
                    ),
                )
                val colors =
                    linkedMapOf<String, String>().apply {
                        fun set(
                            color: String,
                            vararg names: String,
                        ) = names.forEach { put(it, color) }
                        set(
                            "#ff000000",
                            "android:colorBackground",
                            "android:windowBackground",
                            "android:colorBackgroundFloating",
                            "colorSurface",
                            "colorSurfaceBright",
                            "colorSurfaceDim",
                            "colorSurfaceContainer",
                            "colorSurfaceContainerHigh",
                            "colorSurfaceContainerHighest",
                            "colorSurfaceContainerLow",
                            "colorSurfaceContainerLowest",
                            "skCoreBasePrimary",
                            "skCoreBaseSecondary",
                            "skCoreBaseTertiary",
                            "skCoreContainerPrimary",
                            "skCoreContainerSecondary",
                            "skThemeBasePrimary",
                            "skThemeBaseSecondary",
                            "skThemeBackgroundGradient1",
                            "skThemeBackgroundGradient2",
                            "skThemeSurfaceTertiary",
                            "mc3_surface",
                            "mc3_surface_bright",
                            "mc3_surface_dim",
                            "mc3_surface_container",
                            "mc3_surface_container_high",
                            "mc3_surface_container_highest",
                            "mc3_surface_container_low",
                            "mc3_surface_container_lowest",
                        )
                        set(
                            "#fff8f8f8",
                            "skCoreContentPrimary",
                            "skThemeContentPrimary",
                            "colorOnSurface",
                            "mc3_on_surface",
                            "skCoreBaseInversePrimary",
                            "skThemeContentInversePrimary",
                        )
                        set(
                            "#ffbababa",
                            "skCoreContentSecondary",
                            "skThemeContentSecondary",
                            "colorOnSurfaceVariant",
                            "mc3_on_surface_variant",
                        )
                        set("#ff9a9a9a", "skCoreContentTertiary", "skThemeContentTertiary")
                        set("#ff000000", "skCoreContentInversePrimary")
                        set("#ff333333", "skCoreContentInverseSecondary")
                        set("#ffbababa", "skThemeContentInverseSecondary")
                        set("#ff000000", "skThemeBaseInversePrimary")
                        set("#ff181818", "skThemeBaseInverseSecondary")
                        set("#ff000000", "skThemeSurfaceInversePrimary")
                        set("#ff181818", "skThemeSurfaceInverseSecondary")
                        set("#ff121212", "skThemeSurfaceInverseTertiary")
                        set("#ff181818", "skCoreSurfacePrimary")
                        set("#ff121212", "skCoreSurfaceSecondary")
                        set("#ff181818", "skThemeSurfacePrimary")
                        set("#ff121212", "skThemeSurfaceSecondary")
                    }
                root.add("style", "name" to "SlickAmoled", "parent" to "@style/ThemeOverlay.SlackKit.TrueDark").items(colors)
                root
                    .add("style", "name" to "SlickAmoledSheet")
                    .items(colors - "android:windowBackground")
                    .add("item", "name" to "bottomSheetStyle", text = "@style/SlickAmoledSheetWidget")
                root
                    .add("style", "name" to "SlickAmoledSheetWidget", "parent" to "@style/Widget.SlackKit.M3.BottomSheet")
                    .add("item", "name" to "backgroundTint", text = "#ff000000")
            }
        }
    }

val modMenu =
    bytecodePatch {
        dependsOn(modMenuResources)
        extendWith("slick-extension.dex")
        execute {
            // Context is attached by the framework before Application.onCreate.
            method("Lslack/app/SlackApp;", "onCreate") { it.parameterTypes.isEmpty() }
                .addInstructions(0, call("p0", "Settings;->initialize(Landroid/app/Application;)V"))

            method("Lslack/features/settings/circuit/MessageDisplayUiKt;", "PreferenceSettingsUi").run {
                check(registers == 23)
                val group = code.indexOfFirst { (it.ref as? MethodReference)?.name == "startRestartGroup" }
                check(group == 6) // v0 = state, v15 = composer; hook stays inside the restart scope.
                addInstructions(
                    group + 1,
                    """
                invoke-static {v0, v15}, Lslick/android/NativeSettings;->state(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lslack/features/settings/circuit/PreferenceSettings${'$'}State;
            """,
                )
            }
            method("Lslack/features/sharesheet/ui/ShareSheetUiKt\$\$ExternalSyntheticLambda0;", "invoke").run {
                val title = indexed { (it as? WideLiteralInstruction)?.wideLiteral == 0x7f13296aL }.one().index
                check((code[title + 1].ref as MethodReference).name == "stringResource")
                addInstructions(
                    title + 1,
                    "invoke-static {v1, v0}, Lslick/android/NativeSettings;->titleResource(ILjava/lang/Object;)I\nmove-result v1",
                )
            }

            method("Lslack/features/navigationview/you/fragments/NavYouFragment;", "<init>").run {
                addInstructions(indexed(Opcode.RETURN_VOID).one().index, call("p0", "Menu;->insert(Ljava/lang/Object;)V"))
            }

            method("Lslack/features/later/ui/LaterActionsDialogFragment\$initAdapter\$2;", "onResultClick").run {
                check(parameterTypes == listOf("Lslack/uikit/components/list/viewmodels/SKListViewModel;", "I", "Z"))
                check(registers > 4)
                intercept(
                    "invoke-static/range {p0 .. p1}, Lslick/android/Menu;->click(Ljava/lang/Object;Ljava/lang/Object;)Z\nmove-result v0",
                    "return-void",
                )
            }
        }
    }
