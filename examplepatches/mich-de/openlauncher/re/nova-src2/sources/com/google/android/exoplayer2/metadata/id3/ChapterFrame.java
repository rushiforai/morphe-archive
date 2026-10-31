package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import cf.a;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class ChapterFrame extends Id3Frame {
    public static final Parcelable.Creator<ChapterFrame> CREATOR = new a(1);

    /* renamed from: b, reason: collision with root package name */
    public final String f31511b;

    /* renamed from: c, reason: collision with root package name */
    public final int f31512c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31513d;

    /* renamed from: e, reason: collision with root package name */
    public final long f31514e;

    /* renamed from: f, reason: collision with root package name */
    public final long f31515f;

    /* renamed from: g, reason: collision with root package name */
    public final Id3Frame[] f31516g;

    public ChapterFrame(String str, int i5, int i11, long j11, long j12, Id3Frame[] id3FrameArr) {
        super("CHAP");
        this.f31511b = str;
        this.f31512c = i5;
        this.f31513d = i11;
        this.f31514e = j11;
        this.f31515f = j12;
        this.f31516g = id3FrameArr;
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame, android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && ChapterFrame.class == obj.getClass()) {
            ChapterFrame chapterFrame = (ChapterFrame) obj;
            if (this.f31512c == chapterFrame.f31512c && this.f31513d == chapterFrame.f31513d && this.f31514e == chapterFrame.f31514e && this.f31515f == chapterFrame.f31515f && v.a(this.f31511b, chapterFrame.f31511b) && Arrays.equals(this.f31516g, chapterFrame.f31516g)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = (((((((527 + this.f31512c) * 31) + this.f31513d) * 31) + ((int) this.f31514e)) * 31) + ((int) this.f31515f)) * 31;
        String str = this.f31511b;
        return i5 + (str != null ? str.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31511b);
        parcel.writeInt(this.f31512c);
        parcel.writeInt(this.f31513d);
        parcel.writeLong(this.f31514e);
        parcel.writeLong(this.f31515f);
        Id3Frame[] id3FrameArr = this.f31516g;
        parcel.writeInt(id3FrameArr.length);
        for (Id3Frame id3Frame : id3FrameArr) {
            parcel.writeParcelable(id3Frame, 0);
        }
    }

    public ChapterFrame(Parcel parcel) {
        super("CHAP");
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31511b = string;
        this.f31512c = parcel.readInt();
        this.f31513d = parcel.readInt();
        this.f31514e = parcel.readLong();
        this.f31515f = parcel.readLong();
        int i11 = parcel.readInt();
        this.f31516g = new Id3Frame[i11];
        for (int i12 = 0; i12 < i11; i12++) {
            this.f31516g[i12] = (Id3Frame) parcel.readParcelable(Id3Frame.class.getClassLoader());
        }
    }
}
