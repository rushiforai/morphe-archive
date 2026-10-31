package com.google.android.exoplayer2.metadata.emsg;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.exoplayer2.metadata.Metadata;
import fe.j0;
import fe.k0;
import java.util.Arrays;
import wf.v;
import ww.c;

/* loaded from: classes3.dex */
public final class EventMessage implements Metadata.Entry {
    public static final Parcelable.Creator<EventMessage> CREATOR;

    /* renamed from: g, reason: collision with root package name */
    public static final k0 f31479g;

    /* renamed from: h, reason: collision with root package name */
    public static final k0 f31480h;

    /* renamed from: a, reason: collision with root package name */
    public final String f31481a;

    /* renamed from: b, reason: collision with root package name */
    public final String f31482b;

    /* renamed from: c, reason: collision with root package name */
    public final long f31483c;

    /* renamed from: d, reason: collision with root package name */
    public final long f31484d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f31485e;

    /* renamed from: f, reason: collision with root package name */
    public int f31486f;

    static {
        j0 j0Var = new j0();
        j0Var.f54856k = "application/id3";
        f31479g = new k0(j0Var);
        j0 j0Var2 = new j0();
        j0Var2.f54856k = "application/x-scte35";
        f31480h = new k0(j0Var2);
        CREATOR = new c(25);
    }

    public EventMessage(String str, String str2, long j11, long j12, byte[] bArr) {
        this.f31481a = str;
        this.f31482b = str2;
        this.f31483c = j11;
        this.f31484d = j12;
        this.f31485e = bArr;
    }

    @Override // com.google.android.exoplayer2.metadata.Metadata.Entry
    public final byte[] E0() {
        if (w() != null) {
            return this.f31485e;
        }
        return null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && EventMessage.class == obj.getClass()) {
            EventMessage eventMessage = (EventMessage) obj;
            if (this.f31483c == eventMessage.f31483c && this.f31484d == eventMessage.f31484d && v.a(this.f31481a, eventMessage.f31481a) && v.a(this.f31482b, eventMessage.f31482b) && Arrays.equals(this.f31485e, eventMessage.f31485e)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.f31486f == 0) {
            String str = this.f31481a;
            int iHashCode = (527 + (str != null ? str.hashCode() : 0)) * 31;
            String str2 = this.f31482b;
            int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
            long j11 = this.f31483c;
            int i5 = (iHashCode2 + ((int) (j11 ^ (j11 >>> 32)))) * 31;
            long j12 = this.f31484d;
            this.f31486f = Arrays.hashCode(this.f31485e) + ((i5 + ((int) (j12 ^ (j12 >>> 32)))) * 31);
        }
        return this.f31486f;
    }

    public final String toString() {
        return "EMSG: scheme=" + this.f31481a + ", id=" + this.f31484d + ", durationMs=" + this.f31483c + ", value=" + this.f31482b;
    }

    @Override // com.google.android.exoplayer2.metadata.Metadata.Entry
    public final k0 w() {
        String str = this.f31481a;
        str.getClass();
        switch (str) {
            case "urn:scte:scte35:2014:bin":
                return f31480h;
            case "https://aomedia.org/emsg/ID3":
            case "https://developer.apple.com/streaming/emsg-id3":
                return f31479g;
            default:
                return null;
        }
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31481a);
        parcel.writeString(this.f31482b);
        parcel.writeLong(this.f31483c);
        parcel.writeLong(this.f31484d);
        parcel.writeByteArray(this.f31485e);
    }

    public EventMessage(Parcel parcel) {
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31481a = string;
        this.f31482b = parcel.readString();
        this.f31483c = parcel.readLong();
        this.f31484d = parcel.readLong();
        this.f31485e = parcel.createByteArray();
    }
}
