package xyz.urro.transit;

/** Pure path math: interpolates a position along a polyline of lat/lon points. */
public final class SpoofPath {
    private final double[] lat;
    private final double[] lon;
    private final double[] cumulative;

    public SpoofPath(double[] lat, double[] lon) {
        if (lat == null || lon == null || lat.length < 2 || lat.length != lon.length) {
            throw new IllegalArgumentException("need at least two matching points");
        }
        this.lat = lat.clone();
        this.lon = lon.clone();
        this.cumulative = new double[lat.length];
        for (int i = 1; i < lat.length; i++) {
            cumulative[i] = cumulative[i - 1] + distanceMeters(lat[i - 1], lon[i - 1], lat[i], lon[i]);
        }
    }

    public double totalMeters() { return cumulative[cumulative.length - 1]; }

    /** Point at fraction 0..1 of the total length. Returns {lat, lon}. */
    public double[] pointAt(double fraction) {
        double f = Math.max(0, Math.min(1, fraction));
        double target = f * totalMeters();
        for (int i = 1; i < cumulative.length; i++) {
            if (target <= cumulative[i]) {
                double span = cumulative[i] - cumulative[i - 1];
                double t = span <= 0 ? 0 : (target - cumulative[i - 1]) / span;
                return new double[]{lat[i - 1] + (lat[i] - lat[i - 1]) * t, lon[i - 1] + (lon[i] - lon[i - 1]) * t};
            }
        }
        return new double[]{lat[lat.length - 1], lon[lon.length - 1]};
    }

    static double distanceMeters(double lat1, double lon1, double lat2, double lon2) {
        double r = 6371000.0;
        double dLat = Math.toRadians(lat2 - lat1), dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        return 2 * r * Math.asin(Math.min(1, Math.sqrt(a)));
    }
}
