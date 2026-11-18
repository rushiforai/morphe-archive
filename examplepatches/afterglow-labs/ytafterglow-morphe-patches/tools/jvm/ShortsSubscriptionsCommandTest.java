package app.afterglow.extension.interfaceui;

import java.io.ByteArrayOutputStream;
import java.util.Arrays;
import java.util.Random;
import static app.afterglow.extension.interfaceui.ShortsSubscriptionsCommand.Source.*;

public final class ShortsSubscriptionsCommandTest {
    private static int checks;
    private static void check(boolean value, String label) { checks++; if (!value) throw new AssertionError(label); }
    private static byte[] varint(long value) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        while ((value & ~127L) != 0) { bytes.write((int) (value & 127) | 128); value >>>= 7; }
        bytes.write((int) value); return bytes.toByteArray();
    }
    private static byte[] join(byte[]... parts) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        for (byte[] part : parts) bytes.write(part, 0, part.length); return bytes.toByteArray();
    }
    private static byte[] number(int field, long value) { return join(varint((long) field << 3), varint(value)); }
    private static byte[] message(int field, byte[] value) { return join(varint(((long) field << 3) | 2), varint(value.length), value); }
    private static byte[] endpoint(long source) { return message(139608561, number(26, source)); }
    private static byte[] elements(byte[] nativeCommand) { return message(169495254, nativeCommand); }
    public static void main(String[] args) {
        check(ShortsSubscriptionsCommand.classify(endpoint(32)) == PAUSED_SUBSCRIPTIONS, "exact native paused-subscriptions source");
        for (int source : new int[]{7, 33, 61, 64, 0, 31, 34, 79, 80, -1})
            check(ShortsSubscriptionsCommand.classify(endpoint(source)) == OTHER_REEL, "other source remains distinct: " + source);
        check(ShortsSubscriptionsCommand.classify(message(139608561, new byte[0])) == OTHER_REEL, "missing source is not assumed");
        check(ShortsSubscriptionsCommand.classify(new byte[0]) == NO_REEL, "empty command has no reel endpoint");
        check(ShortsSubscriptionsCommand.classify(number(26, 32)) == NO_REEL, "bare source field cannot impersonate a command");
        check(ShortsSubscriptionsCommand.classify(message(1, endpoint(32))) == NO_REEL, "nested tracking data is not recursively searched");
        check(ShortsSubscriptionsCommand.classify(message(139608562, number(26, 32))) == NO_REEL, "different extension cannot match");
        check(ShortsSubscriptionsCommand.classify(join(message(1, new byte[]{1,2,3}), endpoint(32), number(3, 123))) == PAUSED_SUBSCRIPTIONS, "unknown valid command metadata preserved");
        check(ShortsSubscriptionsCommand.classify(join(endpoint(32), endpoint(32))) == INVALID, "duplicate endpoint is ambiguous");
        check(ShortsSubscriptionsCommand.classify(message(139608561, join(number(26, 32), number(26, 7)))) == INVALID, "duplicate source is ambiguous");
        check(ShortsSubscriptionsCommand.classify(message(139608561, message(26, new byte[]{32}))) == INVALID, "source wrong wire type");
        check(ShortsSubscriptionsCommand.classify(number(139608561, 32)) == INVALID, "endpoint wrong wire type");
        check(ShortsSubscriptionsCommand.classify(join(endpoint(32), new byte[]{0})) == INVALID, "malformed trailing data fails closed");
        check(ShortsSubscriptionsCommand.classify(null) == INVALID, "null fails closed");
        check(ShortsSubscriptionsCommand.classify(new byte[65537]) == INVALID, "byte budget");
        check(ShortsSubscriptionsCommand.classify(new byte[]{11,12}) == INVALID, "groups unsupported");
        check(ShortsSubscriptionsCommand.classify(new byte[]{8,(byte)128,0}) == INVALID, "noncanonical varint");
        byte[] overflow = new byte[11]; Arrays.fill(overflow, (byte)255); overflow[0] = 8;
        check(ShortsSubscriptionsCommand.classify(overflow) == INVALID, "varint overflow");
        ByteArrayOutputStream fields = new ByteArrayOutputStream();
        for (int i = 0; i < 513; i++) fields.writeBytes(number(1, 1));
        check(ShortsSubscriptionsCommand.classify(fields.toByteArray()) == INVALID, "field budget");
        byte[] valid = endpoint(32);
        for (int i = 1; i < valid.length; i++) check(ShortsSubscriptionsCommand.classify(Arrays.copyOf(valid, i)) == INVALID, "truncation " + i);
        check(ShortsSubscriptionsCommand.classifyElements(elements(endpoint(32))) == PAUSED_SUBSCRIPTIONS, "primary Elements command wraps the exact native endpoint");
        for (int source : new int[]{7, 33, 61, 64})
            check(ShortsSubscriptionsCommand.classifyElements(elements(endpoint(source))) == OTHER_REEL, "other primary source remains visible: " + source);
        check(ShortsSubscriptionsCommand.classifyElements(endpoint(32)) == NO_REEL, "native command cannot impersonate Elements command");
        check(ShortsSubscriptionsCommand.classifyElements(message(1, elements(endpoint(32)))) == NO_REEL, "tracking bytes are never recursively searched");
        check(ShortsSubscriptionsCommand.classifyElements(join(elements(endpoint(32)), elements(endpoint(32)))) == INVALID, "duplicate native command rejected");
        check(ShortsSubscriptionsCommand.classifyElements(join(elements(endpoint(32)), message(100001, new byte[0]))) == INVALID, "mixed Elements action rejected");
        check(ShortsSubscriptionsCommand.classifyElements(elements(join(endpoint(32), message(100002, new byte[0])))) == INVALID, "mixed native action rejected");
        check(ShortsSubscriptionsCommand.classifyElements(join(number(1, 1), elements(endpoint(32)))) == PAUSED_SUBSCRIPTIONS, "ordinary Elements metadata retained");
        check(ShortsSubscriptionsCommand.classifyElements(null) == INVALID, "null Elements command rejected");
        check(ShortsSubscriptionsCommand.classifyElements(new byte[65537]) == INVALID, "Elements byte budget");
        byte[] element = elements(endpoint(32));
        for (int i = 1; i < element.length; i++) check(ShortsSubscriptionsCommand.classifyElements(Arrays.copyOf(element, i)) == INVALID, "Elements truncation " + i);
        Random random = new Random(5243);
        for (int i = 0; i < 1000; i++) { byte[] input = new byte[random.nextInt(256)]; random.nextBytes(input);
            check(ShortsSubscriptionsCommand.classify(input) != PAUSED_SUBSCRIPTIONS, "random data cannot claim subscriptions");
            check(ShortsSubscriptionsCommand.classifyElements(input) != PAUSED_SUBSCRIPTIONS, "random Elements command cannot claim subscriptions"); }
        System.out.println("PASS " + checks + " native and primary Elements paused-subscriptions command/bounds checks");
    }
}
