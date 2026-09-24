package app.yydarlinker.deepseekcaptions;
/** Independent per-process user preference. No current-video objects, API configuration, or AI gate. */
final class RememberedCaptionSelection {
    private static String language="";
    private static boolean known,on,translated,asr;
    static synchronized void select(String code,boolean translation,boolean automatic){
        if(code==null||code.isEmpty()||code.endsWith("_OPTION"))return;
        language=code;translated=translation;asr=automatic;known=true;on=true;
    }
    static synchronized void off(){known=true;on=false;}
    static synchronized int decision(){return !known?-1:on?1:0;}
    static synchronized String language(){return language;}
    static synchronized boolean translated(){return translated;}
    static synchronized boolean asr(){return asr;}
    static synchronized void reset(){known=false;on=false;language="";translated=false;asr=false;}
}
