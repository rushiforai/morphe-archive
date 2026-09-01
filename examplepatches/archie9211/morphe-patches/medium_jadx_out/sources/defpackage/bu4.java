package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bu4 implements fu4 {
    public final EntityType a;

    public bu4(EntityType entityType) {
        entityType.getClass();
        this.a = entityType;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof bu4) && this.a == ((bu4) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UnfollowFailure(entityType=" + this.a + ")";
    }
}
