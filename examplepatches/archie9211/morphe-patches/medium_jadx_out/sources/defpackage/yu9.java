package defpackage;

import com.medium.android.domain.post.models.Highlight;
import com.medium.android.graphql.fragment.FullPostData;
import com.medium.android.graphql.fragment.PostClapsData;
import com.medium.android.graphql.fragment.PostFooterCountData;
import com.medium.android.graphql.fragment.PostMetaData;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yu9 implements do4 {
    public final /* synthetic */ rya a;
    public final /* synthetic */ sw9 b;
    public final /* synthetic */ rya c;
    public final /* synthetic */ rya d;
    public final /* synthetic */ nya e;
    public final /* synthetic */ nya f;
    public final /* synthetic */ rya g;
    public final /* synthetic */ PostMetaData h;
    public final /* synthetic */ boolean i;
    public final /* synthetic */ nya j;
    public final /* synthetic */ nya k;
    public final /* synthetic */ rya l;
    public final /* synthetic */ pya m;
    public final /* synthetic */ do4 n;
    public final /* synthetic */ FullPostData o;
    public final /* synthetic */ rya p;
    public final /* synthetic */ boolean q;

    public yu9(rya ryaVar, sw9 sw9Var, rya ryaVar2, rya ryaVar3, nya nyaVar, nya nyaVar2, rya ryaVar4, PostMetaData postMetaData, boolean z, nya nyaVar3, nya nyaVar4, rya ryaVar5, pya pyaVar, do4 do4Var, FullPostData fullPostData, rya ryaVar6, boolean z2) {
        this.a = ryaVar;
        this.b = sw9Var;
        this.c = ryaVar2;
        this.d = ryaVar3;
        this.e = nyaVar;
        this.f = nyaVar2;
        this.g = ryaVar4;
        this.h = postMetaData;
        this.i = z;
        this.j = nyaVar3;
        this.k = nyaVar4;
        this.l = ryaVar5;
        this.m = pyaVar;
        this.n = do4Var;
        this.o = fullPostData;
        this.p = ryaVar6;
        this.q = z2;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int iIntValue;
        es9 es9Var = (es9) obj;
        boolean z = es9Var instanceof wr9;
        sw9 sw9Var = this.b;
        nya nyaVar = this.f;
        nya nyaVar2 = this.e;
        rya ryaVar = this.d;
        rya ryaVar2 = this.c;
        rya ryaVar3 = this.a;
        if (!z) {
            if (!(es9Var instanceof vr9)) {
                if (es9Var instanceof ds9) {
                    mq9 mq9Var = (mq9) ryaVar3.a;
                    PostClapsData postClapsData = ((ds9) es9Var).a;
                    Integer clapCount = postClapsData.getViewerEdge().getClapCount();
                    ryaVar3.a = mq9.a(mq9Var, false, clapCount != null ? clapCount.intValue() : 0, false, null, null, null, null, 524095);
                    PostFooterCountData postFooterCountData = (PostFooterCountData) ryaVar2.a;
                    Integer clapCount2 = postClapsData.getViewerEdge().getClapCount();
                    iIntValue = clapCount2 != null ? clapCount2.intValue() : 0;
                    Long totalClapCount = postClapsData.getTotalClapCount();
                    ryaVar2.a = of9.c(postFooterCountData, iIntValue, totalClapCount != null ? totalClapCount.longValue() : 0L);
                } else if (!(es9Var instanceof cs9)) {
                    if (es9Var instanceof sr9) {
                        Highlight highlightB = el5.b(((sr9) es9Var).a);
                        if (highlightB != null) {
                            Iterable iterable = (Iterable) ryaVar.a;
                            ArrayList<n39> arrayList = new ArrayList();
                            for (Object obj2 : iterable) {
                                if (obj2 instanceof n39) {
                                    arrayList.add(obj2);
                                }
                            }
                            for (n39 n39Var : arrayList) {
                                if (g76.L(n39Var.b.getName(), highlightB.getParagraphName())) {
                                    n39Var.e(highlightB);
                                }
                            }
                        }
                    } else if (es9Var instanceof as9) {
                        Iterable iterable2 = (Iterable) ryaVar.a;
                        ArrayList<n39> arrayList2 = new ArrayList();
                        for (Object obj3 : iterable2) {
                            if (obj3 instanceof n39) {
                                arrayList2.add(obj3);
                            }
                        }
                        for (n39 n39Var2 : arrayList2) {
                            String str = ((as9) es9Var).a;
                            n39Var2.getClass();
                            str.getClass();
                            uq0 uq0Var = n39Var2.q;
                            Object obj4 = uq0Var.c.get();
                            Object value = (hj8.isComplete(obj4) || hj8.isError(obj4)) ? null : hj8.getValue(obj4);
                            if (value == null) {
                                ay0.e("ParagraphContextBuilder must not be null");
                                return null;
                            }
                            j09 j09Var = (j09) value;
                            List list = j09Var.c;
                            ArrayList arrayList3 = new ArrayList();
                            for (Object obj5 : list) {
                                if (!g76.L(((Highlight) obj5).getId(), str)) {
                                    arrayList3.add(obj5);
                                }
                            }
                            j09Var.c = arrayList3;
                            uq0Var.onNext(j09Var);
                        }
                    } else if (es9Var instanceof tr9) {
                        nyaVar2.a = ((tr9) es9Var).a;
                    } else if (es9Var instanceof bs9) {
                        ryaVar3.a = mq9.a((mq9) ryaVar3.a, false, 0, false, null, null, null, ((bs9) es9Var).a ? new o99(true) : new n99(true), 520191);
                    } else if (!g76.L(es9Var, xr9.a) && !g76.L(es9Var, zr9.a) && !g76.L(es9Var, yr9.a)) {
                        if (!g76.L(es9Var, ur9.a)) {
                            ygf.a();
                            return null;
                        }
                        nyaVar.a = true;
                    }
                }
            }
            return c1e.a;
        }
        mq9 mq9Var2 = (mq9) ryaVar3.a;
        boolean z2 = !sw9Var.H0;
        PostClapsData postClapsData2 = ((wr9) es9Var).a;
        Integer clapCount3 = postClapsData2.getViewerEdge().getClapCount();
        ryaVar3.a = mq9.a(mq9Var2, false, clapCount3 != null ? clapCount3.intValue() : 0, z2, null, null, null, null, 524095);
        PostFooterCountData postFooterCountData2 = (PostFooterCountData) ryaVar2.a;
        Integer clapCount4 = postClapsData2.getViewerEdge().getClapCount();
        iIntValue = clapCount4 != null ? clapCount4.intValue() : 0;
        Long totalClapCount2 = postClapsData2.getTotalClapCount();
        ryaVar2.a = of9.c(postFooterCountData2, iIntValue, totalClapCount2 != null ? totalClapCount2.longValue() : 0L);
        iv0 iv0VarG = sw9Var.g(this.h, (PostFooterCountData) ryaVar2.a, sw9Var.H0, this.i, this.j.a, this.k.a, (String) this.l.a, new Integer(this.m.a), nyaVar2.a);
        this.g.a = iv0VarG;
        Object objA = this.n.a(new su9(this.o, this.h, (List) ryaVar.a, (List) this.p.a, this.q, (mq9) ryaVar3.a, iv0VarG, nyaVar.a), n92Var);
        if (objA == tb2.COROUTINE_SUSPENDED) {
            return objA;
        }
        return c1e.a;
    }
}
