package app.morphe.extension.chmate;

/** Result presentation owned by Haiagaru; does not replace site links or post nodes. */
final class CheckerResultStyle {
    static String css(boolean dark, int spacing) {
        String line = dark ? "#45494f" : "#d3d9df";
        String secondary = dark ? "#bbc3cd" : "#52606e";
        String accent = dark ? "#9ccaff" : "#195d9d";
        int gap = Math.max(0, Math.min(20, spacing));
        String scope = "body[data-haiagaru-hissi]";
        return scope + "{margin:0;padding:0 12px!important;line-height:1.6;}"
                + scope + " dl{border:0;border-bottom:1px solid " + line
                + ";border-radius:0;box-shadow:none;padding:" + (gap + 10) + "px 0;margin:0;}"
                + scope + " dl dt{font-size:12px;line-height:1.5;color:" + secondary + "!important;}"
                + scope + " dl dt>a:first-child{font-size:14px;font-weight:600;color:" + accent + "!important;}"
                + scope + " dl dd:not(.haiagaru-hissi-aa){margin:8px 0 0;font-size:15px;line-height:1.65;}"
                + scope + " .haiagaru-hissi-metadata{overflow-x:auto;}"
                + scope + " .haiagaru-hissi-metadata table{border-collapse:collapse;border:0!important;}"
                + scope + " .haiagaru-hissi-metadata td,"
                + scope + " .haiagaru-hissi-metadata th{padding:10px 8px;"
                + "border:0!important;border-bottom:1px solid " + line + "!important;}";
    }
    private CheckerResultStyle() {}
}
