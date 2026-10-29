package android.graphics;

public final class Color {
    private Color() {}
    public static int parseColor(String colorString) {
        if (colorString == null || colorString.isEmpty()) throw new IllegalArgumentException("Unknown color");
        if (colorString.charAt(0) == '#') {
            long color = Long.parseLong(colorString.substring(1), 16);
            if (colorString.length() == 7) {
                color |= 0x00000000ff000000L;
            } else if (colorString.length() != 9) {
                throw new IllegalArgumentException("Unknown color");
            }
            return (int) color;
        }
        return 0xff000000;
    }
}
