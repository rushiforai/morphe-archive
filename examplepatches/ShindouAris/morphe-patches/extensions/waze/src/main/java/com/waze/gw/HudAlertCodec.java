package com.waze.gw;

import java.util.Locale;

/** Stable HLP/1 mapping from Waze/Mod alert rows to the public numeric alert enum. */
final class HudAlertCodec {
    static final int JAM_SEVERITY_UNKNOWN = 0;
    static final int JAM_SEVERITY_LIGHT = 1;
    static final int JAM_SEVERITY_MODERATE = 2;
    static final int JAM_SEVERITY_HEAVY = 3;
    static final int JAM_SEVERITY_STANDSTILL = 4;
    static final int JAM_SEVERITY_CLOSED = 5;
    static final int NONE = 0;
    static final int POLICE = 1;
    static final int CAMERA_SPEED = 2;
    static final int CAMERA_REDLIGHT = 3;
    static final int HAZARD = 4;
    static final int ACCIDENT = 5;
    static final int TRAFFIC_JAM = 6;
    static final int ROAD_CLOSED = 7;
    static final int SPEED_DROP = 8;
    static final int NO_PASSING = 9;
    static final int END_NO_PASSING = 10;
    static final int RAILWAY = 11;
    static final int TOLL_BOOTH = 12;
    static final int STOPPED_VEHICLE = 13;
    static final int CONSTRUCTION = 14;
    static final int POTHOLE = 15;
    static final int WEATHER = 16;
    static final int BLOCKED_LANE = 17;
    static final int DANGEROUS_ROAD = 18;
    static final int EXPRESSWAY_EXIT = 19;
    static final int EXPRESSWAY_REST_STOP = 20;
    static final int REST_STOP = 21;
    static final int END_SPEED_RESTRICTION = 22;
    static final int RESIDENTIAL_START = 23;
    static final int RESIDENTIAL_END = 24;
    static final int END_ALL_PROHIBITIONS = 25;
    static final int NO_CAR = 26;
    static final int NO_MOTORCYCLE = 27;
    static final int NO_LEFT_TURN = 28;
    static final int NO_RIGHT_TURN = 29;
    static final int NO_U_TURN = 30;
    static final int NO_STRAIGHT = 31;
    static final int MANDATORY_STRAIGHT = 32;
    static final int MANDATORY_RIGHT = 33;
    static final int MANDATORY_LEFT = 34;
    static final int CAR_LANE = 35;
    static final int MOTORCYCLE_LANE = 36;
    static final int ONE_WAY = 37;
    static final int PROHIBITED_ROAD = 38;
    static final int COMBINED_TURN_RESTRICTION = 39;
    static final int CAMERA_PHONE = 40;
    static final int CAMERA_DUMMY = 41;
    static final int CAMERA_SEATBELT = 42;
    static final int CAMERA_DISTANCE = 43;
    static final int CAMERA_BUS_LANE = 44;
    static final int CAMERA_NOISE = 45;
    static final int CAMERA_STOP_SIGN = 46;
    static final int ANIMAL = 47;
    static final int OBJECT_ON_ROAD = 48;
    static final int ROADKILL = 49;
    static final int FLOOD = 50;
    static final int FOG = 51;
    static final int HAIL = 52;
    static final int SNOW = 53;
    static final int ICE = 54;
    static final int SLIPPERY_ROAD = 55;
    static final int SPEED_BUMP = 56;
    static final int SCHOOL_ZONE = 57;
    static final int LANES_MERGING = 58;
    static final int DANGEROUS_CURVE = 59;
    static final int FORK = 60;
    static final int BROKEN_LIGHT = 61;
    static final int CYCLIST = 62;
    static final int EMERGENCY_VEHICLE = 63;
    static final int PERSONAL_SAFETY = 64;
    static final int NO_STRAIGHT_AND_RIGHT = 65;
    static final int NO_LEFT_AND_U_TURN = 66;
    static final int NO_STRAIGHT_AND_LEFT = 67;
    static final int NO_LEFT_AND_RIGHT = 68;
    static final int CAR_NO_LEFT_AND_U_TURN = 69;
    static final int CAR_NO_RIGHT_AND_U_TURN = 70;
    static final int NO_RIGHT_AND_U_TURN = 71;
    static final int CAR_NO_LEFT_TURN = 72;
    static final int CAR_NO_RIGHT_TURN = 73;
    static final int CAR_NO_U_TURN = 74;
    static final int TRAFFIC_LIGHT = 75;
    static final int LANE_ENDING_LEFT = 76;
    static final int LANE_ENDING_RIGHT = 77;
    static final int SHOULDER_ENDING = 78;      // left, right or both shoulders end
    static final int NARROW_BRIDGE = 79;
    static final int RAISED_CROSSWALK = 80;
    static final int HIGHWAY_CROSSWALK = 81;    // high-speed pedestrian crossing

