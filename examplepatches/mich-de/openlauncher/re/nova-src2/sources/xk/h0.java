package xk;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class h0 extends j0 {

    /* renamed from: c, reason: collision with root package name */
    public static final h0 f95922c = new h0(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 0);

    /* renamed from: d, reason: collision with root package name */
    public static final h0 f95923d = new h0(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 1);

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f95924b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h0(Comparable comparable, int i5) {
        super(comparable);
        this.f95924b = i5;
    }

    @Override // xk.j0
    /* renamed from: a */
    public int compareTo(j0 j0Var) {
        switch (this.f95924b) {
            case 0:
                return j0Var == this ? 0 : 1;
            case 1:
                return j0Var == this ? 0 : -1;
            default:
                return super.compareTo(j0Var);
        }
    }

    @Override // xk.j0
    public final void b(StringBuilder sb2) {
        switch (this.f95924b) {
            case 0:
                throw new AssertionError();
            case 1:
                sb2.append("(-∞");
                return;
            default:
                sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
                sb2.append(this.f95941a);
                return;
        }
    }

    @Override // xk.j0
    public final void c(StringBuilder sb2) {
        switch (this.f95924b) {
            case 0:
                sb2.append("+∞)");
                return;
            case 1:
                throw new AssertionError();
            default:
                sb2.append(this.f95941a);
                sb2.append(')');
                return;
        }
    }

    @Override // xk.j0, java.lang.Comparable
    public int compareTo(Object obj) {
        switch (this.f95924b) {
            case 0:
                return ((j0) obj) == this ? 0 : 1;
            case 1:
                return ((j0) obj) == this ? 0 : -1;
            default:
                return super.compareTo(obj);
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Comparable, java.lang.Object] */
    @Override // xk.j0
    public final boolean d(Comparable comparable) {
        switch (this.f95924b) {
            case 0:
                break;
            case 1:
                break;
            default:
                n2 n2Var = n2.f95978c;
                if (this.f95941a.compareTo(comparable) <= 0) {
                    break;
                }
                break;
        }
        return true;
    }

    @Override // xk.j0
    public final int hashCode() {
        switch (this.f95924b) {
            case 0:
                return System.identityHashCode(this);
            case 1:
                return System.identityHashCode(this);
            default:
                return this.f95941a.hashCode();
        }
    }

    public final String toString() {
        switch (this.f95924b) {
            case 0:
                return "+∞";
            case 1:
                return "-∞";
            default:
                return "\\" + this.f95941a + "/";
        }
    }
}
