package defpackage;

import android.app.PendingIntent;
import android.net.Uri;
import com.medium.android.explore.ui.ExploreFragment;
import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.search.ui.main.SearchFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xi1 extends x55 implements b55 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xi1(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws PendingIntent.CanceledException {
        boolean zIsFocused;
        boolean zIsFocused2;
        int i = this.a;
        cu6 cu6Var = null;
        Object[] objArr = 0;
        int iMin = 0;
        z = false;
        boolean z = false;
        iMin = 0;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                String str = (String) obj;
                String str2 = (String) obj2;
                str.getClass();
                str2.getClass();
                aj1 aj1Var = (aj1) this.receiver;
                aj1Var.getClass();
                SearchFragment searchFragment = ((htb) aj1Var.b.b).a;
                ((p13) searchFragment.Z()).h0(searchFragment.S(), str, str2);
                return c1eVar;
            case 1:
                int iIntValue = ((Number) obj).intValue();
                PostPreviewData postPreviewData = (PostPreviewData) obj2;
                postPreviewData.getClass();
                return ((qe3) this.receiver).e(iIntValue, postPreviewData);
            case 2:
                int iIntValue2 = ((Number) obj).intValue();
                PostPreviewData postPreviewData2 = (PostPreviewData) obj2;
                postPreviewData2.getClass();
                return ((qe3) this.receiver).e(iIntValue2, postPreviewData2);
            case 3:
                Object objF = ((ht3) this.receiver).f((String) obj, (n92) obj2);
                return objF == tb2.COROUTINE_SUSPENDED ? objF : new bjb(objF);
            case 4:
                String str3 = (String) obj;
                SourceParameter sourceParameter = (SourceParameter) obj2;
                str3.getClass();
                sourceParameter.getClass();
                f74 f74Var = ((l64) this.receiver).a;
                if (f74Var.x.add(str3)) {
                    f74Var.l.g(str3, f74Var.b, gp7.u(sourceParameter), f74Var.o);
                }
                return c1eVar;
            case 5:
                String str4 = (String) obj;
                SourceParameter sourceParameter2 = (SourceParameter) obj2;
                str4.getClass();
                sourceParameter2.getClass();
                ExploreFragment exploreFragment = ((l64) this.receiver).b.a;
                ((p13) exploreFragment.Z()).N(exploreFragment.S(), str4, gp7.u(sourceParameter2));
                return c1eVar;
            case 6:
                zr4 zr4Var = (zr4) obj;
                zr4 zr4Var2 = (zr4) obj2;
                bs4 bs4Var = (bs4) this.receiver;
                if (bs4Var.n && (zIsFocused = zr4Var2.isFocused()) != zr4Var.isFocused()) {
                    if (zIsFocused) {
                        rya ryaVar = new rya();
                        mo7.T(bs4Var, new cn(ryaVar, 12, bs4Var));
                        cu6 cu6Var2 = (cu6) ryaVar.a;
                        if (cu6Var2 != null) {
                            cu6Var2.a();
                            cu6Var = cu6Var2;
                        }
                        bs4Var.r = cu6Var;
                    } else {
                        cu6 cu6Var3 = bs4Var.r;
                        if (cu6Var3 != null) {
                            cu6Var3.b();
                        }
                        bs4Var.r = null;
                    }
                }
                return c1eVar;
            case 7:
                zr4 zr4Var3 = (zr4) obj;
                zr4 zr4Var4 = (zr4) obj2;
                ls4 ls4Var = (ls4) this.receiver;
                if (ls4Var.n && (zIsFocused2 = zr4Var4.isFocused()) != zr4Var3.isFocused()) {
                    x45 x45Var = ls4Var.r;
                    if (x45Var != null) {
                        x45Var.invoke(Boolean.valueOf(zIsFocused2));
                    }
                    u3b u3bVar = ms4.o;
                    if (zIsFocused2) {
                        vx0.c0(ls4Var.u0(), null, null, new m1(ls4Var, objArr == true ? 1 : 0, 16), 3);
                        rya ryaVar2 = new rya();
                        mo7.T(ls4Var, new gd3(ryaVar2, 13, ls4Var));
                        cu6 cu6Var4 = (cu6) ryaVar2.a;
                        if (cu6Var4 != null) {
                            cu6Var4.a();
                        } else {
                            cu6Var4 = null;
                        }
                        ls4Var.t = cu6Var4;
                        eh8 eh8Var = ls4Var.u;
                        if (eh8Var != null && eh8Var.O0().n && ls4Var.n) {
                            br7.r(ls4Var, u3bVar);
                        }
                    } else {
                        cu6 cu6Var5 = ls4Var.t;
                        if (cu6Var5 != null) {
                            cu6Var5.b();
                        }
                        ls4Var.t = null;
                        if (ls4Var.n) {
                            br7.r(ls4Var, u3bVar);
                        }
                    }
                    dl7.u(ls4Var);
                    m68 m68Var = ls4Var.q;
                    if (m68Var != null) {
                        gr4 gr4Var = ls4Var.s;
                        if (zIsFocused2) {
                            if (gr4Var != null) {
                                ls4Var.L0(m68Var, new hr4(gr4Var));
                                ls4Var.s = null;
                            }
                            gr4 gr4Var2 = new gr4();
                            ls4Var.L0(m68Var, gr4Var2);
                            ls4Var.s = gr4Var2;
                        } else if (gr4Var != null) {
                            ls4Var.L0(m68Var, new hr4(gr4Var));
                            ls4Var.s = null;
                        }
                    }
                }
                return c1eVar;
            case 8:
                String str5 = (String) obj;
                SourceParameter sourceParameter3 = (SourceParameter) obj2;
                str5.getClass();
                sourceParameter3.getClass();
                ((sh9) this.receiver).i(str5, sourceParameter3);
                return c1eVar;
            case 9:
                String str6 = (String) obj;
                SourceParameter sourceParameter4 = (SourceParameter) obj2;
                str6.getClass();
                sourceParameter4.getClass();
                ((sh9) this.receiver).E(str6, sourceParameter4);
                return c1eVar;
            case 10:
                int iIntValue3 = ((Number) obj).intValue();
                int iIntValue4 = ((Number) obj2).intValue();
                pw6 pw6Var = (pw6) this.receiver;
                xp xpVar = pw6Var.e;
                int[] iArr = new int[iIntValue4];
                if (((jw6) pw6Var.d.getValue()).j.N(iIntValue3)) {
                    k80.p0(iIntValue3, 0, 6, iArr);
                } else {
                    xpVar.m(iIntValue3 + iIntValue4);
                    int iU = xpVar.u(iIntValue3);
                    if (iU != -2 && iU != -1) {
                        if (iU < 0) {
                            e26.a("Expected positive lane number, got " + iU + " instead.");
                        }
                        iMin = Math.min(iU, iIntValue4);
                    }
                    int i2 = iMin - 1;
                    int iN = iIntValue3;
                    while (true) {
                        if (-1 < i2) {
                            iN = xpVar.n(iN, i2);
                            iArr[i2] = iN;
                            if (iN == -1) {
                                k80.p0(-1, i2, 2, iArr);
                            } else {
                                i2--;
                            }
                        }
                    }
                    iArr[iMin] = iIntValue3;
                    for (int i3 = iMin + 1; i3 < iIntValue4; i3++) {
                        iIntValue3++;
                        int length = xpVar.b + ((int[]) xpVar.c).length;
                        while (true) {
                            if (iIntValue3 >= length) {
                                iIntValue3 = xpVar.b + ((int[]) xpVar.c).length;
                            } else {
                                if (xpVar.g(iIntValue3, i3)) {
                                }
                                iIntValue3++;
                            }
                            break;
                        }
                        iArr[i3] = iIntValue3;
                    }
                }
                return iArr;
            case 11:
                return ((do4) this.receiver).a((ud7) obj, (n92) obj2);
            case 12:
                String str7 = (String) obj;
                String str8 = (String) obj2;
                str7.getClass();
                str8.getClass();
                i98 i98Var = (i98) this.receiver;
                i98Var.getClass();
                i98Var.b.d(str7, str8);
                return c1eVar;
            case 13:
                Uri uri = (Uri) obj;
                SourceParameter sourceParameter5 = (SourceParameter) obj2;
                uri.getClass();
                sourceParameter5.getClass();
                iaa iaaVar = (iaa) this.receiver;
                iaaVar.getClass();
                ((kia) ((sja) iaaVar.a.a)).c(uri, sourceParameter5);
                return c1eVar;
            case 14:
                return flb.c0((elb) this.receiver, (x45) obj, (n92) obj2);
            case 15:
                return flb.c0((elb) this.receiver, (x45) obj, (n92) obj2);
            case 16:
                String str9 = (String) obj;
                SourceParameter sourceParameter6 = (SourceParameter) obj2;
                str9.getClass();
                sourceParameter6.getClass();
                ((sh9) this.receiver).i(str9, sourceParameter6);
                return c1eVar;
            case 17:
                String str10 = (String) obj;
                SourceParameter sourceParameter7 = (SourceParameter) obj2;
                str10.getClass();
                sourceParameter7.getClass();
                ((sh9) this.receiver).E(str10, sourceParameter7);
                return c1eVar;
            case 18:
                String str11 = (String) obj;
                SourceParameter sourceParameter8 = (SourceParameter) obj2;
                str11.getClass();
                sourceParameter8.getClass();
                odd oddVar = ((lbd) this.receiver).a;
                if (oddVar.D.add(str11)) {
                    oddVar.q.g(str11, oddVar.c, gp7.u(sourceParameter8), oddVar.P);
                }
                return c1eVar;
            case 19:
                mn6 mn6Var = (mn6) obj;
                mn6 mn6Var2 = (mn6) obj2;
                mn6Var.getClass();
                mn6Var2.getClass();
                ((owd) this.receiver).getClass();
                cf8.b.getClass();
                df8 df8Var = bf8.b;
                if (df8Var.b(mn6Var, mn6Var2) && !df8Var.b(mn6Var2, mn6Var)) {
                    z = true;
                }
                return Boolean.valueOf(z);
            case 20:
                mn6 mn6Var3 = (mn6) obj;
                mn6 mn6Var4 = (mn6) obj2;
                mn6Var3.getClass();
                mn6Var4.getClass();
                return Boolean.valueOf(((df8) this.receiver).a(mn6Var3, mn6Var4));
            default:
                String str12 = (String) obj;
                String str13 = (String) obj2;
                str12.getClass();
                str13.getClass();
                zbe zbeVar = (zbe) this.receiver;
                zbeVar.getClass();
                zbeVar.b.d(str12, str13);
                return c1eVar;
        }
    }
}
