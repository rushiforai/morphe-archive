package com.google.android.exoplayer2.metadata.scte35;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.consent_sdk.a;
import di.b;

/* loaded from: classes3.dex */
public final class TimeSignalCommand extends SpliceCommand {
    public static final Parcelable.Creator<TimeSignalCommand> CREATOR = new b(22);

    /* renamed from: a, reason: collision with root package name */
    public final long f31576a;

    /* renamed from: b, reason: collision with root package name */
    public final long f31577b;

    public TimeSignalCommand(long j11, long j12) {
        this.f31576a = j11;
        this.f31577b = j12;
    }

    public static long a(long j11, a aVar) {
        long jN = aVar.N();
        if ((128 & jN) != 0) {
            return 8589934591L & ((((jN & 1) << 32) | aVar.O()) + j11);
        }
        return -9223372036854775807L;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeLong(this.f31576a);
        parcel.writeLong(this.f31577b);
    }
}
