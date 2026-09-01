package com.medium.android.core.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g76;
import defpackage.h74;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005¢\u0006\u0004\b\b\u0010\tJ\r\u0010\n\u001a\u00020\u0005¢\u0006\u0004\b\n\u0010\u000bJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\u0005¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0013J\u0010\u0010\u0015\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u000bJ\u0010\u0010\u0016\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u000bJ8\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u0013J\u0010\u0010\u001a\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u001a\u0010\u000bJ\u001a\u0010\u001e\u001a\u00020\u001d2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001bHÖ\u0003¢\u0006\u0004\b\u001e\u0010\u001fR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010 \u001a\u0004\b!\u0010\u0013R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010 \u001a\u0004\b\"\u0010\u0013R\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010#\u001a\u0004\b$\u0010\u000bR\u0017\u0010\u0007\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010#\u001a\u0004\b%\u0010\u000b¨\u0006&"}, d2 = {"Lcom/medium/android/core/navigation/HighlightReference;", "Landroid/os/Parcelable;", "", "postId", "paragraphName", "", "startOffset", "endOffset", "<init>", "(Ljava/lang/String;Ljava/lang/String;II)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/String;II)Lcom/medium/android/core/navigation/HighlightReference;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getParagraphName", "I", "getStartOffset", "getEndOffset", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class HighlightReference implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<HighlightReference> CREATOR = new h74(12);
    private final int endOffset;
    private final String paragraphName;
    private final String postId;
    private final int startOffset;

    public HighlightReference(String str, String str2, int i, int i2) {
        str.getClass();
        str2.getClass();
        this.postId = str;
        this.paragraphName = str2;
        this.startOffset = i;
        this.endOffset = i2;
    }

    public static /* synthetic */ HighlightReference copy$default(HighlightReference highlightReference, String str, String str2, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            str = highlightReference.postId;
        }
        if ((i3 & 2) != 0) {
            str2 = highlightReference.paragraphName;
        }
        if ((i3 & 4) != 0) {
            i = highlightReference.startOffset;
        }
        if ((i3 & 8) != 0) {
            i2 = highlightReference.endOffset;
        }
        return highlightReference.copy(str, str2, i, i2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getParagraphName() {
        return this.paragraphName;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getStartOffset() {
        return this.startOffset;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final int getEndOffset() {
        return this.endOffset;
    }

    public final HighlightReference copy(String postId, String paragraphName, int startOffset, int endOffset) {
        postId.getClass();
        paragraphName.getClass();
        return new HighlightReference(postId, paragraphName, startOffset, endOffset);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof HighlightReference)) {
            return false;
        }
        HighlightReference highlightReference = (HighlightReference) other;
        return g76.L(this.postId, highlightReference.postId) && g76.L(this.paragraphName, highlightReference.paragraphName) && this.startOffset == highlightReference.startOffset && this.endOffset == highlightReference.endOffset;
    }

    public final int getEndOffset() {
        return this.endOffset;
    }

    public final String getParagraphName() {
        return this.paragraphName;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int getStartOffset() {
        return this.startOffset;
    }

    public int hashCode() {
        return ((wgd.o(this.postId.hashCode() * 31, 31, this.paragraphName) + this.startOffset) * 31) + this.endOffset;
    }

    public String toString() {
        String str = this.postId;
        String str2 = this.paragraphName;
        int i = this.startOffset;
        int i2 = this.endOffset;
        StringBuilder sbU = y30.u("HighlightReference(postId=", str, ", paragraphName=", str2, ", startOffset=");
        sbU.append(i);
        sbU.append(", endOffset=");
        sbU.append(i2);
        sbU.append(")");
        return sbU.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.postId);
        dest.writeString(this.paragraphName);
        dest.writeInt(this.startOffset);
        dest.writeInt(this.endOffset);
    }
}
