package bh;

import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import b.c0;
import c0.l2;
import c0.s;
import java.util.List;
import java.util.Locale;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kw.e3;
import kw.f3;
import kw.g3;
import kw.h3;
import kw.j3;
import kw.k3;

/* loaded from: classes3.dex */
public final class k implements b, l2 {

    /* renamed from: a, reason: collision with root package name */
    public int f17909a;

    public /* synthetic */ k(int i5, boolean z11) {
        this.f17909a = i5;
    }

    public static int f(Context context, int i5, int i11) {
        return Color.alpha(i5) < 16 ? context.getColor(i11) : i5;
    }

    @Override // bh.b
    public int c(Context context, String str, boolean z11) {
        return 0;
    }

    @Override // bh.b
    public int d(Context context, String str) {
        return this.f17909a;
    }

    public e3 g(ft.b brand, List accountRanges, String number, int i5) {
        Intrinsics.g(brand, "brand");
        Intrinsics.g(accountRanges, "accountRanges");
        Intrinsics.g(number, "number");
        boolean z11 = brand.a() != -1;
        if (number.length() == 0) {
            return f3.f72376b;
        }
        List list = null;
        if (brand == ft.b.f55894x) {
            if (number.length() == i5) {
                return new j3(null);
            }
        } else {
            if (z11 && number.length() == i5) {
                return new j3(null);
            }
            if (!z11 || !brand.f55902f.contains(Integer.valueOf(number.length()))) {
                int i11 = 2132019812;
                if (z11 && number.length() < i5) {
                    return new g3(2132019812);
                }
                int i12 = 6;
                return (!z11 || number.length() <= i5) ? new h3(i11, i12, list) : new h3(i11, i12, list);
            }
        }
        return k3.f72462a;
    }

    public void h(int i5) {
        if (i5 != 0) {
            if (i5 == 0) {
                i5 = 0;
            } else if (i5 != 2 && i5 != 1 && i5 != 23 && i5 != 3) {
                Locale locale = Locale.US;
                throw new IllegalArgumentException(c0.h(i5, "Invalid environment value "));
            }
        }
        this.f17909a = i5;
    }

    @Override // c0.j2
    public s k(long j11, s sVar, s sVar2, s sVar3) {
        return j11 < ((long) this.f17909a) * 1000000 ? sVar : sVar2;
    }

    @Override // c0.l2
    public int l() {
        return this.f17909a;
    }

    @Override // c0.l2
    public int n() {
        return 0;
    }

    @Override // c0.j2
    public s p(long j11, s sVar, s sVar2, s sVar3) {
        return sVar3;
    }

    public k(int i5) {
        switch (i5) {
            case 3:
                this.f17909a = 3;
                break;
            case 4:
                this.f17909a = 2;
                break;
            case 5:
            case 7:
            default:
                zg.a.U(2132019763, new Object[0], EmptyList.f71733a);
                this.f17909a = 8;
                break;
            case 6:
                this.f17909a = Build.VERSION.SDK_INT;
                break;
            case 8:
                this.f17909a = 5;
                break;
        }
    }
}
