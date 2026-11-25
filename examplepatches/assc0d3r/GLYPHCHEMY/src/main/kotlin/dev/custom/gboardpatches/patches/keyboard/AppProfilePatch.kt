package dev.custom.gboardpatches.patches.keyboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.custom.gboardpatches.patches.extras.injectStaticCallOnParamType
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices

private const val IME_CLASS = "Lcom/google/android/libraries/inputmethod/ime/AbstractIme;"
private const val IME_CLASS_NAME = "com/google/android/libraries/inputmethod/ime/AbstractIme"
private const val INCOGNITO_OWNER = "Lesj;"
private const val EDITOR_INFO = "Landroid/view/inputmethod/EditorInfo;"
private const val HELPER_CLASS = "Ldev/custom/gboardpatches/keyboard/AppProfileRuntime;"
private const val CANDIDATE_HOLDER_CLASS =
    "Lcom/google/android/apps/inputmethod/latin/keyboard/widget/LatinFixedCountCandidatesHolderView;"
private const val COMMON_PREFERENCE_FRAGMENT =
    "Lcom/google/android/libraries/inputmethod/preferencewidgets/CommonPreferenceFragment;"
private const val PREFERENCE_GROUP = "Landroidx/preference/PreferenceGroup;"
private const val LIST = "Ljava/util/List;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"

/**
 * Per-app typing profiles: an app whose package has a rule in the local rule table gets its
 * restrictions applied before the keyboard is drawn, and loses them the moment another app takes
 * focus.
 *
 * Three hooks, all restricting:
 * - `AbstractIme.fz` (onActivate) receives the EditorInfo before keyboard inflation. The service
 *   itself is not a `Context` in 18.6.3 (its superclass is `Object`), so the context comes from
 *   the `C` field the IME already keeps. The runtime records the package, its field kind and the
 *   matching rule for the session.
 * - `Lesj.I()Z` is the incognito predicate the manual Incognito feature already wraps, so a profile
 *   that asks for incognito joins the same gate instead of introducing a second one.
 * - `LatinFixedCountCandidatesHolderView.D` binds the candidate chips; a profile with suggestions
 *   off hands it an empty list, so the strip shows nothing while the rest of the binding stays
 *   stock.
 *
 * The rule table lives in the app's private preferences (`gboard_app_profiles`), so no app list or
 * rule ever leaves the device.
 */
val appProfilePatch = bytecodePatch(
    name = "Per-app profiles",
    description = "Apply a per-app profile to the keyboard: incognito (no learning) and no " +
        "suggestions for apps listed in the local rule table, plus a toolbar order and a theme or " +
        "keyboard height written through Gboard's own toolbar editor and " +
        "additional_keyboard_theme preference. Several rules can be kept and cleared from " +
        "Gboard's settings as a package=tokens list, next to the single rule. A session override " +
        "can be set for the app in focus and lasts until another app is focused.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = null, isExperimental = true),
            ),
        ),
    )
    extendWith("colorwheel.dex")
    dependsOn(appProfileSettingsPatch)

    execute {
        val ime = mutableClassDefByOrNull(IME_CLASS)
            ?: error("Gboard input method base class not found.")

        val onActivate = ime.methods.firstOrNull { method ->
            method.name == "fz" && method.returnType == "V" &&
                method.parameterTypes == listOf(EDITOR_INFO, "Z", "Lpwf;")
        } ?: error("Gboard activation handler $IME_CLASS_NAME->fz(EditorInfo;ZLpwf;)V not found.")

        if (!onActivate.callsAppProfileRuntime("onActivate")) {
            // The profile has to be known before the stock body builds the keyboard: no flicker
            // and no first-frame suggestions for a restricted app.
            onActivate.addInstructions(
                0,
                """
                    iget-object v0, p0, $IME_CLASS->C:Landroid/content/Context;
                    invoke-static {v0, p1}, $HELPER_CLASS->onActivate(Landroid/content/Context;$EDITOR_INFO)V
                """.trimIndent(),
            )
        }

        val incognito = mutableClassDefByOrNull(INCOGNITO_OWNER)?.methods?.firstOrNull { method ->
            method.name == "I" && method.returnType == "Z" && method.parameterTypes.isEmpty()
        } ?: error("Gboard incognito predicate $INCOGNITO_OWNER->I()Z not found.")

        if (!incognito.callsAppProfileRuntime("applyIncognito")) {
            incognito.delegateBooleanReturns("applyIncognito")
        }

        // Optional: an experimental target may have moved the strip binding. Incognito still works
        // there, so a missing bind method is not a patch failure.
        mutableClassDefByOrNull(CANDIDATE_HOLDER_CLASS)
            ?.methods
            ?.firstOrNull { method ->
                method.name == "D" && method.returnType == "V" &&
                    method.parameterTypes == listOf(LIST, ARRAY_LIST)
            }
            ?.let { bind ->
                if (!bind.callsAppProfileRuntime("applySuggestionPolicy")) {
                    bind.addInstructions(
                        0,
                        """
                            invoke-static/range {p1 .. p1}, $HELPER_CLASS->applySuggestionPolicy($LIST)$LIST
                            move-result-object p1
                        """.trimIndent(),
                    )
                }
            }

        // The Saved rules row shows the count and the packages it covers while Gboard's
        // Preferences screen loads. `CommonPreferenceFragment->aH(int, PreferenceGroup)` walks
        // every preference group after the screen is inflated - the same hook the glide-trail
        // summaries use - so the row is readable without opening the field. Only aH is hooked:
        // aX calls aH for the same tree (often with a null group), so hooking both would refresh
        // every row twice.
        mutableClassDefByOrNull(COMMON_PREFERENCE_FRAGMENT)?.let { fragment ->
            val groupWalkers = fragment.methods.filter { method ->
                method.name == "aH" && method.returnType == "V" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "I" &&
                    method.parameterTypes[1].toString() == PREFERENCE_GROUP
            }
            groupWalkers.forEach { group ->
                group.injectStaticCallOnParamType(
                    hookOwner = HELPER_CLASS,
                    hookName = "refreshSavedRulesSummary",
                    hookParameterTypes = listOf("Ljava/lang/Object;"),
                    targetType = PREFERENCE_GROUP,
                )
            }
            check(groupWalkers.isNotEmpty() &&
                groupWalkers.all { it.callsAppProfileRuntime("refreshSavedRulesSummary") }
            ) {
                "Per-app profile saved rules summary hook was not installed."
            }
        }

        check(onActivate.callsAppProfileRuntime("onActivate")) {
            "Per-app profile activation hook was not installed."
        }
        check(incognito.callsAppProfileRuntime("applyIncognito")) {
            "Per-app profile incognito hook was not installed."
        }
    }
}

private fun MutableMethod.callsAppProfileRuntime(name: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.definingClass == HELPER_CLASS && reference.name == name
    } == true

/** Replaces every boolean return with the runtime's answer for it. */
private fun MutableMethod.delegateBooleanReturns(name: String) {
    val instructions = implementation?.instructions ?: error("No instructions in $definingClass->$name")
    val returns = returnInstructionIndices().filter { index ->
        instructions[index].isOpcode("RETURN")
    }
    check(returns.isNotEmpty()) { "No boolean return in $definingClass->${this.name}" }
    returns.asReversed().forEach { index ->
        val register = (instructions[index] as OneRegisterInstruction).registerA
        addInstructions(
            index,
            """
                invoke-static {v$register}, $HELPER_CLASS->$name(Z)Z
                move-result v$register
            """.trimIndent(),
        )
    }
}
