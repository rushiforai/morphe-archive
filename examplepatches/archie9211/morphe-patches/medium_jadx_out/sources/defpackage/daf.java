package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001a\u0010\n\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\b\u0010\u0004\u001a\u0004\b\t\u0010\u0006R\u001c\u0010\f\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000b\u0010\u0004\u001a\u0004\b\u0003\u0010\u0006¨\u0006\r"}, d2 = {"Ldaf;", "", "", "a", "Ljava/lang/String;", "getAccessToken", "()Ljava/lang/String;", "accessToken", "b", "getAccessTokenSecret", "accessTokenSecret", "c", "accountName", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class daf {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("accessToken")
    private final String accessToken;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("accessTokenSecret")
    private final String accessTokenSecret;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("accountName")
    private final String accountName;

    public daf(String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        this.accessToken = str;
        this.accessTokenSecret = str2;
        this.accountName = str3;
    }

    /* JADX INFO: renamed from: a, reason: from getter */
    public final String getAccountName() {
        return this.accountName;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof daf)) {
            return false;
        }
        daf dafVar = (daf) obj;
        return g76.L(this.accessToken, dafVar.accessToken) && g76.L(this.accessTokenSecret, dafVar.accessTokenSecret) && g76.L(this.accountName, dafVar.accountName);
    }

    public final int hashCode() {
        int iO = wgd.o(this.accessToken.hashCode() * 31, 31, this.accessTokenSecret);
        String str = this.accountName;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        String str = this.accessToken;
        String str2 = this.accessTokenSecret;
        return ka1.v(y30.u("XOAuthData(accessToken=", str, ", accessTokenSecret=", str2, ", accountName="), this.accountName, ")");
    }
}
