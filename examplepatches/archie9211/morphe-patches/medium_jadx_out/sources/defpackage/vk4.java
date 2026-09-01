package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vk4 extends p92 {
    public Map b;
    public Iterator c;
    public k1c d;
    public Map e;
    public Object f;
    public /* synthetic */ Object g;
    public final /* synthetic */ wk4 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vk4(wk4 wk4Var, p92 p92Var) {
        super(p92Var);
        this.h = wk4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.b(this);
    }
}
