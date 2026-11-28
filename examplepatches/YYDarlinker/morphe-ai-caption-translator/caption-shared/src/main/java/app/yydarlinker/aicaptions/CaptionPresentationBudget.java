package app.yydarlinker.aicaptions;

public class CaptionPresentationBudget {
    public final int width;
    public final float minimumPx, preferredPx;
    public final CaptionRenderSpec renderSpec;

    public CaptionPresentationBudget(int width, float minimum, float preferred, CaptionRenderSpec spec) {
        this.width = width;
        minimumPx = minimum;
        preferredPx = preferred;
        renderSpec = spec;
    }

    boolean fits(String text) {
        return text.isEmpty() || renderSpec.fits(text, minimumPx, width, 2);
    }

    int preferredColumns() {
        return Math.max(1, (int) (width / Math.max(1, preferredPx)));
    }

    int approximateColumns() {
        return Math.max(1, (int) (width / Math.max(1, minimumPx)));
    }
}
