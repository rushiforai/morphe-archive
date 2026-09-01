package defpackage;

import gen.model.Post;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\"\u0010\f\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\n\u001a\u0004\b\u0003\u0010\u000b¨\u0006\r"}, d2 = {"Lmq3;", "", "Lgen/model/Post;", "a", "Lgen/model/Post;", "b", "()Lgen/model/Post;", "post", "", "La73;", "Ljava/util/List;", "()Ljava/util/List;", "normalizingDeltas", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class mq3 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("value")
    private final Post post;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("normalizingDeltas")
    private final List<a73> normalizingDeltas;

    /* JADX INFO: renamed from: a, reason: from getter */
    public final List getNormalizingDeltas() {
        return this.normalizingDeltas;
    }

    /* JADX INFO: renamed from: b, reason: from getter */
    public final Post getPost() {
        return this.post;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mq3)) {
            return false;
        }
        mq3 mq3Var = (mq3) obj;
        return g76.L(this.post, mq3Var.post) && g76.L(this.normalizingDeltas, mq3Var.normalizingDeltas);
    }

    public final int hashCode() {
        int iHashCode = this.post.hashCode() * 31;
        List<a73> list = this.normalizingDeltas;
        return iHashCode + (list == null ? 0 : list.hashCode());
    }

    public final String toString() {
        return "EditPostResponse(post=" + this.post + ", normalizingDeltas=" + this.normalizingDeltas + ")";
    }
}
