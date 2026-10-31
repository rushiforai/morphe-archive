package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.os.Parcel;

/* loaded from: classes3.dex */
public final class wd implements rg.l {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f33189c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public static volatile xk.w2 f33190d;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33191a;

    /* renamed from: b, reason: collision with root package name */
    public final String f33192b;

    public /* synthetic */ wd(String str, int i5) {
        this.f33191a = i5;
        this.f33192b = str;
    }

    @Override // rg.l
    public void accept(Object obj, Object obj2) {
        int i5 = this.f33191a;
        String str = this.f33192b;
        fi.j jVar = (fi.j) obj2;
        cb cbVar = (cb) obj;
        switch (i5) {
            case 1:
                int i11 = ab.f32377l;
                ya yaVar = new ya(jVar);
                bb bbVar = (bb) cbVar.getService();
                Parcel parcelX = bbVar.X();
                r6.c(parcelX, yaVar);
                parcelX.writeString(str);
                parcelX.writeString(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                parcelX.writeString(null);
                bbVar.Z(parcelX, 11);
                break;
            default:
                int i12 = ab.f32377l;
                ya yaVar2 = new ya(jVar);
                bb bbVar2 = (bb) cbVar.getService();
                Parcel parcelX2 = bbVar2.X();
                r6.c(parcelX2, yaVar2);
                parcelX2.writeString(str);
                bbVar2.Z(parcelX2, 5);
                break;
        }
    }

    public wd(Context context, xd xdVar) {
        this.f33191a = 0;
        this.f33192b = xdVar.y() ? mb.b(context, xdVar.x()) : xdVar.x();
    }
}
