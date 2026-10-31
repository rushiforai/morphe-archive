package ps;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.BadParcelableException;
import android.os.Build;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.inputmethod.CursorAnchorInfo;
import androidx.compose.ui.ZIndexElement;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b.i1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import com.stripe.android.stripe3ds2.transactions.ErrorData;
import com.vungle.ads.internal.protos.Sdk;
import cw.l2;
import e0.a2;
import e0.y1;
import e00.p6;
import e10.z2;
import h6.f1;
import h6.o1;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.WeakHashMap;
import k0.h2;
import k0.i2;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.math.MathKt;
import l1.d1;
import l1.g1;
import l1.j3;
import l1.t7;
import org.json.JSONObject;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import p1.n1;
import p1.r1;
import p1.t1;
import p1.y2;

/* loaded from: classes4.dex */
public abstract class e0 {
    public static void A(Drawable drawable, int i5) {
        drawable.setTint(i5);
    }

    public static void B(Drawable drawable, ColorStateList colorStateList) {
        drawable.setTintList(colorStateList);
    }

    public static void C(Drawable drawable, PorterDuff.Mode mode) {
        drawable.setTintMode(mode);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static Drawable D(Drawable drawable) {
        if (!(drawable instanceof s4.a)) {
            return drawable;
        }
        ((s4.b) ((s4.a) drawable)).getClass();
        return null;
    }

    public static Parcelable E(Parcel parcel, Parcelable.Creator creator) {
        if (parcel.readInt() == 0) {
            return null;
        }
        return (Parcelable) creator.createFromParcel(parcel);
    }

    public static void F(Parcel parcel) {
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(b.c0.h(iDataAvail, "Parcel data not fully consumed, unread size: "));
        }
    }

    public static void G(Parcel parcel, Parcelable parcelable) {
        if (parcelable == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcelable.writeToParcel(parcel, 0);
        }
    }

