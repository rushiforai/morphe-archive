package defpackage;

import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R \u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\t0\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\n\u0010\u000b\u001a\u0004\b\f\u0010\rR\u001a\u0010\u0014\u001a\u00020\u000f8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lwa;", "", "", "a", "Ljava/lang/String;", "getPostId", "()Ljava/lang/String;", "postId", "", "La73;", "b", "Ljava/util/List;", "getDeltas", "()Ljava/util/List;", "deltas", "", "c", "I", "getBaseRevision", "()I", "baseRevision", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class wa {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("postId")
    private final String postId;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("deltas")
    private final List<a73> deltas;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("baseRev")
    private final int baseRevision;

    public wa(List list, int i, String str) {
        str.getClass();
        this.postId = str;
        this.deltas = list;
        this.baseRevision = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wa)) {
            return false;
        }
        wa waVar = (wa) obj;
        return g76.L(this.postId, waVar.postId) && g76.L(this.deltas, waVar.deltas) && this.baseRevision == waVar.baseRevision;
    }

    public final int hashCode() {
        return wgd.p(this.postId.hashCode() * 31, 31, this.deltas) + this.baseRevision;
    }

    public final String toString() {
        String str = this.postId;
        List<a73> list = this.deltas;
        return ho2.H(b09.E("AddPostDeltasRequest(postId=", str, ", deltas=", ", baseRevision=", list), this.baseRevision, ")");
    }
}
