package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ux5 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;

    public /* synthetic */ ux5(int i, int i2) {
        this.a = i2;
        this.b = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        int i;
        Integer numValueOf;
        int i2 = this.a;
        int i3 = this.b;
        switch (i2) {
            case 0:
                return dm2.y(g76.W(((rx5) obj).a, i3));
            default:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnb gnbVarB0 = anbVar.B0("SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 ORDER BY last_enqueue_time LIMIT (SELECT MAX(?-COUNT(*), 0) FROM workspec WHERE schedule_requested_at<>-1 AND LENGTH(content_uri_triggers)=0 AND state NOT IN (2, 3, 5))");
                try {
                    gnbVarB0.c(1, i3);
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
                    int iY23 = il7.y(gnbVarB0, "trace_tag");
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
                        int i4 = iY13;
                        int i5 = iY14;
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
                        int i6 = (int) gnbVarB0.getLong(iY10);
                        int i7 = iY;
                        int i8 = iY2;
                        tm0 tm0VarE = en7.E((int) gnbVarB0.getLong(iY11));
                        long j4 = gnbVarB0.getLong(iY12);
                        long j5 = gnbVarB0.getLong(i4);
                        long j6 = gnbVarB0.getLong(i5);
                        int i9 = iY15;
                        long j7 = gnbVarB0.getLong(i9);
                        iY15 = i9;
                        int i10 = iY16;
                        int i11 = iY3;
                        boolean z = ((int) gnbVarB0.getLong(i10)) != 0;
                        int i12 = iY17;
                        int i13 = iY4;
                        lw8 lw8VarG = en7.G((int) gnbVarB0.getLong(i12));
                        int i14 = iY18;
                        int i15 = (int) gnbVarB0.getLong(i14);
                        int i16 = iY19;
                        int i17 = (int) gnbVarB0.getLong(i16);
                        int i18 = iY20;
                        long j8 = gnbVarB0.getLong(i18);
                        int i19 = iY21;
                        int i20 = (int) gnbVarB0.getLong(i19);
                        iY21 = i19;
                        int i21 = iY22;
                        int i22 = (int) gnbVarB0.getLong(i21);
                        int i23 = iY23;
                        Boolean boolValueOf = null;
                        String strD04 = gnbVarB0.isNull(i23) ? null : gnbVarB0.d0(i23);
                        int i24 = iY24;
                        if (gnbVarB0.isNull(i24)) {
                            i = i23;
                            iY22 = i21;
                            numValueOf = null;
                        } else {
                            i = i23;
                            iY22 = i21;
                            numValueOf = Integer.valueOf((int) gnbVarB0.getLong(i24));
                        }
                        if (numValueOf != null) {
                            boolValueOf = Boolean.valueOf(numValueOf.intValue() != 0);
                        }
                        Boolean bool = boolValueOf;
                        int i25 = iY25;
                        te8 te8VarF = en7.F((int) gnbVarB0.getLong(i25));
                        int i26 = iY26;
                        le8 le8VarT = en7.T(gnbVarB0.getBlob(i26));
                        int i27 = iY27;
                        boolean z2 = ((int) gnbVarB0.getLong(i27)) != 0;
                        int i28 = iY28;
                        boolean z3 = ((int) gnbVarB0.getLong(i28)) != 0;
                        int i29 = iY29;
                        boolean z4 = ((int) gnbVarB0.getLong(i29)) != 0;
                        iY29 = i29;
                        int i30 = iY30;
                        int i31 = iY31;
                        int i32 = iY32;
                        iY31 = i31;
                        int i33 = iY33;
                        arrayList.add(new c8f(strD0, j7fVarH, strD02, strD03, dt2VarM0, dt2VarM02, j, j2, j3, new e72(le8VarT, te8VarF, z2, z3, z4, ((int) gnbVarB0.getLong(i30)) != 0, gnbVarB0.getLong(i31), gnbVarB0.getLong(i32), en7.l(gnbVarB0.getBlob(i33))), i6, tm0VarE, j4, j5, j6, j7, z, lw8VarG, i15, i17, j8, i20, i22, strD04, bool));
                        iY28 = i28;
                        iY4 = i13;
                        iY17 = i12;
                        iY18 = i14;
                        iY19 = i16;
                        iY20 = i18;
                        iY23 = i;
                        iY24 = i24;
                        iY25 = i25;
                        iY26 = i26;
                        iY27 = i27;
                        iY33 = i33;
                        iY32 = i32;
                        iY30 = i30;
                        iY = i7;
                        iY3 = i11;
                        iY13 = i4;
                        iY14 = i5;
                        iY2 = i8;
                        iY16 = i10;
                        break;
                    }
                    gnbVarB0.close();
                    return arrayList;
                } catch (Throwable th) {
                    gnbVarB0.close();
                    throw th;
                }
        }
    }
}
