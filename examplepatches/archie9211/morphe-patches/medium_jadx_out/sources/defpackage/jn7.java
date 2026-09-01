package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\b\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002R\u001a\u0010\b\u001a\u00020\u00038\u0000X\u0081\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0005\u001a\u0004\b\u0006\u0010\u0007R\u001a\u0010\r\u001a\u00028\u00008\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u000b\u0010\fR\u001c\u0010\u0011\u001a\u0004\u0018\u00010\u000e8\u0000X\u0081\u0004¢\u0006\f\n\u0004\b\u000b\u0010\u000f\u001a\u0004\b\u0004\u0010\u0010R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u00128\u0000X\u0081\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u0013\u001a\u0004\b\t\u0010\u0014¨\u0006\u0016"}, d2 = {"Ljn7;", "T", "", "", "a", "Z", "d", "()Z", "success", "b", "Ljava/lang/Object;", "c", "()Ljava/lang/Object;", "payload", "", "Ljava/lang/String;", "()Ljava/lang/String;", "error", "Ll14;", "Ll14;", "()Ll14;", "errorInfo", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class jn7<T> {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("success")
    private final boolean success;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("payload")
    private final T payload;

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
    public final Object getPayload() {
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
        if (!(obj instanceof jn7)) {
            return false;
        }
        jn7 jn7Var = (jn7) obj;
        return this.success == jn7Var.success && g76.L(this.payload, jn7Var.payload) && g76.L(this.error, jn7Var.error) && g76.L(this.errorInfo, jn7Var.errorInfo);
    }

    public final int hashCode() {
        int i = (this.success ? 1231 : 1237) * 31;
        T t = this.payload;
        int iHashCode = (i + (t == null ? 0 : t.hashCode())) * 31;
        String str = this.error;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        l14 l14Var = this.errorInfo;
        return iHashCode2 + (l14Var != null ? l14Var.hashCode() : 0);
    }

    public final String toString() {
        return "Medium2ApiResponse(success=" + this.success + ", payload=" + this.payload + ", error=" + this.error + ", errorInfo=" + this.errorInfo + ")";
    }
}
