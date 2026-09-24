package app.yydarlinker.deepseekcaptions;
final class SubtitleStyleMetrics {
    static int alpha(int opacity){return Math.round(255f*Math.max(0,Math.min(100,opacity))/100f);}
    static float scaledSp(int configured,float shortDp){return configured*Math.max(.72f,Math.min(1.8f,shortDp/220f));}
    static float previewTextPx(int configured,float deviceShortPx,float density,float scaledDensity,float previewHeight){
        return scaledSp(configured,deviceShortPx/density)*scaledDensity/deviceShortPx*previewHeight;
    }
}
