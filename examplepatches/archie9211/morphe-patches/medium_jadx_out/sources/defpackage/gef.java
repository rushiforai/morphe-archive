package defpackage;

import com.medium.android.graphql.FollowedEntitiesQuery;
import com.medium.android.graphql.fragment.FollowedPublicationData;
import com.medium.android.graphql.fragment.FollowedWriterData;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gef extends p4d implements d55 {
    public /* synthetic */ FollowedEntitiesQuery.Entity b;
    public /* synthetic */ boolean c;
    public final /* synthetic */ ref d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gef(ref refVar, n92 n92Var) {
        super(4, n92Var);
        this.d = refVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        String id;
        FollowedEntitiesQuery.Entity entity = this.b;
        boolean z = this.c;
        br7.v(obj);
        FollowedEntitiesQuery.OnPublication onPublication = entity.getOnPublication();
        FollowedPublicationData followedPublicationData = onPublication != null ? onPublication.getFollowedPublicationData() : null;
        FollowedEntitiesQuery.OnUser onUser = entity.getOnUser();
        FollowedWriterData followedWriterData = onUser != null ? onUser.getFollowedWriterData() : null;
        ref refVar = this.d;
        if (followedPublicationData != null) {
            LinkedHashMap linkedHashMap = refVar.F;
            String id2 = followedPublicationData.getId();
            if (linkedHashMap.get(id2) == null) {
                linkedHashMap.put(id2, Boolean.valueOf(z));
            }
            String id3 = followedPublicationData.getId();
            String publicationName = followedPublicationData.getPublicationName();
            FollowedPublicationData.Avatar avatar = followedPublicationData.getAvatar();
            return new aw4(id3, publicationName, (avatar == null || (id = avatar.getId()) == null) ? null : id, false, z);
        }
        if (followedWriterData == null) {
            return null;
        }
        LinkedHashMap linkedHashMap2 = refVar.E;
        String id4 = followedWriterData.getId();
        if (linkedHashMap2.get(id4) == null) {
            linkedHashMap2.put(id4, Boolean.valueOf(z));
        }
        String id5 = followedWriterData.getId();
        String writerName = followedWriterData.getWriterName();
        String imageId = followedWriterData.getImageId();
        return new jw4(id5, writerName, imageId != null ? imageId : null, false, z);
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        ((Number) obj).intValue();
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        gef gefVar = new gef(this.d, (n92) obj4);
        gefVar.b = (FollowedEntitiesQuery.Entity) obj2;
        gefVar.c = zBooleanValue;
        return gefVar.invokeSuspend(c1e.a);
    }
}
