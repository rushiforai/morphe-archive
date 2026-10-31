package a40;

import aosp.android.icu.impl.CalendarAstronomer;
import b.c9;
import b.i8;
import b.u4;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class k {

    @NotNull
    public static final j Companion = new j();

    /* renamed from: j, reason: collision with root package name */
    public static final KSerializer[] f209j = {null, null, null, null, null, null, null, null, EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.weather.WeatherCondition", k30.u.values())};

    /* renamed from: a, reason: collision with root package name */
    public final String f210a;

    /* renamed from: b, reason: collision with root package name */
    public final int f211b;

    /* renamed from: c, reason: collision with root package name */
    public final i0 f212c;

    /* renamed from: d, reason: collision with root package name */
    public final i0 f213d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f214e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f215f;

    /* renamed from: g, reason: collision with root package name */
    public final long f216g;

    /* renamed from: h, reason: collision with root package name */
    public final String f217h;

    /* renamed from: i, reason: collision with root package name */
    public final k30.u f218i;

    public /* synthetic */ k(int i5, String str, int i11, i0 i0Var, i0 i0Var2, boolean z11, boolean z12, long j11, String str2, k30.u uVar) {
        k30.u uVar2;
        if (255 != (i5 & 255)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 255, i.f205a.getDescriptor());
        }
        this.f210a = str;
        this.f211b = i11;
        this.f212c = i0Var;
        this.f213d = i0Var2;
        this.f214e = z11;
        this.f215f = z12;
        this.f216g = j11;
        this.f217h = str2;
        if ((i5 & 256) != 0) {
            this.f218i = uVar;
            return;
        }
        switch (i11) {
            case 1:
            case 2:
            case 3:
            case 4:
                uVar2 = k30.u.f71064d;
                break;
            case 5:
                uVar2 = k30.u.f71068h;
                break;
            case 6:
            case 7:
                uVar2 = k30.u.f71065e;
                break;
            case 8:
                uVar2 = k30.u.f71066f;
                break;
            case 9:
            case 10:
            case 27:
            case 28:
            default:
                uVar2 = k30.u.f71063c;
                break;
            case 11:
                uVar2 = k30.u.f71067g;
                break;
            case 12:
            case 13:
            case 14:
                uVar2 = k30.u.f71070j;
                break;
            case 15:
            case 16:
            case 17:
                uVar2 = k30.u.f71072l;
                break;
            case 18:
                uVar2 = k30.u.f71071k;
                break;
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
            case 26:
            case 29:
                uVar2 = k30.u.f71069i;
                break;
            case 30:
                uVar2 = k30.u.f71074p;
                break;
            case 31:
                uVar2 = k30.u.f71075q;
                break;
            case 32:
                uVar2 = k30.u.f71076r;
                break;
            case 33:
            case 34:
            case 35:
            case 36:
                uVar2 = k30.u.f71064d;
                break;
            case 37:
                uVar2 = k30.u.f71067g;
                break;
            case 38:
                uVar2 = k30.u.f71065e;
                break;
            case 39:
            case 40:
                uVar2 = k30.u.f71071k;
                break;
            case 41:
            case 42:
                uVar2 = k30.u.f71072l;
                break;
            case 43:
            case 44:
                uVar2 = k30.u.f71069i;
                break;
        }
        this.f218i = uVar2;
    }

    public final String a() {
        return this.f217h;
    }

    public final k30.u b() {
        return this.f218i;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x008b A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x000e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final k30.x c(List list, w wVar, String str, k30.k0 k0Var, k30.s sVar) {
        k30.k0 k0Var2;
        k30.k0 k0Var3;
        k30.s sVar2;
        List list2 = wVar.f243b;
        c0 c0Var = wVar.f242a;
        if (list2.size() < 2) {
            k0Var2 = null;
        } else {
            z zVar = (z) list2.get(1);
            v vVar = w.Companion;
            int i5 = zVar.f248c;
            vVar.getClass();
            k30.u uVarB = v.b(i5);
            if (uVarB != null) {
                k0Var2 = new k30.k0(uVarB, new Date().getTime() + (zVar.f246a * 60000), lb0.b.n(wVar.f244c), null);
            }
        }
        if (k0Var2 == null) {
            k0Var2 = k0Var;
        }
        v vVar2 = w.Companion;
        int i11 = c0Var.f192b;
        vVar2.getClass();
        k30.u uVarB2 = v.b(i11);
        if (uVarB2 != null) {
            String str2 = c0Var.f191a;
            if ((r70.j.I0(str2, "A break", false) || r70.k.K0(str2, "continue", false) || r70.k.K0(str2, "likely for", false)) && v.b(c0Var.f192b) != null) {
                int i12 = this.f211b;
                if (i12 != 11 && i12 != 30 && i12 != 31) {
                    switch (i12) {
                        default:
                            switch (i12) {
                            }
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                            break;
                    }
                } else if (this.f214e) {
                    uVarB2 = null;
                }
            }
        }
        Iterator it = list.iterator();
        while (true) {
            if (it.hasNext()) {
                e eVar = (e) it.next();
                if (eVar.f195b < 30) {
                    String str3 = eVar.f196c;
                    String str4 = eVar.f194a;
                    uVarB2 = Intrinsics.b(str4, "FLOOD") ? k30.u.n : (!Intrinsics.b(str4, "FIRE") || eVar.f195b > 20) ? (Intrinsics.b(str3, "TOW") || Intrinsics.b(str3, "TOA")) ? k30.u.f71073m : null : k30.u.o;
                    mc0.d.f76206a.m("alert priority valid " + eVar + ", override as " + uVarB2, new Object[0]);
                    if (uVarB2 != null) {
                        k0Var3 = null;
                    }
                } else {
                    mc0.d.f76206a.m("ignoring low priority " + eVar, new Object[0]);
                }
            } else {
                k0Var3 = k0Var2;
            }
        }
        long j11 = this.f216g * 1000;
        String strN = lb0.b.n(this.f217h);
        float f11 = this.f212c.f206a.f220a;
        float f12 = this.f213d.f206a.f220a;
        if (uVarB2 == null) {
            uVarB2 = this.f218i;
        }
        k30.u uVar = uVarB2;
        if (sVar == null) {
            sVar2 = this.f215f ? k30.s.f71058b : k30.s.f71060d;
        } else {
            sVar2 = sVar;
        }
        i8 i8Var = k30.d.f70919b;
        CalendarAstronomer calendarAstronomer = new CalendarAstronomer(j11);
        i8Var.getClass();
        return new k30.x(f11, f12, uVar, sVar2, i8.v(calendarAstronomer), str, j11, System.currentTimeMillis(), strN, k0Var3);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.f210a, kVar.f210a) && this.f211b == kVar.f211b && Intrinsics.b(this.f212c, kVar.f212c) && Intrinsics.b(this.f213d, kVar.f213d) && this.f214e == kVar.f214e && this.f215f == kVar.f215f && this.f216g == kVar.f216g && Intrinsics.b(this.f217h, kVar.f217h);
    }

    public final int hashCode() {
        return this.f217h.hashCode() + b.c0.d(c9.f(c9.f((this.f213d.hashCode() + ((this.f212c.hashCode() + u4.a(this.f211b, this.f210a.hashCode() * 31, 31)) * 31)) * 31, 31, this.f214e), 31, this.f215f), 31, this.f216g);
    }

    public final String toString() {
        StringBuilder sbV = b.c0.v("AccuWeatherCurrentCondition(WeatherText=", this.f211b, this.f210a, ", WeatherIcon=", ", Temperature=");
        sbV.append(this.f212c);
        sbV.append(", RealFeelTemperature=");
        sbV.append(this.f213d);
        sbV.append(", HasPrecipitation=");
        a80.m.s(sbV, this.f214e, ", IsDayTime=", this.f215f, ", EpochTime=");
        sbV.append(this.f216g);
        sbV.append(", MobileLink=");
        sbV.append(this.f217h);
        sbV.append(")");
        return sbV.toString();
    }
}
