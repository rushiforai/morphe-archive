package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dsb implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ dsb(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ac9 ac9Var = (ac9) obj;
                if (ac9Var != null && ac9Var.a == 2) {
                    z = true;
                }
                return Boolean.valueOf(!z);
            case 1:
                obj.getClass();
                List list = (List) obj;
                Object obj2 = list.get(0);
                Object obj3 = list.get(1);
                Object obj4 = list.get(2);
                uid uidVar = obj2 != null ? (uid) ((x45) uid.d.c).invoke(obj2) : null;
                if (uidVar == null) {
                    ay0.e("TextFieldValue could not be restored");
                    return null;
                }
                obj3.getClass();
                boolean zBooleanValue = ((Boolean) obj3).booleanValue();
                obj4.getClass();
                return new atb(uidVar, zBooleanValue, ((Boolean) obj4).booleanValue());
            case 2:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            case 3:
                fj6[] fj6VarArr = gyb.a;
                ((jyb) obj).d(eyb.e, c1eVar);
                return c1eVar;
            case 4:
                ip8 ip8Var = (ip8) obj;
                long j = ip8Var.a;
                return (9223372034707292159L & j) != 9205357640488583168L ? new ax(Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (4294967295L & ip8Var.a))) : jxb.a;
            case 5:
                ax axVar = (ax) obj;
                return new ip8((((long) Float.floatToRawIntBits(axVar.b)) & 4294967295L) | (((long) Float.floatToRawIntBits(axVar.a)) << 32));
            case 6:
                mzb mzbVar = (mzb) obj;
                mzbVar.getClass();
                return mzbVar.iterator();
            case 7:
                return Boolean.valueOf(obj == null);
            case 8:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
            case 9:
                jyb jybVar3 = (jyb) obj;
                jybVar3.getClass();
                hyb.a(jybVar3);
                return c1eVar;
            case 10:
                jyb jybVar4 = (jyb) obj;
                jybVar4.getClass();
                hyb.a(jybVar4);
                return c1eVar;
            case 11:
                jyb jybVar5 = (jyb) obj;
                jybVar5.getClass();
                hyb.a(jybVar5);
                return c1eVar;
            case 12:
                jyb jybVar6 = (jyb) obj;
                jybVar6.getClass();
                z82.a.getClass();
                gyb.c(jybVar6, y82.c);
                return c1eVar;
            case 13:
                jyb jybVar7 = (jyb) obj;
                jybVar7.getClass();
                z82.a.getClass();
                gyb.c(jybVar7, y82.c);
                return c1eVar;
            case 14:
                jyb jybVar8 = (jyb) obj;
                jybVar8.getClass();
                hyb.a(jybVar8);
                return c1eVar;
            case 15:
                jyb jybVar9 = (jyb) obj;
                jybVar9.getClass();
                z82.a.getClass();
                gyb.c(jybVar9, y82.d);
                return c1eVar;
            case 16:
                return c1eVar;
            case 17:
                d6d d6dVar = (d6d) obj;
                d6dVar.getClass();
                return lv8.t(ev6.B(d6dVar.a, d6dVar.b, "{\"startOffset\":", ",\"endOffset\":", ",\"isMine\":"), d6dVar.c, "}");
            case 18:
                return c1eVar;
            case 19:
                tjb tjbVar = (tjb) obj;
                tjbVar.getClass();
                tjbVar.j(-3.0f);
                return c1eVar;
            case 20:
                dpc dpcVar = (dpc) obj;
                dpcVar.getClass();
                return dpcVar.a;
            case 21:
                jyb jybVar10 = (jyb) obj;
                jybVar10.getClass();
                hyb.a(jybVar10);
                return c1eVar;
            case 22:
                wqc wqcVar = (wqc) obj;
                wqcVar.getClass();
                return ka1.r("lifetime_chart_post_", wqcVar.a);
            case 23:
                jyb jybVar11 = (jyb) obj;
                jybVar11.getClass();
                hyb.a(jybVar11);
                return c1eVar;
            case 24:
                jyb jybVar12 = (jyb) obj;
                jybVar12.getClass();
                hyb.a(jybVar12);
                return c1eVar;
            case 25:
                ybd ybdVar = (ybd) obj;
                ybdVar.getClass();
                return "refine_recommendations_suggestion_topics_".concat(ybdVar.g);
            case 26:
                hne hneVar = (hne) obj;
                hneVar.getClass();
                return ka1.r("refine_recommendations_suggestion_writers_", hneVar.j);
            case 27:
                hne hneVar2 = (hne) obj;
                hneVar2.getClass();
                return ka1.r("refine_recommendations_suggestion_friends_", hneVar2.j);
            case 28:
                lt1 lt1Var = (lt1) obj;
                lt1Var.getClass();
                return ka1.r("refine_recommendations_suggestion_publications_", lt1Var.a);
            default:
                fj6[] fj6VarArr2 = gyb.a;
                iyb iybVar = eyb.m;
                fj6 fj6Var = gyb.a[5];
                ((jyb) obj).d(iybVar, Boolean.TRUE);
                return c1eVar;
        }
    }
}
