package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewParent;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.google.android.gms.internal.fido.zzhf;
import com.google.android.gms.internal.fido.zzhj;
import com.medium.android.core.models.EntityType;
import com.medium.android.domain.post.models.AnchorType;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.domain.post.models.Markup;
import com.medium.android.domain.post.models.MarkupType;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class ep7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;

    public static void A(View view, CharSequence charSequence) {
        if (Build.VERSION.SDK_INT >= 26) {
            eod.a(view, charSequence);
            return;
        }
        god godVar = god.k;
        if (godVar != null && godVar.a == view) {
            god.b(null);
        }
        if (!TextUtils.isEmpty(charSequence)) {
            new god(view, charSequence);
            return;
        }
        god godVar2 = god.l;
        if (godVar2 != null && godVar2.a == view) {
            godVar2.a();
        }
        view.setOnLongClickListener(null);
        view.setLongClickable(false);
        view.setOnHoverListener(null);
    }

    public static boolean B(Intent intent) {
        Bundle extras;
        if (intent == null || "com.google.firebase.messaging.RECEIVE_DIRECT_BOOT".equals(intent.getAction()) || (extras = intent.getExtras()) == null) {
            return false;
        }
        return "1".equals(extras.getString("google.c.a.e"));
    }

    public static String C(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length);
        for (byte b2 : bArr) {
            if (b2 == 34) {
                sb.append("\\\"");
            } else if (b2 == 39) {
                sb.append("\\'");
            } else if (b2 != 92) {
                switch (b2) {
                    case 7:
                        sb.append("\\a");
                        break;
                    case 8:
                        sb.append("\\b");
                        break;
                    case 9:
                        sb.append("\\t");
                        break;
                    case 10:
                        sb.append("\\n");
                        break;
                    case 11:
                        sb.append("\\v");
                        break;
                    case 12:
                        sb.append("\\f");
                        break;
                    case 13:
                        sb.append("\\r");
                        break;
                    default:
                        if (b2 < 32 || b2 > 126) {
                            sb.append('\\');
                            sb.append((char) (((b2 >>> 6) & 3) + 48));
                            sb.append((char) (((b2 >>> 3) & 7) + 48));
                            sb.append((char) ((b2 & 7) + 48));
                        } else {
                            sb.append((char) b2);
                        }
                        break;
                }
            } else {
                sb.append("\\\\");
            }
        }
        return sb.toString();
    }

    public static final o7g D(u7g u7gVar) throws zzhj {
        try {
            r7g r7gVarB = u7gVar.B();
            if (r7gVarB == null) {
                throw new zzhj("Parser being asked to parse an empty input stream");
            }
            try {
                byte b2 = r7gVarB.b;
                byte b3 = r7gVarB.a;
                int i = 0;
                if (b3 == -128) {
                    long jF = u7gVar.f();
                    if (jF > 1000) {
                        throw new zzhj("Parser being asked to read a large CBOR array");
                    }
                    E(b2, jF);
                    o7g[] o7gVarArr = new o7g[(int) jF];
                    while (i < jF) {
                        o7gVarArr[i] = D(u7gVar);
                        i++;
                    }
                    return new w6g(ayf.B(o7gVarArr));
                }
                try {
                    if (b3 != -96) {
                        if (b3 == -64) {
                            throw new zzhj("Tags are currently unsupported");
                        }
                        if (b3 == -32) {
                            return new x6g(u7gVar.D());
                        }
                        if (b3 == 0 || b3 == 32) {
                            long jM = u7gVar.m();
                            E(b2, jM > 0 ? jM : ~jM);
                            return new c7g(jM);
                        }
                        if (b3 == 64) {
                            u7gVar.N((byte) 64);
                            byte[] bArrR = u7gVar.R();
                            int length = bArrR.length;
                            E(b2, length);
                            return new z6g(a6g.s(length, bArrR));
                        }
                        if (b3 != 96) {
                            throw new zzhj("Unidentifiable major type: " + ((b3 >> 5) & 7));
                        }
                        u7gVar.N((byte) 96);
                        String str = new String(u7gVar.R(), StandardCharsets.UTF_8);
                        E(b2, str.length());
                        return new j7g(str);
                    }
                    long jP = u7gVar.p();
                    if (jP > 1000) {
                        throw new zzhj("Parser being asked to read a large CBOR map");
                    }
                    E(b2, jP);
                    int i2 = (int) jP;
                    zjf[] zjfVarArr = new zjf[i2];
                    o7g o7gVar = null;
                    int i3 = 0;
                    while (i3 < jP) {
                        o7g o7gVarD = D(u7gVar);
                        if (o7gVar != null && o7gVarD.compareTo(o7gVar) <= 0) {
                            throw new zzhf("Keys in CBOR Map not in strictly ascending natural order:\nPrevious key: " + o7gVar.toString() + "\nCurrent key: " + o7gVarD.toString());
                        }
                        zjfVarArr[i3] = new zjf(o7gVarD, 9, D(u7gVar));
                        i3++;
                        o7gVar = o7gVarD;
                    }
                    TreeMap treeMap = new TreeMap();
                    while (i < i2) {
                        zjf zjfVar = zjfVarArr[i];
                        if (treeMap.containsKey((o7g) zjfVar.b)) {
                            throw new zzhf("Attempted to add duplicate key to canonical CBOR Map.");
                        }
                        treeMap.put((o7g) zjfVar.b, (o7g) zjfVar.c);
                        i++;
                    }
                    return new h7g(nyf.b(treeMap));
                } catch (RuntimeException e) {
                    e = e;
                    throw new zzhj(e);
                }
            } catch (IOException | RuntimeException e2) {
                e = e2;
            }
        } catch (IOException e3) {
            throw new zzhj(e3);
        }
    }

    public static final void E(byte b2, long j) throws zzhf {
        switch (b2) {
            case 24:
                if (j < 24) {
                    throw new zzhf(b09.x("Integer value ", " after add info could have been represented in 0 additional bytes, but used 1", j));
                }
                return;
            case 25:
                if (j < 256) {
                    throw new zzhf(b09.x("Integer value ", " after add info could have been represented in 0-1 additional bytes, but used 2", j));
                }
                return;
            case 26:
                if (j < 65536) {
                    throw new zzhf(b09.x("Integer value ", " after add info could have been represented in 0-2 additional bytes, but used 4", j));
                }
                return;
            case 27:
                if (j < 4294967296L) {
                    throw new zzhf(b09.x("Integer value ", " after add info could have been represented in 0-4 additional bytes, but used 8", j));
                }
                return;
            default:
                return;
        }
    }

    public static final void a(sfb sfbVar, boolean z, veb vebVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        int i2;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1845029526);
        int i3 = i | (p65Var.f(sfbVar) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.f(vebVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.E(o28Var, 24.0f, 0.0f, 2), "actions_row");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            xm1 xm1Var = sfbVar.f;
            boolean z3 = sfbVar.p;
            int i5 = sfbVar.g;
            sgg.h(xm1Var, rm1.M, new reb(vebVar, sfbVar), w2g.G(o28Var, 0.0f, 0.0f, 12.0f, 0.0f, 11), ((zo7) p65Var.j(kt7.b)).o, false, bmb.a(21.0f), p65Var, 199728, 0);
            uob uobVar = w12.a;
            if (i5 > 0) {
                p65Var.Y(189947421);
                hp7.t(p65Var, jfc.p(o28Var, 2.0f));
                if (z3) {
                    i2 = 4;
                    z2 = false;
                    p65Var.Y(190402625);
                    boolean z4 = ((i3 & 14) == 4) | ((i3 & 896) == 256);
                    Object objM = p65Var.M();
                    if (z4 || objM == uobVar) {
                        objM = new heb(vebVar, sfbVar, 3);
                        p65Var.j0(objM);
                    }
                    jq7.e(0, p65Var, (m45) objM, null);
                    p65Var.p(false);
                } else {
                    p65Var.Y(190034903);
                    int i6 = sfbVar.g;
                    boolean z5 = sfbVar.i;
                    i2 = 4;
                    boolean z6 = ((i3 & 14) == 4) | ((i3 & 896) == 256);
                    Object objM2 = p65Var.M();
                    if (z6 || objM2 == uobVar) {
                        objM2 = new heb(vebVar, sfbVar, 2);
                        p65Var.j0(objM2);
                    }
                    iq7.i(i6, z5, null, (m45) objM2, p65Var, 0);
                    z2 = false;
                    p65Var.p(false);
                }
            } else {
                i2 = 4;
                z2 = false;
                p65Var.Y(161256456);
            }
            p65Var.p(z2);
            if ((i5 == 0 || !z3) && !z) {
                p65Var.Y(190759590);
                r28 r28VarN2 = bgf.N(o28Var, "write_response_button");
                String strR = vo7.R(p65Var, R.string.response_item_reply);
                xn7 xn7Var = xn7.S;
                boolean z7 = ((i3 & 14) == i2 ? true : z2) | ((i3 & 896) == 256 ? true : z2);
                Object objM3 = p65Var.M();
                if (z7 || objM3 == uobVar) {
                    objM3 = new heb(vebVar, sfbVar, i2);
                    p65Var.j0(objM3);
                }
                fo7.k(3456, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var, (m45) objM3, xn7Var, r28VarN2, strR, false, false);
                p65Var = p65Var;
            } else {
                p65Var.Y(161256456);
            }
            p65Var.p(z2);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(sfbVar, z, vebVar, r28Var2, i, 7);
        }
    }

    public static final void b(final qfb qfbVar, r28 r28Var, x12 x12Var, final int i) {
        p65 p65Var;
        final r28 r28Var2;
        int i2;
        int i3;
        sn3 sn3Var;
        long j;
        long j2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-262929391);
        int i4 = (p65Var2.f(qfbVar) ? 4 : 2) | i | 48;
        final int i5 = 0;
        if (p65Var2.P(i4 & 1, (i4 & 19) != 18)) {
            boolean z = qfbVar.e;
            final o28 o28Var = o28.b;
            if (!z && !qfbVar.f) {
                mwa mwaVarS = p65Var2.s();
                if (mwaVarS != null) {
                    mwaVarS.d = new b55(qfbVar, o28Var, i, i5) { // from class: neb
                        public final /* synthetic */ int a;
                        public final /* synthetic */ qfb b;
                        public final /* synthetic */ r28 c;

                        {
                            this.a = i5;
                        }

                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i6 = this.a;
                            c1e c1eVar = c1e.a;
                            r28 r28Var3 = this.c;
                            qfb qfbVar2 = this.b;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).getClass();
                            switch (i6) {
                                case 0:
                                    ep7.b(qfbVar2, r28Var3, x12Var2, tr7.y(1));
                                    break;
                                default:
                                    ep7.b(qfbVar2, r28Var3, x12Var2, tr7.y(1));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    return;
                }
                return;
            }
            hp7.t(p65Var2, jfc.l(o28Var, 4.0f));
            if (z) {
                i2 = 1091104812;
                i3 = R.string.response_item_author;
            } else {
                i2 = 1091179119;
                i3 = R.string.response_item_you;
            }
            String strW = km4.w(p65Var2, i2, i3, p65Var2, false);
            mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).o;
            if (z) {
                p65Var2.Y(1091400862);
                sn3Var = kt7.b;
                j = ((zo7) p65Var2.j(sn3Var)).e;
                p65Var2.p(false);
            } else {
                p65Var2.Y(1091489243);
                sn3Var = kt7.b;
                j = ((zo7) p65Var2.j(sn3Var)).b;
                p65Var2.p(false);
            }
            r28 r28VarN = bgf.N(w2g.D(flb.a0(o28Var, j, bmb.a(4.0f)), 4.0f, 1.0f), "author");
            if (z) {
                p65Var2.Y(1091771498);
                j2 = ((zo7) p65Var2.j(sn3Var)).q;
                p65Var2.p(false);
            } else {
                p65Var2.Y(1091847851);
                j2 = ((zo7) p65Var2.j(sn3Var)).o;
                p65Var2.p(false);
            }
            p65Var = p65Var2;
            jjd.b(strW, r28VarN, j2, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, 0, 0, 131064);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS2 = p65Var.s();
        if (mwaVarS2 != null) {
            final int i6 = 1;
            mwaVarS2.d = new b55(qfbVar, r28Var2, i, i6) { // from class: neb
                public final /* synthetic */ int a;
                public final /* synthetic */ qfb b;
                public final /* synthetic */ r28 c;

                {
                    this.a = i6;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i62 = this.a;
                    c1e c1eVar = c1e.a;
                    r28 r28Var3 = this.c;
                    qfb qfbVar2 = this.b;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).getClass();
                    switch (i62) {
                        case 0:
                            ep7.b(qfbVar2, r28Var3, x12Var2, tr7.y(1));
                            break;
                        default:
                            ep7.b(qfbVar2, r28Var3, x12Var2, tr7.y(1));
                            break;
                    }
                    return c1eVar;
                }
            };
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v12 */
    /* JADX WARN: Type inference failed for: r10v7 */
    /* JADX WARN: Type inference failed for: r10v8, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r11v10 */
    /* JADX WARN: Type inference failed for: r11v11 */
    /* JADX WARN: Type inference failed for: r11v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r11v4, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r11v6, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r11v8 */
    /* JADX WARN: Type inference failed for: r11v9 */
    /* JADX WARN: Type inference failed for: r12v12 */
    /* JADX WARN: Type inference failed for: r12v8 */
    /* JADX WARN: Type inference failed for: r12v9, types: [int] */
    /* JADX WARN: Type inference failed for: r18v1, types: [x12] */
    /* JADX WARN: Type inference failed for: r4v22, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r7v18, types: [x12] */
    public static final void c(final sfb sfbVar, final boolean z, final boolean z2, final veb vebVar, final r28 r28Var, x12 x12Var, final int i) {
        ?? r11;
        mwa mwaVarS;
        b55 b55Var;
        int i2;
        ot2 ot2Var;
        qfb qfbVar;
        int i3;
        o28 o28Var;
        ?? r10;
        ?? r112;
        o28 o28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(132485220);
        int i4 = i | (p65Var.f(sfbVar) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.g(z2) ? 256 : 128) | (p65Var.f(vebVar) ? 2048 : 1024);
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            qfb qfbVar2 = sfbVar.e;
            if (qfbVar2 == null) {
                mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    final int i5 = 1;
                    b55Var = new b55(sfbVar, z, z2, vebVar, r28Var, i, i5) { // from class: ieb
                        public final /* synthetic */ int a;
                        public final /* synthetic */ sfb b;
                        public final /* synthetic */ boolean c;
                        public final /* synthetic */ boolean d;
                        public final /* synthetic */ veb e;
                        public final /* synthetic */ r28 f;

                        {
                            this.a = i5;
                        }

                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i6 = this.a;
                            c1e c1eVar = c1e.a;
                            switch (i6) {
                                case 0:
                                    ((Integer) obj2).getClass();
                                    int iY = tr7.y(24577);
                                    ep7.c(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY);
                                    break;
                                default:
                                    ((Integer) obj2).getClass();
                                    int iY2 = tr7.y(24577);
                                    ep7.c(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY2);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    mwaVarS.d = b55Var;
                }
                return;
            }
            r28 r28VarN = bgf.N(pwd.P(w2g.F(r28Var, 24.0f, 18.0f, 24.0f, 12.0f), a76.Min), "author_row");
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, z46.m, p65Var, 0);
            long j = p65Var.T;
            int i6 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            String str = qfbVar2.c;
            hl0 hl0Var = hl0.XS;
            zw7 zw7Var = qfbVar2.d;
            int i7 = i4 & 7168;
            boolean z3 = i7 == 2048;
            int i8 = i4 & 14;
            boolean z4 = z3 | (i8 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z4 || objM == uobVar) {
                i2 = 0;
                objM = new heb(vebVar, sfbVar, i2);
                p65Var.j0(objM);
            } else {
                i2 = 0;
            }
            d46.a(str, hl0Var, null, zw7Var, null, null, null, 0.0f, 0, null, (m45) objM, p65Var, 48, 0, 2036);
            o28 o28Var3 = o28.b;
            r28 r28VarC = jfc.c(w2g.E(o28Var3, 12.0f, 0.0f, 2), 1.0f);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            r28 r28VarB = r28VarC.b(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true));
            wv1 wv1VarA = uv1.a(qb8.e, z46.p, p65Var, 6);
            long j2 = p65Var.T;
            int i9 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarB);
            p65Var.c0();
            if (p65Var.S) {
                ot2Var = ot2Var2;
                p65Var.k(ot2Var);
            } else {
                ot2Var = ot2Var2;
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            zq0 zq0Var = z46.n;
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i10 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            String str2 = qfbVar2.b;
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).n;
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            r28 r28VarY = r40.y(bgf.N(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, false), "author_name"), bmb.a(4.0f));
            boolean z5 = (i7 == 2048) | (i8 == 4);
            Object objM2 = p65Var.M();
            if (z5 || objM2 == uobVar) {
                objM2 = new heb(vebVar, sfbVar, 1);
                p65Var.j0(objM2);
            }
            r28 r28VarR4 = hlg.r(r28VarY, false, null, null, (m45) objM2, 15);
            sn3 sn3Var2 = kt7.b;
            ot2 ot2Var3 = ot2Var;
            jjd.b(str2, r28VarR4, ((zo7) p65Var.j(sn3Var2)).n, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVar, p65Var, 0, 24960, 110584);
            p65 p65Var2 = p65Var;
            if (qfbVar2.i.isEmpty()) {
                qfbVar = qfbVar2;
                i3 = -985710500;
                o28Var = o28Var3;
                r10 = 0;
                p65Var2.Y(-985710500);
                p65Var2.p(false);
                r112 = p65Var2;
            } else {
                km4.F(4.0f, -979372705, p65Var2, p65Var2, o28Var3);
                qfbVar = qfbVar2;
                o28Var = o28Var3;
                jjd.b(bu1.F0(qfbVar2.i, vo7.R(p65Var2, R.string.common_slash), null, null, null, 62), bgf.N(o28Var3, "pronouns"), ((zo7) p65Var2.j(sn3Var2)).o, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).n, p65Var2, 48, 0, 131064);
                p65 p65Var3 = p65Var2;
                r10 = 0;
                p65Var3.p(false);
                i3 = -985710500;
                r112 = p65Var3;
            }
            qfb qfbVar3 = qfbVar;
            if (qfbVar3.g) {
                o28Var2 = o28Var;
                km4.F(4.0f, -978877356, r112, r112, o28Var2);
                w2g.e(vn7.J(R.drawable.ic_book_author, r10, r112), vo7.R(r112, R.string.verified_author), bgf.N(jfc.l(o28Var2, 16.0f), "verified_author"), null, null, 0.0f, null, r112, 392, 120);
            } else {
                o28Var2 = o28Var;
                r112.Y(i3);
            }
            r112.p(r10);
            b(qfbVar3, null, r112, r10);
            r112.p(true);
            omb ombVarA3 = nmb.a(fa4Var, zq0Var, r112, 48);
            long j4 = r112.T;
            int i11 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = r112.l();
            r28 r28VarR5 = gx1.R(r112, o28Var2);
            r112.c0();
            if (r112.S) {
                r112.k(ot2Var3);
            } else {
                r112.m0();
            }
            tp7.B(r112, cuVar, ombVarA3);
            tp7.B(r112, cuVar2, i89VarL4);
            ka1.z(i11, r112, cuVar3, r112, fnVar);
            tp7.B(r112, cuVar4, r28VarR5);
            String strT = vo7.T((Context) r112.j(eo.b), sfbVar.b);
            r112.Y(-207699711);
            StringBuilder sb = new StringBuilder(16);
            ?? V = wgd.v();
            new ArrayList();
            sb.append(strT);
            if (sfbVar.h) {
                r112.Y(212570847);
                sb.append(" ");
                sb.append(vo7.R(r112, R.string.response_item_edited));
            } else {
                r112.Y(204908360);
            }
            r112.p(r10);
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(V.size());
            int size = V.size();
            for (?? I = r10; I < size; I = lv8.i(sb, (jx) V.get(I), arrayList, I, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            r112.p(r10);
            ?? r18 = r112;
            jjd.c(mxVar, bgf.N(o28Var2, "publication_date_and_edited"), ((zo7) r112.j(kt7.b)).o, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) r112.j(jt7.c)).n, r18, 48, 0, 262136);
            ?? r113 = r18;
            r113.p(true);
            r113.p(true);
            k(sfbVar, z, z2, vebVar, null, r113, i4 & 8190);
            r113.p(true);
            r11 = r113;
        } else {
            p65Var.S();
            r11 = p65Var;
        }
        mwaVarS = r11.s();
        if (mwaVarS != null) {
            final int i12 = 0;
            b55Var = new b55(sfbVar, z, z2, vebVar, r28Var, i, i12) { // from class: ieb
                public final /* synthetic */ int a;
                public final /* synthetic */ sfb b;
                public final /* synthetic */ boolean c;
                public final /* synthetic */ boolean d;
                public final /* synthetic */ veb e;
                public final /* synthetic */ r28 f;

                {
                    this.a = i12;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i62 = this.a;
                    c1e c1eVar = c1e.a;
                    switch (i62) {
                        case 0:
                            ((Integer) obj2).getClass();
                            int iY = tr7.y(24577);
                            ep7.c(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY);
                            break;
                        default:
                            ((Integer) obj2).getClass();
                            int iY2 = tr7.y(24577);
                            ep7.c(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY2);
                            break;
                    }
                    return c1eVar;
                }
            };
            mwaVarS.d = b55Var;
        }
    }

    public static final void d(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1350661844);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i | (p65Var.h(m45Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            pr7.b(r28Var, pxf.E(-105668136, new c60(9, m45Var), p65Var), null, null, null, 0, 0L, 0L, null, rx0.b, p65Var, (i2 & 14) | 805306416, 508);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(r28Var, m45Var, i, 2);
        }
    }

    public static final void e(db8 db8Var, r28 r28Var, xd xdVar, x45 x45Var, x45 x45Var2, x45 x45Var3, x45 x45Var4, x45 x45Var5, x12 x12Var, int i) {
        int i2;
        xd xdVar2;
        x45 x45Var6;
        int i3;
        x45 x45Var7;
        x45 x45Var8;
        char c2;
        x45 x45Var9;
        xd xdVar3;
        x45 x45Var10;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1840250294);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(db8Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f("main_route") ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        int i4 = 1797120 | i2;
        if ((12582912 & i) == 0) {
            i4 = 5991424 | i2;
        }
        if ((100663296 & i) == 0) {
            i4 |= 33554432;
        }
        int i5 = 805306368 | i4;
        char c3 = p65Var.h(x45Var5) ? (char) 4 : (char) 2;
        if ((306783379 & i5) == 306783378 && (c3 & 3) == 2 && p65Var.B()) {
            p65Var.S();
            xdVar3 = xdVar;
            x45Var7 = x45Var;
            x45Var10 = x45Var2;
            x45Var9 = x45Var3;
            x45Var8 = x45Var4;
        } else {
            p65Var.U();
            int i6 = i & 1;
            int i7 = 0;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                xdVar2 = z46.d;
                Object objM = p65Var.M();
                if (objM == uobVar) {
                    objM = new ss7(28);
                    p65Var.j0(objM);
                }
                x45 x45Var11 = (x45) objM;
                Object objM2 = p65Var.M();
                if (objM2 == uobVar) {
                    objM2 = new hb8(i7);
                    p65Var.j0(objM2);
                }
                x45Var6 = (x45) objM2;
                i3 = i5 & (-264241153);
                x45Var7 = x45Var11;
                x45Var8 = x45Var6;
                c2 = c3;
                x45Var9 = x45Var7;
            } else {
                p65Var.S();
                i3 = i5 & (-264241153);
                xdVar2 = xdVar;
                x45Var7 = x45Var;
                x45Var6 = x45Var2;
                x45Var8 = x45Var4;
                c2 = c3;
                x45Var9 = x45Var3;
            }
            p65Var.q();
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 57344) == 16384) | ((c2 & 14) == 4);
            Object objM3 = p65Var.M();
            if (z || objM3 == uobVar) {
                za8 za8Var = new za8(db8Var.b.s);
                x45Var5.invoke(za8Var);
                objM3 = za8Var.g();
                p65Var.j0(objM3);
            }
            ya8 ya8Var = (ya8) objM3;
            int i8 = i3 & 8078;
            int i9 = i3 >> 3;
            int i10 = i8 | (i9 & 57344) | (458752 & i9) | (i9 & 234881024);
            xdVar3 = xdVar2;
            x45Var10 = x45Var6;
            f(db8Var, ya8Var, r28Var, xdVar3, x45Var7, x45Var10, x45Var9, x45Var8, p65Var, i10);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ey4(db8Var, r28Var, xdVar3, x45Var7, x45Var10, x45Var9, x45Var8, x45Var5, i);
        }
    }

    public static final void f(final db8 db8Var, final ya8 ya8Var, final r28 r28Var, final xd xdVar, final x45 x45Var, final x45 x45Var2, final x45 x45Var3, final x45 x45Var4, x12 x12Var, final int i) {
        int i2;
        final r28 r28Var2;
        final xd xdVar2;
        final x45 x45Var5;
        x45 x45Var6;
        final d12 d12Var;
        l78 l78Var;
        p65 p65Var;
        ob3 ob3Var;
        int i3;
        oob oobVar;
        s68 s68Var;
        ba8 ba8Var;
        upc upcVar;
        x45 x45Var7;
        hwb hwbVar;
        d12 d12Var2;
        Object obj;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1964664536);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(db8Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(ya8Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            r28Var2 = r28Var;
            i2 |= p65Var2.f(r28Var2) ? 256 : 128;
        } else {
            r28Var2 = r28Var;
        }
        if ((i & 3072) == 0) {
            xdVar2 = xdVar;
            i2 |= p65Var2.f(xdVar2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            xdVar2 = xdVar;
        }
        if ((i & 24576) == 0) {
            x45Var5 = x45Var;
            i2 |= p65Var2.h(x45Var5) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            x45Var5 = x45Var;
        }
        if ((196608 & i) == 0) {
            x45Var6 = x45Var2;
            i2 |= p65Var2.h(x45Var6) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            x45Var6 = x45Var2;
        }
        if ((i & 1572864) == 0) {
            i2 |= p65Var2.h(x45Var3) ? 1048576 : 524288;
        }
        if ((i & 12582912) == 0) {
            i2 |= p65Var2.h(x45Var4) ? 8388608 : 4194304;
        }
        if ((i & 100663296) == 0) {
            i2 |= p65Var2.h(null) ? 67108864 : 33554432;
        }
        if ((i2 & 38347923) == 38347922 && p65Var2.B()) {
            p65Var2.S();
            p65Var = p65Var2;
        } else {
            p65Var2.U();
            if ((i & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            iy6 iy6Var = (iy6) p65Var2.j(y57.a);
            wue wueVarA = e67.a(p65Var2);
            if (wueVarA == null) {
                ygf.f("NavHost requires a ViewModelStoreOwner to be provided via LocalViewModelStoreOwner");
                return;
            }
            db8Var.j(wueVarA.getViewModelStore());
            ka8 ka8Var = db8Var.b;
            ya8Var.getClass();
            ka8Var.getClass();
            ka8Var.s(ya8Var, null);
            sc8 sc8VarB = ka8Var.s.b("composable");
            d12 d12Var3 = sc8VarB instanceof d12 ? (d12) sc8VarB : null;
            if (d12Var3 == null) {
                mwa mwaVarS = p65Var2.s();
                if (mwaVarS != null) {
                    final int i4 = 2;
                    final x45 x45Var8 = x45Var6;
                    mwaVarS.d = new b55() { // from class: ib8
                        @Override // defpackage.b55
                        public final Object invoke(Object obj2, Object obj3) {
                            int i5 = i4;
                            c1e c1eVar = c1e.a;
                            int i6 = i;
                            switch (i5) {
                                case 0:
                                    ((Integer) obj3).getClass();
                                    int iY = tr7.y(i6 | 1);
                                    ep7.f(db8Var, ya8Var, r28Var2, xdVar2, x45Var5, x45Var8, x45Var3, x45Var4, (x12) obj2, iY);
                                    break;
                                case 1:
                                    ((Integer) obj3).getClass();
                                    int iY2 = tr7.y(i6 | 1);
                                    ep7.f(db8Var, ya8Var, r28Var2, xdVar2, x45Var5, x45Var8, x45Var3, x45Var4, (x12) obj2, iY2);
                                    break;
                                default:
                                    ((Integer) obj3).getClass();
                                    int iY3 = tr7.y(i6 | 1);
                                    ep7.f(db8Var, ya8Var, r28Var2, xdVar2, x45Var5, x45Var8, x45Var3, x45Var4, (x12) obj2, iY3);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    return;
                }
                return;
            }
            wua wuaVar = d12Var3.b().e;
            l78 l78VarL = no7.l(wuaVar, wuaVar.getValue(), p65Var2, 0, 0);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new g49(0.0f);
                p65Var2.j0(objM);
            }
            g49 g49Var = (g49) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM2);
            }
            final l78 l78Var2 = (l78) objM2;
            boolean z = ((List) l78VarL.getValue()).size() > 1;
            boolean zF = p65Var2.f(l78VarL) | p65Var2.h(d12Var3);
            Object objM3 = p65Var2.M();
            if (zF || objM3 == uobVar) {
                d12 d12Var4 = d12Var3;
                objM3 = new b9(d12Var4, l78VarL, g49Var, l78Var2, (n92) null, 25);
                d12Var = d12Var4;
                l78Var = l78VarL;
                p65Var2.j0(objM3);
            } else {
                d12 d12Var5 = d12Var3;
                l78Var = l78VarL;
                d12Var = d12Var5;
            }
            no7.h(z, (b55) objM3, p65Var2, 0);
            boolean zH = p65Var2.h(db8Var) | p65Var2.h(iy6Var);
            Object objM4 = p65Var2.M();
            if (zH || objM4 == uobVar) {
                objM4 = new q58(db8Var, 5, iy6Var);
                p65Var2.j0(objM4);
            }
            kyd.h(iy6Var, (x45) objM4, p65Var2);
            oob oobVarX = qo7.x(p65Var2);
            l78 l78VarM = no7.m(ka8Var.i, p65Var2);
            Object objM5 = p65Var2.M();
            int i5 = 6;
            if (objM5 == uobVar) {
                objM5 = bjc.b(new rr1(l78VarM, i5));
                p65Var2.j0(objM5);
            }
            upc upcVar2 = (upc) objM5;
            ba8 ba8Var2 = (ba8) bu1.I0((List) upcVar2.getValue());
            Object objM6 = p65Var2.M();
            if (objM6 == uobVar) {
                int i6 = nm8.a;
                objM6 = new s68(6);
                p65Var2.j0(objM6);
            }
            s68 s68Var2 = (s68) objM6;
            if (ba8Var2 != null) {
                p65Var2.Y(-1797563167);
                boolean zH2 = p65Var2.h(d12Var) | ((((3670016 & i2) ^ 1572864) > 1048576 && p65Var2.f(x45Var3)) || (i2 & 1572864) == 1048576) | ((57344 & i2) == 16384);
                Object objM7 = p65Var2.M();
                if (zH2 || objM7 == uobVar) {
                    final int i7 = 1;
                    i3 = i2;
                    oobVar = oobVarX;
                    s68Var = s68Var2;
                    ba8Var = ba8Var2;
                    upcVar = upcVar2;
                    x45 x45Var9 = new x45() { // from class: fb8
                        @Override // defpackage.x45
                        public final Object invoke(Object obj2) {
                            int i8 = i7;
                            l78 l78Var3 = l78Var2;
                            x45 x45Var10 = x45Var;
                            x45 x45Var11 = x45Var3;
                            d12 d12Var6 = d12Var;
                            ov ovVar = (ov) obj2;
                            switch (i8) {
                                case 0:
                                    va8 va8Var = ((ba8) ovVar.a()).b;
                                    va8Var.getClass();
                                    c12 c12Var = (c12) va8Var;
                                    if (((Boolean) d12Var6.c.getValue()).booleanValue() || ((Boolean) l78Var3.getValue()).booleanValue()) {
                                        int i9 = va8.f;
                                        for (va8 va8Var2 : vo7.x(c12Var)) {
                                        }
                                        return (k54) x45Var11.invoke(ovVar);
                                    }
                                    int i10 = va8.f;
                                    for (va8 va8Var3 : vo7.x(c12Var)) {
                                    }
                                    return (k54) x45Var10.invoke(ovVar);
                                default:
                                    va8 va8Var4 = ((ba8) ovVar.c()).b;
                                    va8Var4.getClass();
                                    c12 c12Var2 = (c12) va8Var4;
                                    if (((Boolean) d12Var6.c.getValue()).booleanValue() || ((Boolean) l78Var3.getValue()).booleanValue()) {
                                        int i11 = va8.f;
                                        for (va8 va8Var5 : vo7.x(c12Var2)) {
                                        }
                                        return (zz3) x45Var11.invoke(ovVar);
                                    }
                                    int i12 = va8.f;
                                    for (va8 va8Var6 : vo7.x(c12Var2)) {
                                    }
                                    return (zz3) x45Var10.invoke(ovVar);
                            }
                        }
                    };
                    p65Var2.j0(x45Var9);
                    objM7 = x45Var9;
                } else {
                    i3 = i2;
                    oobVar = oobVarX;
                    s68Var = s68Var2;
                    ba8Var = ba8Var2;
                    upcVar = upcVar2;
                }
                x45 x45Var10 = (x45) objM7;
                boolean zH3 = p65Var2.h(d12Var) | ((((29360128 & i3) ^ 12582912) > 8388608 && p65Var2.f(x45Var4)) || (i3 & 12582912) == 8388608) | ((458752 & i3) == 131072);
                Object objM8 = p65Var2.M();
                if (zH3 || objM8 == uobVar) {
                    final int i8 = 0;
                    x45Var7 = x45Var10;
                    x45 x45Var11 = new x45() { // from class: fb8
                        @Override // defpackage.x45
                        public final Object invoke(Object obj2) {
                            int i82 = i8;
                            l78 l78Var3 = l78Var2;
                            x45 x45Var102 = x45Var2;
                            x45 x45Var112 = x45Var4;
                            d12 d12Var6 = d12Var;
                            ov ovVar = (ov) obj2;
                            switch (i82) {
                                case 0:
                                    va8 va8Var = ((ba8) ovVar.a()).b;
                                    va8Var.getClass();
                                    c12 c12Var = (c12) va8Var;
                                    if (((Boolean) d12Var6.c.getValue()).booleanValue() || ((Boolean) l78Var3.getValue()).booleanValue()) {
                                        int i9 = va8.f;
                                        for (va8 va8Var2 : vo7.x(c12Var)) {
                                        }
                                        return (k54) x45Var112.invoke(ovVar);
                                    }
                                    int i10 = va8.f;
                                    for (va8 va8Var3 : vo7.x(c12Var)) {
                                    }
                                    return (k54) x45Var102.invoke(ovVar);
                                default:
                                    va8 va8Var4 = ((ba8) ovVar.c()).b;
                                    va8Var4.getClass();
                                    c12 c12Var2 = (c12) va8Var4;
                                    if (((Boolean) d12Var6.c.getValue()).booleanValue() || ((Boolean) l78Var3.getValue()).booleanValue()) {
                                        int i11 = va8.f;
                                        for (va8 va8Var5 : vo7.x(c12Var2)) {
                                        }
                                        return (zz3) x45Var112.invoke(ovVar);
                                    }
                                    int i12 = va8.f;
                                    for (va8 va8Var6 : vo7.x(c12Var2)) {
                                    }
                                    return (zz3) x45Var102.invoke(ovVar);
                            }
                        }
                    };
                    p65Var2.j0(x45Var11);
                    objM8 = x45Var11;
                } else {
                    x45Var7 = x45Var10;
                }
                x45 x45Var12 = (x45) objM8;
                boolean z2 = (234881024 & i3) == 67108864;
                Object objM9 = p65Var2.M();
                if (z2 || objM9 == uobVar) {
                    objM9 = new ss7(29);
                    p65Var2.j0(objM9);
                }
                x45 x45Var13 = (x45) objM9;
                Boolean bool = Boolean.TRUE;
                boolean zH4 = p65Var2.h(d12Var);
                Object objM10 = p65Var2.M();
                if (zH4 || objM10 == uobVar) {
                    objM10 = new q58(upcVar, 4, d12Var);
                    p65Var2.j0(objM10);
                }
                kyd.h(bool, (x45) objM10, p65Var2);
                Object objM11 = p65Var2.M();
                if (objM11 == uobVar) {
                    objM11 = new hwb(ba8Var);
                    p65Var2.j0(objM11);
                }
                hwb hwbVar2 = (hwb) objM11;
                dsd dsdVarK0 = k40.K0(hwbVar2, "entry", p65Var2, 56);
                if (((Boolean) l78Var2.getValue()).booleanValue()) {
                    p65Var2.Y(-1795329152);
                    Float fValueOf = Float.valueOf(g49Var.g());
                    boolean zF2 = p65Var2.f(l78Var) | p65Var2.h(hwbVar2);
                    Object objM12 = p65Var2.M();
                    if (zF2 || objM12 == uobVar) {
                        objM12 = new mo5(hwbVar2, l78Var, g49Var, null, 14);
                        hwbVar = hwbVar2;
                        p65Var2.j0(objM12);
                    } else {
                        hwbVar = hwbVar2;
                    }
                    kyd.k(p65Var2, (b55) objM12, fValueOf);
                    p65Var2.p(false);
                } else {
                    hwbVar = hwbVar2;
                    p65Var2.Y(-1794910745);
                    boolean zH5 = p65Var2.h(hwbVar) | p65Var2.h(ba8Var) | p65Var2.f(dsdVarK0);
                    Object objM13 = p65Var2.M();
                    if (zH5 || objM13 == uobVar) {
                        objM13 = new zo5(hwbVar, ba8Var, dsdVarK0, (n92) null);
                        p65Var2.j0(objM13);
                    }
                    kyd.k(p65Var2, (b55) objM13, ba8Var);
                    p65Var2.p(false);
                }
                boolean zH6 = p65Var2.h(s68Var) | p65Var2.h(d12Var) | p65Var2.f(x45Var7) | p65Var2.f(x45Var12) | p65Var2.f(x45Var13);
                Object objM14 = p65Var2.M();
                if (zH6 || objM14 == uobVar) {
                    d12 d12Var6 = d12Var;
                    s68 s68Var3 = s68Var;
                    objM14 = new gb8(s68Var3, d12Var6, x45Var7, x45Var12, x45Var13, upcVar, l78Var2, 0);
                    d12Var2 = d12Var6;
                    l78Var2 = l78Var2;
                    p65Var2.j0(objM14);
                } else {
                    d12Var2 = d12Var;
                }
                x45 x45Var14 = (x45) objM14;
                Object objM15 = p65Var2.M();
                if (objM15 == uobVar) {
                    objM15 = new hb8(1);
                    p65Var2.j0(objM15);
                }
                upc upcVar3 = upcVar;
                ob3Var = null;
                ht2.f(dsdVarK0, r28Var, x45Var14, xdVar, (x45) objM15, pxf.E(820763100, new kb8(hwbVar, ba8Var, oobVar, l78Var2, upcVar3), p65Var2), p65Var2, ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 221184 | (i3 & 7168));
                p65Var = p65Var2;
                Object objO0 = dsdVarK0.a.o0();
                Object value = dsdVarK0.d.getValue();
                boolean zF3 = p65Var.f(dsdVarK0) | p65Var.h(db8Var) | p65Var.h(ba8Var) | p65Var.h(d12Var2) | p65Var.h(s68Var);
                Object objM16 = p65Var.M();
                if (zF3 || objM16 == uobVar) {
                    obj = value;
                    lb8 lb8Var = new lb8(dsdVarK0, db8Var, ba8Var, s68Var, upcVar3, d12Var2, null);
                    p65Var.j0(lb8Var);
                    objM16 = lb8Var;
                } else {
                    obj = value;
                }
                kyd.l(objO0, obj, (b55) objM16, p65Var);
                p65Var.p(false);
            } else {
                p65Var = p65Var2;
                ob3Var = null;
                p65Var.Y(-1789758886);
                p65Var.p(false);
            }
            sc8 sc8VarB2 = ka8Var.s.b("dialog");
            ob3 ob3Var2 = sc8VarB2 instanceof ob3 ? (ob3) sc8VarB2 : ob3Var;
            if (ob3Var2 == null) {
                mwa mwaVarS2 = p65Var.s();
                if (mwaVarS2 != null) {
                    final int i9 = 0;
                    mwaVarS2.d = new b55() { // from class: ib8
                        @Override // defpackage.b55
                        public final Object invoke(Object obj2, Object obj3) {
                            int i52 = i9;
                            c1e c1eVar = c1e.a;
                            int i62 = i;
                            switch (i52) {
                                case 0:
                                    ((Integer) obj3).getClass();
                                    int iY = tr7.y(i62 | 1);
                                    ep7.f(db8Var, ya8Var, r28Var, xdVar, x45Var, x45Var2, x45Var3, x45Var4, (x12) obj2, iY);
                                    break;
                                case 1:
                                    ((Integer) obj3).getClass();
                                    int iY2 = tr7.y(i62 | 1);
                                    ep7.f(db8Var, ya8Var, r28Var, xdVar, x45Var, x45Var2, x45Var3, x45Var4, (x12) obj2, iY2);
                                    break;
                                default:
                                    ((Integer) obj3).getClass();
                                    int iY3 = tr7.y(i62 | 1);
                                    ep7.f(db8Var, ya8Var, r28Var, xdVar, x45Var, x45Var2, x45Var3, x45Var4, (x12) obj2, iY3);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    return;
                }
                return;
            }
            t40.h(ob3Var2, p65Var, 0);
        }
        mwa mwaVarS3 = p65Var.s();
        if (mwaVarS3 != null) {
            final int i10 = 1;
            mwaVarS3.d = new b55() { // from class: ib8
                @Override // defpackage.b55
                public final Object invoke(Object obj2, Object obj3) {
                    int i52 = i10;
                    c1e c1eVar = c1e.a;
                    int i62 = i;
                    switch (i52) {
                        case 0:
                            ((Integer) obj3).getClass();
                            int iY = tr7.y(i62 | 1);
                            ep7.f(db8Var, ya8Var, r28Var, xdVar, x45Var, x45Var2, x45Var3, x45Var4, (x12) obj2, iY);
                            break;
                        case 1:
                            ((Integer) obj3).getClass();
                            int iY2 = tr7.y(i62 | 1);
                            ep7.f(db8Var, ya8Var, r28Var, xdVar, x45Var, x45Var2, x45Var3, x45Var4, (x12) obj2, iY2);
                            break;
                        default:
                            ((Integer) obj3).getClass();
                            int iY3 = tr7.y(i62 | 1);
                            ep7.f(db8Var, ya8Var, r28Var, xdVar, x45Var, x45Var2, x45Var3, x45Var4, (x12) obj2, iY3);
                            break;
                    }
                    return c1eVar;
                }
            };
        }
    }

    public static final void g(sfb sfbVar, veb vebVar, r28 r28Var, x12 x12Var, int i) throws IOException {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(765248467);
        int i2 = i | (p65Var.f(sfbVar) ? 4 : 2) | (p65Var.f(vebVar) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            float f = sfbVar.d != null ? 4.0f : 0.0f;
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.d(w2g.G(o28Var, 0.0f, f, 0.0f, 8.0f, 5), 1.0f), "response_content");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            i(sfbVar, null, p65Var, i2 & 14);
            l(sfbVar, vebVar, null, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new peb(sfbVar, vebVar, r28Var2, i, 0);
        }
    }

    public static final void h(sfb sfbVar, veb vebVar, r28 r28Var, x12 x12Var, int i) {
        sfb sfbVar2;
        r28 r28Var2;
        c09 c09VarJ;
        Highlight highlight = sfbVar.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(34979796);
        int i2 = i | (p65Var.f(sfbVar) ? 4 : 2) | (p65Var.f(vebVar) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            xm1 xm1Var = sfbVar.f;
            float f = highlight != null ? 4.0f : 0.0f;
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.d(w2g.G(o28Var, 0.0f, f, 0.0f, 8.0f, 5), 1.0f), "response_story_card_content");
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            int i4 = i2 & 14;
            i(sfbVar, null, p65Var, i4);
            r28 r28VarD = jfc.d(w2g.G(o28Var, 24.0f, highlight != null ? 16.0f : 12.0f, 24.0f, 0.0f, 8), 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(bo.B(r28VarD, 1.0f, ((zo7) p65Var.j(sn3Var)).z, bmb.a(3.0f)), ((zo7) p65Var.j(sn3Var)).a, bmb.a(3.0f));
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i4 == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new heb(vebVar, sfbVar, 5);
                p65Var.j0(objM);
            }
            r28 r28VarN2 = bgf.N(hlg.r(r28VarA0, false, null, null, (m45) objM, 15), "response_content_card");
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarN2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarC = w2g.C(jfc.d(o28Var, 1.0f), 16.0f);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarC);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA3 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j5 = p65Var.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, sq6Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA3);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            Iterator it2 = bu1.g1(sfbVar.c, 2).iterator();
            while (it2.hasNext()) {
                sb.append(((rfb) it2.next()).b);
            }
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            int size = arrayListV.size();
            for (int i9 = 0; i9 < size; i9 = lv8.i(sb, (jx) arrayListV.get(i9), arrayList, i9, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            sn3 sn3Var2 = jt7.c;
            jjd.c(mxVar, bgf.N(w2g.G(o28Var, 0.0f, 0.0f, 16.0f, 0.0f, 11), "response_text"), 0L, 0L, 0L, null, 0L, 2, false, 2, 0, null, null, ((bu7) p65Var.j(sn3Var2)).n, p65Var, 48, 24960, 241660);
            p65Var.p(true);
            if (xm1Var.b() > 0) {
                p65Var.Y(505465491);
                c09VarJ = vn7.J(R.drawable.ic_clap_filled_24, 0, p65Var);
                p65Var.p(false);
            } else {
                p65Var.Y(505571418);
                c09VarJ = vn7.J(R.drawable.ic_clap_24, 0, p65Var);
                p65Var.p(false);
            }
            String strR = vo7.R(p65Var, R.string.common_clap);
            sn3 sn3Var3 = kt7.b;
            long j6 = ((zo7) p65Var.j(sn3Var3)).o;
            float f2 = h11.d;
            qv5.b(c09VarJ, strR, bgf.N(jfc.l(o28Var, f2), "clap_icon"), j6, p65Var, 8, 0);
            hp7.t(p65Var, jfc.p(o28Var, 2.0f));
            jjd.b(dq1.g(Long.valueOf(xm1Var.a())), bgf.N(o28Var, "clap_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).n, p65Var, 48, 0, 131068);
            hp7.t(p65Var, jfc.p(o28Var, 6.0f));
            qv5.b(vn7.J(R.drawable.ic_respond_24, 0, p65Var), vo7.R(p65Var, R.string.response_item_replies_content_description), bgf.N(jfc.l(o28Var, f2), "responses_icon"), ((zo7) p65Var.j(sn3Var3)).o, p65Var, 8, 0);
            hp7.t(p65Var, jfc.p(o28Var, 2.0f));
            sfbVar2 = sfbVar;
            jjd.b(String.valueOf(sfbVar2.g), bgf.N(o28Var, "responses_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).n, p65Var, 48, 0, 131068);
            p65Var = p65Var;
            ho2.N(p65Var, true, true, true, true);
            r28Var2 = o28Var;
        } else {
            sfbVar2 = sfbVar;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new peb(sfbVar2, vebVar, r28Var2, i, 1);
        }
    }

    public static final void i(sfb sfbVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        mwa mwaVarS;
        b55 mebVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1292324455);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(sfbVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = i2 | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            Highlight highlight = sfbVar.d;
            if (highlight == null) {
                mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    mebVar = new s8(i, 9, sfbVar);
                    mwaVarS.d = mebVar;
                }
                return;
            }
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(w2g.E(o28Var, 24.0f, 0.0f, 2), 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(bo.B(r28VarD, 1.0f, ((zo7) p65Var.j(sn3Var)).z, bmb.a(3.0f)), ((zo7) p65Var.j(sn3Var)).a, bmb.a(3.0f));
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.c(w2g.y(highlight.getStartOffset(), highlight.getEndOffset(), 0, p65Var, highlight.getParagraphText(), highlight.getParagraphMarkups()), bgf.N(jfc.d(w2g.C(o28Var, 16.0f), 1.0f), "quote"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(jt7.c)).t, p65Var, 48, 0, 262140);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mebVar = new meb(sfbVar, r28Var2, i, 0);
            mwaVarS.d = mebVar;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:70:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void j(final defpackage.sfb r17, final boolean r18, final boolean r19, final defpackage.veb r20, defpackage.r28 r21, defpackage.x12 r22, int r23, int r24) {
        /*
            Method dump skipped, instruction units count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ep7.j(sfb, boolean, boolean, veb, r28, x12, int, int):void");
    }

    public static final void k(sfb sfbVar, final boolean z, final boolean z2, final veb vebVar, r28 r28Var, x12 x12Var, int i) {
        sfb sfbVar2;
        int i2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1108771127);
        int i3 = 2;
        if ((i & 6) == 0) {
            sfbVar2 = sfbVar;
            i2 = (p65Var.f(sfbVar2) ? 4 : 2) | i;
        } else {
            sfbVar2 = sfbVar;
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.g(z) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.g(z2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(vebVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = i2 | 24576;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i5 = (int) ((j >>> 32) ^ j);
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            final l78 l78Var = (l78) objM;
            k40.c(g56.c.a(new vj3(Float.NaN)), pxf.E(1186058877, new hq(l78Var, i3), p65Var), p65Var, 56);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new z7b(l78Var, 7);
                p65Var.j0(objM2);
            }
            final sfb sfbVar3 = sfbVar2;
            xp7.b(zBooleanValue, (m45) objM2, null, 0L, null, null, null, 0L, 0.0f, pxf.E(1630361912, new c55() { // from class: keb
                /* JADX WARN: Removed duplicated region for block: B:74:0x0231  */
                @Override // defpackage.c55
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final java.lang.Object f(java.lang.Object r30, java.lang.Object r31, java.lang.Object r32) {
                    /*
                        Method dump skipped, instruction units count: 773
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: defpackage.keb.f(java.lang.Object, java.lang.Object, java.lang.Object):java.lang.Object");
                }
            }, p65Var), p65Var, 48, 2044);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new leb(sfbVar, z, z2, vebVar, r28Var2, i);
        }
    }

    public static final void l(final sfb sfbVar, final veb vebVar, r28 r28Var, x12 x12Var, int i) throws IOException {
        int i2;
        r28 r28Var2;
        upc upcVar;
        int i3;
        char c2;
        upc upcVar2;
        Iterator it2;
        long j;
        int i4;
        o28 o28Var;
        List list = sfbVar.c;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(726785889);
        if ((i & 6) == 0) {
            i2 = i | (p65Var.f(sfbVar) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(vebVar) ? 32 : 16;
        }
        int i5 = i2 | 384;
        int i6 = 1;
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = bjc.b(new i5b(7, sfbVar));
                p65Var.j0(objM);
            }
            upc upcVar3 = (upc) objM;
            boolean zF = p65Var.f(list);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = bu1.F0(sfbVar.c, "\n\n", null, null, seb.b, 30);
                p65Var.j0(objM2);
            }
            String str = (String) objM2;
            boolean zF2 = p65Var.f(str);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = qo7.u(vw8.NONE);
                p65Var.j0(objM3);
            }
            l78 l78Var = (l78) objM3;
            int i7 = ((vw8) l78Var.getValue()) == vw8.EXPANDED ? Integer.MAX_VALUE : 5;
            long j2 = ((zo7) p65Var.j(kt7.b)).r;
            boolean zF3 = p65Var.f(str);
            Object objM4 = p65Var.M();
            if (zF3 || objM4 == uobVar) {
                kx kxVar = new kx();
                kxVar.d(str);
                Iterator it3 = list.iterator();
                int length = 0;
                while (it3.hasNext()) {
                    rfb rfbVar = (rfb) it3.next();
                    Iterator it4 = rfbVar.c.iterator();
                    while (it4.hasNext()) {
                        final Markup markup = (Markup) it4.next();
                        MarkupType type = markup.getType();
                        Iterator it5 = it3;
                        int i8 = teb.b[type.ordinal()];
                        if (i8 == i6) {
                            upcVar2 = upcVar3;
                            it2 = it4;
                            j = j2;
                            i4 = i6;
                            kxVar.b(new skc(0L, 0L, d05.h, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65531), markup.getStart() + length, markup.getEnd() + length);
                        } else if (i8 != 2) {
                            if (i8 != 3) {
                                wld.a.m("Markup type not handle: " + type, new Object[0]);
                            } else {
                                AnchorType anchorType = markup.getAnchorType();
                                int i9 = anchorType == null ? -1 : teb.a[anchorType.ordinal()];
                                if (i9 == 1) {
                                    upcVar2 = upcVar3;
                                    j = j2;
                                    final String href = markup.getHref();
                                    if (href == null) {
                                        wld.a.c("Markup anchor type is link but href is null: " + rfbVar, new Object[0]);
                                    } else {
                                        it2 = it4;
                                        final int i10 = 0;
                                        kxVar.a(new b07(anchorType.name(), new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14), new e07() { // from class: jeb
                                            @Override // defpackage.e07
                                            public final void a(d07 d07Var) {
                                                int i11 = i10;
                                                sfb sfbVar2 = sfbVar;
                                                Object obj = href;
                                                veb vebVar2 = vebVar;
                                                switch (i11) {
                                                    case 0:
                                                        d07Var.getClass();
                                                        vebVar2.b((String) obj, sfbVar2.m);
                                                        break;
                                                    default:
                                                        d07Var.getClass();
                                                        String userId = ((Markup) obj).getUserId();
                                                        if (userId == null) {
                                                            ay0.e("userId is null, while anchor type is user");
                                                        } else {
                                                            vebVar2.I(userId, sfbVar2.m);
                                                        }
                                                        break;
                                                }
                                            }
                                        }), markup.getStart() + length, markup.getEnd() + length);
                                        i4 = 1;
                                    }
                                } else if (i9 != 2) {
                                    wld.a.m("Markup anchor type not handle: " + anchorType, new Object[0]);
                                } else {
                                    j = j2;
                                    upcVar2 = upcVar3;
                                    final int i11 = 1;
                                    kxVar.a(new b07(anchorType.name(), new wjd(new skc(j, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), null, 14), new e07() { // from class: jeb
                                        @Override // defpackage.e07
                                        public final void a(d07 d07Var) {
                                            int i112 = i11;
                                            sfb sfbVar2 = sfbVar;
                                            Object obj = markup;
                                            veb vebVar2 = vebVar;
                                            switch (i112) {
                                                case 0:
                                                    d07Var.getClass();
                                                    vebVar2.b((String) obj, sfbVar2.m);
                                                    break;
                                                default:
                                                    d07Var.getClass();
                                                    String userId = ((Markup) obj).getUserId();
                                                    if (userId == null) {
                                                        ay0.e("userId is null, while anchor type is user");
                                                    } else {
                                                        vebVar2.I(userId, sfbVar2.m);
                                                    }
                                                    break;
                                            }
                                        }
                                    }), markup.getStart() + length, markup.getEnd() + length);
                                }
                                it2 = it4;
                                i4 = 1;
                            }
                            upcVar2 = upcVar3;
                            it2 = it4;
                            j = j2;
                            i4 = 1;
                        } else {
                            upcVar2 = upcVar3;
                            it2 = it4;
                            j = j2;
                            i4 = 1;
                            kxVar.b(new skc(0L, 0L, (d05) null, new zz4(i4), (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65527), markup.getStart() + length, markup.getEnd() + length);
                        }
                        it3 = it5;
                        i6 = i4;
                        upcVar3 = upcVar2;
                        j2 = j;
                        it4 = it2;
                    }
                    length += rfbVar.b.length() + 2;
                    it3 = it3;
                    j2 = j2;
                }
                upcVar = upcVar3;
                i3 = i6;
                c2 = ' ';
                objM4 = kxVar.i();
                p65Var.j0(objM4);
            } else {
                upcVar = upcVar3;
                i3 = 1;
                c2 = ' ';
            }
            mx mxVar = (mx) objM4;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i12 = (int) (j3 ^ (j3 >>> c2));
            i89 i89VarL = p65Var.l();
            o28 o28Var2 = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var2);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i12));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            r28 r28VarN = bgf.N(w2g.E(jfc.d(w2g.G(o28Var2, 0.0f, ((vj3) upcVar.getValue()).a, 0.0f, 0.0f, 13), 1.0f), 24.0f, 0.0f, 2), "response_text");
            mkd mkdVar = ((bu7) p65Var.j(jt7.c)).m;
            boolean zF4 = p65Var.f(l78Var);
            Object objM5 = p65Var.M();
            if (zF4 || objM5 == uobVar) {
                objM5 = new ws(l78Var, 23);
                p65Var.j0(objM5);
            }
            jjd.c(mxVar, r28VarN, 0L, 0L, 0L, null, 0L, 2, false, i7, 0, null, (x45) objM5, mkdVar, p65Var, 0, 384, 110588);
            p65Var = p65Var;
            if (((vw8) l78Var.getValue()) == vw8.COLLAPSED) {
                p65Var.Y(1718269679);
                o28Var = o28Var2;
                r28 r28VarN2 = bgf.N(w2g.G(o28Var, 12.0f, 0.0f, 0.0f, 0.0f, 14), "read_more");
                String strR = vo7.R(p65Var, R.string.response_item_read_more);
                xn7 xn7Var = xn7.S;
                boolean zF5 = p65Var.f(l78Var);
                Object objM6 = p65Var.M();
                if (zF5 || objM6 == uobVar) {
                    objM6 = new z7b(l78Var, 6);
                    p65Var.j0(objM6);
                }
                fo7.k(3456, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var, (m45) objM6, xn7Var, r28VarN2, strR, false, false);
            } else {
                o28Var = o28Var2;
                p65Var.Y(1691006667);
            }
            p65Var.p(false);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 25, sfbVar, vebVar, r28Var2);
        }
    }

    public static final void m(b5c b5cVar, r28 r28Var, x12 x12Var, int i) {
        cu cuVar;
        float f;
        yq0 yq0Var;
        boolean z;
        cu cuVar2;
        ot2 ot2Var;
        float f2;
        p65 p65Var;
        zq0 zq0Var = z46.n;
        sw5 sw5Var = b5cVar.f;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(849899959);
        int i2 = i | (p65Var2.f(b5cVar) ? 4 : 2) | (p65Var2.f(r28Var) ? 32 : 16);
        int i3 = 1;
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarO = jfc.o(r28Var, 0.0f, 0.0f, 350.0f, 622.0f, 3);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarO);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            cu cuVar3 = q12.f;
            tp7.B(p65Var2, cuVar3, zk7VarC);
            cu cuVar4 = q12.e;
            tp7.B(p65Var2, cuVar4, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar5 = q12.g;
            tp7.B(p65Var2, cuVar5, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar6 = q12.d;
            tp7.B(p65Var2, cuVar6, r28VarR);
            if (sw5Var == null) {
                p65Var2.Y(946055938);
            } else {
                p65Var2.Y(946055939);
                k40.c(u57.a.a(bo.a0(p65Var2)), pxf.E(1689980221, new x35(sw5Var, i3), p65Var2), p65Var2, 56);
            }
            p65Var2.p(false);
            amb ambVarA = bmb.a(16.0f);
            long j2 = sw5Var == null ? uu1.b : uu1.g;
            o28 o28Var = o28.b;
            r28 r28VarA0 = flb.a0(bo.B(r40.y(jfc.e(w2g.E(o28Var, 16.0f, 0.0f, 2), 400.0f), ambVarA), 1.0f, j2, ambVarA), uu1.d, rv8.r);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var2 = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var2, p65Var2, 0);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarA0);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar3, wv1VarA);
            tp7.B(p65Var2, cuVar4, i89VarL2);
            ka1.z(i5, p65Var2, cuVar5, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar6, r28VarR2);
            Integer num = b5cVar.g;
            if (num == null) {
                p65Var2.Y(416789537);
                p65Var2.p(false);
                cuVar2 = cuVar4;
                yq0Var = yq0Var2;
                cuVar = cuVar6;
                z = true;
                f = 1.0f;
            } else {
                p65Var2.Y(416789538);
                cuVar = cuVar6;
                f = 1.0f;
                yq0Var = yq0Var2;
                z = true;
                cuVar2 = cuVar4;
                jjd.b(vo7.Q(R.string.share_min_read, new Object[]{Integer.valueOf(num.intValue())}, p65Var2), w2g.C(o28Var, 16.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).o, xo7.i, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 48, 0, 131068);
                p65Var2 = p65Var2;
                p65Var2.p(false);
            }
            long j4 = xo7.i;
            cu cuVar7 = cuVar2;
            yq0 yq0Var3 = yq0Var;
            p65 p65Var3 = p65Var2;
            cu cuVar8 = cuVar;
            rv8.l(f, 54, j4, p65Var3, o28Var);
            r28 r28VarB = xv1.b(1.0f, o28Var, z);
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, z46.m, p65Var3, 0);
            long j5 = p65Var3.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL3 = p65Var3.l();
            r28 r28VarR3 = gx1.R(p65Var3, r28VarB);
            p65Var3.c0();
            if (p65Var3.S) {
                ot2Var = ot2Var2;
                p65Var3.k(ot2Var);
            } else {
                ot2Var = ot2Var2;
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar3, ombVarA);
            tp7.B(p65Var3, cuVar7, i89VarL3);
            ka1.z(i6, p65Var3, cuVar5, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar8, r28VarR3);
            r28 r28VarD = w2g.D(o28Var, 16.0f, 32.0f);
            qmb qmbVar = qmb.a;
            r28 r28VarA = qmbVar.a(1.0f, r28VarD, true);
            wv1 wv1VarA2 = uv1.a(qb8.e, yq0Var3, p65Var3, 54);
            long j6 = p65Var3.T;
            int i7 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL4 = p65Var3.l();
            r28 r28VarR4 = gx1.R(p65Var3, r28VarA);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar3, wv1VarA2);
            tp7.B(p65Var3, cuVar7, i89VarL4);
            ka1.z(i7, p65Var3, cuVar5, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar8, r28VarR4);
            hp7.t(p65Var3, xv1.b(1.0f, o28Var, true));
            String str = b5cVar.a;
            sn3 sn3Var = jt7.c;
            ot2 ot2Var3 = ot2Var;
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 2, false, 4, 0, null, mkd.a(((bu7) p65Var3.j(sn3Var)).c, j4, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 0, 24960, 110590);
            p65 p65Var4 = p65Var3;
            hp7.t(p65Var4, jfc.e(o28Var, 16.0f));
            String str2 = b5cVar.b;
            if (str2 == null) {
                p65Var4.Y(1824714693);
            } else {
                p65Var4.Y(1824714694);
                jjd.b(str2, null, 0L, 0L, 0L, null, null, 0L, 2, false, 3, 0, null, mkd.a(((bu7) p65Var4.j(sn3Var)).m, j4, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var4, 0, 24960, 110590);
                p65Var4 = p65Var4;
            }
            p65Var4.p(false);
            hp7.t(p65Var4, xv1.b(1.0f, o28Var, true));
            p65Var4.p(true);
            tp7.e(1.0f, 384, 1, j4, p65Var4, null);
            String str3 = b5cVar.c;
            p65Var4.Y(-1828346588);
            r28 r28VarB2 = qmbVar.b(o28Var, zq0Var);
            r28VarB2.getClass();
            p65 p65Var5 = p65Var4;
            jjd.b(str3, w2g.C(xz5.Y(dm2.M(r28VarB2, new u02(27)), 0.0f, 0.0f, 0.0f, null, 524031), 16.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var4.j(sn3Var)).n, j4, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var5, 0, 0, 131068);
            p65Var5.p(false);
            p65Var5.p(true);
            rv8.l(1.0f, 54, j4, p65Var5, o28Var);
            r28 r28VarC = w2g.C(jfc.d(o28Var, 1.0f), 16.0f);
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var5, 48);
            long j7 = p65Var5.T;
            int i8 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL5 = p65Var5.l();
            r28 r28VarR5 = gx1.R(p65Var5, r28VarC);
            p65Var5.c0();
            if (p65Var5.S) {
                p65Var5.k(ot2Var3);
            } else {
                p65Var5.m0();
            }
            tp7.B(p65Var5, cuVar3, ombVarA2);
            tp7.B(p65Var5, cuVar7, i89VarL5);
            ka1.z(i8, p65Var5, cuVar5, p65Var5, fnVar);
            tp7.B(p65Var5, cuVar8, r28VarR5);
            String str4 = b5cVar.e;
            if (str4 == null) {
                p65Var5.Y(-697214266);
                p65Var5.p(false);
                f2 = 1.0f;
                p65Var = p65Var5;
            } else {
                p65Var5.Y(-697214265);
                f2 = 1.0f;
                d46.a(str4, hl0.XS, null, null, null, null, null, 0.0f, 0, null, null, p65Var5, 48, 0, 4092);
                p65Var = p65Var5;
                p65Var.p(false);
            }
            hp7.t(p65Var, jfc.p(o28Var, 8.0f));
            String str5 = b5cVar.d;
            if (str5 == null) {
                p65Var.Y(-696933158);
            } else {
                p65Var.Y(-696933157);
                p65 p65Var6 = p65Var;
                jjd.b(str5, qmbVar.a(f2, w2g.G(o28Var, 0.0f, 0.0f, 8.0f, 0.0f, 11), true), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).m, j4, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var6, 0, 24960, 110588);
                p65Var = p65Var6;
            }
            p65Var.p(false);
            p65 p65Var7 = p65Var;
            w2g.e(vn7.J(R.drawable.medium_watermark, 0, p65Var), vo7.R(p65Var, R.string.medium_watermark), jfc.e(o28Var, 12.0f), null, v82.b, 0.0f, null, p65Var7, 24968, 104);
            p65Var2 = p65Var7;
            b09.H(p65Var2, true, true, true);
        } else {
            p65Var2.S();
        }
        mwa mwaVarS = p65Var2.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(b5cVar, r28Var, i, 29);
        }
    }

    public static final void n(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(655334804);
        int i2 = 6;
        if (p65Var.P(i & 1, i != 0)) {
            o28 o28Var = o28.b;
            r28 r28VarC = w2g.C(m40.V(o28Var, p65Var, 6), 40.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
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
            dy0.a(flb.a0(jfc.l(o28Var, 40.0f), ((zo7) p65Var.j(kt7.b)).c, rv8.r), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, i2);
        }
    }

    public static final void o(xne xneVar, ek8 ek8Var, obe obeVar, x12 x12Var, int i) {
        SourceParameter sourceParameter;
        zq0 zq0Var;
        boolean z;
        cu cuVar;
        SourceParameter sourceParameter2 = xneVar.h;
        String str = xneVar.d;
        obeVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1439777686);
        int i2 = i | (p65Var.f(xneVar) ? 4 : 2) | (p65Var.f(ek8Var) ? 32 : 16) | (p65Var.f(obeVar) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            obeVar.y(xneVar.c, sourceParameter2);
            boolean z2 = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new ube(ek8Var, 12, xneVar);
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            boolean zF = p65Var.f(m45Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new z23(15, m45Var);
                p65Var.j0(objM2);
            }
            o28 o28Var = o28.b;
            r28 r28VarP = pwd.P(jfc.d(hlg.r(o28Var, false, null, null, (m45) objM2, 15), 1.0f), a76.Min);
            fa4 fa4Var = qb8.a;
            zq0 zq0Var2 = z46.m;
            omb ombVarA = nmb.a(fa4Var, zq0Var2, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarP);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar2 = q12.f;
            tp7.B(p65Var, cuVar2, ombVarA);
            cu cuVar3 = q12.e;
            tp7.B(p65Var, cuVar3, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar4 = q12.g;
            tp7.B(p65Var, cuVar4, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar5 = q12.d;
            tp7.B(p65Var, cuVar5, r28VarR);
            if (xneVar.a) {
                p65Var.Y(1769674704);
                sourceParameter = sourceParameter2;
                zq0Var = zq0Var2;
                cuVar = cuVar3;
                tp7.e(2.0f, 384, 1, ((zo7) p65Var.j(kt7.b)).A, p65Var, null);
                p65Var = p65Var;
                z = false;
            } else {
                sourceParameter = sourceParameter2;
                zq0Var = zq0Var2;
                z = false;
                cuVar = cuVar3;
                p65Var.Y(1767055824);
            }
            p65Var.p(z);
            p65 p65Var2 = p65Var;
            pr7.e(xneVar.e, w2g.G(o28Var, 18.0f, 18.0f, 0.0f, 18.0f, 4), Integer.valueOf(R.drawable.ic_notifications_follow), m45Var, p65Var2, 48);
            r28 r28VarF = w2g.F(new sq6(1.0f, true), 18.0f, 18.0f, 18.0f, 18.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarF);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar2, wv1VarA);
            tp7.B(p65Var2, cuVar, i89VarL2);
            ka1.z(i4, p65Var2, cuVar4, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar5, r28VarR2);
            p65Var2.Y(1259594288);
            kx kxVar = new kx();
            String strQ = vo7.Q(R.string.notification_type_users_following_you, new Object[]{str}, p65Var2);
            sn3 sn3Var = kt7.b;
            int iH = kxVar.h(new skc(((zo7) p65Var2.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVar.d(strQ);
                kxVar.f(iH);
                int iZ = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ, kxVar, new skc(((zo7) p65Var2.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var2.p(false);
                sn3 sn3Var2 = jt7.c;
                jjd.c(mxVarC, null, 0L, 0L, 0L, new jgd(5), 0L, 2, false, 2, 0, null, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).m, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 24960, 240638);
                jjd.b(vo7.T((Context) p65Var2.j(eo.b), xneVar.b), w2g.G(o28Var, 0.0f, 4.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, new jgd(5), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).o, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 48, 0, 130044);
                p65Var = p65Var2;
                p65Var.p(true);
                r28 r28VarG = w2g.G(jfc.b(o28Var, 90.0f, 0.0f, 2).b(new qse(zq0Var)), 0.0f, 10.0f, 18.0f, 18.0f, 1);
                zk7 zk7VarC = dy0.c(z46.d, false);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarG);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar2, zk7VarC);
                tp7.B(p65Var, cuVar, i89VarL3);
                ka1.z(i5, p65Var, cuVar4, p65Var, fnVar);
                tp7.B(p65Var, cuVar5, r28VarR3);
                n01.x(new wu4(xneVar.c, str, EntityType.AUTHOR, xneVar.f, xneVar.g, sourceParameter), it4.S, obeVar, iy0.a.a(o28Var, z46.f), null, null, null, 0L, p65Var, (i2 & 896) | 48, 240);
                p65Var.p(true);
                p65Var.p(true);
            } catch (Throwable th) {
                kxVar.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 27, xneVar, ek8Var, obeVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x00c2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.String p(defpackage.dr9 r17, android.content.Context r18) {
        /*
            Method dump skipped, instruction units count: 649
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ep7.p(dr9, android.content.Context):java.lang.String");
    }

    public static final ij7 r(Matcher matcher, int i, CharSequence charSequence) {
        if (matcher.find(i)) {
            return new ij7(matcher, charSequence);
        }
        return null;
    }

    public static long t(x12 x12Var) {
        if (yi2.N(x12Var)) {
            p65 p65Var = (p65) x12Var;
            p65Var.Y(1091114609);
            long j = ((zo7) p65Var.j(kt7.b)).p;
            p65Var.p(false);
            return j;
        }
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(1091176082);
        long j2 = ((zo7) p65Var2.j(kt7.b)).n;
        p65Var2.p(false);
        return j2;
    }

    public static final ViewParent u(View view) {
        view.getClass();
        ViewParent parent = view.getParent();
        if (parent != null) {
            return parent;
        }
        Object tag = view.getTag(R.id.view_tree_disjoint_parent);
        if (tag instanceof ViewParent) {
            return (ViewParent) tag;
        }
        return null;
    }

    public static final String v(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.j(eo.a);
        return ((Context) p65Var.j(eo.b)).getResources().getString(i);
    }

    public static void x(String str, Bundle bundle) {
        try {
            xj4.d();
            if (bundle == null) {
                bundle = new Bundle();
            }
            Bundle bundle2 = new Bundle();
            String string = bundle.getString("google.c.a.c_id");
            if (string != null) {
                bundle2.putString("_nmid", string);
            }
            String string2 = bundle.getString("google.c.a.c_l");
            if (string2 != null) {
                bundle2.putString("_nmn", string2);
            }
            String string3 = bundle.getString("google.c.a.m_l");
            if (!TextUtils.isEmpty(string3)) {
                bundle2.putString("label", string3);
            }
            String string4 = bundle.getString("google.c.a.m_c");
            if (!TextUtils.isEmpty(string4)) {
                bundle2.putString("message_channel", string4);
            }
            String string5 = bundle.getString("from");
            if (string5 == null || !string5.startsWith("/topics/")) {
                string5 = null;
            }
            if (string5 != null) {
                bundle2.putString("_nt", string5);
            }
            String string6 = bundle.getString("google.c.a.ts");
            if (string6 != null) {
                try {
                    bundle2.putInt("_nmt", Integer.parseInt(string6));
                } catch (NumberFormatException e) {
                    Log.w("FirebaseMessaging", "Error while parsing timestamp in GCM event", e);
                }
            }
            String string7 = bundle.containsKey("google.c.a.udt") ? bundle.getString("google.c.a.udt") : null;
            if (string7 != null) {
                try {
                    bundle2.putInt("_ndt", Integer.parseInt(string7));
                } catch (NumberFormatException e2) {
                    Log.w("FirebaseMessaging", "Error while parsing use_device_time in GCM event", e2);
                }
            }
            String str2 = my6.G(bundle) ? "display" : "data";
            if ("_nr".equals(str) || "_nf".equals(str)) {
                bundle2.putString("_nmc", str2);
            }
            if (Log.isLoggable("FirebaseMessaging", 3)) {
                Log.d("FirebaseMessaging", "Logging to scion event=" + str + " scionPayload=" + bundle2);
            }
            if (xj4.d().b(uj.class) == null) {
                Log.w("FirebaseMessaging", "Unable to log event: analytics library is missing");
            } else {
                rd6.m();
            }
        } catch (IllegalStateException unused) {
            Log.e("FirebaseMessaging", "Default FirebaseApp has not been initialized. Skip logging event to GA.");
        }
    }

    public static final void z(Bundle bundle, String str, List list) {
        bundle.putStringArrayList(str, list instanceof ArrayList ? (ArrayList) list : new ArrayList<>(list));
    }

    public abstract Object s(wg6 wg6Var);

    public abstract ep7 y(wg6 wg6Var, Object obj);

    public static boolean q() {
        ApplicationInfo applicationInfo;
        Bundle bundle;
        try {
            xj4.d();
            xj4 xj4VarD = xj4.d();
            xj4VarD.a();
            Context context = xj4VarD.a;
            SharedPreferences sharedPreferences = context.getSharedPreferences("com.google.firebase.messaging", 0);
            if (sharedPreferences.contains("export_to_big_query")) {
                return sharedPreferences.getBoolean("export_to_big_query", false);
            }
            try {
                PackageManager packageManager = context.getPackageManager();
                if (packageManager != null && (applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 128)) != null && (bundle = applicationInfo.metaData) != null && bundle.containsKey("delivery_metrics_exported_to_big_query_enabled")) {
                    return applicationInfo.metaData.getBoolean("delivery_metrics_exported_to_big_query_enabled", false);
                }
            } catch (PackageManager.NameNotFoundException unused) {
            }
            return false;
        } catch (IllegalStateException unused2) {
            Log.i(MaAxRJinch.bkzDK, "FirebaseApp has not being initialized. Device might be in direct boot mode. Skip exporting delivery metrics to Big Query");
            return false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x0189  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x01a4  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x01ae  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x01c8  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x015c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:137:0x008b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:141:0x019a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:143:0x017b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:145:0x01db A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:151:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00e0 A[PHI: r6
      0x00e0: PHI (r6v21 java.lang.String) = (r6v20 java.lang.String), (r6v35 java.lang.String) binds: [B:45:0x00c8, B:49:0x00da] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0135  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0147  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0151  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x016e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void w(android.content.Intent r23) {
        /*
            Method dump skipped, instruction units count: 552
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ep7.w(android.content.Intent):void");
    }
}
