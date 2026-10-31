package wk;

import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class i extends lh.h {

    /* renamed from: b, reason: collision with root package name */
    public Object f94538b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j f94539c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(j jVar, h0 h0Var) {
        super(1);
        this.f94539c = jVar;
        this.f94538b = h0Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f94538b != null;
    }

    @Override // java.util.Iterator
    public final Object next() {
        Object obj = this.f94538b;
        if (obj == null) {
            throw new NoSuchElementException();
        }
        h0 h0VarG = ((h0) obj).g();
        if (h0VarG == this.f94539c.f94540a) {
            h0VarG = null;
        }
        this.f94538b = h0VarG;
        return obj;
    }
}
