package defpackage;

import com.google.gson.JsonParseException;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class na2 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ oa2 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ na2(oa2 oa2Var, int i) {
        super(0);
        this.a = i;
        this.b = oa2Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        File file;
        String str;
        JsonParseException jsonParseException;
        int i = this.a;
        uc6 uc6VarE = null;
        oa2 oa2Var = this.b;
        switch (i) {
            case 0:
                w5d w5dVar = oa2Var.K;
                File file2 = (File) w5dVar.getValue();
                f66 f66Var = oa2Var.a;
                if (ht2.k0(file2, f66Var)) {
                    file = (File) w5dVar.getValue();
                } else {
                    File file3 = new File(new File(oa2Var.c(), "ndk_crash_reports_v2"), "last_view_event");
                    file = ht2.k0(file3, f66Var) ? file3 : null;
                }
                if (file != null) {
                    List listE = new ba9(f66Var, 2).e(file);
                    if (!listE.isEmpty()) {
                        String str2 = new String(((qsa) bu1.H0(listE)).a, wk1.a);
                        try {
                            try {
                                try {
                                    uc6VarE = r40.L(str2).e();
                                } catch (JsonParseException e) {
                                    jsonParseException = e;
                                    str = str2;
                                    f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new hm0(str, 14), jsonParseException, 48);
                                }
                            } catch (JsonParseException e2) {
                                str = str2;
                                jsonParseException = e2;
                            }
                        } catch (IllegalStateException e3) {
                            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new hm0(str2, 15), e3, 48);
                        }
                    }
                    break;
                }
                if (uc6VarE != null) {
                    if (ht2.k0((File) w5dVar.getValue(), f66Var)) {
                        ht2.g0((File) w5dVar.getValue(), f66Var);
                    } else {
                        File file4 = new File(new File(oa2Var.c(), "ndk_crash_reports_v2"), "last_view_event");
                        if (ht2.k0(file4, f66Var)) {
                            ht2.g0(file4, f66Var);
                        }
                    }
                }
                return uc6VarE;
            case 1:
                return new File(oa2Var.c(), "last_view_event");
            case 2:
                f66 f66Var2 = oa2Var.a;
                f66Var2.getClass();
                return new ba9(f66Var2, 2);
            case 3:
                j42 j42Var = j42.e;
                j42Var.getClass();
                i42 i42Var = new i42();
                i42Var.a = j42Var.a;
                i42Var.c = j42Var.c;
                i42Var.d = j42Var.d;
                i42Var.b = j42Var.b;
                i42Var.d(nmd.TLS_1_2, nmd.TLS_1_3);
                zl1[] zl1VarArr = oa2.M;
                i42Var.c((zl1[]) Arrays.copyOf(zl1VarArr, zl1VarArr.length));
                j42 j42VarB = i42Var.b();
                tp8 tp8Var = new tp8();
                TimeUnit timeUnit = TimeUnit.MILLISECONDS;
                timeUnit.getClass();
                tp8Var.x = ggf.b(45000L, timeUnit);
                tp8Var.A = ggf.b(45000L, timeUnit);
                tp8Var.a(d46.R(c8a.HTTP_2, c8a.HTTP_1_1));
                List listQ = d46.Q(j42VarB);
                if (!listQ.equals(tp8Var.s)) {
                    tp8Var.D = null;
                }
                tp8Var.s = ggf.j(listQ);
                vlb vlbVar = new vlb(oa2Var.j);
                if (vlbVar != tp8Var.m) {
                    tp8Var.D = null;
                }
                tp8Var.m = vlbVar;
                return new up8(tp8Var);
            default:
                return (uc6) oa2Var.J.getValue();
        }
    }
}
