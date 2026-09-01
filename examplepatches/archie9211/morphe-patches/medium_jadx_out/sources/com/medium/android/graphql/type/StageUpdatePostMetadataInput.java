package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u000f\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001BE\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002¢\u0006\u0004\b\b\u0010\tJ\u0018\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ\u0018\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\u000bJ\u0010\u0010\r\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0018\u0010\u000f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u000bJP\u0010\u0010\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u000eJ\u0010\u0010\u0014\u001a\u00020\u0013HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001a\u001a\u0004\b\u001b\u0010\u000bR\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001a\u001a\u0004\b\u001c\u0010\u000bR\u0017\u0010\u0006\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001d\u001a\u0004\b\u001e\u0010\u000eR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001a\u001a\u0004\b\u001f\u0010\u000b¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/type/StageUpdatePostMetadataInput;", "", "Lzv8;", "", "featuredImageId", "subtitle", "targetPostId", "title", "<init>", "(Lzv8;Lzv8;Ljava/lang/String;Lzv8;)V", "component1", "()Lzv8;", "component2", "component3", "()Ljava/lang/String;", "component4", "copy", "(Lzv8;Lzv8;Ljava/lang/String;Lzv8;)Lcom/medium/android/graphql/type/StageUpdatePostMetadataInput;", "toString", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getFeaturedImageId", "getSubtitle", "Ljava/lang/String;", "getTargetPostId", "getTitle", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class StageUpdatePostMetadataInput {
    private final zv8 featuredImageId;
    private final zv8 subtitle;
    private final String targetPostId;
    private final zv8 title;

    public StageUpdatePostMetadataInput(zv8 zv8Var, zv8 zv8Var2, String str, zv8 zv8Var3) {
        zv8Var.getClass();
        zv8Var2.getClass();
        str.getClass();
        zv8Var3.getClass();
        this.featuredImageId = zv8Var;
        this.subtitle = zv8Var2;
        this.targetPostId = str;
        this.title = zv8Var3;
    }

    public static /* synthetic */ StageUpdatePostMetadataInput copy$default(StageUpdatePostMetadataInput stageUpdatePostMetadataInput, zv8 zv8Var, zv8 zv8Var2, String str, zv8 zv8Var3, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = stageUpdatePostMetadataInput.featuredImageId;
        }
        if ((i & 2) != 0) {
            zv8Var2 = stageUpdatePostMetadataInput.subtitle;
        }
        if ((i & 4) != 0) {
            str = stageUpdatePostMetadataInput.targetPostId;
        }
        if ((i & 8) != 0) {
            zv8Var3 = stageUpdatePostMetadataInput.title;
        }
        return stageUpdatePostMetadataInput.copy(zv8Var, zv8Var2, str, zv8Var3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getFeaturedImageId() {
        return this.featuredImageId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getSubtitle() {
        return this.subtitle;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getTargetPostId() {
        return this.targetPostId;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getTitle() {
        return this.title;
    }

    public final StageUpdatePostMetadataInput copy(zv8 featuredImageId, zv8 subtitle, String targetPostId, zv8 title) {
        featuredImageId.getClass();
        subtitle.getClass();
        targetPostId.getClass();
        title.getClass();
        return new StageUpdatePostMetadataInput(featuredImageId, subtitle, targetPostId, title);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof StageUpdatePostMetadataInput)) {
            return false;
        }
        StageUpdatePostMetadataInput stageUpdatePostMetadataInput = (StageUpdatePostMetadataInput) other;
        return g76.L(this.featuredImageId, stageUpdatePostMetadataInput.featuredImageId) && g76.L(this.subtitle, stageUpdatePostMetadataInput.subtitle) && g76.L(this.targetPostId, stageUpdatePostMetadataInput.targetPostId) && g76.L(this.title, stageUpdatePostMetadataInput.title);
    }

    public final zv8 getFeaturedImageId() {
        return this.featuredImageId;
    }

    public final zv8 getSubtitle() {
        return this.subtitle;
    }

    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final zv8 getTitle() {
        return this.title;
    }

    public final int hashCode() {
        return this.title.hashCode() + wgd.o(lv8.h(this.subtitle, this.featuredImageId.hashCode() * 31, 31), 31, this.targetPostId);
    }

    public final String toString() {
        zv8 zv8Var = this.featuredImageId;
        zv8 zv8Var2 = this.subtitle;
        String str = this.targetPostId;
        zv8 zv8Var3 = this.title;
        StringBuilder sbW = ka1.w("StageUpdatePostMetadataInput(featuredImageId=", zv8Var, ", subtitle=", zv8Var2, ", targetPostId=");
        sbW.append(str);
        sbW.append(", title=");
        sbW.append(zv8Var3);
        sbW.append(")");
        return sbW.toString();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ StageUpdatePostMetadataInput(zv8 zv8Var, zv8 zv8Var2, String str, zv8 zv8Var3, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, str, (i & 8) != 0 ? xv8Var : zv8Var3);
    }
}
