package local.maps.cluster;

/** Generic input has no assumed vehicle; Morphe may set the explicit known_bev option. */
final class VehicleEvBuildProfile {
    static final boolean OWNER_BEV_HINT=false;
    // Keep a method boundary: javac must not inline the patch-time option into callers.
    static boolean knownBev(){return OWNER_BEV_HINT;}
    private VehicleEvBuildProfile(){}
}
