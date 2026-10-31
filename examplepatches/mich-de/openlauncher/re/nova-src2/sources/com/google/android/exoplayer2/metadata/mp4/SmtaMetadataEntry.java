package com.google.android.exoplayer2.metadata.mp4;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.exoplayer2.metadata.Metadata;

/* loaded from: classes3.dex */
public final class SmtaMetadataEntry implements Metadata.Entry {
    public static final Parcelable.Creator<SmtaMetadataEntry> CREATOR = new cf.a(28);

    /* renamed from: a, reason: collision with root package name */
    public final float f31557a;

    /* renamed from: b, reason: collision with root package name */
    public final int f31558b;

    public SmtaMetadataEntry(float f11, int i5) {
        this.f31557a = f11;
        this.f31558b = i5;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && SmtaMetadataEntry.class == obj.getClass()) {
            SmtaMetadataEntry smtaMetadataEntry = (SmtaMetadataEntry) obj;
            if (this.f31557a == smtaMetadataEntry.f31557a && this.f31558b == smtaMetadataEntry.f31558b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((Float.valueOf(this.f31557a).hashCode() + 527) * 31) + this.f31558b;
    }

    public final String toString() {
        return "smta: captureFrameRate=" + this.f31557a + ", svcTemporalLayerCount=" + this.f31558b;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeFloat(this.f31557a);
        parcel.writeInt(this.f31558b);
    }

    public SmtaMetadataEntry(Parcel parcel) {
        this.f31557a = parcel.readFloat();
        this.f31558b = parcel.readInt();
    }
}
