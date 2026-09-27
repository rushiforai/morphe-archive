package app.yydarlinker.deepseekcaptions;
final class SubtitleStyleMetrics {
    static int alpha(int opacity){return Math.round(255f*Math.max(0,Math.min(100,opacity))/100f);}
    // Configured sp at a 360dp content width; matches the live overlay.
    static float scaledSp(int configured,float videoWidthDp){return Math.max(12,configured*videoWidthDp/360f);}
    static float previewTextPx(int configured,float actualVideoWidthPx,float density,float scaledDensity,float previewWidth){
        return scaledSp(configured,actualVideoWidthPx/density)*scaledDensity*previewWidth/Math.max(1,actualVideoWidthPx);
    }
}
