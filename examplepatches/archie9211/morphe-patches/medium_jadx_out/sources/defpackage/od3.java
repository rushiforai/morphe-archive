package defpackage;

import com.medium.android.graphql.fragment.DigestSectionData;
import com.medium.android.graphql.fragment.PostPreviewData;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class od3 {
    public static final ArrayList a(List list, b55 b55Var) {
        PostPreviewData postPreviewData;
        list.getClass();
        ArrayList arrayList = new ArrayList();
        int i = 0;
        for (Object obj : list) {
            int i2 = i + 1;
            Object objInvoke = null;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            DigestSectionData.Post post = ((DigestSectionData.Entry) obj).getPost();
            if (post != null && (postPreviewData = post.getPostPreviewData()) != null) {
                objInvoke = b55Var.invoke(Integer.valueOf(i), postPreviewData);
            }
            if (objInvoke != null) {
                arrayList.add(objInvoke);
            }
            i = i2;
        }
        return arrayList;
    }
}
