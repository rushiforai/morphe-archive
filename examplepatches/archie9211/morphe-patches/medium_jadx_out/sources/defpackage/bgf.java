package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.os.Bundle;
import android.util.Base64;
import android.util.Xml;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import androidx.work.impl.WorkDatabase;
import com.android.billingclient.api.BillingClient;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.search.ui.main.SearchFragment;
import com.medium.android.tag.tagdirectory.TagDirectoryFragment;
import com.medium.reader.R;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class bgf {
    public static final mya I;
    public static final mya J;
    public static final mya K;
    public static final mya L;
    public static final mya M;
    public static g7c O;
    public static final /* synthetic */ int P = 0;
    public static final mz1 a = new mz1(new zz1(2), false, 401665366);
    public static final mz1 b = new mz1(new yz1(14), false, -2038021787);
    public static final mz1 c = new mz1(new f02(29), false, -1258008078);
    public static final mz1 d = new mz1(new k02(1), false, 1742984603);
    public static final mz1 e = new mz1(new k02(12), false, 1908802325);
    public static final mz1 f = new mz1(new k02(13), false, 188789061);
    public static final mz1 g = new mz1(new k02(14), false, 1827966984);
    public static final mz1 h = new mz1(new k02(15), false, -395116690);
    public static final mz1 i = new mz1(new k02(16), false, -1398130319);
    public static final mz1 j = new mz1(new k02(17), false, -145015411);
    public static final mz1 k = new mz1(new k02(18), false, -1148029040);
    public static final mz1 l = new mz1(new k02(19), false, 980998094);
    public static final mz1 m = new mz1(new k02(10), false, -1498481713);
    public static final mz1 n = new mz1(new k02(20), false, -398416110);
    public static final mz1 o = new mz1(new k02(21), false, -1271530285);
    public static final mz1 p = new mz1(new k02(22), false, 1366328754);
    public static final mz1 q = new mz1(new k02(23), false, -1486953621);
    public static final mz1 r = new mz1(new k02(24), false, 543957204);
    public static final mz1 s = new mz1(new k02(25), false, -1935522603);
    public static final mz1 t = new mz1(new k02(26), false, 702336436);
    public static final mz1 u = new mz1(new k02(27), false, 2144021357);
    public static final mz1 v = new mz1(new k02(0), false, -120035114);
    public static final mz1 w = new mz1(new k02(2), false, 1675237746);
    public static final mz1 x = new mz1(new k02(3), false, 18129489);
    public static final mz1 y = new mz1(new k02(4), false, -346986542);
    public static final mz1 z = new mz1(new k02(5), false, 1468500947);
    public static final mz1 A = new mz1(new k02(6), false, 1480029039);
    public static final mz1 B = new mz1(new k02(7), false, -784027432);
    public static final mz1 C = new mz1(new k02(8), false, -1010978860);
    public static final mz1 D = new mz1(new k02(9), false, -1775955014);
    public static final mz1 E = new mz1(new k02(11), false, 1855019964);
    public static final mz1 F = new mz1(new zz1(10), false, 172516857);
    public static final xsa G = new xsa(15);
    public static final boolean[] H = new boolean[3];
    public static final uob N = new uob(25);

    static {
        int i2 = 3;
        I = new mya(new mpb(23), i2, new npb(24));
        J = new mya(new mpb(24), i2, new npb(25));
        K = new mya(new mpb(25), i2, new npb(26));
        L = new mya(new mpb(26), i2, new npb(27));
        M = new mya(new mpb(27), i2, new npb(28));
    }

    public static final void D(fb6 fb6Var, xzb xzbVar) {
        xzbVar.getClass();
        g76.L(xzbVar.j(), wuc.e);
    }

    public static final void E() {
        try {
            g7c g7cVar = O;
            if (g7cVar == null) {
                g7cVar = (g7c) ((zs2) ((qk4) xj4.d().b(qk4.class))).o.get();
                g7cVar.getClass();
                O = g7cVar;
            }
            if (g7cVar == null) {
                g76.g0("sharedSessionRepository");
                throw null;
            }
            if (g7cVar.i) {
                if (g7cVar != null) {
                    g7cVar.a();
                } else {
                    g76.g0("sharedSessionRepository");
                    throw null;
                }
            }
        } catch (Exception unused) {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v12, types: [android.content.res.TypedArray] */
    /* JADX WARN: Type inference failed for: r3v15 */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Type inference failed for: r3v8, types: [android.content.res.TypedArray] */
    /* JADX WARN: Type inference failed for: r3v9 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v13 */
    public static sz4 F(XmlResourceParser xmlResourceParser, Resources resources) throws Exception {
        int next;
        int i2;
        int i3;
        ?? r3;
        Throwable th;
        ?? r32;
        do {
            next = xmlResourceParser.next();
            i2 = 2;
            if (next == 2) {
                break;
            }
        } while (next != 1);
        if (next != 2) {
            throw new XmlPullParserException("No start tag found");
        }
        xmlResourceParser.require(2, null, "font-family");
        if (!xmlResourceParser.getName().equals("font-family")) {
            J(xmlResourceParser);
            return null;
        }
        TypedArray typedArrayObtainAttributes = resources.obtainAttributes(Xml.asAttributeSet(xmlResourceParser), zra.b);
        int i4 = 0;
        String string = typedArrayObtainAttributes.getString(0);
        String string2 = typedArrayObtainAttributes.getString(5);
        String string3 = typedArrayObtainAttributes.getString(6);
        String string4 = typedArrayObtainAttributes.getString(2);
        int resourceId = typedArrayObtainAttributes.getResourceId(1, 0);
        int i5 = 3;
        int integer = typedArrayObtainAttributes.getInteger(3, 1);
        int integer2 = typedArrayObtainAttributes.getInteger(4, 500);
        String string5 = typedArrayObtainAttributes.getString(7);
        typedArrayObtainAttributes.recycle();
        if (string == null || string2 == null) {
            ArrayList arrayList = new ArrayList();
            while (xmlResourceParser.next() != 3) {
                if (xmlResourceParser.getEventType() == 2) {
                    if (xmlResourceParser.getName().equals("font")) {
                        TypedArray typedArrayObtainAttributes2 = resources.obtainAttributes(Xml.asAttributeSet(xmlResourceParser), zra.c);
                        int i6 = typedArrayObtainAttributes2.getInt(typedArrayObtainAttributes2.hasValue(8) ? 8 : 1, 400);
                        boolean z2 = 1 == typedArrayObtainAttributes2.getInt(typedArrayObtainAttributes2.hasValue(6) ? 6 : 2, 0);
                        int i7 = typedArrayObtainAttributes2.hasValue(9) ? 9 : 3;
                        String string6 = typedArrayObtainAttributes2.getString(typedArrayObtainAttributes2.hasValue(7) ? 7 : 4);
                        int i8 = typedArrayObtainAttributes2.getInt(i7, 0);
                        int i9 = typedArrayObtainAttributes2.hasValue(5) ? 5 : 0;
                        int resourceId2 = typedArrayObtainAttributes2.getResourceId(i9, 0);
                        String string7 = typedArrayObtainAttributes2.getString(i9);
                        typedArrayObtainAttributes2.recycle();
                        while (xmlResourceParser.next() != 3) {
                            J(xmlResourceParser);
                        }
                        arrayList.add(new uz4(i6, i8, resourceId2, string7, string6, z2));
                    } else {
                        J(xmlResourceParser);
                    }
                }
            }
            if (arrayList.isEmpty()) {
                return null;
            }
            return new tz4((uz4[]) arrayList.toArray(new uz4[0]));
        }
        List listG = G(resources, resourceId);
        ArrayList arrayList2 = new ArrayList();
        while (xmlResourceParser.next() != i5) {
            if (xmlResourceParser.getEventType() == i2) {
                if (xmlResourceParser.getName().equals("fallback")) {
                    TypedArray typedArrayObtainAttributes3 = resources.obtainAttributes(Xml.asAttributeSet(xmlResourceParser), zra.d);
                    try {
                        String string8 = typedArrayObtainAttributes3.getString(i4);
                        String string9 = typedArrayObtainAttributes3.getString(1);
                        i3 = integer;
                        String string10 = typedArrayObtainAttributes3.getString(i2);
                        if (string8 == null) {
                            r3 = typedArrayObtainAttributes3;
                            throw new XmlPullParserException("query attribute must be set in fallback element");
                        }
                        while (xmlResourceParser.next() != i5) {
                            try {
                                J(xmlResourceParser);
                            } catch (Throwable th2) {
                                th = th2;
                                r32 = typedArrayObtainAttributes3;
                            }
                        }
                        r3 = typedArrayObtainAttributes3;
                        try {
                            lz4 lz4Var = new lz4(string, string2, string8, listG, string9, string10);
                            if (r3 instanceof AutoCloseable) {
                                ((AutoCloseable) r3).close();
                            } else if (r3 instanceof ExecutorService) {
                                cm0.i((ExecutorService) r3);
                            } else {
                                r3.recycle();
                            }
                            arrayList2.add(lz4Var);
                        } catch (Throwable th3) {
                            th = th3;
                        }
                        th = th3;
                    } catch (Throwable th4) {
                        th = th4;
                        r3 = typedArrayObtainAttributes3;
                    }
                    th = th;
                    r32 = r3;
                    if (r32 == 0) {
                        throw th;
                    }
                    try {
                        if (r32 instanceof AutoCloseable) {
                            ((AutoCloseable) r32).close();
                        } else if (r32 instanceof ExecutorService) {
                            cm0.i((ExecutorService) r32);
                        } else {
                            r32.recycle();
                        }
                        throw th;
                    } catch (Throwable th5) {
                        th.addSuppressed(th5);
                        throw th;
                    }
                }
                i3 = integer;
                J(xmlResourceParser);
                integer = i3;
                i2 = 2;
                i4 = 0;
                i5 = 3;
            }
        }
        int i10 = integer;
        if (!arrayList2.isEmpty()) {
            return new vz4(arrayList2, i10, integer2, string5);
        }
        if (string3 == null) {
            ay0.e("The provider font XML requires query attribute or fallback children.");
            return null;
        }
        arrayList2.add(new lz4(string, string2, string3, listG, null, null));
        if (string4 != null) {
            arrayList2.add(new lz4(string, string2, string4, listG, null, null));
        }
        return new vz4(arrayList2, i10, integer2, string5);
    }

    public static List G(Resources resources, int i2) {
        if (i2 == 0) {
            return Collections.EMPTY_LIST;
        }
        TypedArray typedArrayObtainTypedArray = resources.obtainTypedArray(i2);
        try {
            if (typedArrayObtainTypedArray.length() == 0) {
                return Collections.EMPTY_LIST;
            }
            ArrayList arrayList = new ArrayList();
            if (typedArrayObtainTypedArray.getType(0) == 1) {
                for (int i3 = 0; i3 < typedArrayObtainTypedArray.length(); i3++) {
                    int resourceId = typedArrayObtainTypedArray.getResourceId(i3, 0);
                    if (resourceId != 0) {
                        String[] stringArray = resources.getStringArray(resourceId);
                        ArrayList arrayList2 = new ArrayList();
                        for (String str : stringArray) {
                            arrayList2.add(Base64.decode(str, 0));
                        }
                        arrayList.add(arrayList2);
                    }
                }
            } else {
                String[] stringArray2 = resources.getStringArray(i2);
                ArrayList arrayList3 = new ArrayList();
                for (String str2 : stringArray2) {
                    arrayList3.add(Base64.decode(str2, 0));
                }
                arrayList.add(arrayList3);
            }
            return arrayList;
        } finally {
            typedArrayObtainTypedArray.recycle();
        }
    }

    public static final Object H(Object obj) {
        return obj instanceof cy1 ? br7.n(((cy1) obj).a) : obj;
    }

    public static final nx0 I(ox0 ox0Var, x12 x12Var, int i2) {
        int i3 = i2 & 1;
        uob uobVar = w12.a;
        if (i3 != 0) {
            px0 px0Var = px0.Collapsed;
            cud cudVar = ew0.a;
            p65 p65Var = (p65) x12Var;
            Object objM = p65Var.M();
            if (objM == uobVar) {
                objM = new nx(18);
                p65Var.j0(objM);
            }
            x45 x45Var = (x45) objM;
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object[] objArr = {cudVar};
            mya myaVar = new mya(new p02(5), 3, new o8(m73Var, cudVar, x45Var, 4));
            boolean zF = p65Var.f(m73Var) | p65Var.h(cudVar) | p65Var.f(x45Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                hu0 hu0Var = new hu0(px0Var, m73Var, cudVar, x45Var, 1);
                p65Var.j0(hu0Var);
                objM2 = hu0Var;
            }
            ox0Var = (ox0) hp7.F(objArr, myaVar, (m45) objM2, p65Var, 0);
        }
        p65 p65Var2 = (p65) x12Var;
        Object objM3 = p65Var2.M();
        if (objM3 == uobVar) {
            objM3 = new ohc();
            p65Var2.j0(objM3);
        }
        ohc ohcVar = (ohc) objM3;
        boolean zF2 = ((p65) x12Var).f(ox0Var) | ((p65) x12Var).f(ohcVar);
        p65 p65Var3 = (p65) x12Var;
        Object objM4 = p65Var3.M();
        if (zF2 || objM4 == uobVar) {
            objM4 = new nx0(ox0Var, ohcVar);
            p65Var3.j0(objM4);
        }
        return (nx0) objM4;
    }

    public static void J(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        int i2 = 1;
        while (i2 > 0) {
            int next = xmlPullParser.next();
            if (next == 2) {
                i2++;
            } else if (next == 3) {
                i2--;
            }
        }
    }

    public static final Object K(BillingClient billingClient, p4d p4dVar) {
        x51 x51Var = new x51(1, pwd.Q(p4dVar));
        x51Var.s();
        billingClient.startConnection(new br0(x51Var));
        x51Var.v(new z(6, billingClient));
        return x51Var.q();
    }

    public static boolean L(bo1 bo1Var, hkb hkbVar, hkb hkbVar2) {
        if (bo1Var.h(hkbVar) == bo1Var.h(hkbVar2) && bo1Var.F0(hkbVar) == bo1Var.F0(hkbVar2) && bo1Var.P(hkbVar) == bo1Var.P(hkbVar2) && bo1Var.m0(bo1Var.L(hkbVar), bo1Var.L(hkbVar2))) {
            if (bo1Var.j0(hkbVar, hkbVar2)) {
                return true;
            }
            int iH = bo1Var.h(hkbVar);
            for (int i2 = 0; i2 < iH; i2++) {
                xwd xwdVarC0 = bo1Var.C0(hkbVar, i2);
                xwd xwdVarC02 = bo1Var.C0(hkbVar2, i2);
                if (bo1Var.q0(xwdVarC0) == bo1Var.q0(xwdVarC02)) {
                    if (!bo1Var.q0(xwdVarC0)) {
                        if (bo1Var.R(xwdVarC0) == bo1Var.R(xwdVarC02)) {
                            o3e o3eVarY = bo1Var.Y(xwdVarC0);
                            o3eVarY.getClass();
                            o3e o3eVarY2 = bo1Var.Y(xwdVarC02);
                            o3eVarY2.getClass();
                            if (!M(bo1Var, o3eVarY, o3eVarY2)) {
                            }
                        }
                    }
                }
            }
            return true;
        }
        return false;
    }

    public static boolean M(bo1 bo1Var, qn6 qn6Var, qn6 qn6Var2) {
        if (qn6Var == qn6Var2) {
            return true;
        }
        hec hecVarU0 = bo1Var.u0(qn6Var);
        hec hecVarU02 = bo1Var.u0(qn6Var2);
        if (hecVarU0 != null && hecVarU02 != null) {
            return L(bo1Var, hecVarU0, hecVarU02);
        }
        zm4 zm4VarR0 = bo1Var.r0(qn6Var);
        zm4 zm4VarR02 = bo1Var.r0(qn6Var2);
        return zm4VarR0 != null && zm4VarR02 != null && L(bo1Var, bo1Var.E(zm4VarR0), bo1Var.E(zm4VarR02)) && L(bo1Var, bo1Var.i0(zm4VarR0), bo1Var.i0(zm4VarR02));
    }

    public static final r28 N(r28 r28Var, String str) {
        return r28Var.b(new hgd(str));
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final com.medium.android.domain.post.models.Markup O(com.medium.android.graphql.fragment.MarkupData r9) {
        /*
            r9.getClass()
            com.medium.android.graphql.type.MarkupType r0 = r9.getType()
            r1 = 0
            if (r0 == 0) goto L97
            int[] r2 = defpackage.ri7.b
            int r0 = r0.ordinal()
            r0 = r2[r0]
            switch(r0) {
                case 1: goto L3a;
                case 2: goto L37;
                case 3: goto L34;
                case 4: goto L31;
                case 5: goto L2e;
                case 6: goto L2b;
                case 7: goto L28;
                case 8: goto L25;
                case 9: goto L22;
                case 10: goto L1f;
                case 11: goto L1b;
                case 12: goto L19;
                default: goto L15;
            }
        L15:
            defpackage.ygf.a()
            return r1
        L19:
            r3 = r1
            goto L3d
        L1b:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.UNUSED_DETAIL
        L1d:
            r3 = r0
            goto L3d
        L1f:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.CODE
            goto L1d
        L22:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.QUERY
            goto L1d
        L25:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.SENTENCE_DEPRECATED
            goto L1d
        L28:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.QUOTE
            goto L1d
        L2b:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.COMMENT
            goto L1d
        L2e:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.WARNING
            goto L1d
        L31:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.HIGHLIGHT
            goto L1d
        L34:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.EM
            goto L1d
        L37:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.A
            goto L1d
        L3a:
            com.medium.android.domain.post.models.MarkupType r0 = com.medium.android.domain.post.models.MarkupType.STRONG
            goto L1d
        L3d:
            if (r3 != 0) goto L40
            goto L97
        L40:
            com.medium.android.graphql.type.AnchorType r0 = r9.getAnchorType()
            if (r0 == 0) goto L6a
            int[] r2 = defpackage.fk.b
            int r0 = r0.ordinal()
            r0 = r2[r0]
            r2 = 1
            if (r0 == r2) goto L66
            r2 = 2
            if (r0 == r2) goto L63
            r2 = 3
            if (r0 == r2) goto L60
            r2 = 4
            if (r0 != r2) goto L5c
            r0 = r1
            goto L68
        L5c:
            defpackage.ygf.a()
            return r1
        L60:
            com.medium.android.domain.post.models.AnchorType r0 = com.medium.android.domain.post.models.AnchorType.USER
            goto L68
        L63:
            com.medium.android.domain.post.models.AnchorType r0 = com.medium.android.domain.post.models.AnchorType.AUDIO
            goto L68
        L66:
            com.medium.android.domain.post.models.AnchorType r0 = com.medium.android.domain.post.models.AnchorType.LINK
        L68:
            r6 = r0
            goto L6b
        L6a:
            r6 = r1
        L6b:
            int r4 = r9.getStart()
            int r5 = r9.getEnd()
            java.lang.String r0 = r9.getHref()
            if (r0 == 0) goto L81
            int r2 = r0.length()
            if (r2 <= 0) goto L81
            r7 = r0
            goto L82
        L81:
            r7 = r1
        L82:
            java.lang.String r9 = r9.getUserId()
            if (r9 == 0) goto L90
            int r0 = r9.length()
            if (r0 <= 0) goto L90
            r8 = r9
            goto L91
        L90:
            r8 = r1
        L91:
            com.medium.android.domain.post.models.Markup r2 = new com.medium.android.domain.post.models.Markup
            r2.<init>(r3, r4, r5, r6, r7, r8)
            return r2
        L97:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bgf.O(com.medium.android.graphql.fragment.MarkupData):com.medium.android.domain.post.models.Markup");
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.nj r22, defpackage.nhc r23, defpackage.fj r24, defpackage.obe r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 249
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bgf.a(nj, nhc, fj, obe, r28, x12, int, int):void");
    }

    public static final void b(String str, zg7 zg7Var, r28 r28Var, rj rjVar, x12 x12Var, int i2) {
        rj rjVar2;
        int i3;
        rj rjVar3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-896699631);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(zg7Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            int i6 = 6;
            if (i5 == 0 || p65Var.z()) {
                boolean z2 = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new mb(str, i6);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-7169);
                    rjVar3 = (rj) to7.z(n1b.a.b(rj.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                rjVar3 = rjVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(rjVar3.o, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i7 == 32) | p65Var.f(rjVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new gj(rjVar3, zg7Var);
                p65Var.j0(objM2);
            }
            gj gjVar = (gj) objM2;
            boolean zF2 = p65Var.f(rjVar3) | (i7 == 32);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new fj(rjVar3, zg7Var);
                p65Var.j0(objM3);
            }
            a((nj) l78VarZ.getValue(), nhcVarF, (fj) objM3, gjVar, r28Var, p65Var, (i3 << 6) & 57344, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(rjVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(gjVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                ra raVar = new ra(rjVar3, nhcVarF, resources, gjVar, null, 16);
                p65Var.j0(raVar);
                objM4 = raVar;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            rjVar2 = rjVar3;
        } else {
            p65Var.S();
            rjVar2 = rjVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 13, str, zg7Var, r28Var, rjVar2);
        }
    }

    public static final void c(lj ljVar, fj fjVar, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object vfVar;
        float f2;
        lj ljVar2 = ljVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1312013444);
        int i3 = i2 | (p65Var.f(ljVar2) ? 4 : 2) | (p65Var.f(fjVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            ljVar2 = ljVar;
            b24 b24Var = ljVar2.a;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                vfVar = new vf(0, fjVar, fj.class, "refresh", "refresh()V", 0, 23);
                p65Var.j0(vfVar);
            } else {
                vfVar = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) vfVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 16, ljVar2, fjVar, r28Var);
        }
    }

    public static final void d(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1815230627);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(-118326345);
            for (int i7 = 0; i7 < 10; i7++) {
                tr7.g(0, 1, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 9);
        }
    }

    public static final void e(wp wpVar, m45 m45Var, m45 m45Var2, x12 x12Var, int i2) {
        p65 p65Var;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1104928183);
        int i3 = i2 | (p65Var2.h(wpVar) ? 4 : 2);
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.h(m45Var) ? 32 : 16;
        }
        int i4 = 0;
        int i5 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var = p65Var2;
            hlg.a(m45Var2, pxf.E(153038447, new c60(i4, m45Var), p65Var2), null, pxf.E(-536793043, new c60(i5, m45Var2), p65Var2), pxf.E(-881708788, new k6c(19, wpVar), p65Var2), n01.h, n01.i, null, 0L, 0L, 0L, 0L, null, p65Var, 1797174, 0, 16260);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 2, wpVar, m45Var, m45Var2);
        }
    }

    public static final void f(final ox0 ox0Var, final boolean z2, final m3c m3cVar, final float f2, final long j2, final long j3, final float f3, final r28 r28Var, x12 x12Var, final int i2) {
        p65 p65Var;
        mz1 mz1Var = r40.b;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-426833549);
        int i3 = (p65Var2.h(mz1Var) ? 67108864 : 33554432) | i2 | (p65Var2.f(ox0Var) ? 4 : 2) | (p65Var2.g(z2) ? 32 : 16) | (p65Var2.f(m3cVar) ? 256 : 128) | (p65Var2.c(f2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.e(j2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var2.e(j3) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var2.c(f3) ? 1048576 : 524288) | (p65Var2.f(r28Var) ? 8388608 : 4194304);
        if (p65Var2.P(i3 & 1, (38347923 & i3) != 38347922)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var2);
                p65Var2.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            float fZ = ((m73) p65Var2.j(z22.h)).Z(f3);
            sl slVar = ox0Var.a;
            hw8 hw8Var = hw8.Vertical;
            int i4 = i3 & 14;
            boolean zC = p65Var2.c(fZ) | (i4 == 4);
            Object objM2 = p65Var2.M();
            if (zC || objM2 == uobVar) {
                objM2 = new mw0(fZ, 2, ox0Var);
                p65Var2.j0(objM2);
            }
            r28 r28VarW = sgg.w(r28Var.b(new kl3(slVar, (b55) objM2, hw8Var)), ox0Var.a, hw8Var, z2, false, 56);
            boolean zH = p65Var2.h(sb2Var) | (i4 == 4);
            Object objM3 = p65Var2.M();
            if (zH || objM3 == uobVar) {
                objM3 = new i0(ox0Var, 18, sb2Var);
                p65Var2.j0(objM3);
            }
            int i5 = i3 >> 6;
            p65Var = p65Var2;
            br7.i(wxb.a(r28VarW, false, (x45) objM3), m3cVar, j2, j3, f2, pxf.E(1065607095, new p02(4), p65Var2), p65Var, ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 1572864 | (i5 & 896) | (i5 & 7168) | (458752 & (i3 << 6)), 16);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(z2, m3cVar, f2, j2, j3, f3, r28Var, i2) { // from class: fw0
                public final /* synthetic */ boolean b;
                public final /* synthetic */ m3c c;
                public final /* synthetic */ float d;
                public final /* synthetic */ long e;
                public final /* synthetic */ long f;
                public final /* synthetic */ float g;
                public final /* synthetic */ r28 h;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    bgf.f(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void g(final r28 r28Var, final nx0 nx0Var, c55 c55Var, int i2, boolean z2, m3c m3cVar, float f2, long j2, long j3, final float f3, final long j4, long j5, final mz1 mz1Var, x12 x12Var, final int i3, final int i4) {
        int i5;
        nx0 nx0Var2;
        final c55 c55Var2;
        final int i6;
        final boolean z3;
        final m3c m3cVar2;
        final float f4;
        final long j6;
        final long j7;
        p65 p65Var;
        final long j8;
        int i7;
        final long j9;
        final c55 c55Var3;
        final float f5;
        final m3c m3cVar3;
        final boolean z4;
        final long jB;
        long jB2;
        final int i8;
        mz1 mz1Var2 = r40.b;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(194495313);
        if ((i3 & 6) == 0) {
            i5 = (p65Var2.h(mz1Var2) ? 4 : 2) | i3;
        } else {
            i5 = i3;
        }
        if ((i3 & 48) == 0) {
            i5 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            nx0Var2 = nx0Var;
            i5 |= p65Var2.f(nx0Var2) ? 256 : 128;
        } else {
            nx0Var2 = nx0Var;
        }
        int i9 = 14380032 | i5;
        if ((100663296 & i3) == 0) {
            i9 = 47934464 | i5;
        }
        if ((805306368 & i3) == 0) {
            i9 |= 268435456;
        }
        int i10 = (i4 & 6) == 0 ? i4 | 2 : i4;
        if ((i4 & 48) == 0) {
            i10 |= 16;
        }
        if ((i4 & 384) == 0) {
            i10 |= p65Var2.c(f3) ? 256 : 128;
        }
        if ((i4 & 3072) == 0) {
            i10 |= p65Var2.e(j4) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i4 & 24576) == 0) {
            i10 |= 8192;
        }
        if ((196608 & i4) == 0) {
            i10 |= p65Var2.h(mz1Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i9 & 1, ((306783379 & i9) == 306783378 && (74899 & i10) == 74898) ? false : true)) {
            p65Var2.U();
            if ((i3 & 1) == 0 || p65Var2.z()) {
                mz1 mz1Var3 = vc2.a;
                amb ambVar = ((x4c) p65Var2.j(a5c.a)).c;
                cud cudVar = ew0.a;
                long jE = ((sv1) p65Var2.j(tv1.a)).e();
                i7 = i10 & (-57471);
                j9 = jE;
                c55Var3 = mz1Var3;
                f5 = 8.0f;
                m3cVar3 = ambVar;
                z4 = true;
                jB = tv1.b(jE, p65Var2);
                jB2 = tv1.b(j4, p65Var2);
                i8 = 2;
            } else {
                p65Var2.S();
                i7 = i10 & (-57471);
                c55Var3 = c55Var;
                i8 = i2;
                z4 = z2;
                m3cVar3 = m3cVar;
                f5 = f2;
                j9 = j2;
                jB = j3;
                jB2 = j5;
            }
            p65Var2.q();
            final nx0 nx0Var3 = nx0Var2;
            br7.i(r28Var.b(jfc.c), null, j4, jB2, 0.0f, pxf.E(-747577963, new b55() { // from class: iw0
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    x12 x12Var2 = (x12) obj;
                    int iIntValue = ((Integer) obj2).intValue();
                    int i11 = 0;
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                        final nx0 nx0Var4 = nx0Var3;
                        ox0 ox0Var = nx0Var4.a;
                        final float f6 = f3;
                        mz1 mz1VarE = pxf.E(601061661, new mw0(f6, i11, mz1Var), p65Var3);
                        final boolean z5 = z4;
                        final m3c m3cVar4 = m3cVar3;
                        final float f7 = f5;
                        final long j10 = j9;
                        final long j11 = jB;
                        mz1 mz1VarE2 = pxf.E(1835125948, new b55() { // from class: nw0
                            @Override // defpackage.b55
                            public final Object invoke(Object obj3, Object obj4) {
                                x12 x12Var3 = (x12) obj3;
                                int iIntValue2 = ((Integer) obj4).intValue();
                                p65 p65Var4 = (p65) x12Var3;
                                if (p65Var4.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                                    boolean z6 = z5;
                                    nx0 nx0Var5 = nx0Var4;
                                    r28 r28VarJ = o28.b;
                                    if (z6) {
                                        p65Var4.Y(-401495582);
                                        boolean zF = p65Var4.f(nx0Var5.a.a);
                                        Object objM = p65Var4.M();
                                        if (zF || objM == w12.a) {
                                            cx0 cx0Var = new cx0(nx0Var5.a.a, hw8.Vertical);
                                            p65Var4.j0(cx0Var);
                                            objM = cx0Var;
                                        }
                                        r28VarJ = rv8.J(r28VarJ, (zc8) objM, null);
                                        p65Var4.p(false);
                                    } else {
                                        p65Var4.Y(-1675503260);
                                        p65Var4.p(false);
                                    }
                                    ox0 ox0Var2 = nx0Var5.a;
                                    r28 r28VarD = jfc.d(r28VarJ, 1.0f);
                                    float f8 = f6;
                                    bgf.f(ox0Var2, z6, m3cVar4, f7, j10, j11, f8, jfc.g(r28VarD, f8), p65Var4, 0);
                                } else {
                                    p65Var4.S();
                                }
                                return c1e.a;
                            }
                        }, p65Var3);
                        int i12 = 17;
                        mz1 mz1VarE3 = pxf.E(8287226, new r(c55Var3, i12, nx0Var4), p65Var3);
                        boolean zF = p65Var3.f(nx0Var4);
                        Object objM = p65Var3.M();
                        if (zF || objM == w12.a) {
                            objM = new l8(i12, nx0Var4);
                            p65Var3.j0(objM);
                        }
                        bgf.h(mz1VarE, mz1VarE2, mz1VarE3, f6, (m45) objM, i8, ox0Var, p65Var3, 25008);
                    } else {
                        p65Var3.S();
                    }
                    return c1e.a;
                }
            }, p65Var2), p65Var2, ((i7 >> 3) & 896) | 1572864, 50);
            j7 = jB2;
            p65Var = p65Var2;
            i6 = i8;
            z3 = z4;
            m3cVar2 = m3cVar3;
            f4 = f5;
            j6 = j9;
            j8 = jB;
            c55Var2 = c55Var3;
        } else {
            p65Var2.S();
            c55Var2 = c55Var;
            i6 = i2;
            z3 = z2;
            m3cVar2 = m3cVar;
            f4 = f2;
            j6 = j2;
            j7 = j5;
            p65Var = p65Var2;
            j8 = j3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: kw0
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i3 | 1);
                    int iY2 = tr7.y(i4);
                    bgf.g(r28Var, nx0Var, c55Var2, i6, z3, m3cVar2, f4, j6, j8, f3, j4, j7, mz1Var, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void h(mz1 mz1Var, mz1 mz1Var2, mz1 mz1Var3, float f2, m45 m45Var, int i2, ox0 ox0Var, x12 x12Var, int i3) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(757616750);
        int i4 = (p65Var.h(null) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | i3 | (p65Var.h(null) ? 4 : 2) | (p65Var.c(f2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.h(m45Var) ? 1048576 : 524288) | (p65Var.d(i2) ? 8388608 : 4194304) | (p65Var.f(ox0Var) ? 67108864 : 33554432);
        int i5 = 1;
        if (p65Var.P(i4 & 1, (38347923 & i4) != 38347922)) {
            List listR = d46.R(vc2.b, mz1Var, mz1Var2, vc2.c, mz1Var3);
            boolean z2 = ((i4 & 234881024) == 67108864) | ((3670016 & i4) == 1048576) | ((29360128 & i4) == 8388608) | ((458752 & i4) == 131072);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new zw0(m45Var, i2, f2, ox0Var);
                p65Var.j0(objM);
            }
            w48 w48Var = (w48) objM;
            mz1 mz1Var4 = new mz1(new d50(listR, i5), true, 1271844412);
            boolean zF = p65Var.f(w48Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new x48(w48Var);
                p65Var.j0(objM2);
            }
            zk7 zk7Var = (zk7) objM2;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7Var);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            km4.H(0, mz1Var4, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pw0(mz1Var, mz1Var2, mz1Var3, f2, m45Var, i2, ox0Var, i3);
        }
    }

    public static final void i(boolean z2, String str, x45 x45Var, r28 r28Var, boolean z3, x12 x12Var, int i2) {
        boolean z4;
        str.getClass();
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(591567556);
        int i3 = i2 | (p65Var.g(z2) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128) | 24576;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            vkb vkbVar = new vkb(1);
            int i4 = i3 & 14;
            boolean z5 = ((i3 & 896) == 256) | (i4 == 4);
            Object objM = p65Var.M();
            if (z5 || objM == w12.a) {
                objM = new ic0(x45Var, z2, 1);
                p65Var.j0(objM);
            }
            r28 r28VarQ = hlg.Q(r28VarD, z2, vkbVar, (m45) objM);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i5 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarQ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            o28 o28Var = o28.b;
            int i6 = i3 >> 3;
            vo7.b(z2, x45Var, w2g.G(o28Var, 12.0f, 0.0f, 0.0f, 0.0f, 14), true, null, p65Var, (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | i4 | 384 | 3072, 16);
            z4 = true;
            jjd.b(str, w2g.G(o28Var, 0.0f, 0.0f, 24.0f, 0.0f, 11), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, (i6 & 14) | 48, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
            z4 = z3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new al1(z2, str, x45Var, r28Var, z4, i2, 0);
        }
    }

    public static final void j(kj kjVar, obe obeVar, fj fjVar, r28 r28Var, x12 x12Var, int i2) {
        uob uobVar;
        fj fjVar2 = fjVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-842774564);
        int i3 = i2 | (p65Var.f(kjVar) ? 4 : 2) | (p65Var.f(obeVar) ? 32 : 16) | (p65Var.f(fjVar2) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var);
            boolean z2 = kjVar.b;
            int i4 = i3 & 896;
            boolean z3 = i4 == 256;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z3 || objM == uobVar2) {
                uobVar = uobVar2;
                vf vfVar = new vf(0, fjVar2, fj.class, "refresh", "refresh()V", 0, 24);
                p65Var.j0(vfVar);
                objM = vfVar;
            } else {
                uobVar = uobVar2;
            }
            er7.d(z2, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-881740530, new fd3(kv6VarA, (Object) kjVar, (Object) obeVar, (Object) fjVar, 21), p65Var), p65Var, (i3 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z4 = i4 == 256;
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                fjVar2 = fjVar;
                objM2 = new z8(fjVar2, null, 10);
                p65Var.j0(objM2);
            } else {
                fjVar2 = fjVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 12, kjVar, obeVar, fjVar2, r28Var);
        }
    }

    public static final void k(q53 q53Var, m45 m45Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        m45Var.getClass();
        x45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1766869520);
        int i3 = 2;
        int i4 = (p65Var2.f(q53Var) ? 4 : 2) | i2;
        if ((i2 & 48) == 0) {
            i4 |= p65Var2.h(m45Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i4 |= p65Var2.h(x45Var) ? 256 : 128;
        }
        int i5 = i4 | 3072;
        if (p65Var2.P(i5 & 1, (i5 & 1171) != 1170)) {
            mz1 mz1VarE = pxf.E(739941032, new ag1(x45Var, 15, q53Var), p65Var2);
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            hlg.a(m45Var, mz1VarE, N(o28Var, "delete_post_confirmation_dialog"), pxf.E(-1036134042, new c60(3, m45Var), p65Var2), null, nk7.e, pxf.E(594720643, new l23(i3, q53Var), p65Var2), null, 0L, 0L, 0L, 0L, null, p65Var, ((i5 >> 3) & 14) | 1772592, 0, 16272);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 15, q53Var, m45Var, x45Var, r28Var2);
        }
    }

    public static final void l(xub xubVar, hub hubVar, r28 r28Var, x12 x12Var, int i2) {
        hub hubVar2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-710283761);
        int i4 = 16;
        int i5 = i2 | (p65Var.f(xubVar) ? 4 : 2) | (p65Var.f(hubVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            yrb yrbVarK = wgf.K(p65Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new iz2(i4);
                p65Var.j0(objM);
            }
            r28 r28VarR = wgf.R(wxb.a(r28Var, false, (x45) objM).b(jfc.c), yrbVarK, false, 14);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR2);
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j5 = p65Var.T;
            int i9 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            az5 az5Var = xubVar.a;
            int i10 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            hubVar2 = hubVar;
            p(az5Var, hubVar2, p65Var, i10);
            q(xubVar.b, hubVar2, p65Var, i10);
            hp7.t(p65Var, jfc.e(o28Var, 48.0f));
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                i3 = 0;
                objM2 = bjc.b(new hy3(yrbVarK, i3));
                p65Var.j0(objM2);
            } else {
                i3 = 0;
            }
            upc upcVar = (upc) objM2;
            Boolean bool = (Boolean) upcVar.getValue();
            bool.booleanValue();
            int i11 = i10 == 32 ? 1 : i3;
            Object objM3 = p65Var.M();
            if (i11 != 0 || objM3 == uobVar) {
                objM3 = new rc0(hubVar2, upcVar, null, 12);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, bool);
        } else {
            hubVar2 = hubVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 3, xubVar, hubVar2, r28Var);
        }
    }

    public static final void m(m45 m45Var, m45 m45Var2, m45 m45Var3, m45 m45Var4, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        m45Var.getClass();
        m45Var2.getClass();
        m45Var3.getClass();
        m45Var4.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(392900307);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(m45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(m45Var2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(m45Var3) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(m45Var4) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = i3 | 24576;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            m40.h(m45Var4, null, pxf.E(-352385252, new fw5(m45Var, m45Var2, m45Var3, m45Var4, 0), p65Var), p65Var, ((i4 >> 9) & 14) | 384, 2);
            r28Var2 = o28.b;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(m45Var, m45Var2, m45Var3, m45Var4, r28Var2, i2);
        }
    }

    public static final void n(int i2, m45 m45Var, r28 r28Var, x12 x12Var, int i3) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(701076280);
        int i4 = (p65Var2.d(i2) ? 4 : 2) | i3 | (p65Var2.h(m45Var) ? 32 : 16);
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            r28 r28VarR = hlg.r(r28Var, false, null, new vkb(0), m45Var, 11);
            fr5 fr5Var = g56.a;
            r28 r28VarG = w2g.G(jfc.d(r28VarR.b(w08.b), 1.0f), 24.0f, 0.0f, 24.0f, 0.0f, 10);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var2.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, zk7VarC);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR2);
            jjd.b(vo7.R(p65Var2, i2), iy0.a.a(o28.b, z46.g), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).n, p65Var2, 0, 0, 131068);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gw5(i2, m45Var, r28Var, i3);
        }
    }

    public static final void o(final h86 h86Var, final ek8 ek8Var, x12 x12Var, int i2) {
        String str = h86Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1465545368);
        int i3 = (p65Var.f(h86Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        final int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            String str2 = h86Var.e;
            boolean z2 = h86Var.a;
            kx kxVarW = ho2.w(p65Var, -360162657);
            String strA = af1.a(h86Var.g, p65Var);
            int i5 = h86Var.h;
            String strQ = vo7.Q(R.string.notification_type_item_added_to_followed_catalog, new Object[]{str, vo7.D(R.plurals.n_stories, i5, new Object[]{Integer.valueOf(i5)}, p65Var), strA}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str.length() + iZ);
                int iZ2 = muc.Z(strQ, strA, 0, false, 6);
                mx mxVarC = ka1.c(strA, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j2 = h86Var.b;
                int i6 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i7 = i3 & 14;
                boolean z3 = (i6 == 32) | (i7 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z3 || objM == uobVar) {
                    objM = new m45() { // from class: i86
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i8 = i;
                            c1e c1eVar = c1e.a;
                            h86 h86Var2 = h86Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i8) {
                                case 0:
                                    ek8Var2.o(h86Var2.f, h86Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(h86Var2.c, h86Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i8 = (i6 == 32 ? 1 : 0) | (i7 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i8 != 0 || objM2 == uobVar) {
                    objM2 = new m45() { // from class: i86
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i82 = i4;
                            c1e c1eVar = c1e.a;
                            h86 h86Var2 = h86Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i82) {
                                case 0:
                                    ek8Var2.o(h86Var2.f, h86Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(h86Var2.c, h86Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z2, str2, null, mxVarC, j2, 0, m45Var, (m45) objM2, p65Var, 384, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(h86Var, ek8Var, i2, 15);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void p(final az5 az5Var, hub hubVar, x12 x12Var, final int i2) {
        int i3;
        p65 p65Var;
        mwa mwaVarS;
        b55 b55Var;
        int i4;
        x45 x45Var;
        final hub hubVar2 = hubVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1130556992);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(az5Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i5 = 32;
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(hubVar2) ? 32 : 16;
        }
        int i6 = i3;
        int i7 = 1;
        final int i8 = 0;
        if (!p65Var2.P(i6 & 1, (i6 & 19) != 18)) {
            p65Var = p65Var2;
            p65Var.S();
        } else {
            if (((t0) az5Var).isEmpty()) {
                mwaVarS = p65Var2.s();
                if (mwaVarS != null) {
                    b55Var = new b55() { // from class: iy3
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i9 = i8;
                            c1e c1eVar = c1e.a;
                            int i10 = i2;
                            hub hubVar3 = hubVar2;
                            az5 az5Var2 = az5Var;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).getClass();
                            switch (i9) {
                                case 0:
                                    bgf.p(az5Var2, hubVar3, x12Var2, tr7.y(i10 | 1));
                                    break;
                                default:
                                    bgf.p(az5Var2, hubVar3, x12Var2, tr7.y(i10 | 1));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    mwaVarS.d = b55Var;
                }
                return;
            }
            jjd.b(vo7.R(p65Var2, R.string.search_recent_searches), N(w2g.F(o28.b, 24.0f, 32.0f, 24.0f, 16.0f), "search_history_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).i, p65Var2, 48, 0, 131068);
            p65Var = p65Var2;
            Iterator it2 = az5Var.iterator();
            while (it2.hasNext()) {
                String str = (String) it2.next();
                int i9 = i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i10 = i9 == i5 ? i7 : i8;
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (i10 != 0 || objM == uobVar) {
                    i4 = i5;
                    k0 k0Var = new k0(1, hubVar2, hub.class, "onSearchHistorySelected", "onSearchHistorySelected(Ljava/lang/String;)V", 0, 17);
                    p65Var.j0(k0Var);
                    objM = k0Var;
                } else {
                    i4 = i5;
                }
                x45 x45Var2 = (x45) ((qh6) objM);
                boolean z2 = i9 == i4;
                Object objM2 = p65Var.M();
                if (z2 || objM2 == uobVar) {
                    x45Var = x45Var2;
                    hubVar2 = hubVar;
                    objM2 = new k0(1, hubVar2, hub.class, "onDeleteSearchHistorySelected", "onDeleteSearchHistorySelected(Ljava/lang/String;)V", 0, 18);
                    p65Var.j0(objM2);
                } else {
                    hubVar2 = hubVar;
                    x45Var = x45Var2;
                }
                mq7.p(str, x45Var, (x45) ((qh6) objM2), p65Var, 0);
                i8 = 0;
                i5 = i4;
                i7 = 1;
            }
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final int i11 = 1;
            b55Var = new b55() { // from class: iy3
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i92 = i11;
                    c1e c1eVar = c1e.a;
                    int i102 = i2;
                    hub hubVar3 = hubVar2;
                    az5 az5Var2 = az5Var;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).getClass();
                    switch (i92) {
                        case 0:
                            bgf.p(az5Var2, hubVar3, x12Var2, tr7.y(i102 | 1));
                            break;
                        default:
                            bgf.p(az5Var2, hubVar3, x12Var2, tr7.y(i102 | 1));
                            break;
                    }
                    return c1eVar;
                }
            };
            mwaVarS.d = b55Var;
        }
    }

    public static final void q(wub wubVar, hub hubVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1248514566);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(wubVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(hubVar) ? 32 : 16;
        }
        if (!p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.S();
        } else if (g76.L(wubVar, tub.a)) {
            p65Var.Y(-80409149);
            p65Var.p(false);
        } else if (g76.L(wubVar, uub.a)) {
            p65Var.Y(-80295751);
            r(p65Var, 0);
            p65Var.p(false);
        } else {
            if (!(wubVar instanceof vub)) {
                throw ho2.L(p65Var, -1526616979, false);
            }
            p65Var.Y(-80169147);
            s((vub) wubVar, hubVar, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(wubVar, hubVar, i2, 10);
        }
    }

    public static final void r(x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1260907543);
        if (p65Var.P(i2 & 1, i2 != 0)) {
            o28 o28Var = o28.b;
            r28 r28VarV = m40.V(jfc.d(o28Var, 1.0f), p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            long j3 = ((zo7) p65Var.j(kt7.b)).c;
            r28 r28VarM = jfc.m(w2g.F(o28Var, 24.0f, 48.0f, 24.0f, 16.0f), 140.0f, 32.0f);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarM, j3, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.m(w2g.F(o28Var, 24.0f, 12.0f, 24.0f, 12.0f), 240.0f, 24.0f), j3, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.m(w2g.F(o28Var, 24.0f, 12.0f, 24.0f, 12.0f), 280.0f, 24.0f), j3, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.m(w2g.F(o28Var, 24.0f, 12.0f, 24.0f, 12.0f), 200.0f, 24.0f), j3, nr5Var), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v02(i2);
        }
    }

    public static final void s(vub vubVar, final hub hubVar, x12 x12Var, int i2) {
        final int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(901514693);
        int i4 = (i2 & 6) == 0 ? i2 | (p65Var.f(vubVar) ? 4 : 2) : i2;
        if ((i2 & 48) == 0) {
            i4 |= p65Var.f(hubVar) ? 32 : 16;
        }
        int i5 = i4;
        if (p65Var.P(i5 & 1, (i5 & 19) != 18)) {
            jjd.b(vo7.R(p65Var, R.string.search_explore_tags), w2g.F(o28.b, 24.0f, 48.0f, 24.0f, 16.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).i, p65Var, 48, 0, 131068);
            p65Var = p65Var;
            for (ky3 ky3Var : vubVar.a) {
                int i6 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                boolean z2 = i6 == 32;
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    i3 = 0;
                    objM = new b55() { // from class: jy3
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) throws PendingIntent.CanceledException {
                            int i7 = i3;
                            c1e c1eVar = c1e.a;
                            hub hubVar2 = hubVar;
                            String str = (String) obj;
                            String str2 = (String) obj2;
                            str.getClass();
                            str2.getClass();
                            switch (i7) {
                                case 0:
                                    gvb gvbVar = hubVar2.b;
                                    if (!gvbVar.o.contains(str)) {
                                        gvbVar.e.g(str, gvbVar.b, str2, gvbVar.l);
                                    }
                                    break;
                                default:
                                    SearchFragment searchFragment = ((htb) hubVar2.a).a;
                                    searchFragment.Z();
                                    Context contextS = searchFragment.S();
                                    Bundle bundle = new Bundle();
                                    bundle.putParcelable("bundle_info", new TagDirectoryFragment.BundleInfo(str, str2));
                                    m4.w(contextS, R.id.tagDirectoryFragment, bundle, null, 12);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                } else {
                    i3 = 0;
                }
                b55 b55Var = (b55) objM;
                int i7 = i6 == 32 ? 1 : i3;
                Object objM2 = p65Var.M();
                if (i7 != 0 || objM2 == uobVar) {
                    final int i8 = 1;
                    objM2 = new b55() { // from class: jy3
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) throws PendingIntent.CanceledException {
                            int i72 = i8;
                            c1e c1eVar = c1e.a;
                            hub hubVar2 = hubVar;
                            String str = (String) obj;
                            String str2 = (String) obj2;
                            str.getClass();
                            str2.getClass();
                            switch (i72) {
                                case 0:
                                    gvb gvbVar = hubVar2.b;
                                    if (!gvbVar.o.contains(str)) {
                                        gvbVar.e.g(str, gvbVar.b, str2, gvbVar.l);
                                    }
                                    break;
                                default:
                                    SearchFragment searchFragment = ((htb) hubVar2.a).a;
                                    searchFragment.Z();
                                    Context contextS = searchFragment.S();
                                    Bundle bundle = new Bundle();
                                    bundle.putParcelable("bundle_info", new TagDirectoryFragment.BundleInfo(str, str2));
                                    m4.w(contextS, R.id.tagDirectoryFragment, bundle, null, 12);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                d46.i(ky3Var, b55Var, (b55) objM2, p65Var, i3);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(vubVar, hubVar, i2, 11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object t(defpackage.wx6 r6, defpackage.p92 r7) throws java.lang.Throwable {
        /*
            boolean r0 = r7 instanceof defpackage.sy6
            if (r0 == 0) goto L13
            r0 = r7
            sy6 r0 = (defpackage.sy6) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            sy6 r0 = new sy6
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            c1e r3 = defpackage.c1e.a
            r4 = 1
            if (r2 == 0) goto L36
            if (r2 != r4) goto L2f
            rya r6 = r0.c
            wx6 r0 = r0.b
            defpackage.br7.v(r7)     // Catch: java.lang.Throwable -> L2d
            goto L71
        L2d:
            r7 = move-exception
            goto L80
        L2f:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L36:
            defpackage.br7.v(r7)
            r7 = r6
            ky6 r7 = (defpackage.ky6) r7
            vx6 r7 = r7.d
            vx6 r2 = defpackage.vx6.STARTED
            boolean r7 = r7.isAtLeast(r2)
            if (r7 == 0) goto L47
            goto L7a
        L47:
            rya r7 = new rya
            r7.<init>()
            r0.b = r6     // Catch: java.lang.Throwable -> L7b
            r0.c = r7     // Catch: java.lang.Throwable -> L7b
            r0.e = r4     // Catch: java.lang.Throwable -> L7b
            x51 r2 = new x51     // Catch: java.lang.Throwable -> L7b
            n92 r0 = defpackage.pwd.Q(r0)     // Catch: java.lang.Throwable -> L7b
            r2.<init>(r4, r0)     // Catch: java.lang.Throwable -> L7b
            r2.s()     // Catch: java.lang.Throwable -> L7b
            zw3 r0 = new zw3     // Catch: java.lang.Throwable -> L7b
            r0.<init>(r2)     // Catch: java.lang.Throwable -> L7b
            r7.a = r0     // Catch: java.lang.Throwable -> L7b
            r6.a(r0)     // Catch: java.lang.Throwable -> L7b
            java.lang.Object r0 = r2.q()     // Catch: java.lang.Throwable -> L7b
            if (r0 != r1) goto L6f
            return r1
        L6f:
            r0 = r6
            r6 = r7
        L71:
            java.lang.Object r6 = r6.a
            hy6 r6 = (defpackage.hy6) r6
            if (r6 == 0) goto L7a
            r0.b(r6)
        L7a:
            return r3
        L7b:
            r0 = move-exception
            r5 = r0
            r0 = r6
            r6 = r7
            r7 = r5
        L80:
            java.lang.Object r6 = r6.a
            hy6 r6 = (defpackage.hy6) r6
            if (r6 == 0) goto L89
            r0.b(r6)
        L89:
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bgf.t(wx6, p92):java.lang.Object");
    }

    public static final void u(m7f m7fVar, String str) {
        u8f u8fVarB;
        WorkDatabase workDatabase = m7fVar.c;
        workDatabase.getClass();
        g8f g8fVarX = workDatabase.x();
        v73 v73VarS = workDatabase.s();
        ArrayList arrayListT = d46.T(str);
        while (!arrayListT.isEmpty()) {
            String str2 = (String) bu1.U0(arrayListT);
            j7f j7fVarD = g8fVarX.d(str2);
            if (j7fVarD != j7f.SUCCEEDED && j7fVarD != j7f.FAILED) {
                ((Number) n01.c0(g8fVarX.a, false, true, new nmc(str2, 17))).intValue();
            }
            arrayListT.addAll(v73VarS.a(str2));
        }
        i2a i2aVar = m7fVar.f;
        i2aVar.getClass();
        synchronized (i2aVar.k) {
            d87.h().d(i2a.l, "Processor cancelling " + str);
            i2aVar.i.add(str);
            u8fVarB = i2aVar.b(str);
        }
        i2a.e(str, u8fVarB, 1);
        Iterator it2 = m7fVar.e.iterator();
        while (it2.hasNext()) {
            ((pqb) it2.next()).d(str);
        }
    }

    public static void v(c72 c72Var, wz6 wz6Var, b72 b72Var) {
        b72Var.p = -1;
        l52 l52Var = b72Var.N;
        a72[] a72VarArr = b72Var.U;
        l52 l52Var2 = b72Var.M;
        l52 l52Var3 = b72Var.K;
        l52 l52Var4 = b72Var.L;
        l52 l52Var5 = b72Var.J;
        b72Var.q = -1;
        a72[] a72VarArr2 = c72Var.U;
        a72 a72Var = a72VarArr2[0];
        a72 a72Var2 = a72.WRAP_CONTENT;
        if (a72Var != a72Var2 && a72VarArr[0] == a72.MATCH_PARENT) {
            int i2 = l52Var5.g;
            int iR = c72Var.r() - l52Var4.g;
            l52Var5.i = wz6Var.k(l52Var5);
            l52Var4.i = wz6Var.k(l52Var4);
            wz6Var.d(l52Var5.i, i2);
            wz6Var.d(l52Var4.i, iR);
            b72Var.p = 2;
            b72Var.a0 = i2;
            int i3 = iR - i2;
            b72Var.W = i3;
            int i4 = b72Var.d0;
            if (i3 < i4) {
                b72Var.W = i4;
            }
        }
        if (a72VarArr2[1] == a72Var2 || a72VarArr[1] != a72.MATCH_PARENT) {
            return;
        }
        int i5 = l52Var3.g;
        int iL = c72Var.l() - l52Var2.g;
        l52Var3.i = wz6Var.k(l52Var3);
        l52Var2.i = wz6Var.k(l52Var2);
        wz6Var.d(l52Var3.i, i5);
        wz6Var.d(l52Var2.i, iL);
        if (b72Var.c0 > 0 || b72Var.i0 == 8) {
            gkc gkcVarK = wz6Var.k(l52Var);
            l52Var.i = gkcVarK;
            wz6Var.d(gkcVarK, b72Var.c0 + i5);
        }
        b72Var.q = 2;
        b72Var.b0 = i5;
        int i6 = iL - i5;
        b72Var.X = i6;
        int i7 = b72Var.e0;
        if (i6 < i7) {
            b72Var.X = i7;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0082, code lost:
    
        if (r2.a(r10, r0) == r1) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0070 A[Catch: all -> 0x0035, TRY_LEAVE, TryCatch #0 {all -> 0x0035, blocks: (B:13:0x002f, B:24:0x0053, B:28:0x0068, B:30:0x0070, B:20:0x0045, B:23:0x004f), top: B:47:0x0021 }] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x0082 -> B:14:0x0032). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object w(defpackage.do4 r7, defpackage.wj1 r8, boolean r9, defpackage.n92 r10) throws java.lang.Throwable {
        /*
            boolean r0 = r10 instanceof defpackage.lo4
            if (r0 == 0) goto L13
            r0 = r10
            lo4 r0 = (defpackage.lo4) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            lo4 r0 = new lo4
            r0.<init>(r10)
        L18:
            java.lang.Object r10 = r0.f
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L49
            if (r2 == r4) goto L3d
            if (r2 != r3) goto L37
            boolean r9 = r0.e
            pz0 r7 = r0.d
            wj1 r8 = r0.c
            do4 r2 = r0.b
            defpackage.br7.v(r10)     // Catch: java.lang.Throwable -> L35
        L32:
            r10 = r7
            r7 = r2
            goto L53
        L35:
            r7 = move-exception
            goto L8d
        L37:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L3d:
            boolean r9 = r0.e
            pz0 r7 = r0.d
            wj1 r8 = r0.c
            do4 r2 = r0.b
            defpackage.br7.v(r10)     // Catch: java.lang.Throwable -> L35
            goto L68
        L49:
            defpackage.br7.v(r10)
            defpackage.hlg.A(r7)
            pz0 r10 = r8.iterator()     // Catch: java.lang.Throwable -> L35
        L53:
            r0.b = r7     // Catch: java.lang.Throwable -> L35
            r0.c = r8     // Catch: java.lang.Throwable -> L35
            r0.d = r10     // Catch: java.lang.Throwable -> L35
            r0.e = r9     // Catch: java.lang.Throwable -> L35
            r0.g = r4     // Catch: java.lang.Throwable -> L35
            java.lang.Object r2 = r10.b(r0)     // Catch: java.lang.Throwable -> L35
            if (r2 != r1) goto L64
            goto L84
        L64:
            r6 = r2
            r2 = r7
            r7 = r10
            r10 = r6
        L68:
            java.lang.Boolean r10 = (java.lang.Boolean) r10     // Catch: java.lang.Throwable -> L35
            boolean r10 = r10.booleanValue()     // Catch: java.lang.Throwable -> L35
            if (r10 == 0) goto L85
            java.lang.Object r10 = r7.c()     // Catch: java.lang.Throwable -> L35
            r0.b = r2     // Catch: java.lang.Throwable -> L35
            r0.c = r8     // Catch: java.lang.Throwable -> L35
            r0.d = r7     // Catch: java.lang.Throwable -> L35
            r0.e = r9     // Catch: java.lang.Throwable -> L35
            r0.g = r3     // Catch: java.lang.Throwable -> L35
            java.lang.Object r10 = r2.a(r10, r0)     // Catch: java.lang.Throwable -> L35
            if (r10 != r1) goto L32
        L84:
            return r1
        L85:
            if (r9 == 0) goto L8a
            r8.m(r5)
        L8a:
            c1e r7 = defpackage.c1e.a
            return r7
        L8d:
            throw r7     // Catch: java.lang.Throwable -> L8e
        L8e:
            r10 = move-exception
            if (r9 == 0) goto La7
            boolean r9 = r7 instanceof java.util.concurrent.CancellationException
            if (r9 == 0) goto L98
            r5 = r7
            java.util.concurrent.CancellationException r5 = (java.util.concurrent.CancellationException) r5
        L98:
            if (r5 != 0) goto La4
            java.util.concurrent.CancellationException r5 = new java.util.concurrent.CancellationException
            java.lang.String r9 = "Channel was consumed, consumer had failed"
            r5.<init>(r9)
            r5.initCause(r7)
        La4:
            r8.m(r5)
        La7:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bgf.w(do4, wj1, boolean, n92):java.lang.Object");
    }

    public static final boolean x(int i2, int i3) {
        return (i2 & i3) == i3;
    }

    public static final kb2 y(Executor executor) {
        return new w44(executor);
    }

    public static final int z(xzb xzbVar, fb6 fb6Var, String str) {
        xzbVar.getClass();
        str.getClass();
        D(fb6Var, xzbVar);
        int iD = xzbVar.d(str);
        if (iD != -3) {
            return iD;
        }
        c93 c93Var = fb6Var.c;
        ps5 ps5Var = new ps5(xzbVar, 2, fb6Var);
        ConcurrentHashMap concurrentHashMap = c93Var.a;
        Map map = (Map) concurrentHashMap.get(xzbVar);
        xsa xsaVar = G;
        Object obj = map != null ? map.get(xsaVar) : null;
        Object objInvoke = obj != null ? obj : null;
        if (objInvoke == null) {
            objInvoke = ps5Var.invoke();
            Object concurrentHashMap2 = concurrentHashMap.get(xzbVar);
            if (concurrentHashMap2 == null) {
                concurrentHashMap2 = new ConcurrentHashMap(2);
                concurrentHashMap.put(xzbVar, concurrentHashMap2);
            }
            ((Map) concurrentHashMap2).put(xsaVar, objInvoke);
        }
        Integer num = (Integer) ((Map) objInvoke).get(str);
        if (num != null) {
            return num.intValue();
        }
        return -3;
    }

    public abstract int A(View view, ViewGroup.MarginLayoutParams marginLayoutParams);

    public abstract int B();

    public abstract ViewPropertyAnimator C(View view, int i2);
}
