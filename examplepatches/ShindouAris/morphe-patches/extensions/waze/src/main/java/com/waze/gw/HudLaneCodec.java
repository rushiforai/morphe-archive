package com.waze.gw;

/** Compacts Waze lane angles into the stable HLP lane-direction bitset. */
final class HudLaneCodec {
    static final int STRAIGHT = 1;
    static final int SLIGHT_LEFT = 1 << 1;
    static final int LEFT = 1 << 2;
    static final int SHARP_LEFT = 1 << 3;
    static final int SLIGHT_RIGHT = 1 << 4;
    static final int RIGHT = 1 << 5;
    static final int SHARP_RIGHT = 1 << 6;
    static final int U_TURN = 1 << 7;

    private HudLaneCodec() { }

    static int directionBit(int rawDegrees) {
        int degrees = rawDegrees;
        while (degrees > 180) degrees -= 360;
        while (degrees < -180) degrees += 360;
        int absolute = Math.abs(degrees);
        if (absolute == 180) return U_TURN;
        if (degrees <= -100) return SHARP_LEFT;
        if (degrees <= -55) return LEFT;
        if (degrees <= -20) return SLIGHT_LEFT;
        if (degrees < 20) return STRAIGHT;
        if (degrees < 55) return SLIGHT_RIGHT;
        if (degrees < 100) return RIGHT;
        return SHARP_RIGHT;
    }
}
