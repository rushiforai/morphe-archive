package ai;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.internal.measurement.p6;
import com.google.android.gms.internal.measurement.r6;
import com.google.android.gms.measurement.internal.zzaf;
import com.google.android.gms.measurement.internal.zzah;
import com.google.android.gms.measurement.internal.zzao;
import com.google.android.gms.measurement.internal.zzbh;
import com.google.android.gms.measurement.internal.zzoo;
import com.google.android.gms.measurement.internal.zzpl;
import com.google.android.gms.measurement.internal.zzr;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class y extends p6 implements a0 {
    public y(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.measurement.internal.IMeasurementService", 0);
    }

    @Override // ai.a0
    public final void A(zzr zzrVar, zzaf zzafVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        r6.b(parcelX, zzafVar);
        Z(parcelX, 30);
    }

    @Override // ai.a0
    public final zzao D(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Parcel parcelW = W(parcelX, 21);
        zzao zzaoVar = (zzao) r6.a(parcelW, zzao.CREATOR);
        parcelW.recycle();
        return zzaoVar;
    }

    @Override // ai.a0
    public final void E(Bundle bundle, zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, bundle);
        r6.b(parcelX, zzrVar);
        Z(parcelX, 19);
    }

    @Override // ai.a0
    public final void F(zzr zzrVar, zzoo zzooVar, e0 e0Var) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        r6.b(parcelX, zzooVar);
        r6.c(parcelX, e0Var);
        Z(parcelX, 29);
    }

    @Override // ai.a0
    public final void J(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Z(parcelX, 4);
    }

    @Override // ai.a0
    public final void L(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Z(parcelX, 27);
    }

    @Override // ai.a0
    public final List M(String str, String str2, boolean z11, zzr zzrVar) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        ClassLoader classLoader = r6.f33029a;
        parcelX.writeInt(z11 ? 1 : 0);
        r6.b(parcelX, zzrVar);
        Parcel parcelW = W(parcelX, 14);
        ArrayList arrayListCreateTypedArrayList = parcelW.createTypedArrayList(zzpl.CREATOR);
        parcelW.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // ai.a0
    public final void O(zzbh zzbhVar, zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzbhVar);
        r6.b(parcelX, zzrVar);
        Z(parcelX, 1);
    }

    @Override // ai.a0
    public final List R(String str, String str2, zzr zzrVar) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        r6.b(parcelX, zzrVar);
        Parcel parcelW = W(parcelX, 16);
        ArrayList arrayListCreateTypedArrayList = parcelW.createTypedArrayList(zzah.CREATOR);
        parcelW.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // ai.a0
    public final void S(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Z(parcelX, 20);
    }

    @Override // ai.a0
    public final List a(String str, String str2, String str3, boolean z11) {
        Parcel parcelX = X();
        parcelX.writeString(null);
        parcelX.writeString(str2);
        parcelX.writeString(str3);
        ClassLoader classLoader = r6.f33029a;
        parcelX.writeInt(z11 ? 1 : 0);
        Parcel parcelW = W(parcelX, 15);
        ArrayList arrayListCreateTypedArrayList = parcelW.createTypedArrayList(zzpl.CREATOR);
        parcelW.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // ai.a0
    public final void c(zzah zzahVar, zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzahVar);
        r6.b(parcelX, zzrVar);
        Z(parcelX, 12);
    }

    @Override // ai.a0
    public final List d(String str, String str2, String str3) {
        Parcel parcelX = X();
        parcelX.writeString(null);
        parcelX.writeString(str2);
        parcelX.writeString(str3);
        Parcel parcelW = W(parcelX, 17);
        ArrayList arrayListCreateTypedArrayList = parcelW.createTypedArrayList(zzah.CREATOR);
        parcelW.recycle();
        return arrayListCreateTypedArrayList;
    }

    @Override // ai.a0
    public final byte[] f(zzbh zzbhVar, String str) {
        Parcel parcelX = X();
        r6.b(parcelX, zzbhVar);
        parcelX.writeString(str);
        Parcel parcelW = W(parcelX, 9);
        byte[] bArrCreateByteArray = parcelW.createByteArray();
        parcelW.recycle();
        return bArrCreateByteArray;
    }

    @Override // ai.a0
    public final void g(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Z(parcelX, 25);
    }

    @Override // ai.a0
    public final void i(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Z(parcelX, 6);
    }

    @Override // ai.a0
    public final void k(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Z(parcelX, 26);
    }

    @Override // ai.a0
    public final void l(zzpl zzplVar, zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzplVar);
        r6.b(parcelX, zzrVar);
        Z(parcelX, 2);
    }

    @Override // ai.a0
    public final String o(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Parcel parcelW = W(parcelX, 11);
        String string = parcelW.readString();
        parcelW.recycle();
        return string;
    }

    @Override // ai.a0
    public final void t(long j11, String str, String str2, String str3) {
        Parcel parcelX = X();
        parcelX.writeLong(j11);
        parcelX.writeString(str);
        parcelX.writeString(str2);
        parcelX.writeString(str3);
        Z(parcelX, 10);
    }

    @Override // ai.a0
    public final void u(zzr zzrVar) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        Z(parcelX, 18);
    }

    @Override // ai.a0
    public final void y(zzr zzrVar, Bundle bundle, c0 c0Var) {
        Parcel parcelX = X();
        r6.b(parcelX, zzrVar);
        r6.b(parcelX, bundle);
        r6.c(parcelX, c0Var);
        Z(parcelX, 31);
    }
}
