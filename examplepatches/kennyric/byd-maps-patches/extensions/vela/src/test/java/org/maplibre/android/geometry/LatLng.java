package org.maplibre.android.geometry;

/** Test-only stand-in for MapLibre's unrenamed JNI LatLng, which the host APK supplies at runtime. */
public final class LatLng {
    public final double latitude,longitude;
    public LatLng(double latitude,double longitude){this.latitude=latitude;this.longitude=longitude;}
}
