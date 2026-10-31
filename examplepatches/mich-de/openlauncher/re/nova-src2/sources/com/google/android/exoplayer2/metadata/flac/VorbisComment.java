package com.google.android.exoplayer2.metadata.flac;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.google.android.exoplayer2.metadata.Metadata;
import fe.v0;
import wf.v;

@Deprecated
/* loaded from: classes3.dex */
public class VorbisComment implements Metadata.Entry {
    public static final Parcelable.Creator<VorbisComment> CREATOR = new w(2);

    /* renamed from: a, reason: collision with root package name */
    public final String f31495a;

    /* renamed from: b, reason: collision with root package name */
    public final String f31496b;

    public VorbisComment(String str, String str2) {
        this.f31495a = str;
        this.f31496b = str2;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    @Override // com.google.android.exoplayer2.metadata.Metadata.Entry
    public final void W(v0 v0Var) {
        String str = this.f31495a;
        str.getClass();
        char c11 = 65535;
        switch (str.hashCode()) {
            case 62359119:
                if (str.equals("ALBUM")) {
                    c11 = 0;
                    break;
                }
                break;
            case 79833656:
                if (str.equals(NativeAdContent.ViewTag.AD_TITLE)) {
                    c11 = 1;
                    break;
                }
                break;
            case 428414940:
                if (str.equals(NativeAdContent.ViewTag.AD_DESCRIPTION)) {
                    c11 = 2;
                    break;
                }
                break;
            case 1746739798:
                if (str.equals("ALBUMARTIST")) {
                    c11 = 3;
                    break;
                }
                break;
            case 1939198791:
                if (str.equals("ARTIST")) {
                    c11 = 4;
                    break;
                }
                break;
        }
        String str2 = this.f31496b;
        switch (c11) {
            case 0:
                v0Var.f55011c = str2;
                break;
            case 1:
                v0Var.f55009a = str2;
                break;
            case 2:
                v0Var.f55015g = str2;
                break;
            case 3:
                v0Var.f55012d = str2;
                break;
            case 4:
                v0Var.f55010b = str2;
                break;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            VorbisComment vorbisComment = (VorbisComment) obj;
            if (this.f31495a.equals(vorbisComment.f31495a) && this.f31496b.equals(vorbisComment.f31496b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f31496b.hashCode() + c0.e(527, 31, this.f31495a);
    }

    public final String toString() {
        return "VC: " + this.f31495a + "=" + this.f31496b;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31495a);
        parcel.writeString(this.f31496b);
    }

    public VorbisComment(Parcel parcel) {
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31495a = string;
        this.f31496b = parcel.readString();
    }
}
