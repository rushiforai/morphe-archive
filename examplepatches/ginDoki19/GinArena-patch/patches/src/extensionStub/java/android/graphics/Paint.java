package android.graphics;
public class Paint {
    public static final int ANTI_ALIAS_FLAG = 1;
    public enum Style { FILL, STROKE, FILL_AND_STROKE }
    public Paint() {}
    public Paint(int flags) {}
    public void setAntiAlias(boolean aa) {}
    public void setStyle(Style style) {}
    public void setColor(int color) {}
}