    public static void H(Parcel parcel, IInterface iInterface) {
        parcel.writeStrongBinder(iInterface.asBinder());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0199  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x01b8  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01fd  */
    /* JADX WARN: Removed duplicated region for block: B:87:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r2v2, types: [x1.e] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(x1.e eVar, x1.e eVar2, b2.t tVar, a2 a2Var, p1.o oVar, int i5, int i11) {
        int i12;
        b2.t tVar2;
        a2 a2Var2;
        int i13;
        a2 a2VarN;
        int i14;
        b2.t tVar3;
        Object objP;
        int iHashCode;
        b3.i iVar;
        p1.t tVar4;
        int iHashCode2;
        b2.t tVar5;
        p1.t tVar6;
        x1.e eVar3;
        t1 t1VarU;
        x1.e eVar4 = eVar2;
        p1.t tVar7 = (p1.t) oVar;
        tVar7.d0(-2112893485);
        if ((i5 & 6) == 0) {
            i12 = (tVar7.h(eVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar7.h(eVar4) ? 32 : 16;
        }
        int i15 = i11 & 4;
        if (i15 == 0) {
            if ((i5 & 384) == 0) {
                tVar2 = tVar;
                i12 |= tVar7.f(tVar2) ? 256 : 128;
            }
            if ((i5 & 3072) != 0) {
                if ((i11 & 8) == 0) {
                    a2Var2 = a2Var;
                    int i16 = tVar7.f(a2Var2) ? 2048 : 1024;
                    i12 |= i16;
                } else {
                    a2Var2 = a2Var;
                }
                i12 |= i16;
            } else {
                a2Var2 = a2Var;
            }
            if ((i12 & 1171) == 1170 || !tVar7.E()) {
                tVar7.X();
                i13 = i5 & 1;
                b2.r rVar = b2.r.f17024a;
                if (i13 != 0 || tVar7.B()) {
                    if (i15 != 0) {
                        tVar2 = rVar;
                    }
                    if ((i11 & 8) == 0) {
                        a2VarN = mk.v.N(tVar7);
                        i14 = i12 & (-7169);
                        tVar3 = tVar2;
                    }
                    tVar7.q();
                    tVar7.b0(398535721);
                    objP = tVar7.P();
                    if (objP == p1.n.f81514a) {
                        objP = androidx.compose.runtime.d.d(new y1(a2VarN, 2));
                        tVar7.m0(objP);
                    }
                    tVar7.p(false);
                    y2 y2VarA = c0.h.a(((y3.f) ((y2) objP).getValue()).f96602a, null, "PaymentSheetTopBarElevation", tVar7, 384, 10);
                    k0.e eVar5 = k0.k.f70657c;
                    b2.i iVar2 = b2.d.f17009m;
                    k0.x xVarA = k0.w.a(eVar5, iVar2, tVar7, 0);
                    iHashCode = Long.hashCode(tVar7.T);
                    n1 n1VarL = tVar7.l();
                    b2.t tVarI = fg.a.I(tVar3, tVar7);
                    b3.l.Po.getClass();
                    Function0 function0 = b3.k.f17270b;
                    tVar7.f0();
                    if (tVar7.S) {
                        tVar7.k(function0);
                    } else {
                        tVar7.p0();
                    }
                    b3.i iVar3 = b3.k.f17275g;
                    p1.a0.j(xVarA, iVar3, tVar7);
                    b3.i iVar4 = b3.k.f17274f;
                    p1.a0.j(n1VarL, iVar4, tVar7);
                    iVar = b3.k.f17278j;
                    b2.t tVar8 = tVar3;
                    if (tVar7.S || !Intrinsics.b(tVar7.P(), Integer.valueOf(iHashCode))) {
                        a2.c.u(iHashCode, tVar7, iHashCode, iVar);
                    }
                    b3.i iVar5 = b3.k.f17272d;
                    p1.a0.j(tVarI, iVar5, tVar7);
                    l2.j(new ZIndexElement(), null, 0L, 0L, null, ((y3.f) y2VarA.getValue()).f96602a, x1.f.d(791074657, new b00.i0(eVar, 23), tVar7), tVar7, 1572870, 30);
                    tVar4 = tVar7;
                    b2.t tVarQ = mk.v.Q(i2.f(rVar), a2VarN, false, 14);
                    k0.x xVarA2 = k0.w.a(eVar5, iVar2, tVar4, 0);
                    iHashCode2 = Long.hashCode(tVar4.T);
                    n1 n1VarL2 = tVar4.l();
                    b2.t tVarI2 = fg.a.I(tVarQ, tVar4);
                    tVar4.f0();
                    if (tVar4.S) {
                        tVar4.p0();
                    } else {
                        tVar4.k(function0);
                    }
                    p1.a0.j(xVarA2, iVar3, tVar4);
                    p1.a0.j(n1VarL2, iVar4, tVar4);
                    if (!tVar4.S || !Intrinsics.b(tVar4.P(), Integer.valueOf(iHashCode2))) {
                        a2.c.u(iHashCode2, tVar4, iHashCode2, iVar);
                    }
                    p1.a0.j(tVarI2, iVar5, tVar4);
                    i2.b(androidx.compose.foundation.layout.e.g(rVar, hw.p.f60770f.f60730b), tVar4);
                    ?? r22 = eVar2;
                    r22.invoke(tVar4, Integer.valueOf((i14 >> 3) & 14));
                    WeakHashMap weakHashMap = h2.f70617v;
                    i2.b(new k0.f0(k0.e.e(tVar4).f70622e), tVar4);
                    tVar4.p(true);
                    tVar4.p(true);
                    tVar5 = tVar8;
                    eVar3 = r22;
                    tVar6 = tVar4;
                } else {
                    tVar7.V();
                    if ((i11 & 8) != 0) {
                        i12 &= -7169;
                    }
                }
                i14 = i12;
                tVar3 = tVar2;
                a2VarN = a2Var2;
                tVar7.q();
                tVar7.b0(398535721);
                objP = tVar7.P();
                if (objP == p1.n.f81514a) {
                }
                tVar7.p(false);
                y2 y2VarA2 = c0.h.a(((y3.f) ((y2) objP).getValue()).f96602a, null, "PaymentSheetTopBarElevation", tVar7, 384, 10);
                k0.e eVar52 = k0.k.f70657c;
                b2.i iVar22 = b2.d.f17009m;
                k0.x xVarA3 = k0.w.a(eVar52, iVar22, tVar7, 0);
                iHashCode = Long.hashCode(tVar7.T);
                n1 n1VarL3 = tVar7.l();
                b2.t tVarI3 = fg.a.I(tVar3, tVar7);
                b3.l.Po.getClass();
                Function0 function02 = b3.k.f17270b;
                tVar7.f0();
                if (tVar7.S) {
                }
                b3.i iVar32 = b3.k.f17275g;
                p1.a0.j(xVarA3, iVar32, tVar7);
                b3.i iVar42 = b3.k.f17274f;
                p1.a0.j(n1VarL3, iVar42, tVar7);
                iVar = b3.k.f17278j;
                b2.t tVar82 = tVar3;
                if (tVar7.S) {
                    a2.c.u(iHashCode, tVar7, iHashCode, iVar);
                    b3.i iVar52 = b3.k.f17272d;
                    p1.a0.j(tVarI3, iVar52, tVar7);
                    l2.j(new ZIndexElement(), null, 0L, 0L, null, ((y3.f) y2VarA2.getValue()).f96602a, x1.f.d(791074657, new b00.i0(eVar, 23), tVar7), tVar7, 1572870, 30);
                    tVar4 = tVar7;
                    b2.t tVarQ2 = mk.v.Q(i2.f(rVar), a2VarN, false, 14);
                    k0.x xVarA22 = k0.w.a(eVar52, iVar22, tVar4, 0);
                    iHashCode2 = Long.hashCode(tVar4.T);
                    n1 n1VarL22 = tVar4.l();
                    b2.t tVarI22 = fg.a.I(tVarQ2, tVar4);
                    tVar4.f0();
                    if (tVar4.S) {
                    }
                    p1.a0.j(xVarA22, iVar32, tVar4);
                    p1.a0.j(n1VarL22, iVar42, tVar4);
                    if (!tVar4.S) {
                        a2.c.u(iHashCode2, tVar4, iHashCode2, iVar);
                        p1.a0.j(tVarI22, iVar52, tVar4);
                        i2.b(androidx.compose.foundation.layout.e.g(rVar, hw.p.f60770f.f60730b), tVar4);
                        ?? r222 = eVar2;
                        r222.invoke(tVar4, Integer.valueOf((i14 >> 3) & 14));
                        WeakHashMap weakHashMap2 = h2.f70617v;
                        i2.b(new k0.f0(k0.e.e(tVar4).f70622e), tVar4);
                        tVar4.p(true);
                        tVar4.p(true);
                        tVar5 = tVar82;
                        eVar3 = r222;
                        tVar6 = tVar4;
                    }
                }
            } else {
                tVar7.V();
                tVar5 = tVar2;
                a2VarN = a2Var2;
                eVar3 = eVar4;
                tVar6 = tVar7;
            }
            t1VarU = tVar6.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.b0((Function2) eVar, (Object) eVar3, tVar5, (Object) a2VarN, i5, i11, 11);
                return;
            }
            return;
        }
        i12 |= 384;
        tVar2 = tVar;
        if ((i5 & 3072) != 0) {
        }
        if ((i12 & 1171) == 1170) {
            tVar7.X();
            i13 = i5 & 1;
            b2.r rVar2 = b2.r.f17024a;
            if (i13 != 0) {
                if (i15 != 0) {
                }
                if ((i11 & 8) == 0) {
                    i14 = i12;
                    tVar3 = tVar2;
                    a2VarN = a2Var2;
                }
                tVar7.q();
                tVar7.b0(398535721);
                objP = tVar7.P();
                if (objP == p1.n.f81514a) {
                }
                tVar7.p(false);
                y2 y2VarA22 = c0.h.a(((y3.f) ((y2) objP).getValue()).f96602a, null, "PaymentSheetTopBarElevation", tVar7, 384, 10);
                k0.e eVar522 = k0.k.f70657c;
                b2.i iVar222 = b2.d.f17009m;
                k0.x xVarA32 = k0.w.a(eVar522, iVar222, tVar7, 0);
                iHashCode = Long.hashCode(tVar7.T);
                n1 n1VarL32 = tVar7.l();
                b2.t tVarI32 = fg.a.I(tVar3, tVar7);
                b3.l.Po.getClass();
                Function0 function022 = b3.k.f17270b;
                tVar7.f0();
                if (tVar7.S) {
                }
                b3.i iVar322 = b3.k.f17275g;
                p1.a0.j(xVarA32, iVar322, tVar7);
                b3.i iVar422 = b3.k.f17274f;
                p1.a0.j(n1VarL32, iVar422, tVar7);
                iVar = b3.k.f17278j;
                b2.t tVar822 = tVar3;
                if (tVar7.S) {
                }
            }
        }
        t1VarU = tVar6.u();
        if (t1VarU == null) {
        }
    }

    public static final void b(Function2 function2, x1.e eVar, p1.o oVar, int i5, int i11) {
        Function2 function22;
        int i12;
        Function2 function23;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(1429103685);
        int i13 = i11 & 1;
        if (i13 != 0) {
            i12 = i5 | 6;
            function22 = function2;
        } else if ((i5 & 6) == 0) {
            function22 = function2;
            i12 = i5 | (tVar.h(function22) ? 4 : 2);
        } else {
            function22 = function2;
            i12 = i5;
        }
        if ((i12 & 19) == 18 && tVar.E()) {
            tVar.V();
            function23 = function22;
        } else {
            Function2 function24 = i13 != 0 ? null : function22;
            k0.x xVarA = k0.w.a(k0.k.f70657c, b2.d.n, tVar, 48);
            int iHashCode = Long.hashCode(tVar.T);
            n1 n1VarL = tVar.l();
            b2.r rVar = b2.r.f17024a;
            b2.t tVarI = fg.a.I(rVar, tVar);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar.f0();
            if (tVar.S) {
                tVar.k(function0);
            } else {
                tVar.p0();
            }
            b3.i iVar = b3.k.f17275g;
            p1.a0.j(xVarA, iVar, tVar);
            b3.i iVar2 = b3.k.f17274f;
            p1.a0.j(n1VarL, iVar2, tVar);
            b3.i iVar3 = b3.k.f17278j;
            if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar, iHashCode, iVar3);
            }
            b3.i iVar4 = b3.k.f17272d;
            p1.a0.j(tVarI, iVar4, tVar);
            tVar.b0(-1654192315);
            Object objP = tVar.P();
            if (objP == p1.n.f81514a) {
                objP = new s10.i(13);
                tVar.m0(objP);
            }
            tVar.p(false);
            b2.t tVarB = v2.s.b(rVar, (Function1) objP);
            z2.r0 r0VarD = k0.p.d(b2.d.f16997a, false);
            int iHashCode2 = Long.hashCode(tVar.T);
            n1 n1VarL2 = tVar.l();
            b2.t tVarI2 = fg.a.I(tVarB, tVar);
            tVar.f0();
            if (tVar.S) {
                tVar.k(function0);
            } else {
                tVar.p0();
            }
            p1.a0.j(r0VarD, iVar, tVar);
            p1.a0.j(n1VarL2, iVar2, tVar);
            if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode2))) {
                a2.c.u(iHashCode2, tVar, iHashCode2, iVar3);
            }
            p1.a0.j(tVarI2, iVar4, tVar);
            tVar.b0(-504722864);
            if (function24 != null) {
                function24.invoke(tVar, Integer.valueOf(i12 & 14));
            }
            tVar.p(false);
            tVar.p(true);
            function23 = function24;
            t7.a(androidx.compose.foundation.a.b(rVar, ((d1) tVar.j(g1.f73330a)).f73161p, i2.r0.f61135a).then(androidx.compose.foundation.layout.e.f13973c), null, 0L, 0L, 0.0f, 0.0f, null, x1.f.d(-1490749292, new b00.i0(eVar, 22), tVar), tVar, 12582912, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
            tVar.p(true);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new p6(function23, eVar, i5, i11);
        }
    }

    public static final void c(b2.t tVar, p1.o oVar, int i5, int i11) {
        int i12;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(206644096);
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
            b2.t tVar3 = tVar;
            tVar2.b0(-443512897);
            os.b bVar = (os.b) tVar2.j(os.g.f80779c);
            tVar2.p(false);
            zg.a.e(tVar3, bVar.f80742f, (float) 0.5d, 0.0f, tVar2, (i12 & 14) | 384, 8);
            tVar = tVar3;
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new com.instabridge.mobilesdk.internal.ui.screens.n1(i5, i11, 1, tVar);
        }
    }

    public static final void d(p6.n nVar, y1.c cVar, x1.e eVar, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-1579360880);
        if ((((tVar.h(nVar) ? 4 : 2) | i5 | (tVar.h(cVar) ? 32 : 16)) & 147) == 146 && tVar.E()) {
            tVar.V();
        } else {
            p1.a0.b(new r1[]{l6.a.f74746a.a(nVar), i6.h.f61404a.a(nVar), AndroidCompositionLocals_androidKt.getLocalSavedStateRegistryOwner().a(nVar)}, x1.f.d(-52928304, new c4.n(7, cVar, eVar), tVar), tVar, 56);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new j3(nVar, cVar, eVar, i5, 4);
        }
    }

    public static final void e(y1.c cVar, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(1211832233);
        if ((i5 & 6) == 0) {
            i11 = (tVar.h(cVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar.h(eVar) ? 32 : 16;
        }
        if ((i11 & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            tVar.c0(1729797275);
            o1 o1VarA = l6.a.a(tVar);
            if (o1VarA == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
            }
            f1 f1VarF = com.google.android.gms.internal.consent_sdk.k0.F(Reflection.f71864a.getOrCreateKotlinClass(q6.a.class), o1VarA, null, null, o1VarA instanceof h6.n ? ((h6.n) o1VarA).getDefaultViewModelCreationExtras() : k6.a.f71149b, tVar);
            tVar.p(false);
            q6.a aVar = (q6.a) f1VarF;
            aVar.f83690b = new WeakReference(cVar);
            cVar.f(aVar.f83689a, eVar, tVar, ((i11 << 6) & 896) | (i11 & 112));
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c4.i(cVar, eVar, i5, 1);
        }
    }

    public static final void f(int i5, StringBuilder sb2) {
        for (int i11 = 0; i11 < i5; i11++) {
            sb2.append("?");
            if (i11 < i5 - 1) {
                sb2.append(",");
            }
        }
    }

    public static void g(Drawable drawable, Resources.Theme theme) {
        drawable.applyTheme(theme);
    }

    public static final CursorAnchorInfo h(CursorAnchorInfo.Builder builder, r3.z zVar, r3.s sVar, m3.l0 l0Var, Matrix matrix, h2.c cVar, h2.c cVar2, boolean z11, boolean z12, boolean z13, boolean z14) {
        builder.reset();
        builder.setMatrix(matrix);
        long j11 = zVar.f85472b;
        m3.o0 o0Var = zVar.f85473c;
        int iF = m3.o0.f(j11);
        builder.setSelectionRange(iF, m3.o0.e(zVar.f85472b));
        if (z11 && iF >= 0) {
            int iO = sVar.o(iF);
            h2.c cVarC = l0Var.c(iO);
            float fD0 = kotlin.ranges.a.d0(cVarC.f59018a, 0.0f, (int) (l0Var.f75929c >> 32));
            boolean zJ = j(cVar, fD0, cVarC.f59019b);
            boolean zJ2 = j(cVar, fD0, cVarC.f59021d);
            boolean z15 = l0Var.a(iO) == x3.j.f95017b;
            int i5 = (zJ || zJ2) ? 1 : 0;
            if (!zJ || !zJ2) {
                i5 |= 2;
            }
            if (z15) {
                i5 |= 4;
            }
            float f11 = cVarC.f59019b;
            float f12 = cVarC.f59021d;
            builder.setInsertionMarkerLocation(fD0, f11, f12, f12, i5);
        }
        if (z12) {
            int iF2 = o0Var != null ? m3.o0.f(o0Var.f75946a) : -1;
            int iE = o0Var != null ? m3.o0.e(o0Var.f75946a) : -1;
            if (iF2 >= 0 && iF2 < iE) {
                builder.setComposingText(iF2, zVar.f85471a.f75880b.subSequence(iF2, iE));
                int iO2 = sVar.o(iF2);
                int iO3 = sVar.o(iE);
                float[] fArr = new float[(iO3 - iO2) * 4];
                l0Var.f75928b.a(z2.u(iO2, iO3), fArr);
                for (int i11 = iF2; i11 < iE; i11++) {
                    int iO4 = sVar.o(i11);
                    int i12 = (iO4 - iO2) * 4;
                    float f13 = fArr[i12];
                    float f14 = fArr[i12 + 1];
                    float f15 = fArr[i12 + 2];
                    float f16 = fArr[i12 + 3];
                    int i13 = (f13 < cVar.f59020c ? 1 : 0) & (cVar.f59018a < f15 ? 1 : 0) & (cVar.f59019b < f16 ? 1 : 0) & (f14 < cVar.f59021d ? 1 : 0);
                    if (!j(cVar, f13, f14) || !j(cVar, f15, f16)) {
                        i13 |= 2;
                    }
                    if (l0Var.a(iO4) == x3.j.f95017b) {
                        i13 |= 4;
                    }
                    builder.addCharacterBounds(i11, f13, f14, f15, f16, i13);
                }
            }
        }
        int i14 = Build.VERSION.SDK_INT;
        if (i14 >= 33 && z13) {
            builder.setEditorBoundsInfo(i1.i().setEditorBounds(g90.k.m0(cVar2)).setHandwritingBounds(g90.k.m0(cVar2)).build());
        }
        if (i14 >= 34 && z14 && !cVar.g()) {
            float f17 = cVar.f59019b;
            m3.p pVar = l0Var.f75928b;
            int iE2 = pVar.e(f17);
            int iE3 = pVar.e(cVar.f59021d);
            if (iE2 <= iE3) {
                while (true) {
                    builder.addVisibleLineBounds(l0Var.d(iE2), pVar.f(iE2), l0Var.e(iE2), pVar.b(iE2));
                    if (iE2 == iE3) {
                        break;
                    }
                    iE2++;
                }
            }
        }
        return builder.build();
    }

    public static void i(Drawable drawable) {
        drawable.canApplyTheme();
    }

    public static final boolean j(h2.c cVar, float f11, float f12) {
        float f13 = cVar.f59018a;
        if (f11 > cVar.f59020c || f13 > f11) {
            return false;
        }
        return f12 <= cVar.f59021d && cVar.f59019b <= f12;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x004d, code lost:
    
        if (jk.b.t(r9, r1, r2, r3 instanceof y8.a ? ((y8.a) r3).f96839d : r0.getHeight(), r8) == 1.0d) goto L24;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Bitmap k(Drawable drawable, Bitmap.Config config, y8.f fVar, int i5, boolean z11) {
        Bitmap bitmap;
        Bitmap bitmap2;
        if (drawable instanceof BitmapDrawable) {
            Bitmap bitmap3 = ((BitmapDrawable) drawable).getBitmap();
            if (bitmap3.getConfig() == ((config == null || config == Bitmap.Config.HARDWARE) ? Bitmap.Config.ARGB_8888 : config)) {
                if (!z11) {
                    int width = bitmap3.getWidth();
                    int height = bitmap3.getHeight();
                    v4.a aVar = fVar.f96845a;
                    int width2 = aVar instanceof y8.a ? ((y8.a) aVar).f96839d : bitmap3.getWidth();
                    v4.a aVar2 = fVar.f96846b;
                }
                return bitmap3;
            }
        }
        Drawable drawableMutate = drawable.mutate();
        boolean z12 = drawableMutate instanceof BitmapDrawable;
        BitmapDrawable bitmapDrawable = z12 ? (BitmapDrawable) drawableMutate : null;
        int intrinsicWidth = (bitmapDrawable == null || (bitmap2 = bitmapDrawable.getBitmap()) == null) ? drawableMutate.getIntrinsicWidth() : bitmap2.getWidth();
        int i11 = EventBridgeChannel.QUEUE_CAPACITY;
        if (intrinsicWidth <= 0) {
            intrinsicWidth = 512;
        }
        BitmapDrawable bitmapDrawable2 = z12 ? (BitmapDrawable) drawableMutate : null;
        int intrinsicHeight = (bitmapDrawable2 == null || (bitmap = bitmapDrawable2.getBitmap()) == null) ? drawableMutate.getIntrinsicHeight() : bitmap.getHeight();
        if (intrinsicHeight > 0) {
            i11 = intrinsicHeight;
        }
        v4.a aVar3 = fVar.f96845a;
        int i12 = aVar3 instanceof y8.a ? ((y8.a) aVar3).f96839d : intrinsicWidth;
        v4.a aVar4 = fVar.f96846b;
        double dT = jk.b.t(intrinsicWidth, i11, i12, aVar4 instanceof y8.a ? ((y8.a) aVar4).f96839d : i11, i5);
        int iA = MathKt.a(intrinsicWidth * dT);
        int iA2 = MathKt.a(dT * i11);
        if (config == null || config == Bitmap.Config.HARDWARE) {
            config = Bitmap.Config.ARGB_8888;
        }
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(iA, iA2, config);
        Rect bounds = drawableMutate.getBounds();
        int i13 = bounds.left;
        int i14 = bounds.top;
        int i15 = bounds.right;
        int i16 = bounds.bottom;
        drawableMutate.setBounds(0, 0, iA, iA2);
        drawableMutate.draw(new Canvas(bitmapCreateBitmap));
        drawableMutate.setBounds(i13, i14, i15, i16);
        return bitmapCreateBitmap;
    }

    public static ErrorData l(JSONObject jSONObject) {
        Object next;
        String strOptString = jSONObject.optString("threeDSServerTransID");
        String strOptString2 = jSONObject.optString("acsTransID");
        String strOptString3 = jSONObject.optString("dsTransID");
        String strOptString4 = jSONObject.optString("errorCode");
        Intrinsics.f(strOptString4, "optString(...)");
        w.a aVar = xv.b.f96418b;
        String strOptString5 = jSONObject.optString("errorComponent");
        aVar.getClass();
        Iterator it = xv.b.f96421e.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((xv.b) next).f96422a.equals(strOptString5)) {
                break;
            }
        }
        xv.b bVar = (xv.b) next;
        String strOptString6 = jSONObject.optString("errorDescription");
        Intrinsics.f(strOptString6, "optString(...)");
        String strOptString7 = jSONObject.optString("errorDetail");
        Intrinsics.f(strOptString7, "optString(...)");
        String strOptString8 = jSONObject.optString("errorMessageType");
        String strOptString9 = jSONObject.optString("messageVersion");
        Intrinsics.f(strOptString9, "optString(...)");
        String strOptString10 = jSONObject.optString("sdkTransID");
        return new ErrorData(strOptString, strOptString2, strOptString3, strOptString4, bVar, strOptString6, strOptString7, strOptString8, strOptString9, strOptString10 != null ? new SdkTransactionId(strOptString10) : null);
    }

    public static int m(Drawable drawable) {
        return drawable.getAlpha();
    }

    public static ColorFilter n(Drawable drawable) {
        return drawable.getColorFilter();
    }

    public static final String o(StripeIntent stripeIntent) {
        Intrinsics.g(stripeIntent, "<this>");
        if (stripeIntent instanceof PaymentIntent) {
            return ((PaymentIntent) stripeIntent).f43543k;
        }
        return null;
    }

    public static int p(j7.o oVar) {
        return oVar.getLayoutDirection();
    }

    public static void q(Drawable drawable, Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        drawable.inflate(resources, xmlPullParser, attributeSet, theme);
    }

    public static boolean r(Drawable drawable) {
        return drawable.isAutoMirrored();
    }

    public static void s(Drawable drawable) {
        drawable.jumpToCurrentState();
    }

    public static final StringBuilder t() {
        return new StringBuilder();
    }

    public static TypedValue u(Context context, int i5) {
        TypedValue typedValue = new TypedValue();
        if (context.getTheme().resolveAttribute(i5, typedValue, true)) {
            return typedValue;
        }
        return null;
    }

    public static boolean v(boolean z11, Context context, int i5) {
        TypedValue typedValueU = u(context, i5);
        return (typedValueU == null || typedValueU.type != 18) ? z11 : typedValueU.data != 0;
    }

    public static TypedValue w(Context context, int i5, String str) {
        TypedValue typedValueU = u(context, i5);
        if (typedValueU != null) {
            return typedValueU;
        }
        throw new IllegalArgumentException(String.format("%1$s requires a value for the %2$s attribute to be set in your app theme. You can either set the attribute in your theme or update your theme to inherit from Theme.MaterialComponents (or a descendant).", str, context.getResources().getResourceName(i5)));
    }

    public static void x(Drawable drawable, boolean z11) {
        drawable.setAutoMirrored(z11);
    }

    public static void y(Drawable drawable, float f11, float f12) {
        drawable.setHotspot(f11, f12);
    }

    public static void z(Drawable drawable, int i5, int i11, int i12, int i13) {
        drawable.setHotspotBounds(i5, i11, i12, i13);
    }
}
