package dev.custom.gboardpatches.patches.keyboard

/**
 * The smali the Smart bar case swipe patch injects into Gboard's single commit funnel
 * (`Lowy;->f(InputConnection, CharSequence, int)V` on 18.6.3 and 18.5.4, `Laerl;->f` on 18.8.0).
 *
 * The invariant lives here, not inline in the patch, because getting it wrong is not a compile
 * error: the flags int and the text argument are both single-register parameters, so passing the
 * wrong one only fails on the device, as
 * `VerifyError: register v4 has type Integer but expected Reference: java.lang.CharSequence`
 * inside `LatinIme.fz` while the IME is starting up. `tools/check-case-swipe-hook.sh` runs this
 * code at build time and fails the build when the CharSequence register is not the one passed.
 */
const val CASE_SWIPE_HELPER_CLASS =
    "Ldev/custom/gboardpatches/keyboard/SmartBarCaseSwipeRuntime;"
const val CASE_SWIPE_TEXT_TYPE = "Ljava/lang/CharSequence;"

object CaseSwipeHook {

    /**
     * The `p` register that holds the funnel's CharSequence parameter.
     *
     * Parameter registers are numbered from the signature rather than guessed: an instance method
     * spends `p0` on `this`, then each parameter takes one register in declaration order. That is
     * `p1` for the static funnel Gboard ships today, and `p2` if it ever becomes an instance method.
     */
    fun textRegister(isStatic: Boolean, parameterTypes: List<CharSequence>): String {
        val index = parameterTypes.indexOf(CASE_SWIPE_TEXT_TYPE)
        check(index >= 0) {
            "Smart bar case swipe hook: the commit funnel has no CharSequence parameter " +
                "($parameterTypes), so the hook cannot replace the committed text."
        }
        return "p" + if (isStatic) index else index + 1
    }

    /** Replaces the funnel's text argument with the runtime's answer, in place. */
    fun instructions(isStatic: Boolean, parameterTypes: List<CharSequence>): List<String> {
        val register = textRegister(isStatic, parameterTypes)
        return listOf(
            "invoke-static {$register}, $CASE_SWIPE_HELPER_CLASS->" +
                "applyCommittedCase($CASE_SWIPE_TEXT_TYPE)$CASE_SWIPE_TEXT_TYPE",
            "move-result-object $register",
        )
    }
}
