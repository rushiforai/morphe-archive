package defpackage;

import gen.model.User;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001c\u0010\f\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\t\u001a\u0004\b\n\u0010\u000bR(\u0010\u0012\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u0001\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u000f\u0010\u0011¨\u0006\u0013"}, d2 = {"Le18;", "", "Lgen/model/User;", "a", "Lgen/model/User;", "b", "()Lgen/model/User;", "currentUser", "", "Ljava/lang/Boolean;", "d", "()Ljava/lang/Boolean;", "isCurrentUserVerified", "", "", "c", "Ljava/util/Map;", "()Ljava/util/Map;", "variants", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class e18 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("currentUser")
    private final User currentUser;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("isCurrentUserVerified")
    private final Boolean isCurrentUserVerified;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("variants")
    private final Map<String, Object> variants;

    public e18(User user, Boolean bool, Map map) {
        this.currentUser = user;
        this.isCurrentUserVerified = bool;
        this.variants = map;
    }

    public static e18 a(e18 e18Var, User user) {
        return new e18(user, e18Var.isCurrentUserVerified, e18Var.variants);
    }

    /* JADX INFO: renamed from: b, reason: from getter */
    public final User getCurrentUser() {
        return this.currentUser;
    }

    /* JADX INFO: renamed from: c, reason: from getter */
    public final Map getVariants() {
        return this.variants;
    }

    /* JADX INFO: renamed from: d, reason: from getter */
    public final Boolean getIsCurrentUserVerified() {
        return this.isCurrentUserVerified;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e18)) {
            return false;
        }
        e18 e18Var = (e18) obj;
        return g76.L(this.currentUser, e18Var.currentUser) && g76.L(this.isCurrentUserVerified, e18Var.isCurrentUserVerified) && g76.L(this.variants, e18Var.variants);
    }

    public final int hashCode() {
        User user = this.currentUser;
        int iHashCode = (user == null ? 0 : user.hashCode()) * 31;
        Boolean bool = this.isCurrentUserVerified;
        int iHashCode2 = (iHashCode + (bool == null ? 0 : bool.hashCode())) * 31;
        Map<String, Object> map = this.variants;
        return iHashCode2 + (map != null ? map.hashCode() : 0);
    }

    public final String toString() {
        return "MobileClientConfig(currentUser=" + this.currentUser + ", isCurrentUserVerified=" + this.isCurrentUserVerified + ", variants=" + this.variants + ")";
    }

    public e18() {
        this(null, null, null);
    }
}
