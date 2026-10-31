package com.google.android.exoplayer2.metadata.mp4;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.exoplayer2.metadata.Metadata;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;
import wf.v;

/* loaded from: classes3.dex */
public final class SlowMotionData implements Metadata.Entry {
    public static final Parcelable.Creator<SlowMotionData> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f31553a;

    public static final class Segment implements Parcelable {
        public static final Parcelable.Creator<Segment> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final long f31554a;

        /* renamed from: b, reason: collision with root package name */
        public final long f31555b;

        /* renamed from: c, reason: collision with root package name */
        public final int f31556c;

        public Segment(int i5, long j11, long j12) {
            wf.a.e(j11 < j12);
            this.f31554a = j11;
            this.f31555b = j12;
            this.f31556c = i5;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj != null && Segment.class == obj.getClass()) {
                Segment segment = (Segment) obj;
                if (this.f31554a == segment.f31554a && this.f31555b == segment.f31555b && this.f31556c == segment.f31556c) {
                    return true;
                }
            }
            return false;
        }

        public final int hashCode() {
            return Arrays.hashCode(new Object[]{Long.valueOf(this.f31554a), Long.valueOf(this.f31555b), Integer.valueOf(this.f31556c)});
        }

        public final String toString() {
            int i5 = v.f94376a;
            Locale locale = Locale.US;
            StringBuilder sbU = c0.u(this.f31554a, "Segment: startTimeMs=", ", endTimeMs=");
            sbU.append(this.f31555b);
            sbU.append(", speedDivisor=");
            sbU.append(this.f31556c);
            return sbU.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeLong(this.f31554a);
            parcel.writeLong(this.f31555b);
            parcel.writeInt(this.f31556c);
        }
    }

    public SlowMotionData(ArrayList arrayList) {
        this.f31553a = arrayList;
        boolean z11 = false;
        if (!arrayList.isEmpty()) {
            long j11 = ((Segment) arrayList.get(0)).f31555b;
            int i5 = 1;
            while (true) {
                if (i5 >= arrayList.size()) {
                    break;
                }
                if (((Segment) arrayList.get(i5)).f31554a < j11) {
                    z11 = true;
                    break;
                } else {
                    j11 = ((Segment) arrayList.get(i5)).f31555b;
                    i5++;
                }
            }
        }
        wf.a.e(!z11);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || SlowMotionData.class != obj.getClass()) {
            return false;
        }
        return this.f31553a.equals(((SlowMotionData) obj).f31553a);
    }

    public final int hashCode() {
        return this.f31553a.hashCode();
    }

    public final String toString() {
        return "SlowMotion: segments=" + this.f31553a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeList(this.f31553a);
    }
}
