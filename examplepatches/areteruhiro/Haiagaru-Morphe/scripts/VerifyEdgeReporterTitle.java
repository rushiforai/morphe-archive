import app.morphe.extension.chmate.EdgeReporterTitle;
import java.util.Objects;

public class VerifyEdgeReporterTitle {
    private static int checks;
    private static void check(String selected, String history, String expected) {
        checks++;
        String result = EdgeReporterTitle.preserve(selected, history);
        if (!Objects.equals(expected, result)) throw new AssertionError(result);
    }
    public static void main(String[] args) {
        check("スレ [g66+xfHI★]", "スレ", "スレ [g66+xfHI★]");
        check("スレ [/sE8R8tL★]", "スレ", "スレ [/sE8R8tL★]");
        check("スレ [g66+xfHI★]", "", "スレ [g66+xfHI★]");
        check("スレ [g66+xfHI★]", null, "スレ [g66+xfHI★]");
        check("スレ [g66+xfHI★]", "スレ [g66+xfHI★]", "スレ [g66+xfHI★]");
        check("スレ [g66+xfHI★]", "変更済み", "変更済み");
        check("スレ", "保存タイトル", "保存タイトル");
        check(null, "スレ", "スレ");
        check(null, null, null);
        check("スレ [not-an-id★]", "スレ", "スレ");
        check("スレ [g66+xfHI★] 追加", "スレ", "スレ");
        System.out.println("PASS: " + checks + " title selection checks");
    }
}
