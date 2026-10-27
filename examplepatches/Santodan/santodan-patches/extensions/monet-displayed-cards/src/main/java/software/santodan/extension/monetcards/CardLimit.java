package software.santodan.extension.monetcards;

/** Integer.MAX_VALUE means all available entries; arithmetic never wraps. */
public final class CardLimit {
    public static final int MIN = 4;
    public static final int MAX = Integer.MAX_VALUE;
    private CardLimit() {}
    public static boolean isCardPicker(int minimum, int maximum) {
        return minimum == MIN && (maximum == 20 || maximum == MAX);
    }
    public static int pickerMaximum(int minimum, int maximum) {
        return isCardPicker(minimum, maximum) ? MAX : maximum;
    }
    public static String number(int value, int minimum, int maximum) {
        return isCardPicker(minimum, maximum) && value == MAX ? "Max" : Integer.toString(value);
    }
    public static int step(int value, int delta, int finite) {
        long next = (long) (value == MAX ? finite : value) + delta;
        return (int) Math.max(MIN, Math.min(MAX, next));
    }
    public static int schemaMaximum(String key, int original) {
        return key.equals("continue_watching_card_limit") || key.equals("recommendations_card_limit")
            || key.equals("live_channel_card_limit") ? MAX : original;
    }
    public static String label(int resource, Object[] arguments) {
        return resource == 0x7f110354 && arguments != null && arguments.length == 1
            && Integer.valueOf(MAX).equals(arguments[0]) ? "Max" : null;
    }
}
