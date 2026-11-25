package patches.ytmusic;

/** Routes content only after the original service has authenticated its actual browser. */
public final class GearslipLibrarySupport {
    private GearslipLibrarySupport() {}

    /** Implemented by the patch using the request's captured MediaBrowser RemoteUserInfo. */
    public interface Request {
        String morphe_getCallerPackage();
    }

    public static String getConfiguredPackageNames() {
        return "app.seb3thehacker.gearslip,app.seb3thehacker.gearslip.dev,app.johninnl.drivedeck,app.johninnl.drivedeck.dev";
    }

    /** 0 delegates unchanged; 1 root, 2 personal Home, 3 personal Library. */
    public static int route(Object request, String mediaId) {
        if (!(request instanceof Request) || mediaId == null) return 0;
        String caller = ((Request) request).morphe_getCallerPackage();
        if (caller == null) return 0;
        boolean configured = false;
        for (String host : getConfiguredPackageNames().split(",")) {
            if (caller.equals(host.trim())) { configured = true; break; }
        }
        if (!configured) return 0;
        if (caller.equals(mediaId)) return 1;
        if (mediaId.equals("morphe:gearslip:home")) return 2;
        if (mediaId.equals("morphe:gearslip:library")) return 3;
        return 0;
    }
}
