package defpackage;

import com.medium.android.graphql.FullPostQuery;
import com.medium.android.graphql.fragment.FullPostData;
import com.medium.android.graphql.fragment.PostRepostCountData;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gm9 extends p4d implements b55 {
    public /* synthetic */ Object b;
    public final /* synthetic */ gn9 c;
    public final /* synthetic */ String d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gm9(gn9 gn9Var, String str, n92 n92Var) {
        super(2, n92Var);
        this.c = gn9Var;
        this.d = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        gm9 gm9Var = new gm9(this.c, this.d, n92Var);
        gm9Var.b = ((bjb) obj).a;
        return gm9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        Object obj3 = ((bjb) obj).a;
        gm9 gm9Var = new gm9(this.c, this.d, (n92) obj2);
        gm9Var.b = obj3;
        c1e c1eVar = c1e.a;
        gm9Var.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        FullPostQuery.Post post;
        FullPostData fullPostData;
        PostRepostCountData postRepostCountData;
        Object value;
        Map mapSingletonMap;
        Object obj2 = this.b;
        br7.v(obj);
        if (obj2 instanceof ajb) {
            obj2 = null;
        }
        ld9 ld9Var = (ld9) obj2;
        if (ld9Var != null && (post = ld9Var.a.getPost()) != null && (fullPostData = post.getFullPostData()) != null && (postRepostCountData = fullPostData.getPostRepostCountData()) != null) {
            int repostCount = postRepostCountData.getRepostCount();
            xpc xpcVar = this.c.g;
            do {
                value = xpcVar.getValue();
                Map map = (Map) value;
                Integer num = new Integer(repostCount);
                map.getClass();
                boolean zIsEmpty = map.isEmpty();
                String str = this.d;
                if (zIsEmpty) {
                    mapSingletonMap = Collections.singletonMap(str, num);
                    mapSingletonMap.getClass();
                } else {
                    LinkedHashMap linkedHashMap = new LinkedHashMap(map);
                    linkedHashMap.put(str, num);
                    mapSingletonMap = linkedHashMap;
                }
            } while (!xpcVar.k(value, mapSingletonMap));
        }
        return c1e.a;
    }
}
