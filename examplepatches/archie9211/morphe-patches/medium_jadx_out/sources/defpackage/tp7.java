package defpackage;

import android.app.AppOpsManager;
import android.content.Context;
import android.os.Binder;
import android.os.Build;
import android.os.Process;
import android.text.Spanned;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.ResolvableApiException;
import com.google.android.gms.common.api.Status;
import com.google.protobuf.InvalidProtocolBufferException;
import com.medium.reader.R;
import j$.util.Objects;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class tp7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;

    public static final void A(f78 f78Var, Object obj) {
        boolean zG;
        long[] jArr = f78Var.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        int i4 = (i << 3) + i3;
                        Object obj2 = f78Var.b[i4];
                        Object obj3 = f78Var.c[i4];
                        if (obj3 instanceof g78) {
                            g78 g78Var = (g78) obj3;
                            g78Var.l(obj);
                            zG = g78Var.g();
                        } else {
                            zG = obj3 == obj;
                        }
                        if (zG) {
                            f78Var.l(i4);
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return;
                }
            }
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }

    public static final void B(x12 x12Var, b55 b55Var, Object obj) {
        if (((p65) x12Var).S || !g76.L(((p65) x12Var).M(), obj)) {
            p65 p65Var = (p65) x12Var;
            p65Var.j0(obj);
            p65Var.b(b55Var, obj);
        }
    }

    public static void C(Status status, Object obj, wfd wfdVar) {
        if (status.a <= 0) {
            wfdVar.b(obj);
        } else {
            wfdVar.a(status.c != null ? new ResolvableApiException(status) : new ApiException(status));
        }
    }

    public static final void D(StringBuilder sb, Iterator it2, y3b y3bVar) {
        if (it2.hasNext()) {
            Map.Entry entry = (Map.Entry) it2.next();
            sb.append(y3b.A(entry.getKey()));
            sb.append(" : ");
            sb.append(y3b.A(entry.getValue()));
            while (it2.hasNext()) {
                sb.append(",\n  ");
                Map.Entry entry2 = (Map.Entry) it2.next();
                sb.append(y3b.A(entry2.getKey()));
                sb.append(" : ");
                sb.append(y3b.A(entry2.getValue()));
            }
        }
    }

    public static int E(String str) {
        int length = str.length();
        int i = 0;
        int i2 = 0;
        while (i2 < length && str.charAt(i2) < 128) {
            i2++;
        }
        int i3 = length;
        while (true) {
            if (i2 >= length) {
                break;
            }
            char cCharAt = str.charAt(i2);
            if (cCharAt < 2048) {
                i3 += (127 - cCharAt) >>> 31;
                i2++;
            } else {
                try {
                    int i4 = w9g.a;
                    int length2 = str.length();
                    while (i2 < length2) {
                        char cCharAt2 = str.charAt(i2);
                        if (cCharAt2 < 2048) {
                            i += (127 - cCharAt2) >>> 31;
                        } else {
                            i += 2;
                            if (cCharAt2 >= 55296 && cCharAt2 <= 57343) {
                                if (Character.codePointAt(str, i2) < 65536) {
                                    throw new u9g("Unpaired surrogate at index " + i2 + " of " + length2);
                                }
                                i2++;
                            }
                        }
                        i2++;
                    }
                    i3 += i;
                } catch (u9g unused) {
                    return str.getBytes(StandardCharsets.UTF_8).length;
                }
            }
        }
        if (i3 >= length) {
            return i3;
        }
        throw new IllegalArgumentException("UTF-8 length does not fit in int: " + (((long) i3) + 4294967296L));
    }

    public static final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1236712197);
        if (p65Var.P(i & 1, i != 0)) {
            o28 o28Var = o28.b;
            r28 r28VarE = jfc.e(jfc.d(o28Var, 1.0f), 160.0f);
            wv1 wv1VarA = uv1.a(qb8.e, z46.q, p65Var, 54);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarE);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            B(p65Var, q12.f, wv1VarA);
            B(p65Var, q12.e, i89VarL);
            B(p65Var, q12.g, Integer.valueOf(i2));
            y(p65Var, q12.h);
            B(p65Var, q12.d, r28VarR);
            sn3 sn3Var = jt7.c;
            jjd.b("Divider", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 6, 0, 131070);
            c(0.0f, 0, 7, 0L, p65Var, null);
            jjd.b("Divider thin", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) lv8.n(o28Var, 8.0f, p65Var, sn3Var)).m, p65Var, 6, 0, 131070);
            d(0, 0L, p65Var, null);
            jjd.b("Divider vertical", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) lv8.n(o28Var, 8.0f, p65Var, sn3Var)).m, p65Var, 6, 0, 131070);
            p65Var = p65Var;
            e(0.0f, 0, 7, 0L, p65Var, null);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 11);
        }
    }

    public static final void b(String str, x12 x12Var, int i) {
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-362794029);
        int i2 = (p65Var.f(str) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            sn3 sn3Var = kt7.b;
            long j = ((zo7) p65Var.j(sn3Var)).a;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(flb.a0(o28Var, j, nr5Var), 1.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            B(p65Var, q12.f, zk7VarC);
            B(p65Var, q12.e, i89VarL);
            B(p65Var, q12.g, Integer.valueOf(i3));
            y(p65Var, q12.h);
            B(p65Var, q12.d, r28VarR);
            String upperCase = str.toUpperCase(Locale.ROOT);
            upperCase.getClass();
            jjd.b(upperCase, w2g.G(o28Var, 16.0f, 16.0f, 0.0f, 8.0f, 4), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(dl7.m(((bu7) p65Var.j(jt7.c)).u), ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pb(str, i);
        }
    }

    public static final void c(float f, int i, int i2, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i3;
        long j2;
        long j3;
        float f2;
        r28 r28Var3;
        float f3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1287768791);
        int i4 = i2 & 1;
        if (i4 != 0) {
            i3 = i | 6;
            r28Var2 = r28Var;
        } else if ((i & 6) == 0) {
            r28Var2 = r28Var;
            i3 = (p65Var.f(r28Var2) ? 4 : 2) | i;
        } else {
            r28Var2 = r28Var;
            i3 = i;
        }
        if ((i & 48) == 0) {
            if ((i2 & 2) == 0) {
                j2 = j;
                int i5 = p65Var.e(j2) ? 32 : 16;
                i3 |= i5;
            } else {
                j2 = j;
            }
            i3 |= i5;
        } else {
            j2 = j;
        }
        int i6 = i2 & 4;
        if (i6 != 0) {
            i3 |= 384;
        } else if ((i & 384) == 0) {
            i3 |= p65Var.c(f) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                r28Var3 = i4 != 0 ? o28.b : r28Var2;
                if ((i2 & 2) != 0) {
                    j2 = ((zo7) p65Var.j(kt7.b)).x;
                    i3 &= -113;
                }
                f3 = i6 != 0 ? 1.0f : f;
            } else {
                p65Var.S();
                if ((i2 & 2) != 0) {
                    i3 &= -113;
                }
                f3 = f;
                r28Var3 = r28Var2;
            }
            long j4 = j2;
            p65Var.q();
            rv8.l(f3, ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 << 3) & 896), j4, p65Var, bgf.N(r28Var3, "divider"));
            r28Var2 = r28Var3;
            f2 = f3;
            j3 = j4;
        } else {
            p65Var.S();
            j3 = j2;
            f2 = f;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sp7(r28Var2, j3, f2, i, i2, 0);
        }
    }

    public static final void d(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(701448918);
        int i2 = i | 22;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                j = ((zo7) p65Var.j(kt7.b)).x;
                r28Var3 = o28.b;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            long j3 = j;
            p65Var.q();
            c(0.5f, 390, 0, j3, p65Var, r28Var3);
            j2 = j3;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            j2 = j;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j2, i, 11);
        }
    }

    public static final void e(float f, int i, int i2, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i3;
        long j2;
        long j3;
        float f2;
        float f3;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(62724287);
        int i4 = i2 & 1;
        if (i4 != 0) {
            i3 = i | 6;
            r28Var2 = r28Var;
        } else if ((i & 6) == 0) {
            r28Var2 = r28Var;
            i3 = (p65Var.f(r28Var2) ? 4 : 2) | i;
        } else {
            r28Var2 = r28Var;
            i3 = i;
        }
        if ((i & 48) == 0) {
            if ((i2 & 2) == 0) {
                j2 = j;
                int i5 = p65Var.e(j2) ? 32 : 16;
                i3 |= i5;
            } else {
                j2 = j;
            }
            i3 |= i5;
        } else {
            j2 = j;
        }
        int i6 = i2 & 4;
        if (i6 != 0) {
            i3 |= 384;
        } else if ((i & 384) == 0) {
            i3 |= p65Var.c(f) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                r28 r28Var4 = i4 != 0 ? o28.b : r28Var2;
                if ((i2 & 2) != 0) {
                    j2 = ((zo7) p65Var.j(kt7.b)).x;
                    i3 &= -113;
                }
                if (i6 != 0) {
                    r28Var3 = r28Var4;
                    f3 = 1.0f;
                } else {
                    f3 = f;
                    r28Var3 = r28Var4;
                }
            } else {
                p65Var.S();
                if ((i2 & 2) != 0) {
                    i3 &= -113;
                }
                f3 = f;
                r28Var3 = r28Var2;
            }
            long j4 = j2;
            p65Var.q();
            rv8.q(f3, (i3 & 14) | ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 << 3) & 896), j4, p65Var, r28Var3);
            f2 = f3;
            j3 = j4;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            j3 = j2;
            f2 = f;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sp7(r28Var2, j3, f2, i, i2, 1);
        }
    }

    public static final void f(b08 b08Var, cv9 cv9Var, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1674131919);
        int i2 = i | (p65Var.f(b08Var) ? 4 : 2) | (p65Var.f(cv9Var) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            B(p65Var, cuVar, zk7VarC2);
            B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            B(p65Var, cuVar4, r28VarR2);
            g(b08Var, cv9Var, o28Var, p65Var, i2 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(true);
            p65Var.p(true);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 10, b08Var, cv9Var, obj);
        }
    }

    public static final void g(b08 b08Var, cv9 cv9Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1897039962);
        int i2 = 4;
        int i3 = (i & 6) == 0 ? (p65Var2.f(b08Var) ? 4 : 2) | i : i;
        if ((i & 48) == 0) {
            i3 |= (i & 64) == 0 ? p65Var2.f(cv9Var) : p65Var2.h(cv9Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            nr5 nr5Var = new nr5(i2);
            p65Var2.Y(-751374894);
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            String strR = vo7.R(p65Var2, R.string.meter_first_line);
            String strR2 = vo7.R(p65Var2, R.string.meter_cta);
            String strY = b09.y(strR, "\n", vo7.Q(R.string.meter_second_line, new Object[]{strR2}, p65Var2));
            int iZ = muc.Z(strY, strR2, 0, false, 6);
            sb.append(strY);
            int i5 = 8;
            arrayListV.add(new jx(new skc(0L, 0L, d05.h, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65531), i4, strR.length(), i5));
            arrayListV.add(new jx(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), iZ, strR2.length() + iZ, i5));
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            for (int i6 = 0; i6 < arrayListV.size(); i6 = lv8.i(sb, (jx) arrayListV.get(i6), arrayList, i6, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            p65Var2.p(false);
            mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).m;
            sn3 sn3Var = kt7.b;
            mkd mkdVarA = mkd.a(mkdVar, ((zo7) p65Var2.j(sn3Var)).n, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            r28 r28VarD = jfc.d(flb.a0(r40.y(w2g.D(r28Var, 8.0f, 8.0f), nr5Var), ((zo7) p65Var2.j(sn3Var)).b, nr5Var), 1.0f);
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i3 & 64) != 0 && p65Var2.h(cv9Var))) | ((i3 & 14) == 4);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new ps5(cv9Var, 12, b08Var);
                p65Var2.j0(objM);
            }
            r28 r28VarF = w2g.F(hlg.r(r28VarD, false, null, null, (m45) objM, 15), 16.0f, 16.0f, 16.0f, 24.0f);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new ss7(10);
                p65Var2.j0(objM2);
            }
            p65Var = p65Var2;
            jjd.c(mxVar, bgf.N(wxb.a(r28VarF, false, (x45) objM2), "meter-text"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, mkdVarA, p65Var, 0, 0, 262140);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 4, b08Var, cv9Var, r28Var);
        }
    }

    public static final void h(int i, int i2, mx mxVar, r28 r28Var, x12 x12Var, int i3) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1900004907);
        int i4 = i3 | (p65Var.d(i) ? 4 : 2) | (p65Var.d(i2) ? 32 : 16) | (p65Var.f(mxVar) ? 256 : 128);
        int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            long j = ((zo7) p65Var.j(kt7.b)).o;
            pod podVarD = kod.d(48, 5, p65Var);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = kyd.M(p65Var);
                p65Var.j0(objM);
            }
            kod.b(hod.a(48, 0, p65Var), pxf.E(-504403264, new p16(mxVar, i5), p65Var), podVarD, r28Var, false, pxf.E(992217304, new rx9(bmb.a(8.0f), (sb2) objM, podVarD, i, j, i2), p65Var), p65Var, 100666416, 240);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ya0(i, i2, mxVar, r28Var, i3, 2);
        }
    }

    public static final void i(nca ncaVar, r28 r28Var, x12 x12Var, int i) {
        az5 az5Var = ncaVar.i;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1850722167);
        int i2 = (p65Var.f(ncaVar) ? 4 : 2) | i | 48;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28Var = o28.b;
            r28 r28VarN = bgf.N(aoc.e(p65Var, r28Var), "publication_card_" + ncaVar.a);
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
            B(p65Var, q12.f, wv1VarA);
            B(p65Var, q12.e, i89VarL);
            B(p65Var, q12.g, Integer.valueOf(i3));
            y(p65Var, q12.h);
            B(p65Var, q12.d, r28VarR);
            j(ncaVar, null, p65Var, i2 & 14);
            if (az5Var.isEmpty()) {
                p65Var.Y(-2001751979);
            } else {
                p65Var.Y(-1999980515);
                c(0.0f, 0, 5, ((zo7) p65Var.j(kt7.b)).z, p65Var, null);
                aoc.b(az5Var, km4.u(1.0f, jfc.d(r28Var, 1.0f), false), p65Var, 0);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(ncaVar, r28Var, i, 23);
        }
    }

    public static final void j(nca ncaVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        r28 r28Var2;
        ot2 ot2Var;
        String strD;
        boolean z;
        o28 o28Var;
        sn3 sn3Var;
        sn3 sn3Var2;
        o28 o28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1791068380);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.f(ncaVar) ? 4 : 2);
        } else {
            i2 = i;
        }
        int i3 = i2 | 48;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var3 = o28.b;
            r28 r28VarC = w2g.C(jfc.d(o28Var3, 1.0f), 24.0f);
            h70 h70Var = new h70(16.0f, true, new z10(21));
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(h70Var, yq0Var, p65Var2, 6);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarC);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(o28Var3, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 48);
            long j2 = p65Var2.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                ot2Var = ot2Var2;
                p65Var2.k(ot2Var);
            } else {
                ot2Var = ot2Var2;
                p65Var2.m0();
            }
            B(p65Var2, cuVar, ombVarA);
            B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            B(p65Var2, cuVar4, r28VarR2);
            String str = ncaVar.d;
            String str2 = ncaVar.c;
            String str3 = ncaVar.a;
            String strD2 = null;
            if (str == null) {
                str = null;
            }
            hp7.o(str, hl0.S, bgf.N(o28Var3, "publication_avatar_" + str3), null, null, 0.0f, 0, null, null, p65Var2, 48, 2040);
            hp7.t(p65Var2, jfc.p(o28Var3, 12.0f));
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA2 = uv1.a(new h70(4.0f, true, new z10(21)), yq0Var, p65Var2, 6);
            long j3 = p65Var2.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, sq6Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            B(p65Var2, cuVar, wv1VarA2);
            B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            B(p65Var2, cuVar4, r28VarR3);
            String str4 = ncaVar.b;
            sn3 sn3Var3 = jt7.c;
            ot2 ot2Var3 = ot2Var;
            jjd.b(str4, bgf.N(o28Var3, "publication_name_" + str3), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var2.j(sn3Var3)).j, p65Var2, 0, 24960, 110588);
            p65Var = p65Var2;
            omb ombVarA2 = nmb.a(new h70(8.0f, true, new f70(0, yq0Var)), z46.n, p65Var, 54);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, o28Var3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var3);
            } else {
                p65Var.m0();
            }
            B(p65Var, cuVar, ombVarA2);
            B(p65Var, cuVar2, i89VarL4);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            B(p65Var, cuVar4, r28VarR4);
            if (ncaVar.f.isEmpty()) {
                p65Var.Y(798320266);
            } else {
                p65Var.Y(801826800);
                rr7.i(ncaVar.f, null, 4, p65Var, 384, 2);
            }
            p65Var.p(false);
            int i8 = ncaVar.g;
            int i9 = ncaVar.h;
            if (i8 <= 0) {
                p65Var.Y(335169308);
                p65Var.p(false);
                strD = null;
            } else if (i8 > 4) {
                strD = km4.w(p65Var, -127733857, R.string.onboarding_starter_packs_writers_plus, p65Var, false);
            } else {
                p65Var.Y(-127731301);
                strD = vo7.D(R.plurals.onboarding_starter_packs_writers, i8, new Object[]{Integer.valueOf(i8)}, p65Var);
                p65Var.p(false);
            }
            if (i9 <= 0) {
                p65Var.Y(335447068);
                p65Var.p(false);
            } else if (i9 > 5) {
                strD2 = km4.w(p65Var, -127724897, R.string.onboarding_starter_packs_editors_plus, p65Var, false);
            } else {
                p65Var.Y(-127722341);
                strD2 = vo7.D(R.plurals.onboarding_starter_packs_editors, i9, new Object[]{Integer.valueOf(i9)}, p65Var);
                p65Var.p(false);
            }
            if (strD != null && strD2 != null) {
                p65Var.Y(-127716855);
                strD = vo7.Q(R.string.onboarding_starter_packs_counts_format, new Object[]{strD, strD2}, p65Var);
                p65Var.p(false);
            } else if (strD != null) {
                p65Var.Y(-127711604);
                p65Var.p(false);
            } else if (strD2 != null) {
                p65Var.Y(-127710228);
                p65Var.p(false);
                strD = strD2;
            } else {
                p65Var.Y(335977725);
                p65Var.p(false);
                strD = "";
            }
            if (strD.length() > 0) {
                p65Var.Y(802320971);
                o28Var = o28Var3;
                z = false;
                sn3Var = sn3Var3;
                jjd.b(strD, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var3)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
                p65Var = p65Var;
            } else {
                z = false;
                o28Var = o28Var3;
                sn3Var = sn3Var3;
                p65Var.Y(798320266);
            }
            p65Var.p(z);
            p65Var.p(true);
            Integer num = ncaVar.e;
            if (num == null) {
                p65Var.Y(-1398339763);
                p65Var.p(z);
                sn3Var2 = sn3Var;
            } else {
                p65Var.Y(-1398339762);
                sn3 sn3Var4 = sn3Var;
                p65 p65Var3 = p65Var;
                sn3Var2 = sn3Var4;
                jjd.b(aoc.d(num.intValue()), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var4)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 0, 0, 131070);
                p65Var = p65Var3;
                p65Var.p(z);
            }
            p65Var.p(true);
            p65Var.p(true);
            if (str2 == null) {
                p65Var.Y(69582926);
                p65Var.p(z);
                o28Var2 = o28Var;
            } else {
                p65Var.Y(69582927);
                boolean zF = p65Var.f(str2);
                Object objM = p65Var.M();
                if (zF || objM == w12.a) {
                    objM = bjc.b(new xa8(str2, 1));
                    p65Var.j0(objM);
                }
                o28 o28Var4 = o28Var;
                o28Var2 = o28Var4;
                p65 p65Var4 = p65Var;
                jjd.b((String) ((upc) objM).getValue(), bgf.N(o28Var4, "publication_description_" + str3), 0L, 0L, 0L, null, null, 0L, 2, false, 7, 0, null, ((bu7) p65Var.j(sn3Var2)).m, p65Var4, 0, 24960, 110588);
                p65Var = p65Var4;
                p65Var.p(z);
            }
            p65Var.p(true);
            r28Var2 = o28Var2;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(ncaVar, r28Var2, i, 25);
        }
    }

    public static final void k(final mra mraVar, final ek8 ek8Var, x12 x12Var, int i) {
        String str = mraVar.c;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1673692076);
        int i2 = 4;
        int i3 = (p65Var.f(mraVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            boolean z = mraVar.a;
            String str2 = mraVar.d;
            kx kxVarW = ho2.w(p65Var, -2100296638);
            String strQ = vo7.Q(R.string.notification_type_quote_simple, new Object[]{str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var.p(false);
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_quote);
                mz1 mz1VarE = pxf.E(1943064667, new nra(i, mraVar), p65Var);
                int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i5 = i3 & 14;
                boolean z2 = (i4 == 32) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: ora
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i6 = i;
                            c1e c1eVar = c1e.a;
                            mra mraVar2 = mraVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i6) {
                                case 0:
                                    ek8Var2.j(mraVar2.e, mraVar2.k);
                                    break;
                                default:
                                    ek8Var2.k(mraVar2.b, mraVar2.k);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i6 = (i5 == 4 ? 1 : 0) | (i4 == 32 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i6 != 0 || objM2 == uobVar) {
                    final int i7 = 1;
                    objM2 = new m45() { // from class: ora
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i62 = i7;
                            c1e c1eVar = c1e.a;
                            mra mraVar2 = mraVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i62) {
                                case 0:
                                    ek8Var2.j(mraVar2.e, mraVar2.k);
                                    break;
                                default:
                                    ek8Var2.k(mraVar2.b, mraVar2.k);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.g(z, str2, numValueOf, mxVarC, mz1VarE, 2, m45Var, (m45) objM2, p65Var, 221184, 0);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(mraVar, ek8Var, i, i2);
        }
    }

    public static final void l(String str, x45 x45Var, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        r28 r28Var2;
        str.getClass();
        x45Var.getClass();
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1768020470);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(str) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = 16;
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(x45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        int i4 = i2 | 3072;
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            hlg.a(m45Var, pxf.E(-2119415746, new f4b(str, x45Var), p65Var2), o28Var, pxf.E(94967872, new c60(i3, m45Var), p65Var2), null, rx0.e, rx0.f, null, 0L, 0L, 0L, 0L, null, p65Var, ((i4 >> 6) & 14) | 1772976, 0, 16272);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 11, str, x45Var, m45Var, r28Var2);
        }
    }

    public static final void m(uwe uweVar, int i, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        long j;
        Object ftcVar;
        m62 m62Var;
        l78 l78Var;
        uweVar.getClass();
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2018821994);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(uweVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.d(i) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(x45Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            if (uweVar.b) {
                p65Var.Y(-298768858);
                j = ((zo7) p65Var.j(kt7.b)).b;
                p65Var.p(false);
            } else {
                p65Var.Y(-298693528);
                j = ((zo7) p65Var.j(kt7.b)).a;
                p65Var.p(false);
            }
            upc upcVarA = wec.a(j, null, null, p65Var, 0, 14);
            String strQ = vo7.Q(R.string.indexed_voice_language, new Object[]{uweVar.d, Integer.valueOf(i + 1)}, p65Var);
            r28 r28VarA0 = flb.a0(jfc.d(o28.b, 1.0f), ((uu1) upcVarA.getValue()).a, rv8.r);
            boolean zF = ((i3 & 896) == 256) | p65Var.f(strQ);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new g4b(4, x45Var, strQ);
                p65Var.j0(objM);
            }
            r28 r28VarR = hlg.r(r28VarA0, false, null, null, (m45) objM, 15);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM4);
            }
            l78 l78Var2 = (l78) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM5;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM6;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM7 = p65Var.M();
            if (zH || objM7 == uobVar) {
                ftcVar = new ftc(l78Var3, hl7Var, m62Var2, l78Var2, 7);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(ftcVar);
            } else {
                ftcVar = objM7;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) ftcVar;
            Object objM8 = p65Var.M();
            int i4 = 7;
            if (objM8 == uobVar) {
                objM8 = new gtc(l78Var, m62Var, 7);
                p65Var.j0(objM8);
            }
            m45 m45Var = (m45) objM8;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM9 = p65Var.M();
            if (zH2 || objM9 == uobVar) {
                objM9 = new htc(hl7Var, i4);
                p65Var.j0(objM9);
            }
            hlg.j(wxb.a(r28VarR, false, (x45) objM9), pxf.E(1200550679, new je2(l78Var3, z52Var, m45Var, uweVar, strQ, 7), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ya0(uweVar, i, x45Var, i2);
        }
    }

    public static final void n(Map map, b55 b55Var, m45 m45Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        map.getClass();
        b55Var.getClass();
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-225229896);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(map) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = 16;
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(b55Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            amb ambVarC = bmb.c(8.0f, 8.0f, 0.0f, 0.0f, 12);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new sqe(i3);
                p65Var2.j0(objM);
            }
            g3d.a(new l60((x45) objM, false), ambVarC, 0L, 0L, 0.0f, 0.0f, null, pxf.E(-1717149549, new swe(kv6VarA, m45Var, map, b55Var, 0), p65Var2), p65Var2, 12582912, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            p65Var = p65Var2;
            boolean zH = p65Var.h(map) | p65Var.f(kv6VarA);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new cfd(map, kv6VarA, null, 21);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, map);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pfe(i, 1, map, b55Var, m45Var);
        }
    }

    public static final void o(f78 f78Var, Object obj, Object obj2) {
        int iF = f78Var.f(obj);
        boolean z = iF < 0;
        Object obj3 = z ? null : f78Var.c[iF];
        if (obj3 != null) {
            if (obj3 instanceof g78) {
                ((g78) obj3).a(obj2);
            } else if (obj3 != obj2) {
                g78 g78Var = new g78();
                g78Var.a(obj3);
                g78Var.a(obj2);
                obj2 = g78Var;
            }
            obj2 = obj3;
        }
        if (!z) {
            f78Var.c[iF] = obj2;
            return;
        }
        int i = ~iF;
        f78Var.b[i] = obj;
        f78Var.c[i] = obj2;
    }

    public static int p(Context context, String str) {
        int iNoteProxyOpNoThrow;
        int iMyPid = Process.myPid();
        int iMyUid = Process.myUid();
        String packageName = context.getPackageName();
        if (context.checkPermission(str, iMyPid, iMyUid) != -1) {
            String strPermissionToOp = AppOpsManager.permissionToOp(str);
            if (strPermissionToOp != null) {
                if (packageName == null) {
                    String[] packagesForUid = context.getPackageManager().getPackagesForUid(iMyUid);
                    if (packagesForUid != null && packagesForUid.length > 0) {
                        packageName = packagesForUid[0];
                    }
                }
                int iMyUid2 = Process.myUid();
                String packageName2 = context.getPackageName();
                if (iMyUid2 == iMyUid && Objects.equals(packageName2, packageName) && Build.VERSION.SDK_INT >= 29) {
                    AppOpsManager appOpsManager = (AppOpsManager) context.getSystemService(AppOpsManager.class);
                    iNoteProxyOpNoThrow = appOpsManager == null ? 1 : appOpsManager.checkOpNoThrow(strPermissionToOp, Binder.getCallingUid(), packageName);
                    if (iNoteProxyOpNoThrow == 0) {
                        iNoteProxyOpNoThrow = appOpsManager != null ? appOpsManager.checkOpNoThrow(strPermissionToOp, iMyUid, nm.o(context)) : 1;
                    }
                } else {
                    iNoteProxyOpNoThrow = ((AppOpsManager) context.getSystemService(AppOpsManager.class)).noteProxyOpNoThrow(strPermissionToOp, packageName);
                }
                if (iNoteProxyOpNoThrow != 0) {
                    return -2;
                }
            }
            return 0;
        }
        return -1;
    }

    public static f78 q() {
        long[] jArr = hqb.a;
        return new f78();
    }

    public static void r(byte b2, byte b3, byte b4, byte b5, char[] cArr, int i) {
        if (!w(b3)) {
            if ((((b3 + 112) + (b2 << 28)) >> 30) == 0 && !w(b4) && !w(b5)) {
                int i2 = ((b2 & 7) << 18) | ((b3 & 63) << 12) | ((b4 & 63) << 6) | (b5 & 63);
                cArr[i] = (char) ((i2 >>> 10) + 55232);
                cArr[i + 1] = (char) ((i2 & 1023) + 56320);
                return;
            }
        }
        throw InvalidProtocolBufferException.b();
    }

    public static void s(byte b2, byte b3, byte b4, char[] cArr, int i) {
        if (w(b3) || ((b2 == -32 && b3 < -96) || ((b2 == -19 && b3 >= -96) || w(b4)))) {
            throw InvalidProtocolBufferException.b();
        }
        cArr[i] = (char) (((b2 & 15) << 12) | ((b3 & 63) << 6) | (b4 & 63));
    }

    public static void t(byte b2, byte b3, char[] cArr, int i) {
        if (b2 < -62 || w(b3)) {
            throw InvalidProtocolBufferException.b();
        }
        cArr[i] = (char) (((b2 & 31) << 6) | (b3 & 63));
    }

    public static final boolean u(Spanned spanned, Class cls) {
        return spanned.nextSpanTransition(-1, spanned.length(), cls) != spanned.length();
    }

    public static final void v(x12 x12Var, Integer num, b55 b55Var) {
        if (((p65) x12Var).S) {
            ((p65) x12Var).b(b55Var, num);
        }
    }

    public static boolean w(byte b2) {
        return b2 > -65;
    }

    public static final md5 x(z46 z46Var, String str, Executor executor, m45 m45Var) {
        c1e c1eVar = c1e.a;
        z46Var.getClass();
        executor.getClass();
        n68 n68Var = new n68(0);
        q41 q41Var = new q41();
        q41Var.c = new dcb();
        t41 t41Var = new t41(q41Var);
        q41Var.b = t41Var;
        q41Var.a = lv8.class;
        try {
            executor.execute(new ep0(z46Var, str, m45Var, n68Var, q41Var));
            q41Var.a = c1eVar;
        } catch (Exception e) {
            t41Var.b.l(e);
        }
        return new md5(n68Var, t41Var);
    }

    public static final void y(x12 x12Var, x45 x45Var) {
        ((p65) x12Var).b(new wa0(1, x45Var), c1e.a);
    }

    public static final boolean z(f78 f78Var, Object obj, Object obj2) {
        Object objG = f78Var.g(obj);
        if (objG == null) {
            return false;
        }
        if (!(objG instanceof g78)) {
            if (!objG.equals(obj2)) {
                return false;
            }
            f78Var.k(obj);
            return true;
        }
        g78 g78Var = (g78) objG;
        boolean zL = g78Var.l(obj2);
        if (zL && g78Var.g()) {
            f78Var.k(obj);
        }
        return zL;
    }
}
