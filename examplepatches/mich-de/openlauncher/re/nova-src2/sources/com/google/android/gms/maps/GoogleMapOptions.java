package com.google.android.gms.maps;

import android.app.Activity;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import fg.a;
import og.i;
import ps.j;
import sv.b;

/* loaded from: classes3.dex */
public final class GoogleMapOptions extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<GoogleMapOptions> CREATOR = new b(18);

    /* renamed from: f, reason: collision with root package name */
    public Boolean f33717f;

    /* renamed from: g, reason: collision with root package name */
    public Boolean f33718g;

    /* renamed from: i, reason: collision with root package name */
    public CameraPosition f33720i;

    /* renamed from: j, reason: collision with root package name */
    public Boolean f33721j;

    /* renamed from: k, reason: collision with root package name */
    public Boolean f33722k;

    /* renamed from: l, reason: collision with root package name */
    public Boolean f33723l;

    /* renamed from: m, reason: collision with root package name */
    public Boolean f33724m;
    public Boolean n;
    public Boolean o;

    /* renamed from: p, reason: collision with root package name */
    public Boolean f33725p;

    /* renamed from: q, reason: collision with root package name */
    public Boolean f33726q;

    /* renamed from: r, reason: collision with root package name */
    public Boolean f33727r;

    /* renamed from: v, reason: collision with root package name */
    public Boolean f33731v;

    /* renamed from: h, reason: collision with root package name */
    public int f33719h = -1;

    /* renamed from: s, reason: collision with root package name */
    public Float f33728s = null;

    /* renamed from: t, reason: collision with root package name */
    public Float f33729t = null;

    /* renamed from: u, reason: collision with root package name */
    public LatLngBounds f33730u = null;

    /* renamed from: w, reason: collision with root package name */
    public Integer f33732w = null;

    /* renamed from: x, reason: collision with root package name */
    public String f33733x = null;

    public static GoogleMapOptions b(Activity activity, AttributeSet attributeSet) {
        String string;
        LatLngBounds latLngBounds = null;
        if (activity == null || attributeSet == null) {
            return null;
        }
        Resources resources = activity.getResources();
        int[] iArr = vh.b.f92770a;
        TypedArray typedArrayObtainAttributes = resources.obtainAttributes(attributeSet, iArr);
        GoogleMapOptions googleMapOptions = new GoogleMapOptions();
        if (typedArrayObtainAttributes.hasValue(15)) {
            googleMapOptions.f33719h = typedArrayObtainAttributes.getInt(15, -1);
        }
        if (typedArrayObtainAttributes.hasValue(25)) {
            googleMapOptions.f33717f = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(25, false));
        }
        if (typedArrayObtainAttributes.hasValue(24)) {
            googleMapOptions.f33718g = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(24, false));
        }
        if (typedArrayObtainAttributes.hasValue(16)) {
            googleMapOptions.f33722k = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(16, true));
        }
        if (typedArrayObtainAttributes.hasValue(18)) {
            googleMapOptions.o = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(18, true));
        }
        if (typedArrayObtainAttributes.hasValue(20)) {
            googleMapOptions.f33731v = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(20, true));
        }
        if (typedArrayObtainAttributes.hasValue(19)) {
            googleMapOptions.f33723l = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(19, true));
        }
        if (typedArrayObtainAttributes.hasValue(21)) {
            googleMapOptions.n = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(21, true));
        }
        if (typedArrayObtainAttributes.hasValue(23)) {
            googleMapOptions.f33724m = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(23, true));
        }
        if (typedArrayObtainAttributes.hasValue(22)) {
            googleMapOptions.f33721j = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(22, true));
        }
        if (typedArrayObtainAttributes.hasValue(13)) {
            googleMapOptions.f33725p = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(13, false));
        }
        if (typedArrayObtainAttributes.hasValue(17)) {
            googleMapOptions.f33726q = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(17, true));
        }
        if (typedArrayObtainAttributes.hasValue(0)) {
            googleMapOptions.f33727r = Boolean.valueOf(typedArrayObtainAttributes.getBoolean(0, false));
        }
        if (typedArrayObtainAttributes.hasValue(4)) {
            googleMapOptions.f33728s = Float.valueOf(typedArrayObtainAttributes.getFloat(4, Float.NEGATIVE_INFINITY));
        }
        if (typedArrayObtainAttributes.hasValue(4)) {
            googleMapOptions.f33729t = Float.valueOf(typedArrayObtainAttributes.getFloat(3, Float.POSITIVE_INFINITY));
        }
        TypedArray typedArrayObtainAttributes2 = activity.getResources().obtainAttributes(attributeSet, new int[]{activity.getResources().getIdentifier("backgroundColor", "attr", activity.getPackageName()), activity.getResources().getIdentifier("mapId", "attr", activity.getPackageName())});
        if (typedArrayObtainAttributes2.hasValue(0)) {
            googleMapOptions.f33732w = Integer.valueOf(typedArrayObtainAttributes2.getColor(0, 0));
        }
        if (typedArrayObtainAttributes2.hasValue(1) && (string = typedArrayObtainAttributes2.getString(1)) != null && !string.isEmpty()) {
            googleMapOptions.f33733x = string;
        }
        typedArrayObtainAttributes2.recycle();
        TypedArray typedArrayObtainAttributes3 = activity.getResources().obtainAttributes(attributeSet, iArr);
        Float fValueOf = typedArrayObtainAttributes3.hasValue(11) ? Float.valueOf(typedArrayObtainAttributes3.getFloat(11, 0.0f)) : null;
        Float fValueOf2 = typedArrayObtainAttributes3.hasValue(12) ? Float.valueOf(typedArrayObtainAttributes3.getFloat(12, 0.0f)) : null;
        Float fValueOf3 = typedArrayObtainAttributes3.hasValue(9) ? Float.valueOf(typedArrayObtainAttributes3.getFloat(9, 0.0f)) : null;
        Float fValueOf4 = typedArrayObtainAttributes3.hasValue(10) ? Float.valueOf(typedArrayObtainAttributes3.getFloat(10, 0.0f)) : null;
        typedArrayObtainAttributes3.recycle();
        if (fValueOf != null && fValueOf2 != null && fValueOf3 != null && fValueOf4 != null) {
            latLngBounds = new LatLngBounds(new LatLng(fValueOf.floatValue(), fValueOf2.floatValue()), new LatLng(fValueOf3.floatValue(), fValueOf4.floatValue()));
        }
        googleMapOptions.f33730u = latLngBounds;
        TypedArray typedArrayObtainAttributes4 = activity.getResources().obtainAttributes(attributeSet, iArr);
        LatLng latLng = new LatLng(typedArrayObtainAttributes4.hasValue(5) ? typedArrayObtainAttributes4.getFloat(5, 0.0f) : 0.0f, typedArrayObtainAttributes4.hasValue(6) ? typedArrayObtainAttributes4.getFloat(6, 0.0f) : 0.0f);
        float f11 = typedArrayObtainAttributes4.hasValue(8) ? typedArrayObtainAttributes4.getFloat(8, 0.0f) : 0.0f;
        float f12 = typedArrayObtainAttributes4.hasValue(2) ? typedArrayObtainAttributes4.getFloat(2, 0.0f) : 0.0f;
        float f13 = typedArrayObtainAttributes4.hasValue(7) ? typedArrayObtainAttributes4.getFloat(7, 0.0f) : 0.0f;
        typedArrayObtainAttributes4.recycle();
        googleMapOptions.f33720i = new CameraPosition(latLng, f11, f13, f12);
        typedArrayObtainAttributes.recycle();
        return googleMapOptions;
    }

    public final String toString() {
        i iVar = new i(this);
        iVar.c(Integer.valueOf(this.f33719h), "MapType");
        iVar.c(this.f33725p, "LiteMode");
        iVar.c(this.f33720i, "Camera");
        iVar.c(this.f33722k, "CompassEnabled");
        iVar.c(this.f33721j, "ZoomControlsEnabled");
        iVar.c(this.f33723l, "ScrollGesturesEnabled");
        iVar.c(this.f33724m, "ZoomGesturesEnabled");
        iVar.c(this.n, "TiltGesturesEnabled");
        iVar.c(this.o, "RotateGesturesEnabled");
        iVar.c(this.f33731v, "ScrollGesturesEnabledDuringRotateOrZoom");
        iVar.c(this.f33726q, "MapToolbarEnabled");
        iVar.c(this.f33727r, "AmbientEnabled");
        iVar.c(this.f33728s, "MinZoomPreference");
        iVar.c(this.f33729t, "MaxZoomPreference");
        iVar.c(this.f33732w, "BackgroundColor");
        iVar.c(this.f33730u, "LatLngBoundsForCameraTarget");
        iVar.c(this.f33717f, "ZOrderOnTop");
        iVar.c(this.f33718g, "UseViewLifecycleInFragment");
        return iVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        byte bP = j.p(this.f33717f);
        a.i0(parcel, 2, 4);
        parcel.writeInt(bP);
        byte bP2 = j.p(this.f33718g);
        a.i0(parcel, 3, 4);
        parcel.writeInt(bP2);
        int i11 = this.f33719h;
        a.i0(parcel, 4, 4);
        parcel.writeInt(i11);
        a.b0(parcel, 5, this.f33720i, i5);
        byte bP3 = j.p(this.f33721j);
        a.i0(parcel, 6, 4);
        parcel.writeInt(bP3);
        byte bP4 = j.p(this.f33722k);
        a.i0(parcel, 7, 4);
        parcel.writeInt(bP4);
        byte bP5 = j.p(this.f33723l);
        a.i0(parcel, 8, 4);
        parcel.writeInt(bP5);
        byte bP6 = j.p(this.f33724m);
        a.i0(parcel, 9, 4);
        parcel.writeInt(bP6);
        byte bP7 = j.p(this.n);
        a.i0(parcel, 10, 4);
        parcel.writeInt(bP7);
        byte bP8 = j.p(this.o);
        a.i0(parcel, 11, 4);
        parcel.writeInt(bP8);
        byte bP9 = j.p(this.f33725p);
        a.i0(parcel, 12, 4);
        parcel.writeInt(bP9);
        byte bP10 = j.p(this.f33726q);
        a.i0(parcel, 14, 4);
        parcel.writeInt(bP10);
        byte bP11 = j.p(this.f33727r);
        a.i0(parcel, 15, 4);
        parcel.writeInt(bP11);
        Float f11 = this.f33728s;
        if (f11 != null) {
            a.i0(parcel, 16, 4);
            parcel.writeFloat(f11.floatValue());
        }
        Float f12 = this.f33729t;
        if (f12 != null) {
            a.i0(parcel, 17, 4);
            parcel.writeFloat(f12.floatValue());
        }
        a.b0(parcel, 18, this.f33730u, i5);
        byte bP12 = j.p(this.f33731v);
        a.i0(parcel, 19, 4);
        parcel.writeInt(bP12);
        a.a0(parcel, 20, this.f33732w);
        a.c0(parcel, 21, this.f33733x);
        a.k0(parcel, iJ0);
    }
}
