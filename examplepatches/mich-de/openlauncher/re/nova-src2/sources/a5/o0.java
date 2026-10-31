package a5;

import android.os.Build;
import android.text.TextUtils;
import android.view.View;

/* loaded from: classes2.dex */
public final class o0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f334a;

    /* renamed from: b, reason: collision with root package name */
    public final Class f335b;

    /* renamed from: c, reason: collision with root package name */
    public final int f336c;

    /* renamed from: d, reason: collision with root package name */
    public final int f337d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f338e;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public o0(int i5) {
        this(2131428984, Boolean.class, 0, 28);
        this.f338e = i5;
        switch (i5) {
            case 1:
                this(2131428978, CharSequence.class, 8, 28);
                break;
            case 2:
                this(2131428985, CharSequence.class, 64, 30);
                break;
            case 3:
                this(2131428977, Boolean.class, 0, 28);
                break;
            default:
                break;
        }
    }

    public final Object a(View view) {
        if (Build.VERSION.SDK_INT < this.f336c) {
            Object tag = view.getTag(this.f334a);
            if (this.f335b.isInstance(tag)) {
                return tag;
            }
            return null;
        }
        switch (this.f338e) {
            case 0:
                return Boolean.valueOf(v0.c(view));
            case 1:
                return v0.a(view);
            case 2:
                return x0.a(view);
            default:
                return Boolean.valueOf(v0.b(view));
        }
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:12:0x0031. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0053 A[PHI: r3
      0x0053: PHI (r3v1 boolean) = (r3v0 boolean), (r3v2 boolean) binds: [B:41:0x008a, B:24:0x0051] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(View view, Object obj) {
        boolean z11;
        boolean z12;
        boolean zEquals;
        boolean z13;
        if (Build.VERSION.SDK_INT >= this.f336c) {
            switch (this.f338e) {
                case 0:
                    v0.f(view, ((Boolean) obj).booleanValue());
                    break;
                case 1:
                    v0.e(view, (CharSequence) obj);
                    break;
                case 2:
                    x0.b(view, (CharSequence) obj);
                    break;
                default:
                    v0.d(view, ((Boolean) obj).booleanValue());
                    break;
            }
            return;
        }
        Object objA = a(view);
        switch (this.f338e) {
            case 0:
                Boolean bool = (Boolean) objA;
                Boolean bool2 = (Boolean) obj;
                z11 = false;
                z12 = true;
                if ((bool != null && bool.booleanValue()) == (bool2 != null && bool2.booleanValue())) {
                    z11 = z12;
                }
                z13 = !z11;
                break;
            case 1:
                zEquals = TextUtils.equals((CharSequence) objA, (CharSequence) obj);
                z13 = !zEquals;
                break;
            case 2:
                zEquals = TextUtils.equals((CharSequence) objA, (CharSequence) obj);
                z13 = !zEquals;
                break;
            default:
                Boolean bool3 = (Boolean) objA;
                Boolean bool4 = (Boolean) obj;
                z11 = false;
                z12 = true;
                if ((bool3 != null && bool3.booleanValue()) == (bool4 != null && bool4.booleanValue())) {
                }
                z13 = !z11;
                break;
        }
        if (z13) {
            View.AccessibilityDelegate accessibilityDelegateB = a1.b(view);
            b bVar = accessibilityDelegateB == null ? null : accessibilityDelegateB instanceof a ? ((a) accessibilityDelegateB).f249a : new b(accessibilityDelegateB);
            if (bVar == null) {
                bVar = new b();
            }
            a1.k(view, bVar);
            view.setTag(this.f334a, obj);
            a1.f(this.f337d, view);
        }
    }

    public o0(int i5, Class cls, int i11, int i12) {
        this.f334a = i5;
        this.f335b = cls;
        this.f337d = i11;
        this.f336c = i12;
    }
}
