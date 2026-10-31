package com.google.android.exoplayer2.metadata.flac;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.gms.internal.consent_sdk.a;
import fe.v0;
import java.util.Arrays;
import vk.e;
import wf.v;

/* loaded from: classes3.dex */
public final class PictureFrame implements Metadata.Entry {
    public static final Parcelable.Creator<PictureFrame> CREATOR = new w(1);

    /* renamed from: a, reason: collision with root package name */
    public final int f31487a;

    /* renamed from: b, reason: collision with root package name */
    public final String f31488b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31489c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31490d;

    /* renamed from: e, reason: collision with root package name */
    public final int f31491e;

    /* renamed from: f, reason: collision with root package name */
    public final int f31492f;

    /* renamed from: g, reason: collision with root package name */
    public final int f31493g;

    /* renamed from: h, reason: collision with root package name */
    public final byte[] f31494h;

    public PictureFrame(int i5, String str, String str2, int i11, int i12, int i13, int i14, byte[] bArr) {
        this.f31487a = i5;
        this.f31488b = str;
        this.f31489c = str2;
        this.f31490d = i11;
        this.f31491e = i12;
        this.f31492f = i13;
        this.f31493g = i14;
        this.f31494h = bArr;
    }

    public static PictureFrame a(a aVar) {
        int iA = aVar.A();
        String strL = aVar.L(aVar.A(), e.f92807a);
        String strL2 = aVar.L(aVar.A(), e.f92809c);
        int iA2 = aVar.A();
        int iA3 = aVar.A();
        int iA4 = aVar.A();
        int iA5 = aVar.A();
        int iA6 = aVar.A();
        byte[] bArr = new byte[iA6];
        aVar.z(0, iA6, bArr);
        return new PictureFrame(iA, strL, strL2, iA2, iA3, iA4, iA5, bArr);
    }

    @Override // com.google.android.exoplayer2.metadata.Metadata.Entry
    public final void W(v0 v0Var) {
        v0Var.a(this.f31487a, this.f31494h);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && PictureFrame.class == obj.getClass()) {
            PictureFrame pictureFrame = (PictureFrame) obj;
            if (this.f31487a == pictureFrame.f31487a && this.f31488b.equals(pictureFrame.f31488b) && this.f31489c.equals(pictureFrame.f31489c) && this.f31490d == pictureFrame.f31490d && this.f31491e == pictureFrame.f31491e && this.f31492f == pictureFrame.f31492f && this.f31493g == pictureFrame.f31493g && Arrays.equals(this.f31494h, pictureFrame.f31494h)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f31494h) + ((((((((c0.e(c0.e((527 + this.f31487a) * 31, 31, this.f31488b), 31, this.f31489c) + this.f31490d) * 31) + this.f31491e) * 31) + this.f31492f) * 31) + this.f31493g) * 31);
    }

    public final String toString() {
        return "Picture: mimeType=" + this.f31488b + ", description=" + this.f31489c;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f31487a);
        parcel.writeString(this.f31488b);
        parcel.writeString(this.f31489c);
        parcel.writeInt(this.f31490d);
        parcel.writeInt(this.f31491e);
        parcel.writeInt(this.f31492f);
        parcel.writeInt(this.f31493g);
        parcel.writeByteArray(this.f31494h);
    }

    public PictureFrame(Parcel parcel) {
        this.f31487a = parcel.readInt();
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31488b = string;
        this.f31489c = parcel.readString();
        this.f31490d = parcel.readInt();
        this.f31491e = parcel.readInt();
        this.f31492f = parcel.readInt();
        this.f31493g = parcel.readInt();
        this.f31494h = parcel.createByteArray();
    }
}
