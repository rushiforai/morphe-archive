import app.template.patches.pizzabusiness.PizzaBootstrap;
import java.io.*;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.GZIPOutputStream;

/** Exercise native restoration outcomes, malformed input recovery and real payload parity. */
public class VerifyPizzaBootstrap {
    static byte[] sha(byte[] data) throws Exception { return MessageDigest.getInstance("SHA-256").digest(data); }
    static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
    static byte[] fixture(byte[] original, byte[] expected, int copyLength) throws Exception {
        var bytes = new ByteArrayOutputStream();
        try (var out = new DataOutputStream(new GZIPOutputStream(bytes))) {
            out.writeInt(0x505a4232); out.write(sha(original)); out.write(sha(expected));
            out.writeInt(expected.length); out.writeInt(3);
            out.writeByte(1); out.writeInt(3); out.writeInt(copyLength);
            out.writeByte(0); out.writeInt(1); out.writeByte('!');
            out.writeByte(1); out.writeInt(0); out.writeInt(3);
        }
        return bytes.toByteArray();
    }
    static byte[] restore(byte[] original, byte[] delta) {
        return PizzaBootstrap.INSTANCE.restoreNative(original, new ByteArrayInputStream(delta));
    }
    static void rejects(byte[] original, byte[] delta, String name) {
        try { restore(original, delta); } catch (Exception expected) { return; }
        throw new AssertionError("Accepted " + name);
    }
    public static void main(String[] args) throws Exception {
        byte[] original = "abcdef".getBytes(java.nio.charset.StandardCharsets.UTF_8);
        byte[] expected = "def!abc".getBytes(java.nio.charset.StandardCharsets.UTF_8);
        byte[] delta = fixture(original, expected, 3);
        check(Arrays.equals(restore(original, delta), expected), "Copy/literal reconstruction failed");
        check(Arrays.equals(original, "abcdef".getBytes()), "Input mutated");
        rejects("abcdeg".getBytes(), delta, "different original build");
        rejects(expected, delta, "already patched library");
        rejects(original, fixture(original, "invalid".getBytes(), 3), "wrong output hash");
        rejects(original, fixture(original, expected, 10), "out-of-bounds source range");
        rejects(original, Arrays.copyOf(delta, delta.length / 2), "truncated payload");
        System.out.println("PASS: native reconstruction, immutable source, wrong build/reapply/corrupt/range/truncation rejection");
        if (args.length == 3) {
            byte[] input = Files.readAllBytes(Path.of(args[0]));
            byte[] output;
            try (var resource = new FileInputStream(args[2])) {
                output = PizzaBootstrap.INSTANCE.restoreNative(input, resource);
            }
            check(Arrays.equals(output, Files.readAllBytes(Path.of(args[1]))), "Packaged native repair differs from tested runtime reconstruction");
            System.out.println("PASS: packaged repair exactly reproduces the runtime-tested ARM64 library");
        }
    }
}
