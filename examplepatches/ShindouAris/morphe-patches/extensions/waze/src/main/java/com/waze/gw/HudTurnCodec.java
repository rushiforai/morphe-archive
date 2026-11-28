package com.waze.gw;

/** Maps Waze Instruction.Type numeric values to the stable HLP/1 turn enum. */
final class HudTurnCodec {
    private HudTurnCodec() { }

    static int encode(int instruction) {
        switch (instruction) {
            case 1:   // TURN_LEFT
            case 27:  // PREPARE_TURN_LEFT
                return 2;
            case 2:   // TURN_RIGHT
            case 28:  // PREPARE_TURN_RIGHT
                return 3;
            case 3: return 13;  // KEEP_LEFT
            case 4: return 14;  // KEEP_RIGHT
            case 5: return 1;   // CONTINUE_STRAIGHT
            case 6: case 7:
                return 10;      // generic roundabout enter/exit
            case 10: case 11:   // ROUNDABOUT_STRAIGHT / ROUNDABOUT_EXIT_STRAIGHT
                return 19;
            case 8: case 9:
                return 11;      // roundabout left
            case 12: case 13:
                return 12;      // roundabout right
            case 14: case 15:   // ROUNDABOUT_U / ROUNDABOUT_EXIT_U
                return 20;      // additive HLP/1 code; 18 remains reserved for FERRY
            case 20:            // U_TURN
                return 8;
            case 16:            // APPROACHING_DESTINATION
            case 21:            // LAST_DIRECTION
            case 31:            // APPROACHING_STOP_POINT
                return 17;
            case 17:            // EXIT_LEFT
            case 29:            // PREPARE_EXIT_LEFT
                return 15;
            case 18:            // EXIT_RIGHT
            case 30:            // PREPARE_EXIT_RIGHT
                return 16;
            case 22: return 4;   // SLIGHT_LEFT
            case 23: return 6;   // SHARP_LEFT
            case 24: return 5;   // SLIGHT_RIGHT
            case 25: return 7;   // SHARP_RIGHT
            case 19:            // WAYPOINT_DELAY
            case 26:            // ENTER_HOV_LANE
                return 1;
            default:
                return instruction >= 1 ? 1 : 0;
        }
    }
}
