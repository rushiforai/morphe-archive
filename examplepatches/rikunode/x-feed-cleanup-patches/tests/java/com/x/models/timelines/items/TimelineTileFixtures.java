package com.x.models.timelines.items;

/**
 * Minimal test doubles for the verified X 12.31/12.32 class/field chain.
 * These are test-only classes, never packaged in the Morphe extension.
 */
public final class TimelineTileFixtures {
    private TimelineTileFixtures() {}

    public static Object scoreCard() {
        return new w1(new d0(new o()));
    }

    public static Object standardTile() {
        return new w1(new d0(new StandardContent()));
    }

    public static Object missingContent() {
        return new w1(new d0(null));
    }

    public static Object missingTile() {
        return new w1(null);
    }

    public static Object misleadingText() {
        return new OrdinaryPost("ScoreCard(event=MLB Game)");
    }

    private static final class OrdinaryPost {
        private final String message;
        private OrdinaryPost(String message) { this.message = message; }
        @Override public String toString() { return message; }
    }
}

// Obfuscated names from official X APKs (12.31 and 12.32).
final class w1 {
    private final d0 a;
    w1(d0 tile) { this.a = tile; }
}

final class d0 {
    private final Object a;
    d0(Object content) { this.a = content; }
}

final class o {}

final class StandardContent {}