    private HudAlertCodec() { }

    /** Returns {type, optionalValueKmh}. Unknown input remains the HLP/1 generic hazard. */
    static int[] decode(String[] row) {
        if (row == null || row.length == 0) return result(NONE, 0);
        String visual = field(row, 0);
        String label = normalize(field(row, 1));
        String raw = field(row, 4);
        String semantic = normalize(field(row, 5));

        if (semantic.startsWith("wme:")) {
            int wmeType = parseInt(semantic.substring(4), -1);
            return result(wmeType(wmeType), speedValue(visual));
        }
        if (semantic.startsWith("roadpoint:") || visual.startsWith("roadpoint_")) {
            String point = semantic.length() > 10 ? semantic.substring(10) : visual.substring(10);
            if (point.contains("expressway_rest")) return result(EXPRESSWAY_REST_STOP, 0);
            if (point.contains("exit")) return result(EXPRESSWAY_EXIT, 0);
            return result(REST_STOP, 0);
        }

        int speed = speedValue(visual);
        if (speed > 0) {
            if (label.contains("het han che toc do") || label.contains("end speed"))
                return result(END_SPEED_RESTRICTION, speed);
            return result(SPEED_DROP, speed);
        }

        // Some Waze builds expose a railroad crossing as CAMERA with a generic camera icon and
        // only keep the real meaning in the localized title.
        if (containsAny(label, "giao cat duong sat", "railway crossing", "railroad crossing",
                "railroad camera")) return result(RAILWAY, 0);

        String icon = normalize(visual + " " + raw + " " + semantic);
        // TrafficLightAlerts; checked before the camera/jam paths ("traffic", "light").
        if (icon.contains("traffic_signal")) return result(TRAFFIC_LIGHT, 0);
        // Permanent hazards (icon_permanent_hazard_*): matched by icon first, then by the localized title,
        // before the generic keyword paths below can claim them.
        if (containsAny(icon, "left_lane_ending", "lane_ending_left")
                || containsAny(label, "thu hep lan ben trai", "left lane ends"))
            return result(LANE_ENDING_LEFT, 0);
        if (containsAny(icon, "right_lane_ending", "lane_ending_right")
                || containsAny(label, "thu hep lan ben phai", "right lane ends"))
            return result(LANE_ENDING_RIGHT, 0);
        if (icon.contains("school_zone") || containsAny(label, "khu vuc truong hoc", "school zone"))
            return result(SCHOOL_ZONE, 0);
        if (icon.contains("shoulder_ending") || icon.contains("shoulders_ending")
                || containsAny(label, "thu hep le duong", "shoulder ends", "shoulder end"))
            return result(SHOULDER_ENDING, 0);
        if (icon.contains("narrow_bridge") || containsAny(label, "cau hep", "narrow bridge"))
            return result(NARROW_BRIDGE, 0);
        if (icon.contains("raised_crosswalk") || containsAny(label, "vach qua duong noi cao", "raised crosswalk"))
            return result(RAISED_CROSSWALK, 0);
        if (icon.contains("highway_crosswalk")
                || containsAny(label, "vach di bo qua duong", "high-speed crossing", "high speed crossing"))
            return result(HIGHWAY_CROSSWALK, 0);
        if (containsAny(icon, "no_passing_out", "end_no_passing", "het_cam_vuot"))
            return result(END_NO_PASSING, 0);
        if (containsAny(icon, "no_passing", "cam_vuot", "c_vuot")
                || (Region.inVietnam() && containsAny(icon, "average", "french")))   // avg zone = no passing in Vietnam only
            return result(NO_PASSING, 0);
        if (containsAny(icon, "phone_camera", "cam_phone")) return result(CAMERA_PHONE, 0);
        if (containsAny(icon, "dummy_camera", "camera_fake", "cam_fake")) return result(CAMERA_DUMMY, 0);
        // Native names use cam_seat_belt / cam_noise / cam_stop_signe (typo in Waze) / cam_bus_lane.
        if (containsAny(icon, "seatbelt", "seat_belt")) return result(CAMERA_SEATBELT, 0);
        if (containsAny(icon, "distance_between", "distance_camera")) return result(CAMERA_DISTANCE, 0);
        if (icon.contains("bus_lane")) return result(CAMERA_BUS_LANE, 0);
        if (containsAny(icon, "noise_camera", "cam_noise")) return result(CAMERA_NOISE, 0);
        if (containsAny(icon, "stop_sign_camera", "cam_stop_sign")) return result(CAMERA_STOP_SIGN, 0);
        // Waze names this alert "railroad camera" on some builds.  Match the semantic
        // railroad/train token before the generic camera fallback below, otherwise a real
        // railway crossing is incorrectly encoded as HLP CAMERA_SPEED (2) instead of RAILWAY (11).
        if (containsAny(icon, "railway", "railroad", "train")) return result(RAILWAY, 0);
        if (containsAny(icon, "trafficlight", "traffic_light", "red_light"))
            return result(CAMERA_REDLIGHT, 0);
        if (icon.contains("camera") || icon.contains("cam")) return result(CAMERA_SPEED, 0);
        if (icon.contains("toll")) return result(TOLL_BOOTH, 0);
        if (containsAny(icon, "hazard_stopped", "stopped_vehicle", "car_on_shoulder"))
            return result(STOPPED_VEHICLE, 0);
        if (icon.contains("construction")) return result(CONSTRUCTION, 0);
        if (icon.contains("pothole")) return result(POTHOLE, 0);
        if (icon.contains("blocked_lane") || icon.contains("closed_lane"))
            return result(BLOCKED_LANE, 0);
        if (icon.contains("weather_flood") || icon.contains("flood")) return result(FLOOD, 0);
        if (icon.contains("weather_fog") || icon.contains("fog")) return result(FOG, 0);
        if (icon.contains("weather_hail") || icon.contains("hail")) return result(HAIL, 0);
        if (icon.contains("weather_snow") || icon.contains("snow")) return result(SNOW, 0);
        if (icon.contains("weather_ice") || icon.contains("ice")) return result(ICE, 0);
        if (icon.contains("slippery")) return result(SLIPPERY_ROAD, 0);
        if (icon.contains("speed_bump")) return result(SPEED_BUMP, 0);
        if (containsAny(icon, "lanes_merging", "lane_merge")) return result(LANES_MERGING, 0);
        if (containsAny(icon, "dangerous_curves", "dangerous_curve")) return result(DANGEROUS_CURVE, 0);
        if (icon.contains("fork")) return result(FORK, 0);
        if (icon.contains("intersection")) return result(DANGEROUS_ROAD, 0);
        if (icon.contains("broken_light")) return result(BROKEN_LIGHT, 0);
        if (icon.contains("roadkill")) return result(ROADKILL, 0);
        if (containsAny(icon, "object_on_road", "object_onroad")) return result(OBJECT_ON_ROAD, 0);
        if (icon.contains("animal")) return result(ANIMAL, 0);
        if (icon.contains("cyclist")) return result(CYCLIST, 0);
        if (icon.contains("emergency_vehicle")) return result(EMERGENCY_VEHICLE, 0);
        if (icon.contains("personal_safety")) return result(PERSONAL_SAFETY, 0);
        if (icon.contains("police") || icon.contains("checkpoint")) return result(POLICE, 0);
        if (icon.contains("accident") || icon.contains("crash")) return result(ACCIDENT, 0);
        if (icon.contains("traffic") || icon.contains("jam")) return result(TRAFFIC_JAM, 0);
        if (icon.contains("closure") || icon.contains("closed")) return result(ROAD_CLOSED, 0);
        if (icon.contains("bad_weather") || icon.contains("weather")) return result(WEATHER, 0);
        return result(HAZARD, 0);
    }

