package defpackage;

import com.medium.android.core.models.HighlightType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class if2 extends p92 {
    public String b;
    public HighlightType c;
    public String d;
    public String e;
    public String f;
    public /* synthetic */ Object g;
    public final /* synthetic */ jf2 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public if2(jf2 jf2Var, p92 p92Var) {
        super(p92Var);
        this.h = jf2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objA = this.h.a(null, null, 0, 0, null, null, null, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
