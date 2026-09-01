package defpackage;

import com.google.android.recaptcha.internal.zzad;
import com.google.android.recaptcha.internal.zzae;
import com.google.android.recaptcha.internal.zzag;
import com.google.android.recaptcha.internal.zzah;
import com.google.android.recaptcha.internal.zzao;
import com.google.android.recaptcha.internal.zzap;
import com.google.android.recaptcha.internal.zzx;
import com.google.android.recaptcha.internal.zzy;
import com.google.android.recaptcha.internal.zzz;
import j$.util.Optional;
import j$.util.function.Function$CC;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nkg implements csf {
    public static final /* synthetic */ nkg b;
    public static final /* synthetic */ nkg c;
    public static final /* synthetic */ nkg d;
    public static final /* synthetic */ nkg e;
    public static final /* synthetic */ nkg f;
    public static final /* synthetic */ nkg g;
    public static final /* synthetic */ nkg h;
    public static final /* synthetic */ nkg i;
    public static final /* synthetic */ nkg j;
    public static final /* synthetic */ nkg k;
    public static final /* synthetic */ nkg l;
    public static final /* synthetic */ nkg m;
    public static final /* synthetic */ nkg n;
    public static final /* synthetic */ nkg o;
    public static final /* synthetic */ nkg p;
    public static final /* synthetic */ nkg q;
    public final /* synthetic */ int a;

    static {
        int i2 = (((((~386839851) & 502322068) | 1879579667) + ((386839851 & 1341449093) | 1376723995)) - (-1804183289)) ^ (2118801173 % 1119399015);
        int i3 = (((((~310242589) & 1847460522) | 916960512) + ((310242589 & 1486357226) | 346393668)) - 2000278179) ^ (2125023787 % 550804899);
        int i4 = (((((~2025251990) & 688917531) | 1994836270) + ((2025251990 & 152053269) | 883831534)) - (-1390790891)) ^ (1069117832 % 942581876);
        int i5 = (((((~1650994571) & 1371186185) | 1050017619) + ((1650994571 & 1227505800) | 205643505)) - (-1965943233)) ^ (1992865128 % 986478257);
        int i6 = (((((~1199680559) & 1141516237) | 463752220) + ((1199680559 & 1150952403) | 43369530)) - 1260832081) ^ (1435001171 % 1047196295);
        int i7 = (((((~1456339643) & 675645608) | 1411114002) + ((1456339643 & 693897896) | 1427718916)) - (-1019776501)) ^ (1561812722 % 1322623287);
        int i8 = (((((~1978701535) & 466139520) | 1762924265) + ((1978701535 & 315141952) | 1765037774)) - (-506179056)) ^ (1934660183 % 1880346039);
        int i9 = (((((~222028828) & 1142841824) | 166034459) + ((222028828 & 1142555104) | 723801104)) - 1805567702) ^ (829570037 % 301373537);
        int i10 = (((((~1396918184) & 1248054849) | 133905852) + ((1396918184 & 1770570357) | 870268086)) - 2138058592) ^ (1934392735 % 620089368);
        int i11 = (((((~1889804310) & 69748736) | 707083889) + ((1889804310 & 604795188) | 951435263)) - 1284100921) ^ (1663080928 % 610506582);
        int i12 = (((((~672139932) & 1821026947) | 1629321417) + ((672139932 & 214090242) | 828986457)) - (-2020274916)) ^ (1579068977 % 395191309);
        int i13 = (((((~99568484) & 3432473) | 44796710) + ((99568484 & 403994653) | 1028298918)) - 934561551) ^ (1076919591 % 234262547);
        q = new nkg((((((~1759592334) & 1334334268) | 1043988652) + ((1759592334 & 1099191056) | 509413516)) - (-1669029722)) ^ (599529154 % 33713861));
        p = new nkg((((((~1160063179) & 1841305796) | 575720514) + ((1160063179 & 1300254868) | 1886521)) - 1545499812) ^ (1060494695 % 728149010));
        o = new nkg(i13);
        n = new nkg(i4);
        m = new nkg(i5);
        l = new nkg(i6);
        k = new nkg(i3);
        j = new nkg(i7);
        i = new nkg(i8);
        h = new nkg(i9);
        g = new nkg(i2);
        f = new nkg(i10);
        e = new nkg(i11);
        d = new nkg(i12);
        c = new nkg(1);
        b = new nkg(0);
    }

    public /* synthetic */ nkg(int i2) {
        this.a = i2;
    }

    public /* synthetic */ Function andThen(Function function) {
        return Function$CC.$default$andThen(this, function);
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        kxf kxfVar;
        gvf gvfVarF;
        try {
            try {
                try {
                    try {
                        try {
                            switch (this.a) {
                                case 0:
                                    return ((iuf) obj).a();
                                case 1:
                                    try {
                                        hz2 hz2Var = ((iuf) obj).a;
                                        long jM = hz2Var.f().m();
                                        gvf gvfVarF2 = hz2Var.f();
                                        List listO = gvfVarF2.o();
                                        if (jM < 0) {
                                            jM += (long) ((ArrayList) listO).size();
                                        }
                                        if (jM >= 0) {
                                            ArrayList arrayList = (ArrayList) listO;
                                            if (jM < arrayList.size()) {
                                                arrayList.remove((int) jM);
                                                hz2Var.e(gvfVarF2);
                                                return Optional.empty();
                                            }
                                        }
                                        throw new zzap();
                                    } catch (zzap unused) {
                                        kxfVar = kxf.zzI;
                                    }
                                    break;
                                case 2:
                                    iuf iufVar = (iuf) obj;
                                    hz2 hz2Var2 = iufVar.a;
                                    gvf gvfVarF3 = hz2Var2.f();
                                    mpg mpgVarN = hz2Var2.f().n();
                                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                                    gvfVarF3.k(byteArrayOutputStream);
                                    iufVar.a.e(gvf.d(mpgVarN.d(mpg.e(byteArrayOutputStream.toByteArray()))));
                                    return Optional.empty();
                                case 3:
                                    iuf iufVar2 = (iuf) obj;
                                    hz2 hz2Var3 = iufVar2.a;
                                    gvf gvfVarF4 = hz2Var3.f();
                                    mpg mpgVarN2 = hz2Var3.f().n();
                                    ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
                                    b9g.b(gvfVarF4.m(), new eoc(byteArrayOutputStream2), false);
                                    iufVar2.a.e(gvf.d(mpgVarN2.d(mpg.e(byteArrayOutputStream2.toByteArray()))));
                                    return Optional.empty();
                                case 4:
                                    iuf iufVar3 = (iuf) obj;
                                    opg opgVar = iufVar3.c;
                                    hz2 hz2Var4 = iufVar3.a;
                                    hz2Var4.a.set(hz2Var4.d(-(iufVar3.b.k().b + opgVar.h())), hz2Var4.f());
                                    return Optional.empty();
                                case 5:
                                    hz2 hz2Var5 = ((iuf) obj).a;
                                    hz2Var5.e(gvf.b(hz2Var5.f().m() << ((int) hz2Var5.f().m())));
                                    return Optional.empty();
                                case 6:
                                    hz2 hz2Var6 = ((iuf) obj).a;
                                    hz2Var6.e(gvf.b(hz2Var6.f().m() >>> ((int) hz2Var6.f().m())));
                                    return Optional.empty();
                                case 7:
                                    hz2 hz2Var7 = ((iuf) obj).a;
                                    hz2Var7.e(gvf.c(hz2Var7.f().q() - hz2Var7.f().q()));
                                    return Optional.empty();
                                case 8:
                                    hz2 hz2Var8 = ((iuf) obj).a;
                                    hz2Var8.e(gvf.b(hz2Var8.f().m() - hz2Var8.f().m()));
                                    return Optional.empty();
                                case 9:
                                    iuf iufVar4 = (iuf) obj;
                                    hz2 hz2Var9 = iufVar4.a;
                                    long jM2 = hz2Var9.f().m();
                                    gvf gvfVarF5 = hz2Var9.f();
                                    hz2 hz2Var10 = iufVar4.a;
                                    gvf gvfVarG = hz2Var10.g(jM2);
                                    hz2Var10.a.set(hz2Var10.d(jM2), gvfVarF5);
                                    hz2Var10.e(gvfVarG);
                                    return Optional.empty();
                                case 10:
                                    iuf iufVar5 = (iuf) obj;
                                    hz2 hz2Var11 = iufVar5.a;
                                    long jM3 = iufVar5.b.k().b + hz2Var11.f().m();
                                    gvf gvfVarF6 = hz2Var11.f();
                                    hz2 hz2Var12 = iufVar5.a;
                                    long j2 = -jM3;
                                    gvf gvfVarG2 = hz2Var12.g(j2);
                                    hz2Var12.a.set(hz2Var12.d(j2), gvfVarF6);
                                    hz2Var12.e(gvfVarG2);
                                    return Optional.empty();
                                case 11:
                                    iuf iufVar6 = (iuf) obj;
                                    opg opgVar2 = iufVar6.c;
                                    hz2 hz2Var13 = iufVar6.a;
                                    long jH = iufVar6.b.k().b + opgVar2.h();
                                    gvf gvfVarF7 = hz2Var13.f();
                                    long j3 = -jH;
                                    gvf gvfVarG3 = hz2Var13.g(j3);
                                    hz2Var13.a.set(hz2Var13.d(j3), gvfVarF7);
                                    hz2Var13.e(gvfVarG3);
                                    return Optional.empty();
                                case 12:
                                    iuf iufVar7 = (iuf) obj;
                                    long jM4 = iufVar7.a.f().m();
                                    try {
                                        hz2 hz2Var14 = iufVar7.a;
                                        if (jM4 == 0) {
                                            gvfVarF = hz2Var14.f();
                                        } else {
                                            hz2Var14.b--;
                                            gvfVarF = (gvf) hz2Var14.a.remove(hz2Var14.d(jM4));
                                        }
                                        hz2Var14.e(gvfVarF);
                                        return Optional.empty();
                                    } catch (zzag unused2) {
                                        kxfVar = kxf.zzg;
                                    }
                                    break;
                                case 13:
                                    iuf iufVar8 = (iuf) obj;
                                    try {
                                        hz2 hz2Var15 = iufVar8.a;
                                        long jM5 = hz2Var15.f().m();
                                        long jM6 = hz2Var15.f().m();
                                        nec necVar = iufVar8.b;
                                        opg opgVar3 = iufVar8.c;
                                        necVar.i(opgVar3.c(), jM6, necVar.k().b);
                                        opgVar3.a(jM5);
                                        return Optional.empty();
                                    } catch (zzad unused3) {
                                        kxfVar = kxf.zzB;
                                    } catch (zzae unused4) {
                                        kxfVar = kxf.zzw;
                                    } catch (zzy | zzz unused5) {
                                        kxfVar = kxf.zzr;
                                    }
                                    break;
                                case 14:
                                    iuf iufVar9 = (iuf) obj;
                                    try {
                                        iufVar9.a.e(gvf.g(iufVar9.a.f().l()));
                                        return Optional.empty();
                                    } catch (zzao unused6) {
                                        kxfVar = kxf.zzp;
                                    }
                                    break;
                                default:
                                    try {
                                        hz2 hz2Var16 = ((iuf) obj).a;
                                        Iterator it2 = ((ArrayList) hz2Var16.f().o()).iterator();
                                        while (it2.hasNext()) {
                                            hz2Var16.e((gvf) it2.next());
                                            break;
                                        }
                                        return Optional.empty();
                                    } catch (zzah unused7) {
                                        kxfVar = kxf.zza;
                                    }
                                    break;
                            }
                        } catch (zzae | zzag unused8) {
                            kxfVar = kxf.zzx;
                        }
                    } catch (zzao | zzx | zzz unused9) {
                        kxfVar = kxf.zzy;
                    }
                } catch (zzah e2) {
                    e = e2;
                    throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
                }
            } catch (zzag unused10) {
                kxfVar = kxf.zzh;
            }
        } catch (zzao unused11) {
            kxfVar = kxf.zzk;
        } catch (IOException e3) {
            e = e3;
            throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
        }
        return Optional.of(kxfVar);
    }

    public /* synthetic */ Function compose(Function function) {
        return Function$CC.$default$compose(this, function);
    }
}
