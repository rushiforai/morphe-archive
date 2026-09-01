package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001c\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\b\u0010\u0004\u001a\u0004\b\u0003\u0010\u0006¨\u0006\n"}, d2 = {"Lz84;", "", "", "a", "Ljava/lang/String;", "getAccessToken", "()Ljava/lang/String;", "accessToken", "b", "accountName", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class z84 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("accessToken")
    private final String accessToken;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("accountName")
    private final String accountName;

    public z84(String str, String str2) {
        str.getClass();
        this.accessToken = str;
        this.accountName = str2;
    }

    /* JADX INFO: renamed from: a, reason: from getter */
    public final String getAccountName() {
        return this.accountName;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z84)) {
            return false;
        }
        z84 z84Var = (z84) obj;
        return g76.L(this.accessToken, z84Var.accessToken) && g76.L(this.accountName, z84Var.accountName);
    }

    public final int hashCode() {
        int iHashCode = this.accessToken.hashCode() * 31;
        String str = this.accountName;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return ev6.y("FacebookOAuthData(accessToken=", this.accessToken, ", accountName=", this.accountName, ")");
    }
}
