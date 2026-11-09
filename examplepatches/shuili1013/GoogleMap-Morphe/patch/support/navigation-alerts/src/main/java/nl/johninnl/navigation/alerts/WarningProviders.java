package nl.johninnl.navigation.alerts;

import java.util.Set;

/** Authenticated provider identities and their distinct semantic contracts. */
public final class WarningProviders {
    public static final String WAZE="com.waze",FLITSMEISTER="nl.flitsmeister";
    private WarningProviders() {}
    public static boolean supported(String provider) { return WAZE.equals(provider)||FLITSMEISTER.equals(provider); }
    public static Set<String> required(String provider) {
        if(WAZE.equals(provider))return WazeWarningTypes.required();
        if(FLITSMEISTER.equals(provider))return FlitsmeisterWarningTypes.required();
        throw new IllegalArgumentException("UNSUPPORTED_WARNING_PROVIDER");
    }
    public static String displayName(String provider) {
        if(WAZE.equals(provider))return "De-Waze";
        if(FLITSMEISTER.equals(provider))return "Flitsmeister";
        return "";
    }
}
