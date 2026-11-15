package app.morphe.extension.chmate;

/** Keep an explicit positive zoom when the native release handler settles its position. */
public final class ImageScaleRetention {
    static float minimum(float nativeMinimum,float requested) {
        if(Float.isNaN(requested)||Float.isInfinite(requested)||requested<=0)return nativeMinimum;
        return Math.min(nativeMinimum,Math.max(.05f,requested));
    }
    public static float minimumForPosition(Object view,float x,float y,float requested,boolean animate) {
        try {
            String name=view.getClass().getName();
            String field=name.equals("o.qhbExternalSyntheticLambda0")?"B":"C";
            return minimum(NativeFields.find(view.getClass(),field).getFloat(view),requested);
        } catch(ReflectiveOperationException error) {
            return 1f;
        }
    }
    private ImageScaleRetention(){}
}
