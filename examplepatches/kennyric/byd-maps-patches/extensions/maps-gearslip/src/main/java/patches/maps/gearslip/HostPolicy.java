package patches.maps.gearslip;

/**
 * Any Android Auto compatible host may drive the car screens (Google's Android Auto, DriveDeck,
 * Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto, AARE, ...). A host claim is only accepted when
 * the Binder caller actually owns that package, so one app cannot pose as another.
 */
final class HostPolicy {
    private HostPolicy() {}

    static boolean permits(String packageName, int uid, String[] ownedPackages) {
        return uid >= 0 && packageName != null && contains(ownedPackages, packageName);
    }

    private static boolean contains(String[] values, String candidate) {
        if (values != null && candidate != null) for (String value : values) if (candidate.equals(value)) return true;
        return false;
    }
}
