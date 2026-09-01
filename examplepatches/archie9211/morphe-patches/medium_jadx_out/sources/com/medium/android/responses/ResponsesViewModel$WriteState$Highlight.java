package com.medium.android.responses;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.domain.post.models.Markup;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.b09;
import defpackage.ev6;
import defpackage.f08;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000H\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0087\b\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\b¢\u0006\u0004\b\u000b\u0010\fJ\r\u0010\r\u001a\u00020\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u001d\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u000eJ\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u000eJ\u0010\u0010\u0017\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0018J\u0016\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\t0\bHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJH\u0010\u001d\u001a\u00020\u001c2\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\bHÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u001f\u0010\u0018J\u0010\u0010 \u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b \u0010\u000eJ\u001a\u0010$\u001a\u00020#2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b$\u0010%R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010&\u001a\u0004\b'\u0010\u000eR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010&\u001a\u0004\b(\u0010\u000eR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010)\u001a\u0004\b*\u0010\u0018R\u0017\u0010\u0007\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010)\u001a\u0004\b+\u0010\u0018R\u001d\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\b8\u0006¢\u0006\f\n\u0004\b\n\u0010,\u001a\u0004\b-\u0010\u001b¨\u0006."}, d2 = {"com/medium/android/responses/ResponsesViewModel$WriteState$Highlight", "Landroid/os/Parcelable;", "", "startOffset", "endOffset", "", "paragraphName", "paragraphText", "", "Lcom/medium/android/domain/post/models/Markup;", "paragraphMarkups", "<init>", "(IILjava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "component2", "component3", "()Ljava/lang/String;", "component4", "component5", "()Ljava/util/List;", "Lcom/medium/android/responses/ResponsesViewModel$WriteState$Highlight;", "copy", "(IILjava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/medium/android/responses/ResponsesViewModel$WriteState$Highlight;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "I", "getStartOffset", "getEndOffset", "Ljava/lang/String;", "getParagraphName", "getParagraphText", "Ljava/util/List;", "getParagraphMarkups", "responses_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ResponsesViewModel$WriteState$Highlight implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<ResponsesViewModel$WriteState$Highlight> CREATOR = new f08(23);
    private final int endOffset;
    private final List<Markup> paragraphMarkups;
    private final String paragraphName;
    private final String paragraphText;
    private final int startOffset;

    public ResponsesViewModel$WriteState$Highlight(int i, int i2, String str, String str2, List<Markup> list) {
        str.getClass();
        str2.getClass();
        list.getClass();
        this.startOffset = i;
        this.endOffset = i2;
        this.paragraphName = str;
        this.paragraphText = str2;
        this.paragraphMarkups = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ResponsesViewModel$WriteState$Highlight copy$default(ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight, int i, int i2, String str, String str2, List list, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = responsesViewModel$WriteState$Highlight.startOffset;
        }
        if ((i3 & 2) != 0) {
            i2 = responsesViewModel$WriteState$Highlight.endOffset;
        }
        if ((i3 & 4) != 0) {
            str = responsesViewModel$WriteState$Highlight.paragraphName;
        }
        if ((i3 & 8) != 0) {
            str2 = responsesViewModel$WriteState$Highlight.paragraphText;
        }
        if ((i3 & 16) != 0) {
            list = responsesViewModel$WriteState$Highlight.paragraphMarkups;
        }
        List list2 = list;
        String str3 = str;
        return responsesViewModel$WriteState$Highlight.copy(i, i2, str3, str2, list2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final int getStartOffset() {
        return this.startOffset;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getEndOffset() {
        return this.endOffset;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getParagraphName() {
        return this.paragraphName;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getParagraphText() {
        return this.paragraphText;
    }

    public final List<Markup> component5() {
        return this.paragraphMarkups;
    }

    public final ResponsesViewModel$WriteState$Highlight copy(int startOffset, int endOffset, String paragraphName, String paragraphText, List<Markup> paragraphMarkups) {
        paragraphName.getClass();
        paragraphText.getClass();
        paragraphMarkups.getClass();
        return new ResponsesViewModel$WriteState$Highlight(startOffset, endOffset, paragraphName, paragraphText, paragraphMarkups);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ResponsesViewModel$WriteState$Highlight)) {
            return false;
        }
        ResponsesViewModel$WriteState$Highlight responsesViewModel$WriteState$Highlight = (ResponsesViewModel$WriteState$Highlight) other;
        return this.startOffset == responsesViewModel$WriteState$Highlight.startOffset && this.endOffset == responsesViewModel$WriteState$Highlight.endOffset && g76.L(this.paragraphName, responsesViewModel$WriteState$Highlight.paragraphName) && g76.L(this.paragraphText, responsesViewModel$WriteState$Highlight.paragraphText) && g76.L(this.paragraphMarkups, responsesViewModel$WriteState$Highlight.paragraphMarkups);
    }

    public final int getEndOffset() {
        return this.endOffset;
    }

    public final List<Markup> getParagraphMarkups() {
        return this.paragraphMarkups;
    }

    public final String getParagraphName() {
        return this.paragraphName;
    }

    public final String getParagraphText() {
        return this.paragraphText;
    }

    public final int getStartOffset() {
        return this.startOffset;
    }

    public int hashCode() {
        return this.paragraphMarkups.hashCode() + wgd.o(wgd.o(((this.startOffset * 31) + this.endOffset) * 31, 31, this.paragraphName), 31, this.paragraphText);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeInt(this.startOffset);
        dest.writeInt(this.endOffset);
        dest.writeString(this.paragraphName);
        dest.writeString(this.paragraphText);
        List<Markup> list = this.paragraphMarkups;
        dest.writeInt(list.size());
        Iterator<Markup> it2 = list.iterator();
        while (it2.hasNext()) {
            dest.writeParcelable(it2.next(), flags);
        }
    }

    public String toString() {
        int i = this.startOffset;
        int i2 = this.endOffset;
        String str = this.paragraphName;
        String str2 = this.paragraphText;
        List<Markup> list = this.paragraphMarkups;
        StringBuilder sbB = ev6.B(i, i2, "Highlight(startOffset=", ", endOffset=", ", paragraphName=");
        ka1.C(sbB, str, ", paragraphText=", str2, ezwlgQm.Xyy);
        return b09.B(sbB, list, ")");
    }
}
