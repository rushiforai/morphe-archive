import dev.custom.gboardpatches.patches.keyboard.CaseSwipeHook;

import java.util.Arrays;
import java.util.List;

/**
 * Runs the compiled {@link CaseSwipeHook} against the commit-funnel shapes Gboard can have and
 * refuses any hook whose invoke-static register is not the funnel's CharSequence parameter.
 *
 * This is the build-time half of the on-device bug where the hook passed the flags int and every
 * keyboard start died with a VerifyError. Compiled classes are checked, so it covers the code that
 * actually ships in the bundle, not just the source text.
 */
public final class CaseSwipeHookCheck {

    private static final String INPUT_CONNECTION = "Landroid/view/inputmethod/InputConnection;";
    private static final String CHAR_SEQUENCE = "Ljava/lang/CharSequence;";
    private static final String INT = "I";

    private static int failures;

    public static void main(String[] args) {
        // Gboard's funnel as it ships: static, text argument second.
        check("static funnel", true, Arrays.<CharSequence>asList(INPUT_CONNECTION, CHAR_SEQUENCE, INT), "p1", "p2");
        // The same signature as an instance method: `this` takes p0, so text and flags shift.
        check("instance funnel", false, Arrays.<CharSequence>asList(INPUT_CONNECTION, CHAR_SEQUENCE, INT), "p2", "p3");
        // The register must follow the signature, not a hardcoded slot.
        check("reordered funnel", true, Arrays.<CharSequence>asList(CHAR_SEQUENCE, INPUT_CONNECTION, INT), "p0", "p2");

        if (failures > 0) {
            System.err.println("error: the Smart bar case swipe hook passes a wrong register.");
            System.err.println("error: the injected invoke-static must pass the commit funnel's");
            System.err.println("error: CharSequence parameter; passing the flags int ships a");
            System.err.println("error: VerifyError that crashes the keyboard on every input field.");
            System.exit(1);
        }
        System.out.println("  hook passes the CharSequence register in every funnel shape");
    }

    private static void check(
            String shape,
            boolean isStatic,
            List<CharSequence> parameterTypes,
            String textRegister,
            String flagsRegister) {
        String register = CaseSwipeHook.INSTANCE.textRegister(isStatic, parameterTypes);
        if (!register.equals(textRegister)) {
            fail(shape + ": text register is " + register + ", expected " + textRegister);
            return;
        }
        if (register.equals(flagsRegister)) {
            fail(shape + ": text register is the flags int register " + register);
            return;
        }

        List<String> instructions = CaseSwipeHook.INSTANCE.instructions(isStatic, parameterTypes);
        String expectedInvoke = "invoke-static {" + textRegister + "}, "
                + "Ldev/custom/gboardpatches/keyboard/SmartBarCaseSwipeRuntime;->"
                + "applyCommittedCase(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;";
        if (instructions.size() != 2) {
            fail(shape + ": emitted " + instructions.size() + " instructions, expected 2");
            return;
        }
        if (!instructions.get(0).equals(expectedInvoke)) {
            fail(shape + ": invoke is `" + instructions.get(0) + "`, expected `" + expectedInvoke + "`");
            return;
        }
        if (!instructions.get(1).equals("move-result-object " + textRegister)) {
            fail(shape + ": result is `" + instructions.get(1) + "`, expected `move-result-object "
                    + textRegister + "`");
            return;
        }
        for (String instruction : instructions) {
            if (instruction.contains("{" + flagsRegister + "}")) {
                fail(shape + ": emitted instruction reads the flags register " + flagsRegister);
                return;
            }
        }
        System.out.println("  " + shape + ": " + textRegister + " (flags in " + flagsRegister + ")");
    }

    private static void fail(String message) {
        failures++;
        System.err.println("error: Smart bar case swipe hook " + message);
    }
}