    /** Optional HLP traffic severity. Zero means the Waze row did not expose a usable subtype. */
    static int jamSeverity(String[] row) {
        if (decode(row)[0] != TRAFFIC_JAM) return JAM_SEVERITY_UNKNOWN;
        String text = normalize(field(row, 0) + " " + field(row, 1) + " "
                + field(row, 4) + " " + field(row, 5));
        if (containsAny(text, "closed_road", "road_closed", "duong dong", "duong bi dong"))
            return JAM_SEVERITY_CLOSED;
        if (containsAny(text, "stand_still", "standstill", "traffic_standstill",
                "dung im", "dung yen")) return JAM_SEVERITY_STANDSTILL;
        if (containsAny(text, "heavy_traffic", "traffic_heavy", "ket xe nang", "un tac nang"))
            return JAM_SEVERITY_HEAVY;
        if (containsAny(text, "moderate_traffic", "traffic_moderate", "ket xe vua",
                "un tac vua")) return JAM_SEVERITY_MODERATE;
        if (containsAny(text, "light_traffic", "traffic_light", "ket xe nhe", "un tac nhe"))
            return JAM_SEVERITY_LIGHT;
        return JAM_SEVERITY_UNKNOWN;
    }

    /** Parse an explicit delay from Waze's localized label. Never derives minutes from route ETA. */
    static int jamDelayMinutes(String[] row) {
        if (decode(row)[0] != TRAFFIC_JAM) return 0;
        String text = normalize(field(row, 1) + " " + field(row, 4) + " " + field(row, 5));
        try {
            java.util.regex.Matcher matcher = java.util.regex.Pattern.compile(
                    "(?:^|[^0-9])(\\d{1,3})\\s*(?:phut|min(?:ute)?s?)(?:[^a-z]|$)")
                    .matcher(text);
            if (!matcher.find()) return 0;
            int minutes = Integer.parseInt(matcher.group(1));
            return minutes >= 1 && minutes <= 999 ? minutes : 0;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static int wmeType(int type) {
        switch (type) {
            case 1: return NO_STRAIGHT_AND_RIGHT;
            case 2: return NO_LEFT_AND_U_TURN;
            case 3: return NO_STRAIGHT_AND_LEFT;
            case 4: return NO_LEFT_AND_RIGHT;
            case 5: return CAR_NO_LEFT_AND_U_TURN;
            case 6: return CAR_NO_RIGHT_AND_U_TURN;
            case 7: return NO_RIGHT_AND_U_TURN;
            case 8: return NO_LEFT_TURN;
            case 9: return NO_RIGHT_TURN;
            case 10: return NO_STRAIGHT;
            case 11: return NO_U_TURN;
            case 12: return END_SPEED_RESTRICTION;
            case 13: return SPEED_DROP;
            case 14: return NO_PASSING;
            case 15: return END_NO_PASSING;
            case 16: return CAR_NO_LEFT_TURN;
            case 17: return CAR_NO_RIGHT_TURN;
            case 18: return CAR_NO_U_TURN;
            case 19: return NO_CAR;
            case 20: return NO_MOTORCYCLE;
            case 21: return MANDATORY_STRAIGHT;
            case 22: return MANDATORY_RIGHT;
            case 23: return MANDATORY_LEFT;
            case 24: return CAR_LANE;
            case 25: return MOTORCYCLE_LANE;
            case 26: return RESIDENTIAL_START;
            case 27: return RESIDENTIAL_END;
            case 32: return PROHIBITED_ROAD;
            case 33: return ONE_WAY;
            case 35: return END_ALL_PROHIBITIONS;
            default: return HAZARD;
        }
    }

    private static int speedValue(String icon) {
        String value = icon == null ? "" : icon.toLowerCase(Locale.US);
        if (!value.startsWith("speeddrop_")) return 0;
        int speed = parseInt(value.substring(10), 0);
        return speed >= 5 && speed <= 200 ? speed : 0;
    }

    private static String field(String[] row, int index) {
        return row != null && index >= 0 && index < row.length && row[index] != null
                ? row[index] : "";
    }

    private static String normalize(String value) {
        if (value == null || value.isEmpty()) return "";
        try {
            return java.text.Normalizer.normalize(value, java.text.Normalizer.Form.NFD)
                    .replaceAll("\\p{M}+", "")
                    .replace('\u0111', 'd').replace('\u0110', 'D')
                    .toLowerCase(Locale.US).trim();
        } catch (Throwable ignored) {
            return value.toLowerCase(Locale.US).trim();
        }
    }

    private static boolean containsAny(String value, String... needles) {
        if (value == null || needles == null) return false;
        for (String needle : needles) if (needle != null && value.contains(needle)) return true;
        return false;
    }

    private static int parseInt(String value, int fallback) {
        try { return Integer.parseInt(value.trim()); }
        catch (Throwable ignored) { return fallback; }
    }

    private static int[] result(int type, int value) { return new int[]{type, value}; }
}
