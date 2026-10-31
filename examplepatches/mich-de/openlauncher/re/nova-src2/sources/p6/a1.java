package p6;

import android.content.Context;
import android.content.res.AssetManager;
import android.view.KeyEvent;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.billing.AiTier;
import com.instabridge.ai.proactive.ProactiveGenerationConfig;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import com.teslacoilsw.launcher.NovaApplication;
import e10.y2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import k0.i2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SpreadBuilder;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import p1.a0;
import p1.t1;
import p6.a1;
import tx.q2;

/* loaded from: classes2.dex */
public abstract class a1 {
    public static q3.a a(String str, AssetManager assetManager, q3.b0 b0Var) {
        q3.x[] xVarArr = new q3.x[0];
        SpreadBuilder spreadBuilder = new SpreadBuilder(3);
        int i5 = b0Var.f83539a;
        if (1 > i5 || i5 >= 1001) {
            s3.a.a("'wght' value must be in [1, 1000]. Actual: " + i5);
        }
        spreadBuilder.a(new q3.z(i5));
        float f11 = 0;
        if (0.0f > f11 || f11 > 1.0f) {
            s3.a.a("'ital' must be in 0.0f..1.0f. Actual: " + f11);
        }
        spreadBuilder.a(new q3.y(f11));
        spreadBuilder.b(xVarArr);
        ArrayList arrayList = spreadBuilder.f71867a;
        return new q3.a(assetManager, str, b0Var, new q3.a0((q3.x[]) arrayList.toArray(new q3.x[arrayList.size()])));
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0172  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0175  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0178  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0180  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0184  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x018c  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x018f  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x01c8  */
    /* JADX WARN: Removed duplicated region for block: B:140:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0107  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(final String url, final qw.v imageLoader, final b2.t tVar, z2.l lVar, i2.t tVar2, n2.c cVar, b2.f fVar, boolean z11, Function3 function3, Function3 function32, p1.o oVar, final int i5, final int i11, final int i12) {
        int i13;
        z2.l lVar2;
        int i14;
        i2.t tVar3;
        int i15;
        n2.c cVar2;
        int i16;
        b2.f fVar2;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        int i23;
        int i24;
        p1.t tVar4;
        final n2.c cVar3;
        final z2.l lVar3;
        final Function3 function33;
        final i2.t tVar5;
        final Function3 function34;
        final b2.f fVar3;
        final boolean z12;
        t1 t1VarU;
        Intrinsics.g(url, "url");
        Intrinsics.g(imageLoader, "imageLoader");
        p1.t tVar6 = (p1.t) oVar;
        tVar6.d0(-957894735);
        if ((i5 & 6) == 0) {
            i13 = (tVar6.f(url) ? 4 : 2) | i5;
        } else {
            i13 = i5;
        }
        if ((i5 & 48) == 0) {
            i13 |= (i5 & 64) == 0 ? tVar6.f(imageLoader) : tVar6.h(imageLoader) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i13 |= tVar6.f(null) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i13 |= tVar6.f(tVar) ? 2048 : 1024;
        }
        int i25 = i12 & 16;
        if (i25 != 0) {
            i13 |= 24576;
        } else {
            if ((i5 & 24576) == 0) {
                lVar2 = lVar;
                i13 |= tVar6.f(lVar2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
            }
            i14 = i12 & 32;
            if (i14 == 0) {
                i13 |= 196608;
            } else {
                if ((196608 & i5) == 0) {
                    tVar3 = tVar2;
                    i13 |= tVar6.f(tVar3) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
                }
                i15 = i12 & 64;
                if (i15 != 0) {
                    i13 |= 1572864;
                } else {
                    if ((1572864 & i5) == 0) {
                        cVar2 = cVar;
                        i13 |= tVar6.h(cVar2) ? 1048576 : 524288;
                    }
                    i16 = i12 & 128;
                    if (i16 == 0) {
                        i13 |= 12582912;
                        fVar2 = fVar;
                    } else {
                        fVar2 = fVar;
                        if ((i5 & 12582912) == 0) {
                            i13 |= tVar6.f(fVar2) ? 8388608 : 4194304;
                        }
                    }
                    i17 = i12 & 256;
                    if (i17 == 0) {
                        i13 |= 100663296;
                    } else {
                        if ((i5 & 100663296) == 0) {
                            i18 = i13 | (tVar6.g(z11) ? 67108864 : 33554432);
                        }
                        i19 = i12 & EventBridgeChannel.QUEUE_CAPACITY;
                        if (i19 == 0) {
                            if ((i5 & 805306368) == 0) {
                                i21 = i19;
                                i18 |= tVar6.h(function3) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
                            }
                            i22 = i12 & 1024;
                            if (i22 == 0) {
                                i24 = 6;
                                i23 = i22;
                            } else if ((i11 & 6) == 0) {
                                i23 = i22;
                                i24 = i11 | (tVar6.h(function32) ? 4 : 2);
                            } else {
                                i23 = i22;
                                i24 = i11;
                            }
                            if ((i18 & 306783379) != 306783378 && (i24 & 3) == 2 && tVar6.E()) {
                                tVar6.V();
                                function33 = function3;
                                fVar3 = fVar2;
                                lVar3 = lVar2;
                                tVar5 = tVar3;
                                tVar4 = tVar6;
                                cVar3 = cVar2;
                                z12 = z11;
                                function34 = function32;
                            } else {
                                if (i25 != 0) {
                                    lVar2 = z2.k.f98095b;
                                }
                                if (i14 != 0) {
                                    tVar3 = null;
                                }
                                if (i15 != 0) {
                                    cVar2 = null;
                                }
                                if (i16 != 0) {
                                    fVar2 = b2.d.f17001e;
                                }
                                boolean z13 = i17 == 0 ? false : z11;
                                Function3 function35 = i21 == 0 ? qw.b.f84335a : function3;
                                z2.l lVar4 = lVar2;
                                n2.c cVar4 = cVar2;
                                b2.f fVar4 = fVar2;
                                Function3 function36 = i23 == 0 ? qw.b.f84336b : function32;
                                i2.a(null, null, x1.f.d(1080821659, new qw.o(url, imageLoader, z13, cVar4, function35, function36, tVar, fVar4, lVar4, tVar3), tVar6), tVar6, 3072, 7);
                                tVar4 = tVar6;
                                cVar3 = cVar4;
                                lVar3 = lVar4;
                                function33 = function35;
                                tVar5 = tVar3;
                                function34 = function36;
                                fVar3 = fVar4;
                                z12 = z13;
                            }
                            t1VarU = tVar4.u();
                            if (t1VarU == null) {
                                t1VarU.f81583d = new Function2() { // from class: qw.m
                                    @Override // kotlin.jvm.functions.Function2
                                    public final Object invoke(Object obj, Object obj2) {
                                        ((Integer) obj2).getClass();
                                        a1.b(url, imageLoader, tVar, lVar3, tVar5, cVar3, fVar3, z12, function33, function34, (p1.o) obj, a0.l(i5 | 1), a0.l(i11), i12);
                                        return Unit.f71706a;
                                    }
                                };
                                return;
                            }
                            return;
                        }
                        i18 |= 805306368;
                        i21 = i19;
                        i22 = i12 & 1024;
                        if (i22 == 0) {
                        }
                        if ((i18 & 306783379) != 306783378) {
                            if (i25 != 0) {
                            }
                            if (i14 != 0) {
                            }
                            if (i15 != 0) {
                            }
                            if (i16 != 0) {
                            }
                            if (i17 == 0) {
                            }
                            if (i21 == 0) {
                            }
                            z2.l lVar42 = lVar2;
                            n2.c cVar42 = cVar2;
                            b2.f fVar42 = fVar2;
                            Function3 function362 = i23 == 0 ? qw.b.f84336b : function32;
                            i2.a(null, null, x1.f.d(1080821659, new qw.o(url, imageLoader, z13, cVar42, function35, function362, tVar, fVar42, lVar42, tVar3), tVar6), tVar6, 3072, 7);
                            tVar4 = tVar6;
                            cVar3 = cVar42;
                            lVar3 = lVar42;
                            function33 = function35;
                            tVar5 = tVar3;
                            function34 = function362;
                            fVar3 = fVar42;
                            z12 = z13;
                        }
                        t1VarU = tVar4.u();
                        if (t1VarU == null) {
                        }
                    }
                    i18 = i13;
                    i19 = i12 & EventBridgeChannel.QUEUE_CAPACITY;
                    if (i19 == 0) {
                    }
                    i21 = i19;
                    i22 = i12 & 1024;
                    if (i22 == 0) {
                    }
                    if ((i18 & 306783379) != 306783378) {
                    }
                    t1VarU = tVar4.u();
                    if (t1VarU == null) {
                    }
                }
                cVar2 = cVar;
                i16 = i12 & 128;
                if (i16 == 0) {
                }
                i17 = i12 & 256;
                if (i17 == 0) {
                }
                i18 = i13;
                i19 = i12 & EventBridgeChannel.QUEUE_CAPACITY;
                if (i19 == 0) {
                }
                i21 = i19;
                i22 = i12 & 1024;
                if (i22 == 0) {
                }
                if ((i18 & 306783379) != 306783378) {
                }
                t1VarU = tVar4.u();
                if (t1VarU == null) {
                }
            }
            tVar3 = tVar2;
            i15 = i12 & 64;
            if (i15 != 0) {
            }
            cVar2 = cVar;
            i16 = i12 & 128;
            if (i16 == 0) {
            }
            i17 = i12 & 256;
            if (i17 == 0) {
            }
            i18 = i13;
            i19 = i12 & EventBridgeChannel.QUEUE_CAPACITY;
            if (i19 == 0) {
            }
            i21 = i19;
            i22 = i12 & 1024;
            if (i22 == 0) {
            }
            if ((i18 & 306783379) != 306783378) {
            }
            t1VarU = tVar4.u();
            if (t1VarU == null) {
            }
        }
        lVar2 = lVar;
        i14 = i12 & 32;
        if (i14 == 0) {
        }
        tVar3 = tVar2;
        i15 = i12 & 64;
        if (i15 != 0) {
        }
        cVar2 = cVar;
        i16 = i12 & 128;
        if (i16 == 0) {
        }
        i17 = i12 & 256;
        if (i17 == 0) {
        }
        i18 = i13;
        i19 = i12 & EventBridgeChannel.QUEUE_CAPACITY;
        if (i19 == 0) {
        }
        i21 = i19;
        i22 = i12 & 1024;
        if (i22 == 0) {
        }
        if ((i18 & 306783379) != 306783378) {
        }
        t1VarU = tVar4.u();
        if (t1VarU == null) {
        }
    }

    public static final void d(v70.z zVar, Throwable th2) {
        if (th2 != null) {
            cancellationExceptionA = th2 instanceof CancellationException ? (CancellationException) th2 : null;
            if (cancellationExceptionA == null) {
                cancellationExceptionA = ph.a.a("Channel was consumed, consumer had failed", th2);
            }
        }
        zVar.c(cancellationExceptionA);
    }

    public static final boolean e(KeyEvent keyEvent) {
        return keyEvent.getKeyCode() == 4 && t2.c.x(keyEvent) == 1;
    }

    public static final rr.a f(FinancialConnectionsSheetActivityArgs financialConnectionsSheetActivityArgs) {
        Intrinsics.g(financialConnectionsSheetActivityArgs, "<this>");
        if (financialConnectionsSheetActivityArgs instanceof FinancialConnectionsSheetActivityArgs.ForData) {
            return rr.a.f86142a;
        }
        if (financialConnectionsSheetActivityArgs instanceof FinancialConnectionsSheetActivityArgs.ForInstantDebits) {
            return rr.a.f86143b;
        }
        if (financialConnectionsSheetActivityArgs instanceof FinancialConnectionsSheetActivityArgs.ForToken) {
            return rr.a.f86144c;
        }
        throw new NoWhenBranchMatchedException();
    }

    public static String g(Class cls) {
        LinkedHashMap linkedHashMap = b1.f82141b;
        String strValue = (String) linkedHashMap.get(cls);
        if (strValue == null) {
            y0 y0Var = (y0) cls.getAnnotation(y0.class);
            strValue = y0Var != null ? y0Var.value() : null;
            if (strValue == null || strValue.length() <= 0) {
                throw new IllegalArgumentException("No @Navigator.Name annotation found for ".concat(cls.getSimpleName()).toString());
            }
            linkedHashMap.put(cls, strValue);
        }
        Intrinsics.d(strValue);
        return strValue;
    }

    public static final Set h(Set set) {
        Intrinsics.g(set, "set");
        Set setUnmodifiableSet = Collections.unmodifiableSet(b70.g.N1(set));
        Intrinsics.f(setUnmodifiableSet, "unmodifiableSet(set.toSet())");
        return setUnmodifiableSet;
    }

    public static final Map i(LinkedHashMap linkedHashMap) {
        Map mapUnmodifiableMap = Collections.unmodifiableMap(linkedHashMap);
        Intrinsics.f(mapUnmodifiableMap, "unmodifiableMap(map)");
        return mapUnmodifiableMap;
    }

    /* JADX WARN: Code restructure failed: missing block: B:6:0x0011, code lost:
    
        if (cy.d0.x(r1) != false) goto L7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean j() {
        try {
            Context context = mx.g0.f77088a;
            Context contextE = mx.g0.e();
            if (!tx.q0.c(contextE)) {
            }
            return true;
        } catch (Throwable unused) {
        }
        zy.c cVar = zy.c.f98823a;
        return zy.c.d("nova_ai_enabled", true);
    }

    public static List k(Object... objArr) {
        int length = objArr.length;
        return length != 0 ? length != 1 ? Collections.unmodifiableList(Arrays.asList(objArr)) : Collections.singletonList(objArr[0]) : Collections.EMPTY_LIST;
    }

    public static int l(z2.c0 c0Var, z2.t tVar, z2.s sVar, int i5) {
        return c0Var.mo295measure3p2s80s(new z2.x(tVar, tVar.getLayoutDirection()), new z2.u0(sVar, z2.w0.f98170b, z2.x0.f98175b), y3.b.b(i5, 0, 13)).getHeight();
    }

    public static int m(z2.c0 c0Var, z2.t tVar, z2.s sVar, int i5) {
        return c0Var.mo295measure3p2s80s(new z2.x(tVar, tVar.getLayoutDirection()), new z2.u0(sVar, z2.w0.f98170b, z2.x0.f98174a), y3.b.b(0, i5, 7)).getWidth();
    }

    public static int n(z2.c0 c0Var, z2.t tVar, z2.s sVar, int i5) {
        return c0Var.mo295measure3p2s80s(new z2.x(tVar, tVar.getLayoutDirection()), new z2.u0(sVar, z2.w0.f98169a, z2.x0.f98175b), y3.b.b(i5, 0, 13)).getHeight();
    }

    public static int o(z2.c0 c0Var, z2.t tVar, z2.s sVar, int i5) {
        return c0Var.mo295measure3p2s80s(new z2.x(tVar, tVar.getLayoutDirection()), new z2.u0(sVar, z2.w0.f98169a, z2.x0.f98174a), y3.b.b(0, i5, 7)).getWidth();
    }

    public static ProactiveGenerationConfig p() {
        Set setF1 = kotlin.collections.c.f1(new AiTier[]{AiTier.PLUS, AiTier.PRO});
        zy.c cVar = zy.c.f98823a;
        long j11 = 60;
        return new ProactiveGenerationConfig(zy.c.g("nova_ai_proactive_target_pool_size", 3), 0, 0, zy.c.g("nova_ai_proactive_starved_batch_size", 1), zy.c.g("nova_ai_proactive_min_interval_minutes", 45) * j11 * 1000, zy.c.g("nova_ai_proactive_meta_refresh_hours", 6) * j11 * j11 * 1000, zy.c.g("nova_ai_proactive_max_parallel_generations", 1), zy.c.g("nova_ai_proactive_impression_refill_min_minutes", 45) * j11 * 1000, false, true, setF1, 262, null).sanitized();
    }

    public static long q(int i5, int i11, com.google.android.gms.internal.consent_sdk.a aVar) {
        aVar.Y(i5);
        if (aVar.g() < 5) {
            return -9223372036854775807L;
        }
        int iA = aVar.A();
        if ((8388608 & iA) != 0 || ((2096896 & iA) >> 8) != i11 || (iA & 32) == 0 || aVar.N() < 7 || aVar.g() < 7 || (aVar.N() & 16) != 16) {
            return -9223372036854775807L;
        }
        aVar.z(0, 6, new byte[6]);
        return ((255 & r0[4]) >> 7) | ((r0[0] & 255) << 25) | ((r0[1] & 255) << 17) | ((r0[2] & 255) << 9) | ((r0[3] & 255) << 1);
    }

    public static final void r(RuntimeException runtimeException, Function0 function0) {
        try {
            int i5 = Result.f71687b;
            Boolean bool = NovaApplication.f45635g;
            if (fg.a.n()) {
                function0.invoke();
                zy.c cVar = zy.c.f98823a;
                zy.c.j(runtimeException);
                Unit unit = Unit.f71706a;
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
    }

    public static void s(RuntimeException runtimeException) {
        try {
            int i5 = Result.f71687b;
            Boolean bool = NovaApplication.f45635g;
            if (fg.a.n()) {
                Unit unit = Unit.f71706a;
                zy.c cVar = zy.c.f98823a;
                zy.c.j(runtimeException);
                Unit unit2 = Unit.f71706a;
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
    }

    public static boolean t() {
        try {
            if (y2.f51877a.X0().l() == q2.f89961d) {
                return false;
            }
        } catch (Throwable unused) {
        }
        if (!j()) {
            return false;
        }
        zy.c cVar = zy.c.f98823a;
        return zy.c.d("nova_ai_search_suggestion_enabled", true);
    }

    public static final int u(int i5, String str) {
        if (str == null) {
            return i5;
        }
        switch (str.hashCode()) {
            case -1765633026:
                if (str.equals("capitalone")) {
                    return 2131232140;
                }
                return i5;
            case -1716678772:
                if (str.equals("suntrust")) {
                    return 2131232149;
                }
                return i5;
            case -1435862505:
                if (str.equals("citibank")) {
                    return 2131232141;
                }
                return i5;
            case -891985843:
                if (str.equals("stripe")) {
                    return 2131232148;
                }
                return i5;
            case -836135462:
                if (str.equals("usbank")) {
                    return 2131232153;
                }
                return i5;
            case -270531414:
                if (str.equals("morganchase")) {
                    return 2131232145;
                }
                return i5;
            case -78918662:
                if (str.equals("wellsfargo")) {
                    return 2131232154;
                }
                return i5;
            case 3696:
                if (str.equals("td")) {
                    return 2131232151;
                }
                return i5;
            case 97716:
                if (str.equals("boa")) {
                    return 2131232139;
                }
                return i5;
            case 111141:
                if (str.equals("pnc")) {
                    return 2131232147;
                }
                return i5;
            case 114271:
                if (str.equals("svb")) {
                    return 2131232150;
                }
                return i5;
            case 3378218:
                if (str.equals("nfcu")) {
                    return 2131232146;
                }
                return i5;
            case 3599166:
                if (str.equals("usaa")) {
                    return 2131232152;
                }
                return i5;
            case 950484242:
                if (str.equals("compass")) {
                    return 2131232142;
                }
                return i5;
            default:
                return i5;
        }
    }
}
