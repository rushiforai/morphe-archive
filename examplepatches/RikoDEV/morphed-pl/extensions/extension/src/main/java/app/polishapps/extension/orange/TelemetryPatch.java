package app.polishapps.extension.orange;

@SuppressWarnings("unused")
public final class TelemetryPatch {

    private static final String SPONSORED_OFFERS_KEY = "AreSponsoredOffersEnabled";

    private TelemetryPatch() {
    }

    public static boolean overrideBoolean(String key, boolean value) {
        if (SPONSORED_OFFERS_KEY.equals(key)) {
            return false;
        }
        return value;
    }
}
