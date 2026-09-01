package defpackage;

import com.medium.android.graphql.fragment.FullPostData;
import com.medium.android.graphql.fragment.PostMetaData;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vv9 extends p92 {
    public ArrayList b;
    public FullPostData c;
    public PostMetaData d;
    public ni3 e;
    public ArrayList f;
    public boolean g;
    public /* synthetic */ Object h;
    public final /* synthetic */ sw9 i;
    public int j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vv9(sw9 sw9Var, p92 p92Var) {
        super(p92Var);
        this.i = sw9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.h = obj;
        this.j |= Integer.MIN_VALUE;
        return this.i.i(null, null, false, false, this);
    }
}
