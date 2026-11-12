package app.badfella.extension.linkedin;

import android.animation.ValueAnimator;
import java.util.List;

class LinkedInUpstreamCheck {
    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    static double light(int color) {
        return ((color >> 16) & 255) * .299 + ((color >> 8) & 255) * .587 + (color & 255) * .114;
    }
    static void palette() {
        check(AccentPalette.parse(" #aBc123 ") == 0xABC123, "Hex color parsing");
        for (String invalid : List.of("", "#123", "#GG0000", "#12345678", "-00001"))
            check(AccentPalette.parse(invalid) == -1, "Invalid color accepted: " + invalid);
        check(AccentPalette.parse(null) == -1, "Null color accepted");
        check(AccentPalette.format(0xABC) .equals("#000ABC"), "Canonical color formatting");
        for (int seed : new int[]{0, 0xFFFFFF, 0xFF0000, 0x00897B, 0x6750A4}) {
            double previous = 256;
            for (int shade : new int[]{10,50,100,200,300,400,500,600,700,800,900,1000}) {
                int color = AccentPalette.shade(seed, shade);
                check((color >>> 24) == 255, "Palette is not opaque");
                check(light(color) <= previous + 3, "Tone ordering reversed");
                previous = light(color);
            }
            check(AccentPalette.shade(seed, 1000) == 0xFF000000,
                    "Black endpoint for " + Integer.toHexString(seed) + ": " + Integer.toHexString(AccentPalette.shade(seed, 1000)));
        }
        Settings.seed = 0x6750A4;
        int expected = AccentPalette.shade(Settings.seed, 600);
        check(MaterialYou.accent(0xFF0A66C2L) == (expected & 0xFFFFFFFFL), "Custom accent not used in production theme");
        long translucent = MaterialYou.translucentAccent(0x330A66C200000000L);
        check(translucent == (((0x33000000L | (expected & 0xFFFFFFL))) << 32), "Alpha lost");
        check(MaterialYou.settingsAccent(false, 0) == expected, "Settings accent not mapped");
        Settings.enabled = false;
        check(MaterialYou.accent(0xFF0A66C2L) == 0xFF0A66C2L, "Disabled theme still changes colors");
        Settings.enabled = true; Settings.seed = -1;
        if (android.os.Build.VERSION.SDK_INT < 31)
            check(MaterialYou.accent(0xFF0A66C2L) == 0xFF0A66C2L, "Old Android accessed missing system palette");
        else
            check(MaterialYou.accent(0xFF0A66C2L) == 0xFF123456L, "Wallpaper fallback not preserved");
        System.out.println("PASS: palettes, custom theme mapping, disabled/wallpaper fallback and alpha");
    }
    static void icons() {
        for (int bookmark : new int[]{190,148,1124,1122}) {
            var image = ProtoEdit.message(8, ProtoEdit.varintField(3, bookmark), ProtoEdit.string(4,"Bookmark"));
            byte[] row = ProtoEdit.write(List.of(image, ProtoEdit.string(6, "Save")));
            for (String action : List.of("copy", "download", "pdf")) {
                var result = new MenuIconIds.Result();
                byte[] changed = MenuIconIds.swap(row, action, result);
                var fields = ProtoEdit.parse(changed);
                check(result.swapped == 1, "Bookmark not replaced");
                check(MenuIconIds.designSystemId(fields.get(0).data) == MenuIconIds.target(bookmark, action), "Wrong icon family/size");
                check(java.util.Arrays.equals(fields.get(1).data, ProtoEdit.parse(row).get(1).data), "Unrelated row text changed");
            }
            check(MenuIconIds.swap(row, "unknown", new MenuIconIds.Result()) == row, "Unknown action modified row");
        }
        byte[] unknown = ProtoEdit.write(List.of(ProtoEdit.message(8, ProtoEdit.varintField(3, 9999))));
        check(MenuIconIds.swap(unknown, "copy", new MenuIconIds.Result()) == unknown, "Unknown icon modified");
        check(MenuIconIds.designSystemId(new byte[]{(byte)255}) == -1, "Malformed image accepted");
        System.out.println("PASS: both bookmark families/sizes, action icons and unchanged unknown payloads");
    }
    static void spring() {
        var pill = new SlidingPill(() -> {});
        pill.select(0, 100); check(pill.start() == 0 && pill.end() == 100, "Initial placement");
        pill.select(100, 200); var animator = ValueAnimator.last;
        check(animator.duration == 600, "Spring duration");
        animator.frame(.1f); check(pill.swell() > 1, "No early swell");
        animator.frame(.5f); check(pill.start() > 100, "No overshoot");
        pill.select(100, 200); check(ValueAnimator.last == animator, "Predraw restarted spring");
        animator.frame(.8f); check(pill.swell() == 1, "Swell lasts too long");
        float before = pill.start(); pill.select(200, 300);
        check(Math.abs(pill.start() - before) < .001, "Retarget jumps");
        ValueAnimator.last.frame(1); check(pill.start() == 200 && pill.end() == 300 && pill.swell() == 1, "Final placement");
        System.out.println("PASS: full spring time, overshoot/swell, unchanged target and continuous retarget");
    }
    public static void main(String[] args) {
        switch (args[0]) { case "palette" -> palette(); case "icons" -> icons(); case "spring" -> spring(); }
    }
}
