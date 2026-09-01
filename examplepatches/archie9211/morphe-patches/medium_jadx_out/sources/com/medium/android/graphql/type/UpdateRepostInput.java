package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u0018\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ,\u0010\f\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000bJ\u0010\u0010\u0010\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0016\u001a\u0004\b\u0017\u0010\tR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0018\u001a\u0004\b\u0019\u0010\u000b¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/type/UpdateRepostInput;", "", "Lzv8;", "", "note", "targetPostId", "<init>", "(Lzv8;Ljava/lang/String;)V", "component1", "()Lzv8;", "component2", "()Ljava/lang/String;", "copy", "(Lzv8;Ljava/lang/String;)Lcom/medium/android/graphql/type/UpdateRepostInput;", "toString", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getNote", "Ljava/lang/String;", "getTargetPostId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateRepostInput {
    private final zv8 note;
    private final String targetPostId;

    public UpdateRepostInput(zv8 zv8Var, String str) {
        zv8Var.getClass();
        str.getClass();
        this.note = zv8Var;
        this.targetPostId = str;
    }

    public static /* synthetic */ UpdateRepostInput copy$default(UpdateRepostInput updateRepostInput, zv8 zv8Var, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = updateRepostInput.note;
        }
        if ((i & 2) != 0) {
            str = updateRepostInput.targetPostId;
        }
        return updateRepostInput.copy(zv8Var, str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getNote() {
        return this.note;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final UpdateRepostInput copy(zv8 note, String targetPostId) {
        note.getClass();
        targetPostId.getClass();
        return new UpdateRepostInput(note, targetPostId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpdateRepostInput)) {
            return false;
        }
        UpdateRepostInput updateRepostInput = (UpdateRepostInput) other;
        return g76.L(this.note, updateRepostInput.note) && g76.L(this.targetPostId, updateRepostInput.targetPostId);
    }

    public final zv8 getNote() {
        return this.note;
    }

    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final int hashCode() {
        return this.targetPostId.hashCode() + (this.note.hashCode() * 31);
    }

    public final String toString() {
        return "UpdateRepostInput(note=" + this.note + ", targetPostId=" + this.targetPostId + ")";
    }

    public /* synthetic */ UpdateRepostInput(zv8 zv8Var, String str, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var, str);
    }
}
