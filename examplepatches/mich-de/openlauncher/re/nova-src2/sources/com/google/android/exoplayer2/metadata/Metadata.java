package com.google.android.exoplayer2.metadata;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import cw.l2;
import fe.k0;
import fe.v0;
import java.util.Arrays;
import java.util.List;
import wf.v;

/* loaded from: classes3.dex */
public final class Metadata implements Parcelable {
    public static final Parcelable.Creator<Metadata> CREATOR = new xe.a();

    /* renamed from: a, reason: collision with root package name */
    public final Entry[] f31467a;

    /* renamed from: b, reason: collision with root package name */
    public final long f31468b;

    public interface Entry extends Parcelable {
        default byte[] E0() {
            return null;
        }

        default void W(v0 v0Var) {
        }

        default k0 w() {
            return null;
        }
    }

    public Metadata(Entry... entryArr) {
        this(-9223372036854775807L, entryArr);
    }

    public final Metadata a(Entry... entryArr) {
        if (entryArr.length == 0) {
            return this;
        }
        int i5 = v.f94376a;
        Entry[] entryArr2 = this.f31467a;
        Object[] objArrCopyOf = Arrays.copyOf(entryArr2, entryArr2.length + entryArr.length);
        System.arraycopy(entryArr, 0, objArrCopyOf, entryArr2.length, entryArr.length);
        return new Metadata(this.f31468b, (Entry[]) objArrCopyOf);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && Metadata.class == obj.getClass()) {
            Metadata metadata = (Metadata) obj;
            if (Arrays.equals(this.f31467a, metadata.f31467a) && this.f31468b == metadata.f31468b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return l2.C(this.f31468b) + (Arrays.hashCode(this.f31467a) * 31);
    }

    public final String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder("entries=");
        sb2.append(Arrays.toString(this.f31467a));
        long j11 = this.f31468b;
        if (j11 == -9223372036854775807L) {
            str = b.f42142b;
        } else {
            str = ", presentationTimeUs=" + j11;
        }
        sb2.append(str);
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        Entry[] entryArr = this.f31467a;
        parcel.writeInt(entryArr.length);
        for (Entry entry : entryArr) {
            parcel.writeParcelable(entry, 0);
        }
        parcel.writeLong(this.f31468b);
    }

    public Metadata(long j11, Entry... entryArr) {
        this.f31468b = j11;
        this.f31467a = entryArr;
    }

    public Metadata(List list) {
        this((Entry[]) list.toArray(new Entry[0]));
    }

    public Metadata(Parcel parcel) {
        this.f31467a = new Entry[parcel.readInt()];
        int i5 = 0;
        while (true) {
            Entry[] entryArr = this.f31467a;
            if (i5 < entryArr.length) {
                entryArr[i5] = (Entry) parcel.readParcelable(Entry.class.getClassLoader());
                i5++;
            } else {
                this.f31468b = parcel.readLong();
                return;
            }
        }
    }
}
