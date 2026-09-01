package defpackage;

import com.medium.android.graphql.fragment.PostPreviewData;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class no8 extends p92 {
    public List b;
    public String c;
    public Iterator d;
    public PostPreviewData e;
    public Object f;
    public int g;
    public int h;
    public int i;
    public int j;
    public /* synthetic */ Object k;
    public final /* synthetic */ yo8 l;
    public int m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public no8(yo8 yo8Var, p92 p92Var) {
        super(p92Var);
        this.l = yo8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.k = obj;
        this.m |= Integer.MIN_VALUE;
        return this.l.c(this, null, null);
    }
}
