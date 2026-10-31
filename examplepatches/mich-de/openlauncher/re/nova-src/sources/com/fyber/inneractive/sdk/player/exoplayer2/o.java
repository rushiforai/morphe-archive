package com.fyber.inneractive.sdk.player.exoplayer2;

import android.media.MediaFormat;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class o implements Parcelable {
    public static final Parcelable.Creator<o> CREATOR = new n();
    public int A;

    /* renamed from: a, reason: collision with root package name */
    public final String f30123a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30124b;

    /* renamed from: c, reason: collision with root package name */
    public final String f30125c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.metadata.b f30126d;

    /* renamed from: e, reason: collision with root package name */
    public final String f30127e;

    /* renamed from: f, reason: collision with root package name */
    public final String f30128f;

    /* renamed from: g, reason: collision with root package name */
    public final int f30129g;

    /* renamed from: h, reason: collision with root package name */
    public final List f30130h;

    /* renamed from: i, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.drm.d f30131i;

    /* renamed from: j, reason: collision with root package name */
    public final int f30132j;

    /* renamed from: k, reason: collision with root package name */
    public final int f30133k;

    /* renamed from: l, reason: collision with root package name */
    public final float f30134l;

    /* renamed from: m, reason: collision with root package name */
    public final int f30135m;
    public final float n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final byte[] f30136p;

    /* renamed from: q, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.video.c f30137q;

    /* renamed from: r, reason: collision with root package name */
    public final int f30138r;

    /* renamed from: s, reason: collision with root package name */
    public final int f30139s;

    /* renamed from: t, reason: collision with root package name */
    public final int f30140t;

    /* renamed from: u, reason: collision with root package name */
    public final int f30141u;

    /* renamed from: v, reason: collision with root package name */
    public final int f30142v;

    /* renamed from: w, reason: collision with root package name */
    public final long f30143w;

    /* renamed from: x, reason: collision with root package name */
    public final int f30144x;

    /* renamed from: y, reason: collision with root package name */
    public final String f30145y;

    /* renamed from: z, reason: collision with root package name */
    public final int f30146z;

    public o(String str, String str2, String str3, String str4, int i5, int i11, int i12, int i13, float f11, int i14, float f12, byte[] bArr, int i15, com.fyber.inneractive.sdk.player.exoplayer2.video.c cVar, int i16, int i17, int i18, int i19, int i21, int i22, String str5, int i23, long j11, List list, com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar, com.fyber.inneractive.sdk.player.exoplayer2.metadata.b bVar) {
        this.f30123a = str;
        this.f30127e = str2;
        this.f30128f = str3;
        this.f30125c = str4;
        this.f30124b = i5;
        this.f30129g = i11;
        this.f30132j = i12;
        this.f30133k = i13;
        this.f30134l = f11;
        this.f30135m = i14;
        this.n = f12;
        this.f30136p = bArr;
        this.o = i15;
        this.f30137q = cVar;
        this.f30138r = i16;
        this.f30139s = i17;
        this.f30140t = i18;
        this.f30141u = i19;
        this.f30142v = i21;
        this.f30144x = i22;
        this.f30145y = str5;
        this.f30146z = i23;
        this.f30143w = j11;
        this.f30130h = list == null ? Collections.EMPTY_LIST : list;
        this.f30131i = dVar;
        this.f30126d = bVar;
    }

    public static o a(String str, String str2, int i5, int i11, int i12, List list, int i13, float f11, byte[] bArr, int i14, com.fyber.inneractive.sdk.player.exoplayer2.video.c cVar, com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar) {
        return new o(str, null, str2, null, -1, i5, i11, i12, -1.0f, i13, f11, bArr, i14, cVar, -1, -1, -1, -1, -1, 0, null, -1, Long.MAX_VALUE, list, dVar, null);
    }

    public final int b() {
        int i5;
        int i11 = this.f30132j;
        if (i11 == -1 || (i5 = this.f30133k) == -1) {
            return -1;
        }
        return i11 * i5;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && o.class == obj.getClass()) {
            o oVar = (o) obj;
            if (this.f30124b == oVar.f30124b && this.f30129g == oVar.f30129g && this.f30132j == oVar.f30132j && this.f30133k == oVar.f30133k && this.f30134l == oVar.f30134l && this.f30135m == oVar.f30135m && this.n == oVar.n && this.o == oVar.o && this.f30138r == oVar.f30138r && this.f30139s == oVar.f30139s && this.f30140t == oVar.f30140t && this.f30141u == oVar.f30141u && this.f30142v == oVar.f30142v && this.f30143w == oVar.f30143w && this.f30144x == oVar.f30144x && z.a(this.f30123a, oVar.f30123a) && z.a(this.f30145y, oVar.f30145y) && this.f30146z == oVar.f30146z && z.a(this.f30127e, oVar.f30127e) && z.a(this.f30128f, oVar.f30128f) && z.a(this.f30125c, oVar.f30125c) && z.a(this.f30131i, oVar.f30131i) && z.a(this.f30126d, oVar.f30126d) && z.a(this.f30137q, oVar.f30137q) && Arrays.equals(this.f30136p, oVar.f30136p) && this.f30130h.size() == oVar.f30130h.size()) {
                for (int i5 = 0; i5 < this.f30130h.size(); i5++) {
                    if (!Arrays.equals((byte[]) this.f30130h.get(i5), (byte[]) oVar.f30130h.get(i5))) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.A == 0) {
            String str = this.f30123a;
            int iHashCode = ((str == null ? 0 : str.hashCode()) + 527) * 31;
            String str2 = this.f30127e;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f30128f;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f30125c;
            int iHashCode4 = (((((((((((iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31) + this.f30124b) * 31) + this.f30132j) * 31) + this.f30133k) * 31) + this.f30138r) * 31) + this.f30139s) * 31;
            String str5 = this.f30145y;
            int iHashCode5 = (((iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31) + this.f30146z) * 31;
            com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar = this.f30131i;
            int iHashCode6 = (iHashCode5 + (dVar == null ? 0 : dVar.hashCode())) * 31;
            com.fyber.inneractive.sdk.player.exoplayer2.metadata.b bVar = this.f30126d;
            this.A = iHashCode6 + (bVar != null ? Arrays.hashCode(bVar.f30087a) : 0);
        }
        return this.A;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Format(");
        sb2.append(this.f30123a);
        sb2.append(", ");
        sb2.append(this.f30127e);
        sb2.append(", ");
        sb2.append(this.f30128f);
        sb2.append(", ");
        sb2.append(this.f30124b);
        sb2.append(", ");
        sb2.append(this.f30145y);
        sb2.append(", [");
        sb2.append(this.f30132j);
        sb2.append(", ");
        sb2.append(this.f30133k);
        sb2.append(", ");
        sb2.append(this.f30134l);
        sb2.append("], [");
        sb2.append(this.f30138r);
        sb2.append(", ");
        return c0.o(sb2, this.f30139s, "])");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30123a);
        parcel.writeString(this.f30127e);
        parcel.writeString(this.f30128f);
        parcel.writeString(this.f30125c);
        parcel.writeInt(this.f30124b);
        parcel.writeInt(this.f30129g);
        parcel.writeInt(this.f30132j);
        parcel.writeInt(this.f30133k);
        parcel.writeFloat(this.f30134l);
        parcel.writeInt(this.f30135m);
        parcel.writeFloat(this.n);
        parcel.writeInt(this.f30136p != null ? 1 : 0);
        byte[] bArr = this.f30136p;
        if (bArr != null) {
            parcel.writeByteArray(bArr);
        }
        parcel.writeInt(this.o);
        parcel.writeParcelable(this.f30137q, i5);
        parcel.writeInt(this.f30138r);
        parcel.writeInt(this.f30139s);
        parcel.writeInt(this.f30140t);
        parcel.writeInt(this.f30141u);
        parcel.writeInt(this.f30142v);
        parcel.writeInt(this.f30144x);
        parcel.writeString(this.f30145y);
        parcel.writeInt(this.f30146z);
        parcel.writeLong(this.f30143w);
        int size = this.f30130h.size();
        parcel.writeInt(size);
        for (int i11 = 0; i11 < size; i11++) {
            parcel.writeByteArray((byte[]) this.f30130h.get(i11));
        }
        parcel.writeParcelable(this.f30131i, 0);
        parcel.writeParcelable(this.f30126d, 0);
    }

    public static o a(String str, String str2, int i5, int i11, int i12, int i13, List list, com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar, String str3) {
        return a(str, str2, i5, i11, i12, i13, -1, -1, -1, list, dVar, 0, str3, null);
    }

    public static o a(String str, String str2, int i5, int i11, int i12, int i13, int i14, int i15, int i16, List list, com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar, int i17, String str3, com.fyber.inneractive.sdk.player.exoplayer2.metadata.b bVar) {
        return new o(str, null, str2, null, i5, i11, -1, -1, -1.0f, -1, -1.0f, null, -1, null, i12, i13, i14, i15, i16, i17, str3, -1, Long.MAX_VALUE, list, dVar, bVar);
    }

    public static o a(String str, String str2, int i5, String str3, int i11, com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar, long j11, List list) {
        return new o(str, null, str2, null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, i5, str3, i11, j11, list, dVar, null);
    }

    public static o a(String str, String str2, com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar) {
        return new o(str, null, str2, null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, 0, null, -1, Long.MAX_VALUE, null, dVar, null);
    }

    public final MediaFormat a() {
        MediaFormat mediaFormat = new MediaFormat();
        mediaFormat.setString("mime", this.f30128f);
        String str = this.f30145y;
        if (str != null) {
            mediaFormat.setString(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, str);
        }
        a(mediaFormat, "max-input-size", this.f30129g);
        a(mediaFormat, "width", this.f30132j);
        a(mediaFormat, "height", this.f30133k);
        float f11 = this.f30134l;
        if (f11 != -1.0f) {
            mediaFormat.setFloat("frame-rate", f11);
        }
        a(mediaFormat, "rotation-degrees", this.f30135m);
        a(mediaFormat, "channel-count", this.f30138r);
        a(mediaFormat, "sample-rate", this.f30139s);
        a(mediaFormat, "encoder-delay", this.f30141u);
        a(mediaFormat, "encoder-padding", this.f30142v);
        for (int i5 = 0; i5 < this.f30130h.size(); i5++) {
            mediaFormat.setByteBuffer(m.a("csd-", i5), ByteBuffer.wrap((byte[]) this.f30130h.get(i5)));
        }
        com.fyber.inneractive.sdk.player.exoplayer2.video.c cVar = this.f30137q;
        if (cVar != null) {
            a(mediaFormat, "color-transfer", cVar.f30526c);
            a(mediaFormat, "color-standard", cVar.f30524a);
            a(mediaFormat, "color-range", cVar.f30525b);
            byte[] bArr = cVar.f30527d;
            if (bArr != null) {
                mediaFormat.setByteBuffer("hdr-static-info", ByteBuffer.wrap(bArr));
            }
        }
        return mediaFormat;
    }

    public o(Parcel parcel) {
        this.f30123a = parcel.readString();
        this.f30127e = parcel.readString();
        this.f30128f = parcel.readString();
        this.f30125c = parcel.readString();
        this.f30124b = parcel.readInt();
        this.f30129g = parcel.readInt();
        this.f30132j = parcel.readInt();
        this.f30133k = parcel.readInt();
        this.f30134l = parcel.readFloat();
        this.f30135m = parcel.readInt();
        this.n = parcel.readFloat();
        this.f30136p = parcel.readInt() != 0 ? parcel.createByteArray() : null;
        this.o = parcel.readInt();
        this.f30137q = (com.fyber.inneractive.sdk.player.exoplayer2.video.c) parcel.readParcelable(com.fyber.inneractive.sdk.player.exoplayer2.video.c.class.getClassLoader());
        this.f30138r = parcel.readInt();
        this.f30139s = parcel.readInt();
        this.f30140t = parcel.readInt();
        this.f30141u = parcel.readInt();
        this.f30142v = parcel.readInt();
        this.f30144x = parcel.readInt();
        this.f30145y = parcel.readString();
        this.f30146z = parcel.readInt();
        this.f30143w = parcel.readLong();
        int i5 = parcel.readInt();
        this.f30130h = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            this.f30130h.add(parcel.createByteArray());
        }
        this.f30131i = (com.fyber.inneractive.sdk.player.exoplayer2.drm.d) parcel.readParcelable(com.fyber.inneractive.sdk.player.exoplayer2.drm.d.class.getClassLoader());
        this.f30126d = (com.fyber.inneractive.sdk.player.exoplayer2.metadata.b) parcel.readParcelable(com.fyber.inneractive.sdk.player.exoplayer2.metadata.b.class.getClassLoader());
    }

    public static void a(MediaFormat mediaFormat, String str, int i5) {
        if (i5 != -1) {
            mediaFormat.setInteger(str, i5);
        }
    }
}
