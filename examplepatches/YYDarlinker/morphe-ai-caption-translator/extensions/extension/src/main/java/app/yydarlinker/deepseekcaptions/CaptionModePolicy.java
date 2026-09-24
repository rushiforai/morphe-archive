package app.yydarlinker.deepseekcaptions;
final class CaptionModePolicy {
    static boolean mayTranslateSelection(boolean chosen,boolean on,boolean translatedMode) {
        return chosen && on && translatedMode;
    }
    static boolean mayCallApi(boolean sourceOnly,boolean terminalError,boolean cancelled) {
        return !sourceOnly && !terminalError && !cancelled;
    }
}
