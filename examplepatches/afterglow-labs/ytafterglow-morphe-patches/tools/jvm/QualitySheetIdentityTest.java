import app.afterglow.extension.playback.QualitySheetIdentity;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

/** Native captures establish the field path; malformed or nested matches must leave menus alone. */
public final class QualitySheetIdentityTest {
    static int checks;
    static void check(boolean expected, byte[] bytes, String label) {
        checks++;
        if (QualitySheetIdentity.isQuick(bytes) != expected) throw new AssertionError(label);
    }
    static void command(boolean expected, byte[] bytes, String label) {
        checks++;
        if (QualitySheetIdentity.hasResolutions(bytes) != expected) throw new AssertionError(label);
    }
    static byte[] replace(byte[] input, String from, String to) {
        byte[] result = input.clone(), before = text(from), after = text(to);
        if (before.length != after.length) throw new AssertionError("fixture mutation length");
        for (int i = 0; i <= result.length - before.length; i++) {
            boolean match = true;
            for (int j = 0; j < before.length; j++) if (result[i + j] != before[j]) match = false;
            if (match) System.arraycopy(after, 0, result, i, after.length);
        }
        if (Arrays.equals(result, input)) throw new AssertionError("fixture mutation was absent");
        return result;
    }
    static byte[] join(byte[]... values) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (byte[] value : values) out.write(value, 0, value.length);
        return out.toByteArray();
    }
    static byte[] var(long value) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        while ((value & ~127L) != 0) { out.write((int) value & 127 | 128); value >>>= 7; }
        out.write((int) value); return out.toByteArray();
    }
    static byte[] field(int number, byte[] value) {
        return join(var((long) number << 3 | 2), var(value.length), value);
    }
    static byte[] root(byte[] name) {
        return field(1, field(168777401, field(3, field(172035250, field(1, name)))));
    }
    static byte[] text(String value) { return value.getBytes(StandardCharsets.UTF_8); }
    public static void main(String[] args) throws Exception {
        String name = "quick_quality_sheet_content.eml-js-fe|8b6a6e44f8046c92";
        byte[] quick = root(text(name)), original = quick.clone();
        check(true, quick, "captured quick template identifier");
        check(false, root(text("advanced_quality_sheet_content.eml-js-fe|8b7f8aeda2445547")), "advanced sheet");
        check(false, root(text("playback_speed_sheet_content.eml-js-fe|123")), "unrelated one-item sheet");
        check(false, root(text(name.replace(".eml-", ".emlWrong-"))), "similar name is not the template");
        check(true, root(text("quick_quality_sheet_content.eml")), "unversioned native template");
        check(true, root(text("quick_quality_sheet_content.eml|123")), "native template hash");
        check(false, root(text("Quick_quality_sheet_content.eml")), "case sensitive identity");
        check(false, root(text("x" + name)), "not a substring match");
        check(false, field(7, quick), "quick template nested inside another root");
        check(false, join(root(text("other.eml")), field(5, quick)), "nested quick command does not identify the sheet");
        check(false, join(quick, quick), "duplicate root is ambiguous");
        check(true, join(field(9, text(name)), quick), "unrelated field is skipped");
        check(true, join(var(8L << 3), var(923456), quick), "unknown varint field");
        check(true, join(var(8L << 3 | 1), new byte[8], quick), "unknown fixed64 field");
        check(true, join(var(8L << 3 | 5), new byte[4], quick), "unknown fixed32 field");
        check(false, join(quick, new byte[]{0}), "invalid field number");
        check(false, join(var(8L << 3 | 3), quick), "unsupported group fails open");
        check(false, join(var(8L << 3 | 1), new byte[7]), "truncated fixed field");
        check(false, new byte[]{10, (byte) 255, (byte) 255, (byte) 255, (byte) 255, 15}, "oversized length");
        check(false, new byte[]{(byte) 128,(byte) 128,(byte) 128,(byte) 128,(byte) 128,(byte) 128,(byte) 128,(byte) 128,(byte) 128,2}, "overflowing varint");
        for (int i = 0; i < quick.length; i++) check(false, Arrays.copyOf(quick, i), "truncation " + i);
        check(false, null, "missing data");
        if (!Arrays.equals(quick, original)) throw new AssertionError("native bytes were modified");
        byte[] empty = Files.readAllBytes(Path.of(args[0], "empty-command.bin"));
        byte[] populated = Files.readAllBytes(Path.of(args[0], "populated-command.bin"));
        byte[] populatedOriginal = populated.clone();
        command(false, empty, "native first-draw command has no formats");
        command(true, populated, "native updated command has five formats");
        command(false, quick, "sheet identity is not a ready action");
        command(false, join(populated, populated), "ambiguous duplicate action");
        command(false, join(populated, new byte[]{0}), "malformed command suffix");
        command(false, field(7, populated), "unrelated command containing quality data");
        command(false, replace(populated, "handleOnTap", "handleOther"), "different native action");
        command(false, replace(populated, "advanced_quality_sheet_content.eml", "unrelate_quality_sheet_content.eml"), "different target sheet");
        command(true, replace(populated, "720p", "HD  "), "format availability is independent of labels");
        command(false, null, "missing command");
        command(false, new byte[65537], "bounded command size");
        for (int i = 0; i < populated.length; i++)
            command(false, Arrays.copyOf(populated, i), "native command truncation " + i);
        if (!Arrays.equals(populated, populatedOriginal)) throw new AssertionError("native command changed");
        System.out.println("PASS quality sheet identity: " + checks + " checks");
    }
}
