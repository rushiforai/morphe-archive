package ps;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Typeface;
import android.view.View;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b.u4;
import c0.x0;
import com.android.launcher3.icons.BitmapInfo;
import com.google.android.play.core.integrity.StandardIntegrityException;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.instabridge.mobilesdk.internal.ui.screens.n1;
import com.stripe.attestation.AttestationError;
import com.teslacoilsw.launcher.launcher3.NovaBitmapInfo;
import e10.y2;
import f1.t0;
import f1.u0;
import h6.o1;
import h6.y0;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import k0.i2;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import p1.t1;
import p6.b1;
import p6.z0;

/* loaded from: classes4.dex */
public abstract class i0 {
    public static final void a(b2.t tVar, p1.o oVar, int i5, int i11) {
        int i12;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1171193611);
        int i13 = i11 & 1;
        if (i13 != 0) {
            i12 = i5 | 6;
        } else if ((i5 & 6) == 0) {
            i12 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i12 & 3) == 2 && tVar2.E()) {
            tVar2.V();
        } else {
            if (i13 != 0) {
                tVar = b2.r.f17024a;
            }
            d(0, 2, 0L, androidx.compose.foundation.layout.e.g(androidx.compose.foundation.layout.e.e(tVar, 1.0f), a.a.M(tVar2, 2131166476)), tVar2);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new n1(i5, i11, 2, tVar);
        }
    }

    public static u20.m b(BitmapInfo bitmapInfo) {
        List listP = ul.b.P(new Pair(null, bitmapInfo.f21151a));
        NovaBitmapInfo novaBitmapInfo = bitmapInfo instanceof NovaBitmapInfo ? (NovaBitmapInfo) bitmapInfo : null;
        boolean z11 = false;
        if (novaBitmapInfo != null && novaBitmapInfo.f45811e) {
            z11 = true;
        }
        return new u20.m(listP, z11);
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0123  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x013f  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:91:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void c(final b2.t tVar, long j11, long j12, float f11, p1.o oVar, final int i5, final int i11) {
        int i12;
        float f12;
        float f13;
        long j13;
        long j14;
        c0.j0 j0VarA;
        boolean zF;
        Object objP;
        long j15;
        final long j16;
        final float f14;
        final long j17;
        t1 t1VarU;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(459278094);
        if ((i5 & 6) == 0) {
            i12 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        long j18 = j11;
        long j19 = j12;
        int i13 = i12 | (((i11 & 2) == 0 && tVar2.e(j18)) ? 32 : 16) | (((i11 & 4) == 0 && tVar2.e(j19)) ? 256 : 128);
        int i14 = i11 & 8;
        if (i14 == 0) {
            if ((i5 & 3072) == 0) {
                f12 = f11;
                i13 |= tVar2.c(f12) ? 2048 : 1024;
            }
            if ((i13 & 1171) == 1170 || !tVar2.E()) {
                tVar2.X();
                if ((i5 & 1) != 0 || tVar2.B()) {
                    if ((i11 & 2) != 0) {
                        tVar2.b0(-443512897);
                        os.b bVar = (os.b) tVar2.j(os.g.f80779c);
                        tVar2.p(false);
                        j18 = bVar.f80759y;
                        i13 &= -113;
                    }
                    if ((i11 & 4) != 0) {
                        tVar2.b0(-443512897);
                        os.b bVar2 = (os.b) tVar2.j(os.g.f80779c);
                        tVar2.p(false);
                        j19 = bVar2.f80740d;
                        i13 &= -897;
                    }
                    if (i14 == 0) {
                        f13 = 6;
                        j13 = j19;
                    }
                    tVar2.q();
                    j14 = j13;
                    j0VarA = c0.v.a(c0.v.c(null, tVar2, 1), 0.0f, 360.0f, c0.f.f(c0.f.i(1200, 0, null, 6), x0.f19005a, 4), null, tVar2, 4536, 8);
                    tVar2.b0(2130810875);
                    zF = ((i13 & 7168) == 2048) | ((((i13 & 896) ^ 384) > 256 && tVar2.e(j14)) || (i13 & 384) == 256) | tVar2.f(j0VarA) | ((((i13 & 112) ^ 48) > 32 && tVar2.e(j18)) || (i13 & 48) == 32);
                    objP = tVar2.P();
                    if (zF || objP == p1.n.f81514a) {
                        j15 = j18;
                        objP = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer.j(f13, j14, j15, j0VarA);
                        tVar2.m0(objP);
                    } else {
                        j15 = j18;
                    }
                    tVar2.p(false);
                    ic.b.g(i13 & 14, tVar, (Function1) objP, tVar2);
                    j16 = j14;
                    f14 = f13;
                    j17 = j15;
                } else {
                    tVar2.V();
                    if ((i11 & 2) != 0) {
                        i13 &= -113;
                    }
                    if ((i11 & 4) != 0) {
                        i13 &= -897;
                    }
                }
                j13 = j19;
                f13 = f12;
                tVar2.q();
                j14 = j13;
                j0VarA = c0.v.a(c0.v.c(null, tVar2, 1), 0.0f, 360.0f, c0.f.f(c0.f.i(1200, 0, null, 6), x0.f19005a, 4), null, tVar2, 4536, 8);
                tVar2.b0(2130810875);
                if (((i13 & 896) ^ 384) > 256) {
                    if (((i13 & 112) ^ 48) > 32) {
                        zF = ((i13 & 7168) == 2048) | ((((i13 & 896) ^ 384) > 256 && tVar2.e(j14)) || (i13 & 384) == 256) | tVar2.f(j0VarA) | ((((i13 & 112) ^ 48) > 32 && tVar2.e(j18)) || (i13 & 48) == 32);
                        objP = tVar2.P();
                        if (zF) {
                            j15 = j18;
                            objP = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer.j(f13, j14, j15, j0VarA);
                            tVar2.m0(objP);
                            tVar2.p(false);
                            ic.b.g(i13 & 14, tVar, (Function1) objP, tVar2);
                            j16 = j14;
                            f14 = f13;
                            j17 = j15;
                        }
                    } else {
                        zF = ((i13 & 7168) == 2048) | ((((i13 & 896) ^ 384) > 256 && tVar2.e(j14)) || (i13 & 384) == 256) | tVar2.f(j0VarA) | ((((i13 & 112) ^ 48) > 32 && tVar2.e(j18)) || (i13 & 48) == 32);
                        objP = tVar2.P();
                        if (zF) {
                        }
                    }
                }
            } else {
                tVar2.V();
                j17 = j18;
                j16 = j19;
                f14 = f12;
            }
            t1VarU = tVar2.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new Function2() { // from class: ps.h0
                    @Override // kotlin.jvm.functions.Function2
                    public final Object invoke(Object obj, Object obj2) {
                        ((Integer) obj2).getClass();
                        i0.c(tVar, j17, j16, f14, (p1.o) obj, p1.a0.l(i5 | 1), i11);
                        return Unit.f71706a;
                    }
                };
                return;
            }
            return;
        }
        i13 |= 3072;
        f12 = f11;
        if ((i13 & 1171) == 1170) {
            tVar2.X();
            if ((i5 & 1) != 0) {
                if ((i11 & 2) != 0) {
                }
                if ((i11 & 4) != 0) {
                }
                if (i14 == 0) {
                    j13 = j19;
                    f13 = f12;
                }
                tVar2.q();
                j14 = j13;
                j0VarA = c0.v.a(c0.v.c(null, tVar2, 1), 0.0f, 360.0f, c0.f.f(c0.f.i(1200, 0, null, 6), x0.f19005a, 4), null, tVar2, 4536, 8);
                tVar2.b0(2130810875);
            }
        }
        t1VarU = tVar2.u();
        if (t1VarU == null) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:49:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void d(int i5, int i11, long j11, b2.t tVar, p1.o oVar) {
        int i12;
        long jE;
        int i13;
        int iHashCode;
        b3.i iVar;
        t1 t1VarU;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1933914630);
        if ((i5 & 6) == 0) {
            i12 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i11 & 2) == 0) {
            jE = j11;
            int i14 = tVar2.e(jE) ? 32 : 16;
            i13 = i12 | i14;
            if ((i13 & 19) == 18 || !tVar2.E()) {
                tVar2.X();
                if ((i5 & 1) != 0 || tVar2.B()) {
                    if ((i11 & 2) != 0) {
                        jE = ((t0) tVar2.j(u0.f54013a)).e();
                        i13 &= -113;
                    }
                    long j12 = jE;
                    tVar2.q();
                    float fM = a.a.M(tVar2, 2131166477);
                    float fM2 = a.a.M(tVar2, 2131166478);
                    z2.r0 r0VarD = k0.p.d(b2.d.f17001e, false);
                    iHashCode = Long.hashCode(tVar2.T);
                    p1.n1 n1VarL = tVar2.l();
                    b2.t tVarI = fg.a.I(tVar, tVar2);
                    b3.l.Po.getClass();
                    Function0 function0 = b3.k.f17270b;
                    tVar2.f0();
                    if (tVar2.S) {
                        tVar2.k(function0);
                    } else {
                        tVar2.p0();
                    }
                    p1.a0.j(r0VarD, b3.k.f17275g, tVar2);
                    p1.a0.j(n1VarL, b3.k.f17274f, tVar2);
                    iVar = b3.k.f17278j;
                    if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                        a2.c.u(iHashCode, tVar2, iHashCode, iVar);
                    }
                    p1.a0.j(tVarI, b3.k.f17272d, tVar2);
                    wh.f.e(androidx.compose.foundation.layout.e.o(b2.r.f17024a, fM), j12, fM2, 0L, tVar2, i13 & 112);
                    tVar2.p(true);
                    jE = j12;
                } else {
                    tVar2.V();
                    if ((i11 & 2) != 0) {
                        i13 &= -113;
                    }
                    long j122 = jE;
                    tVar2.q();
                    float fM3 = a.a.M(tVar2, 2131166477);
                    float fM22 = a.a.M(tVar2, 2131166478);
                    z2.r0 r0VarD2 = k0.p.d(b2.d.f17001e, false);
                    iHashCode = Long.hashCode(tVar2.T);
                    p1.n1 n1VarL2 = tVar2.l();
                    b2.t tVarI2 = fg.a.I(tVar, tVar2);
                    b3.l.Po.getClass();
                    Function0 function02 = b3.k.f17270b;
                    tVar2.f0();
                    if (tVar2.S) {
                    }
                    p1.a0.j(r0VarD2, b3.k.f17275g, tVar2);
                    p1.a0.j(n1VarL2, b3.k.f17274f, tVar2);
                    iVar = b3.k.f17278j;
                    if (tVar2.S) {
                        a2.c.u(iHashCode, tVar2, iHashCode, iVar);
                        p1.a0.j(tVarI2, b3.k.f17272d, tVar2);
                        wh.f.e(androidx.compose.foundation.layout.e.o(b2.r.f17024a, fM3), j122, fM22, 0L, tVar2, i13 & 112);
                        tVar2.p(true);
                        jE = j122;
                    }
                }
            } else {
                tVar2.V();
            }
            t1VarU = tVar2.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new mo.b(tVar, jE, i5, i11);
                return;
            }
            return;
        }
        jE = j11;
        i13 = i12 | i14;
        if ((i13 & 19) == 18) {
            tVar2.X();
            if ((i5 & 1) != 0) {
                if ((i11 & 2) != 0) {
                }
                long j1222 = jE;
                tVar2.q();
                float fM32 = a.a.M(tVar2, 2131166477);
                float fM222 = a.a.M(tVar2, 2131166478);
                z2.r0 r0VarD22 = k0.p.d(b2.d.f17001e, false);
                iHashCode = Long.hashCode(tVar2.T);
                p1.n1 n1VarL22 = tVar2.l();
                b2.t tVarI22 = fg.a.I(tVar, tVar2);
                b3.l.Po.getClass();
                Function0 function022 = b3.k.f17270b;
                tVar2.f0();
                if (tVar2.S) {
                }
                p1.a0.j(r0VarD22, b3.k.f17275g, tVar2);
                p1.a0.j(n1VarL22, b3.k.f17274f, tVar2);
                iVar = b3.k.f17278j;
                if (tVar2.S) {
                }
            }
        }
        t1VarU = tVar2.u();
        if (t1VarU == null) {
        }
    }

    public static final void e(List list, t00.y yVar, b2.t tVar, p1.o oVar, int i5) {
        b2.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(1892004952);
        int i11 = (tVar3.h(list) ? 4 : 2) | i5;
        if ((i5 & 48) == 0) {
            i11 |= tVar3.f(yVar) ? 32 : 16;
        }
        int i12 = i11 | 384;
        if ((i12 & 147) == 146 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
        } else {
            x1.e eVarD = x1.f.d(-1819316158, new iy.i0(i12, list, yVar), tVar3);
            b2.r rVar = b2.r.f17024a;
            i2.a(rVar, null, eVarD, tVar3, 3078, 6);
            tVar2 = rVar;
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a1.f(list, yVar, tVar2, i5, 23);
        }
    }

    public static String f(String str, Object... objArr) {
        int length;
        int length2;
        int iIndexOf;
        String strN;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            length = objArr.length;
            if (i11 >= length) {
                break;
            }
            Object obj = objArr[i11];
            if (obj == null) {
                strN = AbstractJsonLexerKt.NULL;
            } else {
                try {
                    strN = obj.toString();
                } catch (Exception e3) {
                    String strM = u4.m(obj.getClass().getName(), "@", Integer.toHexString(System.identityHashCode(obj)));
                    Logger.getLogger("com.google.common.base.Strings").logp(Level.WARNING, "com.google.common.base.Strings", "lenientToString", "Exception during lenientFormat for ".concat(strM), (Throwable) e3);
                    strN = b.c0.n("<", strM, " threw ", e3.getClass().getName(), ">");
                }
            }
            objArr[i11] = strN;
            i11++;
        }
        StringBuilder sb2 = new StringBuilder(str.length() + (length * 16));
        int i12 = 0;
        while (true) {
            length2 = objArr.length;
            if (i5 >= length2 || (iIndexOf = str.indexOf("%s", i12)) == -1) {
                break;
            }
            sb2.append((CharSequence) str, i12, iIndexOf);
            sb2.append(objArr[i5]);
            i5++;
            i12 = iIndexOf + 2;
        }
        sb2.append((CharSequence) str, i12, str.length());
        if (i5 < length2) {
            sb2.append(" [");
            sb2.append(objArr[i5]);
            for (int i13 = i5 + 1; i13 < objArr.length; i13++) {
                sb2.append(", ");
                sb2.append(objArr[i13]);
            }
            sb2.append(AbstractJsonLexerKt.END_LIST);
        }
        return sb2.toString();
    }

    public static final p6.l0 g(Context context) {
        Intrinsics.g(context, "context");
        p6.l0 l0Var = new p6.l0(context);
        b1 b1Var = l0Var.f82271v;
        b1Var.a(new q6.g(b1Var));
        l0Var.f82271v.a(new q6.i());
        l0Var.f82271v.a(new q6.o());
        return l0Var;
    }

    public static final void h(String str, char[] cArr, int i5) {
        j0.t(str, cArr, i5, 0, str.length());
    }

    public static void i(Object obj) {
        if (obj == null) {
            throw new NullPointerException("Cannot return null from a non-@Nullable @Provides method");
        }
    }

    public static final void j(View view, Function2 function2) {
        h6.a0 a0VarC = y0.c(view);
        o1 o1VarD = y0.d(view);
        if (a0VarC == null || o1VarD == null) {
            return;
        }
        Context applicationContext = view.getContext().getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        dv.r rVar = new dv.r(applicationContext, 2);
        h6.n1 store = o1VarD.getViewModelStore();
        k6.c defaultCreationExtras = o1VarD instanceof h6.n ? ((h6.n) o1VarD).getDefaultViewModelCreationExtras() : k6.a.f71149b;
        Intrinsics.g(store, "store");
        Intrinsics.g(defaultCreationExtras, "defaultCreationExtras");
        x7.n nVar = new x7.n(store, rVar, defaultCreationExtras);
        KClass modelClass = JvmClassMappingKt.e(ww.v.class);
        Intrinsics.g(modelClass, "modelClass");
        String qualifiedName = modelClass.getQualifiedName();
        if (qualifiedName == null) {
            throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
        }
        function2.invoke(a0VarC, (ww.v) nVar.m(modelClass, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(qualifiedName)));
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [java.lang.Object, java.util.Map] */
    public static AttestationError k(Throwable th2) {
        if (!(th2 instanceof StandardIntegrityException)) {
            xw.a aVar = xw.a.f96438a;
            return new AttestationError("An unknown error occurred", th2);
        }
        if (((xw.a) AttestationError.f45518a.get(Integer.valueOf(((StandardIntegrityException) th2).f31794a.f31810f))) == null) {
            xw.a aVar2 = xw.a.f96438a;
        }
        String message = th2.getMessage();
        if (message == null) {
            message = "Integrity error occurred";
        }
        return new AttestationError(message, th2);
    }

    public static final List n(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("id");
        int columnIndex2 = cursor.getColumnIndex("seq");
        int columnIndex3 = cursor.getColumnIndex("from");
        int columnIndex4 = cursor.getColumnIndex("to");
        ListBuilder listBuilderW = ul.b.w();
        while (cursor.moveToNext()) {
            int i5 = cursor.getInt(columnIndex);
            int i11 = cursor.getInt(columnIndex2);
            String string = cursor.getString(columnIndex3);
            Intrinsics.f(string, "cursor.getString(fromColumnIndex)");
            String string2 = cursor.getString(columnIndex4);
            Intrinsics.f(string2, "cursor.getString(toColumnIndex)");
            listBuilderW.add(new z6.c(i5, i11, string, string2));
        }
        return b70.g.C1(ul.b.m(listBuilderW));
    }

    public static final z6.d o(d7.a aVar, String str, boolean z11) throws IOException {
        Cursor cursorQuery = aVar.query("PRAGMA index_xinfo(`" + str + "`)");
        try {
            int columnIndex = cursorQuery.getColumnIndex("seqno");
            int columnIndex2 = cursorQuery.getColumnIndex("cid");
            int columnIndex3 = cursorQuery.getColumnIndex(PendingUpgradeStore.KEY_NAME);
            int columnIndex4 = cursorQuery.getColumnIndex("desc");
            if (columnIndex != -1 && columnIndex2 != -1 && columnIndex3 != -1 && columnIndex4 != -1) {
                TreeMap treeMap = new TreeMap();
                TreeMap treeMap2 = new TreeMap();
                while (cursorQuery.moveToNext()) {
                    if (cursorQuery.getInt(columnIndex2) >= 0) {
                        int i5 = cursorQuery.getInt(columnIndex);
                        String columnName = cursorQuery.getString(columnIndex3);
                        String str2 = cursorQuery.getInt(columnIndex4) > 0 ? "DESC" : "ASC";
                        Integer numValueOf = Integer.valueOf(i5);
                        Intrinsics.f(columnName, "columnName");
                        treeMap.put(numValueOf, columnName);
                        treeMap2.put(Integer.valueOf(i5), str2);
                    }
                }
                Collection collectionValues = treeMap.values();
                Intrinsics.f(collectionValues, "columnsMap.values");
                List listI1 = b70.g.I1(collectionValues);
                Collection collectionValues2 = treeMap2.values();
                Intrinsics.f(collectionValues2, "ordersMap.values");
                z6.d dVar = new z6.d(str, z11, listI1, b70.g.I1(collectionValues2));
                cursorQuery.close();
                return dVar;
            }
            cursorQuery.close();
            return null;
        } finally {
        }
    }

    public static final p6.l0 p(z0[] z0VarArr, p1.o oVar) {
        p1.t tVar = (p1.t) oVar;
        Context context = (Context) tVar.j(AndroidCompositionLocals_androidKt.f14166b);
        Object[] objArrCopyOf = Arrays.copyOf(z0VarArr, z0VarArr.length);
        ab.c0 c0Var = new ab.c0(7, q6.p.f83712j, new q6.q(context, 0));
        boolean zH = tVar.h(context);
        Object objP = tVar.P();
        if (zH || objP == p1.n.f81514a) {
            objP = new q6.r(context, 0);
            tVar.m0(objP);
        }
        p6.l0 l0Var = (p6.l0) y1.j.e(objArrCopyOf, c0Var, (Function0) objP, tVar, 0, 4);
        for (z0 z0Var : z0VarArr) {
            l0Var.f82271v.a(z0Var);
        }
        return l0Var;
    }

    public static void q(Context context, uy.s sVar, boolean z11) {
        iz.c cVar = sVar.f91756h;
        cVar.f68417a = cVar.g(128, !z11);
        if (sVar instanceof uy.m) {
            y2.f51877a.getClass();
            y2.b0().i(Boolean.valueOf(((uy.m) sVar).d()));
        } else {
            uy.s sVarH = uy.d0.f91699e.h(sVar.f91753e);
            iz.c cVar2 = sVarH.f91756h;
            cVar2.f68417a = cVar2.g(128, !sVar.d());
            iz.c cVar3 = sVarH.f91756h;
            cVar3.f68417a = cVar3.g(256, true);
            if (sVarH.e() && sVar.d()) {
                y2.f51877a.getClass();
                y2.V().i(Boolean.TRUE);
                Activity activity = context instanceof Activity ? (Activity) context : null;
                if (activity != null) {
                    o10.b.a("smart_folder_created", activity);
                }
            }
            uy.o oVarA = sVarH.a();
            oVarA.f(sVarH.f91756h);
            oVarA.c(context.getContentResolver(), true);
        }
        uy.d0.f91699e.r(context);
    }

    public abstract void l(int i5);

    public abstract void m(Typeface typeface, boolean z11);
}
