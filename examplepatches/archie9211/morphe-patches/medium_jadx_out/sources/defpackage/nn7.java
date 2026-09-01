package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\b\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002R\u001a\u0010\b\u001a\u00020\u00038\u0000X\u0081\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0005\u001a\u0004\b\u0006\u0010\u0007R \u0010\u000e\u001a\b\u0012\u0004\u0012\u00028\u00000\t8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\n\u0010\u000b\u001a\u0004\b\f\u0010\rR\u001c\u0010\u0012\u001a\u0004\u0018\u00010\u000f8\u0000X\u0081\u0004¢\u0006\f\n\u0004\b\f\u0010\u0010\u001a\u0004\b\u0004\u0010\u0011R\u001c\u0010\u0016\u001a\u0004\u0018\u00010\u00138\u0000X\u0081\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u0014\u001a\u0004\b\n\u0010\u0015¨\u0006\u0017"}, d2 = {"Lnn7;", "T", "", "", "a", "Z", "d", "()Z", "success", "Lo69;", "b", "Lo69;", "c", "()Lo69;", "payload", "", "Ljava/lang/String;", "()Ljava/lang/String;", "error", "Ll14;", "Ll14;", "()Ll14;", "errorInfo", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class nn7<T> {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("success")
    private final boolean success;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("payload")
    private final o69<T> payload;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("error")
    private final String error;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    @g0c("errorInfo")
    private final l14 errorInfo;

    /* JADX INFO: renamed from: a, reason: from getter */
    public final String getError() {
        return this.error;
    }

    /* JADX INFO: renamed from: b, reason: from getter */
    public final l14 getErrorInfo() {
        return this.errorInfo;
    }

    /* JADX INFO: renamed from: c, reason: from getter */
    public final o69 getPayload() {
        return this.payload;
    }

    /* JADX INFO: renamed from: d, reason: from getter */
    public final boolean getSuccess() {
        return this.success;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nn7)) {
            return false;
        }
        nn7 nn7Var = (nn7) obj;
        return this.success == nn7Var.success && g76.L(this.payload, nn7Var.payload) && g76.L(this.error, nn7Var.error) && g76.L(this.errorInfo, nn7Var.errorInfo);
    }

    public final int hashCode() {
        int iHashCode = (this.payload.hashCode() + ((this.success ? 1231 : 1237) * 31)) * 31;
        String str = this.error;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        l14 l14Var = this.errorInfo;
        return iHashCode2 + (l14Var != null ? l14Var.hashCode() : 0);
    }

    public final String toString() {
        return "Medium2ApiResponseWithPayload(success=" + this.success + ", payload=" + this.payload + ", error=" + this.error + ", errorInfo=" + this.errorInfo + ")";
    }
}
