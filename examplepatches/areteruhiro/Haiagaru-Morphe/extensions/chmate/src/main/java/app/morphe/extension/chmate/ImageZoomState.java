package app.morphe.extension.chmate;

/** Distinguish native fit-to-window enlargement from zooming beyond that fit. */
final class ImageZoomState {
    static boolean zoomed(float current,float minimum,float fitted) {
        float base=!Float.isNaN(fitted)&&!Float.isInfinite(fitted)&&fitted>0?Math.max(minimum,fitted):minimum;
        return base>0&&current>base+0.01f;
    }
    private ImageZoomState(){}
}
