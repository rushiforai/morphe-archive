package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class f8f implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ f8f(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        gnb gnbVarB0;
        boolean z;
        Integer numValueOf;
        Boolean boolValueOf;
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnbVarB0 = anbVar.B0("SELECT COUNT(*) > 0 FROM workspec WHERE state NOT IN (2, 3, 5) LIMIT 1");
                try {
                    if (gnbVarB0.w0()) {
                        z = false;
                        if (((int) gnbVarB0.getLong(0)) != 0) {
                            z = true;
                        }
                    } else {
                        z = false;
                    }
                    boolean z2 = z;
                    gnbVarB0.close();
                    return Boolean.valueOf(z2);
                } finally {
                }
            case 1:
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                gnbVarB0 = anbVar2.B0("SELECT * FROM workspec WHERE state=0 ORDER BY last_enqueue_time LIMIT ?");
                try {
                    gnbVarB0.c(1, 200L);
                    int iY = il7.y(gnbVarB0, "id");
                    int iY2 = il7.y(gnbVarB0, "state");
                    int iY3 = il7.y(gnbVarB0, "worker_class_name");
                    int iY4 = il7.y(gnbVarB0, "input_merger_class_name");
                    int iY5 = il7.y(gnbVarB0, "input");
                    int iY6 = il7.y(gnbVarB0, "output");
                    int iY7 = il7.y(gnbVarB0, "initial_delay");
                    int iY8 = il7.y(gnbVarB0, "interval_duration");
                    int iY9 = il7.y(gnbVarB0, "flex_duration");
                    int iY10 = il7.y(gnbVarB0, "run_attempt_count");
                    int iY11 = il7.y(gnbVarB0, "backoff_policy");
                    int iY12 = il7.y(gnbVarB0, "backoff_delay_duration");
                    int iY13 = il7.y(gnbVarB0, "last_enqueue_time");
                    int iY14 = il7.y(gnbVarB0, "minimum_retention_duration");
                    int iY15 = il7.y(gnbVarB0, "schedule_requested_at");
                    int iY16 = il7.y(gnbVarB0, "run_in_foreground");
                    int iY17 = il7.y(gnbVarB0, "out_of_quota_policy");
                    int iY18 = il7.y(gnbVarB0, "period_count");
                    int iY19 = il7.y(gnbVarB0, "generation");
                    int iY20 = il7.y(gnbVarB0, "next_schedule_time_override");
                    int iY21 = il7.y(gnbVarB0, "next_schedule_time_override_generation");
                    int iY22 = il7.y(gnbVarB0, "stop_reason");
                    int iY23 = il7.y(gnbVarB0, pUlNWdybf.ANKJi);
                    int iY24 = il7.y(gnbVarB0, "backoff_on_system_interruptions");
                    int iY25 = il7.y(gnbVarB0, "required_network_type");
                    int iY26 = il7.y(gnbVarB0, "required_network_request");
                    int iY27 = il7.y(gnbVarB0, "requires_charging");
                    int iY28 = il7.y(gnbVarB0, "requires_device_idle");
                    int iY29 = il7.y(gnbVarB0, "requires_battery_not_low");
                    int iY30 = il7.y(gnbVarB0, "requires_storage_not_low");
                    int iY31 = il7.y(gnbVarB0, "trigger_content_update_delay");
                    int iY32 = il7.y(gnbVarB0, "trigger_max_content_delay");
                    int iY33 = il7.y(gnbVarB0, "content_uri_triggers");
                    ArrayList arrayList = new ArrayList();
                    while (gnbVarB0.w0()) {
                        String strD0 = gnbVarB0.d0(iY);
                        int i2 = iY14;
                        ArrayList arrayList2 = arrayList;
                        j7f j7fVarH = en7.H((int) gnbVarB0.getLong(iY2));
                        String strD02 = gnbVarB0.d0(iY3);
                        String strD03 = gnbVarB0.d0(iY4);
                        byte[] blob = gnbVarB0.getBlob(iY5);
                        dt2 dt2Var = dt2.b;
                        dt2 dt2VarM0 = ht2.m0(blob);
                        dt2 dt2VarM02 = ht2.m0(gnbVarB0.getBlob(iY6));
                        long j = gnbVarB0.getLong(iY7);
                        long j2 = gnbVarB0.getLong(iY8);
                        long j3 = gnbVarB0.getLong(iY9);
                        int i3 = (int) gnbVarB0.getLong(iY10);
                        tm0 tm0VarE = en7.E((int) gnbVarB0.getLong(iY11));
                        long j4 = gnbVarB0.getLong(iY12);
                        long j5 = gnbVarB0.getLong(iY13);
                        long j6 = gnbVarB0.getLong(i2);
                        int i4 = iY15;
                        long j7 = gnbVarB0.getLong(i4);
                        int i5 = iY;
                        int i6 = iY16;
                        int i7 = iY13;
                        boolean z3 = ((int) gnbVarB0.getLong(i6)) != 0;
                        int i8 = iY17;
                        lw8 lw8VarG = en7.G((int) gnbVarB0.getLong(i8));
                        int i9 = iY18;
                        int i10 = (int) gnbVarB0.getLong(i9);
                        int i11 = iY19;
                        int i12 = (int) gnbVarB0.getLong(i11);
                        int i13 = iY20;
                        long j8 = gnbVarB0.getLong(i13);
                        int i14 = iY21;
                        int i15 = (int) gnbVarB0.getLong(i14);
                        iY21 = i14;
                        int i16 = iY22;
                        int i17 = (int) gnbVarB0.getLong(i16);
                        int i18 = iY23;
                        String strD04 = gnbVarB0.isNull(i18) ? null : gnbVarB0.d0(i18);
                        int i19 = iY24;
                        if (gnbVarB0.isNull(i19)) {
                            iY23 = i18;
                            iY22 = i16;
                            numValueOf = null;
                        } else {
                            iY23 = i18;
                            iY22 = i16;
                            numValueOf = Integer.valueOf((int) gnbVarB0.getLong(i19));
                        }
                        if (numValueOf != null) {
                            boolValueOf = Boolean.valueOf(numValueOf.intValue() != 0);
                        } else {
                            boolValueOf = null;
                        }
                        int i20 = iY25;
                        te8 te8VarF = en7.F((int) gnbVarB0.getLong(i20));
                        int i21 = iY26;
                        le8 le8VarT = en7.T(gnbVarB0.getBlob(i21));
                        int i22 = iY27;
                        boolean z4 = ((int) gnbVarB0.getLong(i22)) != 0;
                        int i23 = iY28;
                        boolean z5 = ((int) gnbVarB0.getLong(i23)) != 0;
                        int i24 = iY29;
                        boolean z6 = ((int) gnbVarB0.getLong(i24)) != 0;
                        iY29 = i24;
                        int i25 = iY30;
                        int i26 = iY31;
                        int i27 = iY32;
                        iY31 = i26;
                        int i28 = iY33;
                        iY33 = i28;
                        iY32 = i27;
                        arrayList2.add(new c8f(strD0, j7fVarH, strD02, strD03, dt2VarM0, dt2VarM02, j, j2, j3, new e72(le8VarT, te8VarF, z4, z5, z6, ((int) gnbVarB0.getLong(i25)) != 0, gnbVarB0.getLong(i26), gnbVarB0.getLong(i27), en7.l(gnbVarB0.getBlob(i28))), i3, tm0VarE, j4, j5, j6, j7, z3, lw8VarG, i10, i12, j8, i15, i17, strD04, boolValueOf));
                        iY = i5;
                        iY30 = i25;
                        iY15 = i4;
                        iY17 = i8;
                        iY18 = i9;
                        iY19 = i11;
                        iY20 = i13;
                        iY24 = i19;
                        iY25 = i20;
                        iY26 = i21;
                        iY27 = i22;
                        iY14 = i2;
                        iY28 = i23;
                        arrayList = arrayList2;
                        iY13 = i7;
                        iY16 = i6;
                        break;
                    }
                    return arrayList;
                } catch (Throwable th) {
                    throw th;
                }
            case 2:
                anb anbVar3 = (anb) obj;
                anbVar3.getClass();
                gnbVarB0 = anbVar3.B0("UPDATE workspec SET schedule_requested_at=-1 WHERE state NOT IN (2, 3, 5)");
                try {
                    gnbVarB0.w0();
                    int iS = dl7.s(anbVar3);
                    gnbVarB0.close();
                    return Integer.valueOf(iS);
                } finally {
                }
            case 3:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            case 4:
                dr9 dr9Var = (dr9) obj;
                dr9Var.getClass();
                return dr9Var.a;
            case 5:
                dr9 dr9Var2 = (dr9) obj;
                dr9Var2.getClass();
                return dr9Var2.a;
            case 6:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
            case 7:
                jyb jybVar3 = (jyb) obj;
                jybVar3.getClass();
                hyb.a(jybVar3);
                return c1eVar;
            case 8:
                Object obj2 = ((dv6) obj).k;
                String str = obj2 instanceof String ? (String) obj2 : null;
                return Boolean.valueOf(str != null ? muc.Q(str, "your_following_feed_post_", false) : false);
            case 9:
                return b09.w(((Integer) obj).intValue(), "loading_more_item_");
            case 10:
                jyb jybVar4 = (jyb) obj;
                jybVar4.getClass();
                hyb.a(jybVar4);
                return c1eVar;
            default:
                ((xff) obj).getClass();
                return Boolean.TRUE;
        }
    }
}
