package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0082\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001a\u0010\n\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\b\u0010\u0004\u001a\u0004\b\t\u0010\u0006R\u001a\u0010\u000f\u001a\u00020\u000b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\f\u0010\r\u001a\u0004\b\b\u0010\u000eR\u001a\u0010\u0010\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u0004\u001a\u0004\b\u0003\u0010\u0006R\u001a\u0010\u0012\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0011\u0010\u0004\u001a\u0004\b\u0011\u0010\u0006R\u001a\u0010\u0017\u001a\u00020\u00138\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0014\u0010\u0016R\u001a\u0010\u0018\u001a\u00020\u00138\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\t\u0010\u0015\u001a\u0004\b\f\u0010\u0016¨\u0006\u0019"}, d2 = {"Lt3;", "", "", "a", "Ljava/lang/String;", "d", "()Ljava/lang/String;", "name", "b", "g", "value", "", "c", "J", "()J", "expiresAt", "domain", "e", "path", "", "f", "Z", "()Z", "secure", "httpOnly", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
final /* data */ class t3 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("name")
    private final String name;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("value")
    private final String value;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("expiresAt")
    private final long expiresAt;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    @g0c("domain")
    private final String domain;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    @g0c("path")
    private final String path;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    @g0c("secure")
    private final boolean secure;

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    @g0c("httpOnly")
    private final boolean httpOnly;

    public t3(String str, String str2, long j, String str3, String str4, boolean z, boolean z2) {
        ho2.Q(str, str2, str3, str4);
        this.name = str;
        this.value = str2;
        this.expiresAt = j;
        this.domain = str3;
        this.path = str4;
        this.secure = z;
        this.httpOnly = z2;
    }

    /* JADX INFO: renamed from: a, reason: from getter */
    public final String getDomain() {
        return this.domain;
    }

    /* JADX INFO: renamed from: b, reason: from getter */
    public final long getExpiresAt() {
        return this.expiresAt;
    }

    /* JADX INFO: renamed from: c, reason: from getter */
    public final boolean getHttpOnly() {
        return this.httpOnly;
    }

    /* JADX INFO: renamed from: d, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: e, reason: from getter */
    public final String getPath() {
        return this.path;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t3)) {
            return false;
        }
        t3 t3Var = (t3) obj;
        return g76.L(this.name, t3Var.name) && g76.L(this.value, t3Var.value) && this.expiresAt == t3Var.expiresAt && g76.L(this.domain, t3Var.domain) && g76.L(this.path, t3Var.path) && this.secure == t3Var.secure && this.httpOnly == t3Var.httpOnly;
    }

    /* JADX INFO: renamed from: f, reason: from getter */
    public final boolean getSecure() {
        return this.secure;
    }

    /* JADX INFO: renamed from: g, reason: from getter */
    public final String getValue() {
        return this.value;
    }

    public final int hashCode() {
        int iO = wgd.o(this.name.hashCode() * 31, 31, this.value);
        long j = this.expiresAt;
        return ((wgd.o(wgd.o((iO + ((int) (j ^ (j >>> 32)))) * 31, 31, this.domain), 31, this.path) + (this.secure ? 1231 : 1237)) * 31) + (this.httpOnly ? 1231 : 1237);
    }

    public final String toString() {
        String str = this.name;
        String str2 = this.value;
        long j = this.expiresAt;
        String str3 = this.domain;
        String str4 = this.path;
        boolean z = this.secure;
        boolean z2 = this.httpOnly;
        StringBuilder sbU = y30.u("SharedPreferencesCookie(name=", str, ", value=", str2, ", expiresAt=");
        sbU.append(j);
        sbU.append(", domain=");
        sbU.append(str3);
        sbU.append(", path=");
        sbU.append(str4);
        sbU.append(", secure=");
        sbU.append(z);
        sbU.append(", httpOnly=");
        sbU.append(z2);
        sbU.append(")");
        return sbU.toString();
    }
}
