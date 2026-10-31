package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import cf.a;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class ChapterTocFrame extends Id3Frame {
    public static final Parcelable.Creator<ChapterTocFrame> CREATOR = new a(2);

    /* renamed from: b, reason: collision with root package name */
    public final String f31517b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f31518c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f31519d;

    /* renamed from: e, reason: collision with root package name */
    public final String[] f31520e;

    /* renamed from: f, reason: collision with root package name */
    public final Id3Frame[] f31521f;

    public ChapterTocFrame(String str, boolean z11, boolean z12, String[] strArr, Id3Frame[] id3FrameArr) {
        super("CTOC");
        this.f31517b = str;
        this.f31518c = z11;
        this.f31519d = z12;
        this.f31520e = strArr;
        this.f31521f = id3FrameArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && ChapterTocFrame.class == obj.getClass()) {
            ChapterTocFrame chapterTocFrame = (ChapterTocFrame) obj;
            if (this.f31518c == chapterTocFrame.f31518c && this.f31519d == chapterTocFrame.f31519d && v.a(this.f31517b, chapterTocFrame.f31517b) && Arrays.equals(this.f31520e, chapterTocFrame.f31520e) && Arrays.equals(this.f31521f, chapterTocFrame.f31521f)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = (((527 + (this.f31518c ? 1 : 0)) * 31) + (this.f31519d ? 1 : 0)) * 31;
        String str = this.f31517b;
        return i5 + (str != null ? str.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31517b);
        parcel.writeByte(this.f31518c ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.f31519d ? (byte) 1 : (byte) 0);
        parcel.writeStringArray(this.f31520e);
        Id3Frame[] id3FrameArr = this.f31521f;
        parcel.writeInt(id3FrameArr.length);
        for (Id3Frame id3Frame : id3FrameArr) {
            parcel.writeParcelable(id3Frame, 0);
        }
    }

    public ChapterTocFrame(Parcel parcel) {
        super("CTOC");
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31517b = string;
        this.f31518c = parcel.readByte() != 0;
        this.f31519d = parcel.readByte() != 0;
        this.f31520e = parcel.createStringArray();
        int i11 = parcel.readInt();
        this.f31521f = new Id3Frame[i11];
        for (int i12 = 0; i12 < i11; i12++) {
            this.f31521f[i12] = (Id3Frame) parcel.readParcelable(Id3Frame.class.getClassLoader());
        }
    }
}
