package ads_mobile_sdk;

import a60.d;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import b0.b0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Locale;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import r70.i;
import t70.m0;

/* loaded from: classes.dex */
public final class sq1 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f9637a;

    /* renamed from: b, reason: collision with root package name */
    public final b.w4 f9638b;

    /* renamed from: c, reason: collision with root package name */
    public final b.w4 f9639c;

    /* renamed from: d, reason: collision with root package name */
    public final b.w4 f9640d;

    /* renamed from: e, reason: collision with root package name */
    public final b.w4 f9641e;

    /* renamed from: f, reason: collision with root package name */
    public final g0 f9642f;

    /* renamed from: g, reason: collision with root package name */
    public final z03 f9643g;

    public sq1(b.w4 mraidSetOrientationPropertiesHandler, b.w4 mraidResizeHandler, b.w4 mraidCalendarEventHandler, b.w4 mraidStorePictureHandler, b.w4 mraidUnloadHandler, g0 activityTracker, z03 safeBrowsingManager) {
        Intrinsics.g(mraidSetOrientationPropertiesHandler, "mraidSetOrientationPropertiesHandler");
        Intrinsics.g(mraidResizeHandler, "mraidResizeHandler");
        Intrinsics.g(mraidCalendarEventHandler, "mraidCalendarEventHandler");
        Intrinsics.g(mraidStorePictureHandler, "mraidStorePictureHandler");
        Intrinsics.g(mraidUnloadHandler, "mraidUnloadHandler");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
        this.f9637a = mraidSetOrientationPropertiesHandler;
        this.f9638b = mraidResizeHandler;
        this.f9639c = mraidCalendarEventHandler;
        this.f9640d = mraidStorePictureHandler;
        this.f9641e = mraidUnloadHandler;
        this.f9642f = activityTracker;
        this.f9643g = safeBrowsingManager;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0102, code lost:
    
        if (r2.a(r18, r19) == r15) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0185, code lost:
    
        if (r1 == r15) goto L29;
     */
    /* JADX WARN: Removed duplicated region for block: B:127:0x028b  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        rq1 rq1Var;
        String string;
        String string2;
        String string3;
        String string4;
        Unit unit;
        CoroutineSingletons coroutineSingletons;
        String lowerCase;
        Unit unit2;
        Boolean boolT1;
        String str;
        if (continuation instanceof rq1) {
            rq1Var = (rq1) continuation;
            int i5 = rq1Var.f9286d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rq1Var.f9286d = i5 - Integer.MIN_VALUE;
            } else {
                rq1Var = new rq1(this, continuation);
            }
        }
        Object obj = rq1Var.f9284b;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        Continuation continuation2 = null;
        switch (rq1Var.f9286d) {
            case 0:
                ResultKt.b(obj);
                String str2 = (String) map.get("a");
                String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (str2 == null) {
                    str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                cc2 cc2VarE = ji3.a().e();
                b.z3 z3VarO = iq1.o();
                Intrinsics.f(z3VarO, "newBuilder(...)");
                z3VarO.b();
                ((iq1) z3VarO.f1095b).b(str2);
                cc2VarE.f1806w = (iq1) z3VarO.a();
                if (!str2.equals(n.f39154h) && !str2.equals("unload")) {
                    z03 z03Var = this.f9643g;
                    if (!z03Var.a()) {
                        rq1Var.f9283a = str2;
                        rq1Var.f9286d = 1;
                        if (z03Var.b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, rq1Var) != coroutineSingletons2) {
                            str = str2;
                            zi3.a(6, "MRAID action " + str + " blocked by safe browsing", null);
                            return Unit.f71706a;
                        }
                    }
                    return coroutineSingletons2;
                }
                Context contextB = this.f9642f.b();
                if (contextB == null) {
                    contextB = tx0Var.getContext();
                }
                String str4 = (String) map.get("a");
                if (str4 != null) {
                    int iHashCode = str4.hashCode();
                    b.w4 w4Var = this.f9638b;
                    switch (iHashCode) {
                        case -1995788453:
                            if (!str4.equals("closeResizedAd")) {
                                zi3.a(6, "Unknown MRAID gmsg action: ".concat(str2), null);
                                cz.b bVar = mu0.f7335a;
                                mu0.c("Unknown MRAID gmsg action: ".concat(str2), null);
                                break;
                            } else {
                                ((rr1) w4Var.get()).a(true);
                                break;
                            }
                        case -934437708:
                            if (str4.equals(n.f39153g)) {
                                rr1 rr1Var = (rr1) w4Var.get();
                                rq1Var.f9286d = 2;
                                rr1Var.getClass();
                                if (rr1.a(rr1Var, map, rq1Var) == coroutineSingletons2) {
                                    return coroutineSingletons2;
                                }
                                return Unit.f71706a;
                            }
                            zi3.a(6, "Unknown MRAID gmsg action: ".concat(str2), null);
                            cz.b bVar2 = mu0.f7335a;
                            mu0.c("Unknown MRAID gmsg action: ".concat(str2), null);
                            break;
                        case -840442113:
                            if (!str4.equals("unload")) {
                                zi3.a(6, "Unknown MRAID gmsg action: ".concat(str2), null);
                                cz.b bVar22 = mu0.f7335a;
                                mu0.c("Unknown MRAID gmsg action: ".concat(str2), null);
                                break;
                            } else {
                                es1 es1Var = (es1) this.f9641e.get();
                                rq1Var.f9286d = 6;
                                Object objC = es1Var.f2963a.c(rq1Var);
                                if (objC != coroutineSingletons2) {
                                    objC = Unit.f71706a;
                                }
                                if (((Unit) objC) == coroutineSingletons2) {
                                    return coroutineSingletons2;
                                }
                                return Unit.f71706a;
                            }
                        case -733616544:
                            if (str4.equals("createCalendarEvent")) {
                                fq1 fq1Var = (fq1) this.f9639c.get();
                                rq1Var.f9286d = 4;
                                g0 g0Var = fq1Var.f3471e;
                                t70.j0 j0Var = fq1Var.f3470d;
                                Activity activityB = g0Var.b();
                                if (activityB == null) {
                                    m0.t(j0Var, null, null, new b0(fq1Var, tx0Var, "Activity context is required to show calendar event alert.", continuation2, 2), 3);
                                    unit = Unit.f71706a;
                                } else {
                                    di0 di0Var = fq1Var.f3467a;
                                    di0Var.getClass();
                                    Intent type = new Intent("android.intent.action.INSERT").setType("vnd.android.cursor.dir/event");
                                    Intrinsics.f(type, "setType(...)");
                                    if (di0Var.a(type)) {
                                        String str5 = (String) map.get("start_ticks");
                                        Long lV0 = str5 != null ? i.v0(str5) : null;
                                        String str6 = (String) map.get("end_ticks");
                                        Long lV02 = str6 != null ? i.v0(str6) : null;
                                        String str7 = (String) map.get(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
                                        if (str7 == null) {
                                            str7 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                        }
                                        String str8 = (String) map.get("summary");
                                        String str9 = str8 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str8;
                                        String str10 = (String) map.get("location");
                                        if (str10 != null) {
                                            str3 = str10;
                                        }
                                        Resources resources = activityB.getResources();
                                        if (resources == null || (string = resources.getString(2132018650)) == null) {
                                            string = "Create calendar event";
                                        }
                                        if (resources == null || (string2 = resources.getString(2132018648)) == null) {
                                            string2 = "Allow Ad to create a calendar event?";
                                        }
                                        if (resources == null || (string3 = resources.getString(2132018646)) == null) {
                                            string3 = "Accept";
                                        }
                                        if (resources == null || (string4 = resources.getString(2132018647)) == null) {
                                            string4 = "Decline";
                                        }
                                        m0.t(j0Var, null, null, new eq1(activityB, string, string2, string3, string4, str7, str3, str9, lV0, lV02, fq1Var, tx0Var, null), 3);
                                        unit = Unit.f71706a;
                                        coroutineSingletons = coroutineSingletons2;
                                        if (unit == coroutineSingletons) {
                                            return coroutineSingletons;
                                        }
                                        return Unit.f71706a;
                                    }
                                    m0.t(j0Var, null, null, new b0(fq1Var, tx0Var, "This feature is not available on the device.", continuation2, 2), 3);
                                    unit = Unit.f71706a;
                                }
                                coroutineSingletons = coroutineSingletons2;
                                if (unit == coroutineSingletons) {
                                }
                                return Unit.f71706a;
                            }
                            zi3.a(6, "Unknown MRAID gmsg action: ".concat(str2), null);
                            cz.b bVar222 = mu0.f7335a;
                            mu0.c("Unknown MRAID gmsg action: ".concat(str2), null);
                            break;
                        case 133423073:
                            if (str4.equals(n.f39154h)) {
                                vr1 vr1Var = (vr1) this.f9637a.get();
                                Intrinsics.d(contextB);
                                rq1Var.f9286d = 5;
                                vr1Var.getClass();
                                t70.j0 j0Var2 = vr1Var.f10882b;
                                et0 et0Var = tx0Var.o;
                                if (et0Var != null) {
                                    String str11 = (String) map.get("forceOrientation");
                                    String str12 = (String) map.get("allowOrientationChange");
                                    boolean zBooleanValue = (str12 == null || (boolT1 = r70.k.t1(str12)) == null) ? true : boolT1.booleanValue();
                                    if (str11 != null) {
                                        lowerCase = str11.toLowerCase(Locale.ROOT);
                                        Intrinsics.f(lowerCase, "toLowerCase(...)");
                                    } else {
                                        lowerCase = null;
                                    }
                                    m0.t(j0Var2, null, null, new d(et0Var, Intrinsics.b(lowerCase, "landscape") ? 6 : Intrinsics.b(lowerCase, "portrait") ? 7 : zBooleanValue ? -1 : 14, continuation2, 18), 3);
                                    unit2 = Unit.f71706a;
                                    break;
                                } else {
                                    m0.t(j0Var2, null, null, new b00.e(vr1Var, tx0Var, continuation2, 19), 3);
                                    unit2 = Unit.f71706a;
                                    break;
                                }
                            }
                            zi3.a(6, "Unknown MRAID gmsg action: ".concat(str2), null);
                            cz.b bVar2222 = mu0.f7335a;
                            mu0.c("Unknown MRAID gmsg action: ".concat(str2), null);
                            break;
                        case 459238621:
                            if (str4.equals("storePicture")) {
                                cs1 cs1Var = (cs1) this.f9640d.get();
                                rq1Var.f9286d = 3;
                                break;
                            }
                            zi3.a(6, "Unknown MRAID gmsg action: ".concat(str2), null);
                            cz.b bVar22222 = mu0.f7335a;
                            mu0.c("Unknown MRAID gmsg action: ".concat(str2), null);
                            break;
                        default:
                            zi3.a(6, "Unknown MRAID gmsg action: ".concat(str2), null);
                            cz.b bVar222222 = mu0.f7335a;
                            mu0.c("Unknown MRAID gmsg action: ".concat(str2), null);
                            break;
                    }
                }
                return Unit.f71706a;
            case 1:
                str = rq1Var.f9283a;
                ResultKt.b(obj);
                zi3.a(6, "MRAID action " + str + " blocked by safe browsing", null);
                return Unit.f71706a;
            case 2:
                ResultKt.b(obj);
                return Unit.f71706a;
            case 3:
                ResultKt.b(obj);
                return Unit.f71706a;
            case 4:
                ResultKt.b(obj);
                return Unit.f71706a;
            case 5:
                ResultKt.b(obj);
                return Unit.f71706a;
            case 6:
                ResultKt.b(obj);
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    @Override // b.gb
    public final int b() {
        return 26;
    }
}
