package com.drew.metadata.photoshop;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Subpath {
    private final ArrayList<Knot> _knots;
    private final String _type;

    public Subpath(String str) {
        this._knots = new ArrayList<>();
        this._type = str;
    }

    public final void add(Knot knot) {
        this._knots.add(knot);
    }

    public final Iterable<Knot> getKnots() {
        return this._knots;
    }

    public final String getType() {
        return this._type;
    }

    public final int size() {
        return this._knots.size();
    }

    public Subpath() {
        this("");
    }
}
