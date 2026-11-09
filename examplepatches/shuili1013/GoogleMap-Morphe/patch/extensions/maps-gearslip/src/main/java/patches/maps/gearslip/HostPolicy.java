package patches.maps.gearslip;

/** Host claims are capabilities only after the Binder caller owns the package. */
final class HostPolicy {
    // Gearslip and its DriveDeck rebrand, release and development builds, whichever key signs them.
    private static final String[] CAR_HOSTS = {
        "app.seb3thehacker.gearslip", "app.seb3thehacker.gearslip.dev", "app.johninnl.drivedeck", "app.johninnl.drivedeck.dev"
    };
    private static final String ANDROID_AUTO = "com.google.android.projection.gearhead";
    // Verified original and rotated signing lineage of Android Auto 16.8.661874.
    private static final String GOOGLE_ORIGINAL = "fdb00c43dbde8b51cb312aa81d3b5fa17713adb94b28f598d77f8eb89daceedf";
    private static final String GOOGLE_CURRENT = "1ca8dcc0bed3cbd872d2cb791200c0292ca9975768a82d676b8b424fb65b5295";
    private HostPolicy() {}

    static boolean permits(String packageName, int uid, String[] ownedPackages,
                           String[] currentSigners, String[] signingHistory) {
        if (uid < 0 || packageName == null || !contains(ownedPackages, packageName)) return false;
        if (contains(CAR_HOSTS, packageName)) return true;
        if (!ANDROID_AUTO.equals(packageName) || currentSigners == null || currentSigners.length == 0) return false;
        if (currentSigners.length > 1) {
            for (String signer : currentSigners) if (!google(signer)) return false;
            return true;
        }
        if (signingHistory != null) for (String signer : signingHistory) if (google(signer)) return true;
        return google(currentSigners[0]);
    }

    private static boolean google(String digest) {
        return GOOGLE_ORIGINAL.equals(digest) || GOOGLE_CURRENT.equals(digest);
    }

    private static boolean contains(String[] values, String candidate) {
        if (values != null) for (String value : values) if (candidate.equals(value)) return true;
        return false;
    }
}
