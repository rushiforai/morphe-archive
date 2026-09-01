package com.medium.android.core.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import defpackage.ev6;
import defpackage.g04;
import defpackage.g76;
import defpackage.gy2;
import defpackage.rv8;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0005\u0010\u0011\u0012\u0013\u0014B#\b\u0004\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tR\u0016\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f\u0082\u0001\u0003\u0015\u0016\u0017¨\u0006\u0018"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference;", "Landroid/os/Parcelable;", "spotlightResponseId", "", "viewType", "Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;", "writeState", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "<init>", "(Ljava/lang/String;Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;Lcom/medium/android/core/navigation/ResponsesReference$WriteState;)V", "getSpotlightResponseId", "()Ljava/lang/String;", "getViewType", "()Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;", "getWriteState", "()Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "Catalog", "Post", "HighlightResponses", "ResponseViewType", "WriteState", "Lcom/medium/android/core/navigation/ResponsesReference$Catalog;", "Lcom/medium/android/core/navigation/ResponsesReference$HighlightResponses;", "Lcom/medium/android/core/navigation/ResponsesReference$Post;", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public abstract class ResponsesReference implements Parcelable {
    public static final int $stable = 0;
    private final String spotlightResponseId;
    private final ResponseViewType viewType;
    private final WriteState writeState;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;", "", "<init>", "(Ljava/lang/String;I)V", "Standard", "Replies", "HighlightResponses", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ResponseViewType {
        private static final /* synthetic */ g04 $ENTRIES;
        private static final /* synthetic */ ResponseViewType[] $VALUES;
        public static final ResponseViewType Standard = new ResponseViewType("Standard", 0);
        public static final ResponseViewType Replies = new ResponseViewType("Replies", 1);
        public static final ResponseViewType HighlightResponses = new ResponseViewType("HighlightResponses", 2);

        private static final /* synthetic */ ResponseViewType[] $values() {
            return new ResponseViewType[]{Standard, Replies, HighlightResponses};
        }

        static {
            ResponseViewType[] responseViewTypeArr$values = $values();
            $VALUES = responseViewTypeArr$values;
            $ENTRIES = rv8.x(responseViewTypeArr$values);
        }

        private ResponseViewType(String str, int i) {
        }

        public static g04 getEntries() {
            return $ENTRIES;
        }

        public static ResponseViewType valueOf(String str) {
            return (ResponseViewType) Enum.valueOf(ResponseViewType.class, str);
        }

        public static ResponseViewType[] values() {
            return (ResponseViewType[]) $VALUES.clone();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0004\u0006\u0007\b\t¨\u0006\nÀ\u0006\u0003"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "Landroid/os/Parcelable;", "None", "Reply", "Edit", "Answer", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState$Answer;", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState$Edit;", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState$None;", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState$Reply;", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public interface WriteState extends Parcelable {

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0005\u0010\u0006J\u001d\u0010\u000b\u001a\u00020\n2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0004¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0006J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015¨\u0006\u0016"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$WriteState$Answer;", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "<init>", "()V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "", "toString", "()Ljava/lang/String;", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class Answer implements WriteState {
            public static final int $stable = 0;
            public static final Answer INSTANCE = new Answer();
            public static final Parcelable.Creator<Answer> CREATOR = new o();

            private Answer() {
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                return this == other || (other instanceof Answer);
            }

            public int hashCode() {
                return -925327077;
            }

            public String toString() {
                return "Answer";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeInt(1);
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        /* JADX INFO: loaded from: classes2.dex */
        @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$WriteState$Edit;", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "", "responseId", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/core/navigation/ResponsesReference$WriteState$Edit;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getResponseId", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class Edit implements WriteState {
            public static final int $stable = 0;
            public static final Parcelable.Creator<Edit> CREATOR = new p();
            private final String responseId;

            public Edit(String str) {
                str.getClass();
                this.responseId = str;
            }

            public static /* synthetic */ Edit copy$default(Edit edit, String str, int i, Object obj) {
                if ((i & 1) != 0) {
                    str = edit.responseId;
                }
                return edit.copy(str);
            }

            /* JADX INFO: renamed from: component1, reason: from getter */
            public final String getResponseId() {
                return this.responseId;
            }

            public final Edit copy(String responseId) {
                responseId.getClass();
                return new Edit(responseId);
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Edit) && g76.L(this.responseId, ((Edit) other).responseId);
            }

            public final String getResponseId() {
                return this.responseId;
            }

            public int hashCode() {
                return this.responseId.hashCode();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeString(this.responseId);
            }

            public String toString() {
                return ev6.x(MaAxRJinch.nCHEM, this.responseId, ")");
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0005\u0010\u0006J\u001d\u0010\u000b\u001a\u00020\n2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0004¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0006J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015¨\u0006\u0016"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$WriteState$None;", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "<init>", "()V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "", "toString", "()Ljava/lang/String;", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class None implements WriteState {
            public static final int $stable = 0;
            public static final None INSTANCE = new None();
            public static final Parcelable.Creator<None> CREATOR = new q();

            private None() {
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                return this == other || (other instanceof None);
            }

            public int hashCode() {
                return 1496630229;
            }

            public String toString() {
                return "None";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeInt(1);
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$WriteState$Reply;", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "", "responseId", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/core/navigation/ResponsesReference$WriteState$Reply;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getResponseId", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class Reply implements WriteState {
            public static final int $stable = 0;
            public static final Parcelable.Creator<Reply> CREATOR = new r();
            private final String responseId;

            public Reply(String str) {
                str.getClass();
                this.responseId = str;
            }

            public static /* synthetic */ Reply copy$default(Reply reply, String str, int i, Object obj) {
                if ((i & 1) != 0) {
                    str = reply.responseId;
                }
                return reply.copy(str);
            }

            /* JADX INFO: renamed from: component1, reason: from getter */
            public final String getResponseId() {
                return this.responseId;
            }

            public final Reply copy(String responseId) {
                responseId.getClass();
                return new Reply(responseId);
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Reply) && g76.L(this.responseId, ((Reply) other).responseId);
            }

            public final String getResponseId() {
                return this.responseId;
            }

            public int hashCode() {
                return this.responseId.hashCode();
            }

            public String toString() {
                return ev6.x("Reply(responseId=", this.responseId, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeString(this.responseId);
            }
        }
    }

    private ResponsesReference(String str, ResponseViewType responseViewType, WriteState writeState) {
        this.spotlightResponseId = str;
        this.viewType = responseViewType;
        this.writeState = writeState;
    }

    public String getSpotlightResponseId() {
        return this.spotlightResponseId;
    }

    public ResponseViewType getViewType() {
        return this.viewType;
    }

    public WriteState getWriteState() {
        return this.writeState;
    }

    public /* synthetic */ ResponsesReference(String str, ResponseViewType responseViewType, WriteState writeState, gy2 gy2Var) {
        this(str, responseViewType, writeState);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0087\b\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\r\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u001d\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\u0007¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0012\u0010\u0012\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0011J&\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0011J\u0010\u0010\u0016\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u0016\u0010\tJ\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001c\u001a\u0004\b\u001d\u0010\u0011R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u001c\u001a\u0004\b\u001e\u0010\u0011¨\u0006\u001f"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$Catalog;", "Lcom/medium/android/core/navigation/ResponsesReference;", "", "catalogId", "spotlightResponseId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "copy", "(Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/core/navigation/ResponsesReference$Catalog;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "getSpotlightResponseId", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Catalog extends ResponsesReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<Catalog> CREATOR = new l();
        private final String catalogId;
        private final String spotlightResponseId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Catalog(String str, String str2) {
            super(str2, ResponseViewType.Standard, WriteState.None.INSTANCE, null);
            str.getClass();
            this.catalogId = str;
            this.spotlightResponseId = str2;
        }

        public static /* synthetic */ Catalog copy$default(Catalog catalog, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalog.catalogId;
            }
            if ((i & 2) != 0) {
                str2 = catalog.spotlightResponseId;
            }
            return catalog.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getCatalogId() {
            return this.catalogId;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getSpotlightResponseId() {
            return this.spotlightResponseId;
        }

        public final Catalog copy(String catalogId, String spotlightResponseId) {
            catalogId.getClass();
            return new Catalog(catalogId, spotlightResponseId);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Catalog)) {
                return false;
            }
            Catalog catalog = (Catalog) other;
            return g76.L(this.catalogId, catalog.catalogId) && g76.L(this.spotlightResponseId, catalog.spotlightResponseId);
        }

        public final String getCatalogId() {
            return this.catalogId;
        }

        @Override // com.medium.android.core.navigation.ResponsesReference
        public String getSpotlightResponseId() {
            return this.spotlightResponseId;
        }

        public int hashCode() {
            int iHashCode = this.catalogId.hashCode() * 31;
            String str = this.spotlightResponseId;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public String toString() {
            return ev6.y("Catalog(catalogId=", this.catalogId, ", spotlightResponseId=", this.spotlightResponseId, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.catalogId);
            dest.writeString(this.spotlightResponseId);
        }

        public /* synthetic */ Catalog(String str, String str2, int i, gy2 gy2Var) {
            this(str, (i & 2) != 0 ? null : str2);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\r\u0010\n\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\t¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0013J\u0010\u0010\u0015\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0016J.\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u0013J\u0010\u0010\u001a\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b\u001a\u0010\u000bJ\u001a\u0010\u001e\u001a\u00020\u001d2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001bHÖ\u0003¢\u0006\u0004\b\u001e\u0010\u001fR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010 \u001a\u0004\b!\u0010\u0013R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010 \u001a\u0004\b\"\u0010\u0013R\u001a\u0010\u0006\u001a\u00020\u00058\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0006\u0010#\u001a\u0004\b$\u0010\u0016¨\u0006%"}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$HighlightResponses;", "Lcom/medium/android/core/navigation/ResponsesReference;", "", "postId", "groupId", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "writeState", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/core/navigation/ResponsesReference$WriteState;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/core/navigation/ResponsesReference$WriteState;)Lcom/medium/android/core/navigation/ResponsesReference$HighlightResponses;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getGroupId", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "getWriteState", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class HighlightResponses extends ResponsesReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<HighlightResponses> CREATOR = new m();
        private final String groupId;
        private final String postId;
        private final WriteState writeState;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public HighlightResponses(String str, String str2, WriteState writeState) {
            super(null, ResponseViewType.HighlightResponses, writeState, 0 == true ? 1 : 0);
            str.getClass();
            str2.getClass();
            writeState.getClass();
            this.postId = str;
            this.groupId = str2;
            this.writeState = writeState;
        }

        public static /* synthetic */ HighlightResponses copy$default(HighlightResponses highlightResponses, String str, String str2, WriteState writeState, int i, Object obj) {
            if ((i & 1) != 0) {
                str = highlightResponses.postId;
            }
            if ((i & 2) != 0) {
                str2 = highlightResponses.groupId;
            }
            if ((i & 4) != 0) {
                writeState = highlightResponses.writeState;
            }
            return highlightResponses.copy(str, str2, writeState);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getPostId() {
            return this.postId;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getGroupId() {
            return this.groupId;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final WriteState getWriteState() {
            return this.writeState;
        }

        public final HighlightResponses copy(String postId, String groupId, WriteState writeState) {
            postId.getClass();
            groupId.getClass();
            writeState.getClass();
            return new HighlightResponses(postId, groupId, writeState);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof HighlightResponses)) {
                return false;
            }
            HighlightResponses highlightResponses = (HighlightResponses) other;
            return g76.L(this.postId, highlightResponses.postId) && g76.L(this.groupId, highlightResponses.groupId) && g76.L(this.writeState, highlightResponses.writeState);
        }

        public final String getGroupId() {
            return this.groupId;
        }

        public final String getPostId() {
            return this.postId;
        }

        @Override // com.medium.android.core.navigation.ResponsesReference
        public WriteState getWriteState() {
            return this.writeState;
        }

        public int hashCode() {
            return this.writeState.hashCode() + wgd.o(this.postId.hashCode() * 31, 31, this.groupId);
        }

        public String toString() {
            String str = this.postId;
            String str2 = this.groupId;
            WriteState writeState = this.writeState;
            StringBuilder sbU = y30.u("HighlightResponses(postId=", str, ", groupId=", str2, ", writeState=");
            sbU.append(writeState);
            sbU.append(")");
            return sbU.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.postId);
            dest.writeString(this.groupId);
            dest.writeParcelable(this.writeState, flags);
        }

        public /* synthetic */ HighlightResponses(String str, String str2, WriteState writeState, int i, gy2 gy2Var) {
            this(str, str2, (i & 4) != 0 ? WriteState.None.INSTANCE : writeState);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0087\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\r\u0010\r\u001a\u00020\f¢\u0006\u0004\b\r\u0010\u000eJ\u001d\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\f¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0016J\u0012\u0010\u0017\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0016J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0016J\u0010\u0010\u0019\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJF\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\bHÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001f\u0010\u0016J\u0010\u0010 \u001a\u00020\fHÖ\u0001¢\u0006\u0004\b \u0010\u000eJ\u001a\u0010$\u001a\u00020#2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b$\u0010%R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010&\u001a\u0004\b'\u0010\u0016R\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010&\u001a\u0004\b(\u0010\u0016R\u001c\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0005\u0010&\u001a\u0004\b)\u0010\u0016R\u001a\u0010\u0007\u001a\u00020\u00068\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0007\u0010*\u001a\u0004\b+\u0010\u001aR\u001a\u0010\t\u001a\u00020\b8\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\t\u0010,\u001a\u0004\b-\u0010\u001c¨\u0006."}, d2 = {"Lcom/medium/android/core/navigation/ResponsesReference$Post;", "Lcom/medium/android/core/navigation/ResponsesReference;", "", "postId", "highlightId", "spotlightResponseId", "Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;", "viewType", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "writeState", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;Lcom/medium/android/core/navigation/ResponsesReference$WriteState;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;", "component5", "()Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;Lcom/medium/android/core/navigation/ResponsesReference$WriteState;)Lcom/medium/android/core/navigation/ResponsesReference$Post;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getHighlightId", "getSpotlightResponseId", "Lcom/medium/android/core/navigation/ResponsesReference$ResponseViewType;", "getViewType", "Lcom/medium/android/core/navigation/ResponsesReference$WriteState;", "getWriteState", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post extends ResponsesReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<Post> CREATOR = new n();
        private final String highlightId;
        private final String postId;
        private final String spotlightResponseId;
        private final ResponseViewType viewType;
        private final WriteState writeState;

        public /* synthetic */ Post(String str, String str2, String str3, ResponseViewType responseViewType, WriteState writeState, int i, gy2 gy2Var) {
            this(str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? ResponseViewType.Standard : responseViewType, (i & 16) != 0 ? WriteState.None.INSTANCE : writeState);
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, String str3, ResponseViewType responseViewType, WriteState writeState, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.postId;
            }
            if ((i & 2) != 0) {
                str2 = post.highlightId;
            }
            if ((i & 4) != 0) {
                str3 = post.spotlightResponseId;
            }
            if ((i & 8) != 0) {
                responseViewType = post.viewType;
            }
            if ((i & 16) != 0) {
                writeState = post.writeState;
            }
            WriteState writeState2 = writeState;
            String str4 = str3;
            return post.copy(str, str2, str4, responseViewType, writeState2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getPostId() {
            return this.postId;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getHighlightId() {
            return this.highlightId;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getSpotlightResponseId() {
            return this.spotlightResponseId;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final ResponseViewType getViewType() {
            return this.viewType;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final WriteState getWriteState() {
            return this.writeState;
        }

        public final Post copy(String postId, String highlightId, String spotlightResponseId, ResponseViewType viewType, WriteState writeState) {
            postId.getClass();
            viewType.getClass();
            writeState.getClass();
            return new Post(postId, highlightId, spotlightResponseId, viewType, writeState);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.postId, post.postId) && g76.L(this.highlightId, post.highlightId) && g76.L(this.spotlightResponseId, post.spotlightResponseId) && this.viewType == post.viewType && g76.L(this.writeState, post.writeState);
        }

        public final String getHighlightId() {
            return this.highlightId;
        }

        public final String getPostId() {
            return this.postId;
        }

        @Override // com.medium.android.core.navigation.ResponsesReference
        public String getSpotlightResponseId() {
            return this.spotlightResponseId;
        }

        @Override // com.medium.android.core.navigation.ResponsesReference
        public ResponseViewType getViewType() {
            return this.viewType;
        }

        @Override // com.medium.android.core.navigation.ResponsesReference
        public WriteState getWriteState() {
            return this.writeState;
        }

        public int hashCode() {
            int iHashCode = this.postId.hashCode() * 31;
            String str = this.highlightId;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.spotlightResponseId;
            int iHashCode3 = str2 != null ? str2.hashCode() : 0;
            return this.writeState.hashCode() + ((this.viewType.hashCode() + ((iHashCode2 + iHashCode3) * 31)) * 31);
        }

        public String toString() {
            String str = this.postId;
            String str2 = this.highlightId;
            String str3 = this.spotlightResponseId;
            ResponseViewType responseViewType = this.viewType;
            WriteState writeState = this.writeState;
            StringBuilder sbU = y30.u("Post(postId=", str, ", highlightId=", str2, ", spotlightResponseId=");
            sbU.append(str3);
            sbU.append(", viewType=");
            sbU.append(responseViewType);
            sbU.append(", writeState=");
            sbU.append(writeState);
            sbU.append(")");
            return sbU.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.postId);
            dest.writeString(this.highlightId);
            dest.writeString(this.spotlightResponseId);
            dest.writeString(this.viewType.name());
            dest.writeParcelable(this.writeState, flags);
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Post(String str, String str2, String str3, ResponseViewType responseViewType, WriteState writeState) {
            super(str3, responseViewType, writeState, null);
            str.getClass();
            responseViewType.getClass();
            writeState.getClass();
            this.postId = str;
            this.highlightId = str2;
            this.spotlightResponseId = str3;
            this.viewType = responseViewType;
            this.writeState = writeState;
        }
    }
}
