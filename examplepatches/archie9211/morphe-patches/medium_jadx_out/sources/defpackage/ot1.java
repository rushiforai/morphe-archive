package defpackage;

import com.medium.android.graphql.fragment.CollectionPreviewData;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ot1 {
    public final wjc a;
    public final oxe b;

    public ot1(wjc wjcVar, oxe oxeVar) {
        this.a = wjcVar;
        this.b = oxeVar;
    }

    public final lt1 a(CollectionPreviewData collectionPreviewData, mt1 mt1Var, SourceParameter sourceParameter, boolean z) {
        vv2 jt1Var;
        CollectionPreviewData.Header header;
        CollectionPreviewData.BackgroundImage backgroundImage;
        collectionPreviewData.getClass();
        mt1Var.getClass();
        String id = collectionPreviewData.getId();
        int i = nt1.a[mt1Var.ordinal()];
        if (i == 1) {
            jt1Var = new jt1(this.a.g(id, true));
        } else {
            if (i != 2) {
                ygf.a();
                return null;
            }
            jt1Var = new kt1(this.b.a(id, true));
        }
        vv2 vv2Var = jt1Var;
        CollectionPreviewData.Avatar avatar = collectionPreviewData.getAvatar();
        String id2 = avatar != null ? avatar.getId() : null;
        CollectionPreviewData.CustomStyleSheet customStyleSheet = collectionPreviewData.getCustomStyleSheet();
        String id3 = (customStyleSheet == null || (header = customStyleSheet.getHeader()) == null || (backgroundImage = header.getBackgroundImage()) == null) ? null : backgroundImage.getId();
        String name = collectionPreviewData.getName();
        if (name == null) {
            ywb.g(ev6.x("Collection with id ", id, " has no name"));
            return null;
        }
        return new lt1(id, id2, id3, name, z, collectionPreviewData.getDescription(), vv2Var, collectionPreviewData.getSubscriberCount() != null ? Long.valueOf(r10.intValue()) : null, sourceParameter);
    }
}
