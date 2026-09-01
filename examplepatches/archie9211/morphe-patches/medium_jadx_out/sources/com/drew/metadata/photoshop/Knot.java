package com.drew.metadata.photoshop;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Knot {
    private final double[] _points = new double[6];
    private final String _type;

    public Knot(String str) {
        this._type = str;
    }

    public final double getPoint(int i) {
        return this._points[i];
    }

    public final String getType() {
        return this._type;
    }

    public final void setPoint(int i, double d) {
        this._points[i] = d;
    }
}
