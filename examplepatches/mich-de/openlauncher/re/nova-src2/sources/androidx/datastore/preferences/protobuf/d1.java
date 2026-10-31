package androidx.datastore.preferences.protobuf;

import com.google.android.gms.internal.consent_sdk.v6;
import com.google.android.gms.internal.consent_sdk.w6;
import com.google.android.gms.internal.measurement.v2;
import com.google.android.gms.internal.measurement.w2;
import com.google.android.gms.internal.play_billing.a4;
import com.google.android.gms.internal.play_billing.z3;
import com.google.protobuf.d2;
import java.util.AbstractMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class d1 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14303a;

    /* renamed from: b, reason: collision with root package name */
    public int f14304b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f14305c;

    /* renamed from: d, reason: collision with root package name */
    public Iterator f14306d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ AbstractMap f14307e;

    public /* synthetic */ d1(AbstractMap abstractMap, int i5) {
        this.f14303a = i5;
        this.f14307e = abstractMap;
        this.f14304b = -1;
    }

    public Iterator a() {
        switch (this.f14303a) {
            case 0:
                if (this.f14306d == null) {
                    this.f14306d = ((b1) this.f14307e).f14282b.entrySet().iterator();
                }
                break;
            default:
                if (this.f14306d == null) {
                    this.f14306d = ((d2) this.f14307e).f34840b.entrySet().iterator();
                }
                break;
        }
        return this.f14306d;
    }

    public Iterator b() {
        switch (this.f14303a) {
            case 1:
                if (this.f14306d == null) {
                    this.f14306d = ((v6) this.f14307e).f32273c.entrySet().iterator();
                }
                break;
            case 2:
                if (this.f14306d == null) {
                    this.f14306d = ((v2) this.f14307e).f33127c.entrySet().iterator();
                }
                break;
            default:
                if (this.f14306d == null) {
                    this.f14306d = ((z3) this.f14307e).f33667c.entrySet().iterator();
                }
                break;
        }
        return this.f14306d;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f14303a) {
            case 0:
                int i5 = this.f14304b + 1;
                b1 b1Var = (b1) this.f14307e;
                if (i5 >= b1Var.f14281a.size()) {
                    if (b1Var.f14282b.isEmpty() || !a().hasNext()) {
                    }
                }
                break;
            case 1:
                int i11 = this.f14304b + 1;
                v6 v6Var = (v6) this.f14307e;
                if (i11 >= v6Var.f32272b) {
                    if (v6Var.f32273c.isEmpty() || !b().hasNext()) {
                        break;
                    }
                }
                break;
            case 2:
                int i12 = this.f14304b + 1;
                v2 v2Var = (v2) this.f14307e;
                if (i12 >= v2Var.f33126b) {
                    if (v2Var.f33127c.isEmpty() || !b().hasNext()) {
                        break;
                    }
                }
                break;
            case 3:
                int i13 = this.f14304b + 1;
                z3 z3Var = (z3) this.f14307e;
                if (i13 >= z3Var.f33666b) {
                    if (z3Var.f33667c.isEmpty() || !b().hasNext()) {
                        break;
                    }
                }
                break;
            default:
                int i14 = this.f14304b + 1;
                d2 d2Var = (d2) this.f14307e;
                if (i14 >= d2Var.f34839a.size()) {
                    if (d2Var.f34840b.isEmpty() || !a().hasNext()) {
                    }
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f14303a) {
            case 0:
                this.f14305c = true;
                int i5 = this.f14304b + 1;
                this.f14304b = i5;
                b1 b1Var = (b1) this.f14307e;
                return i5 < b1Var.f14281a.size() ? (Map.Entry) b1Var.f14281a.get(this.f14304b) : (Map.Entry) a().next();
            case 1:
                this.f14305c = true;
                int i11 = this.f14304b + 1;
                this.f14304b = i11;
                v6 v6Var = (v6) this.f14307e;
                return i11 < v6Var.f32272b ? (w6) v6Var.f32271a[i11] : (Map.Entry) b().next();
            case 2:
                this.f14305c = true;
                int i12 = this.f14304b + 1;
                this.f14304b = i12;
                v2 v2Var = (v2) this.f14307e;
                return i12 < v2Var.f33126b ? (w2) v2Var.f33125a[i12] : (Map.Entry) b().next();
            case 3:
                this.f14305c = true;
                int i13 = this.f14304b + 1;
                this.f14304b = i13;
                z3 z3Var = (z3) this.f14307e;
                return i13 < z3Var.f33666b ? (a4) z3Var.f33665a[i13] : (Map.Entry) b().next();
            default:
                this.f14305c = true;
                int i14 = this.f14304b + 1;
                this.f14304b = i14;
                d2 d2Var = (d2) this.f14307e;
                return i14 < d2Var.f34839a.size() ? (Map.Entry) d2Var.f34839a.get(this.f14304b) : (Map.Entry) a().next();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        int i5 = this.f14303a;
        AbstractMap abstractMap = this.f14307e;
        switch (i5) {
            case 0:
                b1 b1Var = (b1) abstractMap;
                if (!this.f14305c) {
                    throw new IllegalStateException("remove() was called before next()");
                }
                this.f14305c = false;
                int i11 = b1.f14280f;
                b1Var.b();
                if (this.f14304b >= b1Var.f14281a.size()) {
                    a().remove();
                    return;
                }
                int i12 = this.f14304b;
                this.f14304b = i12 - 1;
                b1Var.g(i12);
                return;
            case 1:
                if (!this.f14305c) {
                    throw new IllegalStateException("remove() was called before next()");
                }
                this.f14305c = false;
                v6 v6Var = (v6) abstractMap;
                int i13 = v6.f32270g;
                v6Var.g();
                int i14 = this.f14304b;
                if (i14 >= v6Var.f32272b) {
                    b().remove();
                    return;
                } else {
                    this.f14304b = i14 - 1;
                    v6Var.e(i14);
                    return;
                }
            case 2:
                if (!this.f14305c) {
                    throw new IllegalStateException("remove() was called before next()");
                }
                this.f14305c = false;
                v2 v2Var = (v2) abstractMap;
                v2Var.f();
                int i15 = this.f14304b;
                if (i15 >= v2Var.f33126b) {
                    b().remove();
                    return;
                } else {
                    this.f14304b = i15 - 1;
                    v2Var.d(i15);
                    return;
                }
            case 3:
                if (!this.f14305c) {
                    throw new IllegalStateException("remove() was called before next()");
                }
                this.f14305c = false;
                z3 z3Var = (z3) abstractMap;
                int i16 = z3.f33664g;
                z3Var.g();
                int i17 = this.f14304b;
                if (i17 >= z3Var.f33666b) {
                    b().remove();
                    return;
                } else {
                    this.f14304b = i17 - 1;
                    z3Var.e(i17);
                    return;
                }
            default:
                d2 d2Var = (d2) abstractMap;
                if (!this.f14305c) {
                    throw new IllegalStateException("remove() was called before next()");
                }
                this.f14305c = false;
                int i18 = d2.f34838f;
                d2Var.b();
                if (this.f14304b >= d2Var.f34839a.size()) {
                    a().remove();
                    return;
                }
                int i19 = this.f14304b;
                this.f14304b = i19 - 1;
                d2Var.h(i19);
                return;
        }
    }

    public /* synthetic */ d1(v6 v6Var) {
        this.f14303a = 1;
        Objects.requireNonNull(v6Var);
        this.f14307e = v6Var;
        this.f14304b = -1;
    }

    public /* synthetic */ d1(v2 v2Var) {
        this.f14303a = 2;
        Objects.requireNonNull(v2Var);
        this.f14307e = v2Var;
        this.f14304b = -1;
    }

    public /* synthetic */ d1(z3 z3Var) {
        this.f14303a = 3;
        Objects.requireNonNull(z3Var);
        this.f14307e = z3Var;
        this.f14304b = -1;
    }
}
