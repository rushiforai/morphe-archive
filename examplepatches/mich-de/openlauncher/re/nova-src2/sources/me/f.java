package me;

import com.google.android.gms.internal.measurement.k2;
import fe.j0;
import fe.k0;
import java.util.Arrays;
import rg.m;
import wf.v;
import xk.l0;
import xk.r2;
import xk.v0;

/* loaded from: classes3.dex */
public final class f implements a {

    /* renamed from: a, reason: collision with root package name */
    public final v0 f76262a;

    /* renamed from: b, reason: collision with root package name */
    public final int f76263b;

    public f(int i5, r2 r2Var) {
        this.f76263b = i5;
        this.f76262a = r2Var;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static f b(int i5, com.google.android.gms.internal.consent_sdk.a aVar) {
        a gVar;
        String str;
        int i11;
        int i12 = 4;
        w20.e.e(4, "initialCapacity");
        Object[] objArrCopyOf = new Object[4];
        int i13 = aVar.f31985c;
        int i14 = 0;
        int i15 = -2;
        int i16 = 0;
        while (aVar.g() > 8) {
            int iC = aVar.C();
            int iC2 = aVar.f31984b + aVar.C();
            aVar.X(iC2);
            if (iC != 1414744396) {
                d dVar = null;
                switch (iC) {
                    case 1718776947:
                        if (i15 == 2) {
                            aVar.Z(i12);
                            int iC3 = aVar.C();
                            int iC4 = aVar.C();
                            aVar.Z(i12);
                            int iC5 = aVar.C();
                            switch (iC5) {
                                case 808802372:
                                case 877677894:
                                case 1145656883:
                                case 1145656920:
                                case 1482049860:
                                case 1684633208:
                                case 2021026148:
                                    str = "video/mp4v-es";
                                    break;
                                case 826496577:
                                case 828601953:
                                case 875967048:
                                    str = "video/avc";
                                    break;
                                case 842289229:
                                    str = "video/mp42";
                                    break;
                                case 859066445:
                                    str = "video/mp43";
                                    break;
                                case 1196444237:
                                case 1735420525:
                                    str = "video/mjpeg";
                                    break;
                                default:
                                    str = null;
                                    break;
                            }
                            if (str != null) {
                                j0 j0Var = new j0();
                                j0Var.f54859p = iC3;
                                j0Var.f54860q = iC4;
                                j0Var.f54856k = str;
                                gVar = new g(new k0(j0Var));
                                break;
                            } else {
                                k2.t(iC5, "Ignoring track with unsupported compression ", "StreamFormatChunk");
                                gVar = dVar;
                                break;
                            }
                        } else {
                            if (i15 == 1) {
                                int iG = aVar.G();
                                String str2 = iG != 1 ? iG != 85 ? iG != 255 ? iG != 8192 ? iG != 8193 ? null : "audio/vnd.dts" : "audio/ac3" : "audio/mp4a-latm" : "audio/mpeg" : "audio/raw";
                                if (str2 != null) {
                                    int iG2 = aVar.G();
                                    int iC6 = aVar.C();
                                    aVar.Z(6);
                                    int iO = v.o(aVar.S());
                                    int iG3 = aVar.G();
                                    byte[] bArr = new byte[iG3];
                                    aVar.z(i14, iG3, bArr);
                                    j0 j0Var2 = new j0();
                                    j0Var2.f54856k = str2;
                                    j0Var2.f54867x = iG2;
                                    j0Var2.f54868y = iC6;
                                    if ("audio/raw".equals(str2) && iO != 0) {
                                        j0Var2.f54869z = iO;
                                    }
                                    if ("audio/mp4a-latm".equals(str2) && iG3 > 0) {
                                        j0Var2.f54858m = v0.s(bArr);
                                    }
                                    gVar = new g(new k0(j0Var2));
                                    break;
                                } else {
                                    k2.t(iG, "Ignoring track with unsupported format tag ", "StreamFormatChunk");
                                }
                            } else {
                                wf.a.D("StreamFormatChunk", "Ignoring strf box for unsupported track type: " + v.t(i15));
                            }
                            gVar = dVar;
                        }
                    case 1751742049:
                        int iC7 = aVar.C();
                        aVar.Z(8);
                        int iC8 = aVar.C();
                        int iC9 = aVar.C();
                        aVar.Z(i12);
                        aVar.C();
                        aVar.Z(12);
                        gVar = new c(iC7, iC8, iC9);
                        break;
                    case 1752331379:
                        int iC10 = aVar.C();
                        aVar.Z(12);
                        aVar.C();
                        int iC11 = aVar.C();
                        int iC12 = aVar.C();
                        aVar.Z(i12);
                        int iC13 = aVar.C();
                        int iC14 = aVar.C();
                        aVar.Z(8);
                        dVar = new d(iC10, iC11, iC12, iC13, iC14);
                        gVar = dVar;
                        break;
                    case 1852994675:
                        gVar = new h(aVar.L(aVar.g(), vk.e.f92809c));
                        break;
                    default:
                        gVar = dVar;
                        break;
                }
            } else {
                gVar = b(aVar.C(), aVar);
            }
            if (gVar != null) {
                if (gVar.getType() == 1752331379) {
                    int i17 = ((d) gVar).f76245a;
                    if (i17 == 1935960438) {
                        i15 = 2;
                    } else if (i17 != 1935963489) {
                        if (i17 != 1937012852) {
                            wf.a.D("AviStreamHeaderChunk", "Found unsupported streamType fourCC: " + Integer.toHexString(i17));
                            i11 = -1;
                        } else {
                            i11 = 3;
                        }
                        i15 = i11;
                    } else {
                        i15 = 1;
                    }
                }
                int i18 = i16 + 1;
                if (objArrCopyOf.length < i18) {
                    objArrCopyOf = Arrays.copyOf(objArrCopyOf, m.c(objArrCopyOf.length, i18));
                }
                objArrCopyOf[i16] = gVar;
                i16 = i18;
            }
            aVar.Y(iC2);
            aVar.X(i13);
            i12 = 4;
            i14 = 0;
        }
        return new f(i5, v0.k(i16, objArrCopyOf));
    }

    public final a a(Class cls) {
        l0 l0VarListIterator = this.f76262a.listIterator(0);
        while (l0VarListIterator.hasNext()) {
            a aVar = (a) l0VarListIterator.next();
            if (aVar.getClass() == cls) {
                return aVar;
            }
        }
        return null;
    }

    @Override // me.a
    public final int getType() {
        return this.f76263b;
    }
}
