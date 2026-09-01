package defpackage;

import gen.model.ApiReferences;
import gen.model.Paging;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0086\b\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002R\u001a\u0010\u0006\u001a\u00028\u00008\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0003\u0010\u0005R\u001c\u0010\f\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\b\u0010\t\u001a\u0004\b\n\u0010\u000bR\u001c\u0010\u0012\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000e\u0010\u000f\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0013"}, d2 = {"Lo69;", "T", "", "a", "Ljava/lang/Object;", "()Ljava/lang/Object;", "value", "Lgen/model/ApiReferences;", "b", "Lgen/model/ApiReferences;", "getApiReferences", "()Lgen/model/ApiReferences;", "apiReferences", "Lgen/model/Paging;", "c", "Lgen/model/Paging;", "getPaging", "()Lgen/model/Paging;", "paging", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class o69<T> {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("value")
    private final T value;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("references")
    private final ApiReferences apiReferences;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("paging")
    private final Paging paging;

    /* JADX INFO: renamed from: a, reason: from getter */
    public final Object getValue() {
        return this.value;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o69)) {
            return false;
        }
        o69 o69Var = (o69) obj;
        return g76.L(this.value, o69Var.value) && g76.L(this.apiReferences, o69Var.apiReferences) && g76.L(this.paging, o69Var.paging);
    }

    public final int hashCode() {
        T t = this.value;
        int iHashCode = (t == null ? 0 : t.hashCode()) * 31;
        ApiReferences apiReferences = this.apiReferences;
        int iHashCode2 = (iHashCode + (apiReferences == null ? 0 : apiReferences.hashCode())) * 31;
        Paging paging = this.paging;
        return iHashCode2 + (paging != null ? paging.hashCode() : 0);
    }

    public final String toString() {
        return "Payload(value=" + this.value + ", apiReferences=" + this.apiReferences + ", paging=" + this.paging + ")";
    }
}
