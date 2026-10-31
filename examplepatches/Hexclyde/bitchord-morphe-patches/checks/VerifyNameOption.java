import app.morphe.patcher.patch.*;

import kotlin.jvm.functions.Function2;

import java.io.File;
import java.util.Set;

/** Exercise the actual option validator loaded from the release bundle. */
public final class VerifyNameOption {
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void main(String[] args) {
        Patch<?> patch =
                new PatchLoader.Jar(Set.of(new File(args[0])))
                        .stream()
                                .filter(p -> "Install as Bitchord+".equals(p.getName()))
                                .findFirst()
                                .orElseThrow();
        Option option = patch.getOptions().get("installationName");
        if (option == null || !"".equals(option.getDefault()) || option.getRequired())
            throw new AssertionError("Optional blank installation name missing");
        Function2 validator = option.getValidator();
        int checks = 1;
        for (String name :
                new String[] {
                    "",
                    "   ",
                    "Weekend Audio",
                    "  Studio & Audio  ",
                    "Música +",
                    "Unofficial Telegram Music",
                    "x".repeat(80)
                }) {
            if (!Boolean.TRUE.equals(validator.invoke(option, name)))
                throw new AssertionError("Rejected valid name");
            checks++;
        }
        for (String name :
                new String[] {
                    "Telegram Music", "MyTelegram", "Line\nBreak", "Control\u0001", "x".repeat(81)
                }) {
            if (!Boolean.FALSE.equals(validator.invoke(option, name)))
                throw new AssertionError("Accepted invalid name");
            checks++;
        }
        System.out.println(
                "PASS: "
                        + checks
                        + " installation-name option/default/validation cases from the actual"
                        + " MPP.");
    }
}
