package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val TV_FOCUS_HELPER = "Lcom/anime/witcher/TvFocusHelper;"

/**
 * D-pad navigation part of [androidTvSupportPatch].
 *
 * The app is designed for touch; on a TV / Fire TV remote there is nothing focusable in the
 * content area and focus gets stuck on the top bar. This patch:
 *
 * - Wires [TvFocusHelper] as an ActivityLifecycleCallbacks in ApplicationClass.onCreate() so
 *   every activity gets a focusability pass (every actionable view becomes focusable, so no
 *   button is unreachable, including buttons nested inside a clickable parent; list rows added
 *   later are also covered).
 * - Redirects D-pad presses away from the top bar to the first content row in
 *   AppCompatActivity.dispatchKeyEvent().
 * - Makes every Dialog the app shows TV-focusable (all actionable views inside become
 *   focusable, independent of their on-screen position) and installs the window callback
 *   wrapper right before each Dialog.show() / AlertDialog.show() / AppCompatDialog.show()
 *   call site, so D-pad navigation works inside dialogs too.
 *
 * Only runs when "Android TV" is enabled: enabling that patch auto-applies this one.
 * The runtime classes live in the "extensions/extension.mpe" DEX merged by the patcher.
 */
@Suppress("unused")
val tvDpadNavigationPatch = bytecodePatch(
    name = "Android TV: D-pad navigation",
    description = "Part of Android TV: makes the app fully navigable with a TV / Fire TV remote (focusable content rows, D-pad focus out of the top bar, dialog focus). Original APK: https://www.animewitcher.com/",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    extendWith("extensions/extension.mpe")

    execute {
        // Register TvFocusHelper as an ActivityLifecycleCallbacks right after super.onCreate(),
        // before FirebaseApp.initializeApp / the appearance setting code run.
        ApplicationClassOnCreateFingerprint.method.addInstructions(
            1,
            """
                new-instance v0, $TV_FOCUS_HELPER
                invoke-direct {v0}, $TV_FOCUS_HELPER-><init>()V
                invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application${'$'}ActivityLifecycleCallbacks;)V
            """
        )

        // Consume a top-bar D-pad press only after focus has actually moved into a content
        // row; otherwise fall through to the original dispatch so in-content navigation is
        // left untouched. redirectMod itself filters action/keycode/focus-position.
        //
        // NOTE: this modifies the androidx.appcompat AppCompatActivity class, so the injected
        // code must only use registers the target method already declares. AppCompatActivity
        // dispatchKeyEvent declares at least one local, so v0 is safe to clobber here: it is
        // inserted at the top of the method, before any original code reads v0.
        AppCompatActivityDispatchKeyEventFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $TV_FOCUS_HELPER->redirectMod(Landroid/app/Activity;Landroid/view/KeyEvent;)Z
                move-result v0
                if-eqz v0, :original
                const/4 v0, 0x1
                return v0
                :original
                nop
            """
        )

        // Make focusable any dialog the app shows, regardless of how it is built (plain
        // Dialog, AlertDialog, AppCompatDialog). fixDialog is idempotent, so hooking every
        // show() call site is safe: the target dialog's receiver register is reused for the
        // invoke-static inserted right before the show().
        val dialogShowOwners = setOf(
            "Landroid/app/Dialog;",
            "Landroid/app/AlertDialog;",
            "Landroidx/appcompat/app/AlertDialog;",
            "Landroidx/appcompat/app/AppCompatDialog;",
        )

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach methodLoop@{ method ->
                val implementation = method.implementation ?: return@methodLoop
                val matches = implementation.instructions.withIndex().filter { (_, instruction) ->
                    val invokesShow = instruction.opcode == Opcode.INVOKE_VIRTUAL
                        || instruction.opcode == Opcode.INVOKE_SUPER
                        || instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE
                        || instruction.opcode == Opcode.INVOKE_SUPER_RANGE
                    invokesShow && (instruction as? ReferenceInstruction)?.reference?.let { reference ->
                        reference is MethodReference
                            && reference.name == "show"
                            && reference.returnType == "V"
                            && reference.definingClass in dialogShowOwners
                    } == true
                }.map { it.index to it.value }

                matches.asReversed().forEach { (index, instruction) ->
                    val dialogRegister = when {
                        instruction is RegisterRangeInstruction && instruction.registerCount > 0 ->
                            instruction.startRegister
                        instruction is FiveRegisterInstruction && instruction.registerCount > 0 ->
                            instruction.registerC
                        else -> null
                    }
                    if (dialogRegister != null) {
                        method.addInstructions(
                            index,
                            "invoke-static {v$dialogRegister}, $TV_FOCUS_HELPER->fixDialog(Landroid/app/Dialog;)V"
                        )
                    }
                }
            }
        }
    }
}

/**
 * Adds Android TV / Fire TV support to the app. Optional.
 *
 * The app is not a dedicated TV app, but it works fine on TV when the following
 * manifest declarations are added:
 *
 * - `<uses-feature android:name="android.software.leanback" android:required="false"/>`
 *   so the app is considered TV-compatible (required=false keeps phone support).
 * - `<uses-feature android:name="android.hardware.touchscreen" android:required="false"/>`
 *   so the app can be installed on devices without a touchscreen.
 * - `android.banner="@mipmap/ic_launcher"` so the TV launcher can display a banner.
 *   The existing launcher icon is reused (no new drawable is added, which keeps the
 *   resource compile step robust).
 * - A `LEANBACK_LAUNCHER` intent filter on [HomeActivity] so the TV / Fire TV home
 *   screen shows a launcher entry.
 *
 * This patch pulls in the D-pad navigation sub-patch [tvDpadNavigationPatch], so enabling
 * it wires up both the TV manifest declarations and full remote navigation.
 */
@Suppress("unused")
val androidTvSupportPatch = resourcePatch(
    name = "Android TV",
    description = "Adds full Android TV / Fire TV support: manifest declarations, TV launcher entry and D-pad remote navigation (focusable content rows, focus out of the top bar, dialog focus). Original APK: https://www.animewitcher.com/",
    default = false
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)
    dependsOn(tvDpadNavigationPatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element

            fun addUsesFeature(name: String) {
                val feature = document.createElement("uses-feature")
                feature.setAttribute("android:name", name)
                feature.setAttribute("android:required", "false")
                manifest.appendChild(feature)
            }

            addUsesFeature("android.software.leanback")
            addUsesFeature("android.hardware.touchscreen")

            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:banner", "@mipmap/ic_launcher")

            val activities = document.getElementsByTagName("activity")
            var homeActivity: Element? = null
            for (i in 0 until activities.length) {
                val candidate = activities.item(i) as Element
                if (candidate.getAttribute("android:name") == "com.anime.witcher.HomeActivity") {
                    homeActivity = candidate
                    break
                }
            }
            checkNotNull(homeActivity) { "HomeActivity not found in AndroidManifest.xml" }

            val intentFilter = document.createElement("intent-filter")
            intentFilter.appendChild(document.createElement("action").apply {
                setAttribute("android:name", "android.intent.action.MAIN")
            })
            intentFilter.appendChild(document.createElement("category").apply {
                setAttribute("android:name", "android.intent.category.LEANBACK_LAUNCHER")
            })
            homeActivity.appendChild(intentFilter)
        }
    }
}