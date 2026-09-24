package app.yydarlinker.deepseekcaptions;
/** Startup uses the same normal batch policy as later realtime work, including its context. */
final class StartupCaptionPolicy {
    static int targetLimit(boolean firstReady,int usual){return Math.max(1,usual);}
}
