package app.morphe.patches.vk.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK

private const val EXTENSION_CLASS = "Lapp/morphe/extension/vk/layout/NavigationFilter;"

// TabbarState's no-arg List getter. Matched by shape because R8 renames it every build.
internal object TabbarStateGetItemsFingerprint : Fingerprint(
    definingClass = "Lcom/vk/tabbar/core/api/domain/TabbarState;",
    returnType = "Ljava/util/List;",
    parameters = emptyList()
)


internal object MainActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/vkontakte/android/MainActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList()
)

// Intercept TabbarSettingsRouterImpl.c(Context, String)
internal object TabbarSettingsRouterImplCFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "TabbarSettingsRouterImpl.kt" },
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;"
    )
)

// Intercept TabbarSettingsRouterImpl.a(NavigationDelegateActivity, int, TabbarState)
internal object TabbarSettingsRouterImplAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "TabbarSettingsRouterImpl.kt" },
    returnType = "V",
    parameters = listOf(
        "Lcom/vk/navigation/NavigationDelegateActivity;",
        "I",
        "Lcom/vk/tabbar/core/api/domain/TabbarState;"
    )
)

// Intercept TabbarSettingsFragment onViewCreated: the name and first parameter type are obfuscated
// (Sj(Lxsna/kab0;, View) in 8.195, oj(Lxsna/s6b0;, View) in 8.200)
internal object TabbarSettingsFragmentFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "TabbarSettingsFragment.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("L", "Landroid/view/View;")
)

private const val SUPERAPP_FILTER_CLASS = "Lapp/morphe/extension/vk/layout/SuperAppFilter;"

internal object SuperAppFragmentSubmitFingerprint : Fingerprint(
    definingClass = "Lcom/vk/superapp/ui/SuperAppFragment;",
    returnType = "V",
    parameters = listOf("Lcom/vk/superapp/dto/ListData;")
)


@Suppress("unused")
val navigationPatch = bytecodePatch(
    name = "Customize navigation bar",
    description = "Removes unwanted tabs (Clips, Services, etc.) from the bottom navigation bar."
) {
    compatibleWith(COMPATIBILITY_VK)

    extendWith("extensions/vk.mpe")

    execute {
        // The visible bar is built from the items read through this getter
        // (MainActivity -> NavigationDelegateBottom -> BottomNavigationState ->
        // BottomNavigationInteractor.b), and that TabbarState instance never goes through the
        // constructor, so the getter is the only place that reaches the UI.
        //
        // The method has a single register, which holds `this`, so the patch must not write a
        // result into it: clobbering p0 would make the original body read the field from null.
        // Instead the helper rewrites the field in place and the untouched body returns it.
        TabbarStateGetItemsFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->applyCustomOrder(Ljava/lang/Object;)V
                """
            )
        }


        MainActivityOnResumeFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS->onMainActivityResume(Landroid/app/Activity;)V
                """
            )
        }

        // Intercept opening VK tabbar settings to show our full 5-tab customization UI
        TabbarSettingsRouterImplCFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_CLASS->openSettings(Landroid/content/Context;)V
                    return-void
                """
            )
        }

        TabbarSettingsRouterImplAFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_CLASS->openSettings(Landroid/content/Context;)V
                    return-void
                """
            )
        }

        // If TabbarSettingsFragment is ever created directly, dismiss it and show our dialog
        TabbarSettingsFragmentFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS->onTabbarSettingsFragmentCreated(Ljava/lang/Object;)V
                """
            )
        }

        // Filter SuperApp (Services) tab to keep only Weather, Communities, Video, Clips, Settings
        SuperAppFragmentSubmitFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p1 }, $SUPERAPP_FILTER_CLASS->filterListData(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, Lcom/vk/superapp/dto/ListData;
                """
            )
        }
    }
}

