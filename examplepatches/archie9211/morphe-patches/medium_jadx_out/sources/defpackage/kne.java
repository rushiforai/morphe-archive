package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.MembershipFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kne {
    public final mya a;
    public final a1a b;
    public final mya c;

    public kne(mya myaVar, a1a a1aVar, mya myaVar2) {
        this.a = myaVar;
        this.b = a1aVar;
        this.c = myaVar2;
    }

    public final hne a(CreatorPreviewData creatorPreviewData, ine ineVar, SourceParameter sourceParameter) {
        gne fneVar;
        zw7 zw7VarB;
        MembershipFragment membershipFragment;
        creatorPreviewData.getClass();
        ineVar.getClass();
        String id = creatorPreviewData.getId();
        int i = jne.a[ineVar.ordinal()];
        int i2 = 0;
        if (i == 1) {
            fneVar = new fne(this.b.x(id, true));
        } else {
            if (i != 2) {
                ygf.a();
                return null;
            }
            fneVar = new ene(m40.J(new sp4(this.a.v(id, true), this.c.u(EntityType.AUTHOR, id, true), new bda(id, creatorPreviewData, sourceParameter, null), i2)));
        }
        gne gneVar = fneVar;
        Long followerCount = null;
        String imageId = creatorPreviewData.getImageId();
        String name = creatorPreviewData.getName();
        if (name == null) {
            ywb.g(ev6.x("User with id ", id, " has no name"));
            return null;
        }
        String bio = creatorPreviewData.getBio();
        CreatorPreviewData.Membership membership = creatorPreviewData.getMembership();
        if (membership == null || (membershipFragment = membership.getMembershipFragment()) == null || (zw7VarB = vn7.B(membershipFragment)) == null) {
            zw7VarB = zw7.NOT_A_MEMBER;
        }
        CreatorPreviewData.Verifications verifications = creatorPreviewData.getVerifications();
        boolean z = verifications != null && verifications.isBookAuthor();
        CreatorPreviewData.SocialStats socialStats = creatorPreviewData.getSocialStats();
        if (socialStats != null) {
            followerCount = socialStats.getFollowerCount();
        }
        return new hne(id, imageId, name, bio, gneVar, zw7VarB, z, followerCount, sourceParameter);
    }
}
