package com.facebook.ads.androidx.media3.extractor.metadata.scte35;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1084Mk;
import com.facebook.ads.redexgen.X.C1092Ms;
import com.facebook.ads.redexgen.X.C1437aO;

/* loaded from: assets/audience_network/classes.dex */
public final class TimeSignalCommand extends SpliceCommand {
    public static final Parcelable.Creator<TimeSignalCommand> CREATOR = new C1437aO();
    public final long A00;
    public final long A01;

    public TimeSignalCommand(long j11, long j12) {
        this.A01 = j11;
        this.A00 = j12;
    }

    public /* synthetic */ TimeSignalCommand(long j11, long j12, C1437aO c1437aO) {
        this(j11, j12);
    }

    public static long A00(C1084Mk c1084Mk, long j11) {
        long jA0I = c1084Mk.A0I();
        if ((128 & jA0I) == 0) {
            return -9223372036854775807L;
        }
        long ptsTime = 1 & jA0I;
        long firstByte = c1084Mk.A0Q();
        return (((ptsTime << 32) | firstByte) + j11) & 8589934591L;
    }

    public static TimeSignalCommand A01(C1084Mk c1084Mk, long j11, C1092Ms c1092Ms) {
        long jA00 = A00(c1084Mk, j11);
        return new TimeSignalCommand(jA00, c1092Ms.A06(jA00));
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeLong(this.A01);
        parcel.writeLong(this.A00);
    }
}
