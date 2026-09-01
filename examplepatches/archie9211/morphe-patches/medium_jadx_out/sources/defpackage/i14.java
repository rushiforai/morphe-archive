package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0006\u001a\u00020\u00028\u0016X\u0097\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0003\u0010\u0005¨\u0006\u0007"}, d2 = {"Li14;", "Ll14;", "La14;", "a", "La14;", "()La14;", "code", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class i14 implements l14 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("code")
    private final a14 code;

    @Override // defpackage.l14
    /* JADX INFO: renamed from: a, reason: from getter */
    public final a14 getCode() {
        return this.code;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof i14) && this.code == ((i14) obj).code;
    }

    public final int hashCode() {
        return this.code.hashCode();
    }

    public final String toString() {
        return "Default(code=" + this.code + ")";
    }
}
