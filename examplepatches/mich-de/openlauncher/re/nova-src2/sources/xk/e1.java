package xk;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class e1 extends d1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f95902d = 1;

    /* renamed from: e, reason: collision with root package name */
    public final transient Object f95903e;

    public e1(Object obj) {
        obj.getClass();
        this.f95903e = obj;
    }

    @Override // xk.d1, xk.q0
    public v0 c() {
        switch (this.f95902d) {
            case 1:
                return v0.s(this.f95903e);
            default:
                return super.c();
        }
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        switch (this.f95902d) {
            case 0:
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    f1 f1Var = (f1) this.f95903e;
                    Object key = entry.getKey();
                    Object value = entry.getValue();
                    Collection collection = (Collection) f1Var.a().get(key);
                    if (collection != null && collection.contains(value)) {
                        return true;
                    }
                }
                return false;
            default:
                return this.f95903e.equals(obj);
        }
    }

    @Override // xk.q0
    public int d(Object[] objArr, int i5) {
        switch (this.f95902d) {
            case 1:
                objArr[i5] = this.f95903e;
                return i5 + 1;
            default:
                return super.d(objArr, i5);
        }
    }

    @Override // xk.q0
    public final boolean h() {
        switch (this.f95902d) {
        }
        return false;
    }

    @Override // xk.d1, java.util.Collection, java.util.Set
    public int hashCode() {
        switch (this.f95902d) {
            case 1:
                return this.f95903e.hashCode();
            default:
                return super.hashCode();
        }
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator iterator() {
        switch (this.f95902d) {
            case 0:
                f1 f1Var = (f1) this.f95903e;
                f1Var.getClass();
                return new y0(f1Var);
            default:
                return super.iterator();
        }
    }

    @Override // xk.q0
    /* renamed from: j */
    public final lh.h iterator() {
        switch (this.f95902d) {
            case 0:
                f1 f1Var = (f1) this.f95903e;
                f1Var.getClass();
                return new y0(f1Var);
            default:
                return new o1(this.f95903e);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        switch (this.f95902d) {
            case 0:
                return ((f1) this.f95903e).f95912e;
            default:
                return 1;
        }
    }

    @Override // java.util.AbstractCollection
    public String toString() {
        switch (this.f95902d) {
            case 1:
                return "[" + this.f95903e.toString() + AbstractJsonLexerKt.END_LIST;
            default:
                return super.toString();
        }
    }

    public e1(f1 f1Var) {
        this.f95903e = f1Var;
    }
}
