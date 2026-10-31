package t;

import java.util.HashMap;

/* loaded from: classes.dex */
public final class a extends f {

    /* renamed from: e, reason: collision with root package name */
    public final HashMap f87866e = new HashMap();

    @Override // t.f
    public final c b(Object obj) {
        return (c) this.f87866e.get(obj);
    }

    @Override // t.f
    public final Object c(Object obj) {
        Object objC = super.c(obj);
        this.f87866e.remove(obj);
        return objC;
    }
}
