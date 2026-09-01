package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ro implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;

    public /* synthetic */ ro(int i, long j) {
        this.a = i;
        this.b = j;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        x51 x51Var;
        Object ajbVar;
        int i;
        int i2;
        Integer numValueOf;
        int i3 = this.a;
        long j = this.b;
        c1e c1eVar = c1e.a;
        switch (i3) {
            case 0:
                d31 d31Var = (d31) obj;
                float fIntBitsToFloat = Float.intBitsToFloat((int) (d31Var.a.f() >> 32)) / 2.0f;
                return d31Var.a(new so(fIntBitsToFloat, g01.M(d31Var, fIntBitsToFloat), new bs0(5, j), 0));
            case 1:
                zy0 zy0Var = (zy0) obj;
                x45 x45Var = zy0Var.b;
                if (x45Var != null && (x51Var = zy0Var.a) != null) {
                    try {
                        ajbVar = x45Var.invoke(Long.valueOf(j));
                    } catch (Throwable th) {
                        ajbVar = new ajb(th);
                    }
                    x51Var.resumeWith(ajbVar);
                    break;
                }
                return c1eVar;
            case 2:
                ((jyb) obj).d(ixb.a, new hxb(ai5.Cursor, this.b, gxb.Middle, true));
                return c1eVar;
            case 3:
                return Long.valueOf(j);
            case 4:
                ((b78) obj).c(dj5.b, Long.valueOf(j));
                return null;
            case 5:
                zl3 zl3Var = (zl3) obj;
                zl3Var.getClass();
                long jF = zl3Var.f();
                float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jF >> 32));
                ho2.n(zl3Var, this.b, (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L), (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) << 32) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (jF & 4294967295L)))) & 4294967295L), zl3Var.Z(1.0f), 0, 496);
                return c1eVar;
            case 6:
                zl3 zl3Var2 = (zl3) obj;
                zl3Var2.getClass();
                long jF2 = zl3Var2.f();
                float fIntBitsToFloat3 = Float.intBitsToFloat((int) (jF2 & 4294967295L));
                ho2.n(zl3Var2, this.b, (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat3)) & 4294967295L), (4294967295L & ((long) Float.floatToRawIntBits(fIntBitsToFloat3))) | (Float.floatToRawIntBits(Float.intBitsToFloat((int) (jF2 >> 32))) << 32), zl3Var2.Z(1.0f), 0, 496);
                return c1eVar;
            case 7:
                zl3 zl3Var3 = (zl3) obj;
                zl3Var3.getClass();
                ho2.r(zl3Var3, this.b, 0L, 0L, 0.0f, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                return c1eVar;
            case 8:
                zl3 zl3Var4 = (zl3) obj;
                zl3Var4.getClass();
                ho2.r(zl3Var4, this.b, 0L, 0L, 0.0f, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                return c1eVar;
            default:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnb gnbVarB0 = anbVar.B0("SELECT * FROM workspec WHERE last_enqueue_time >= ? AND state IN (2, 3, 5) ORDER BY last_enqueue_time DESC");
                try {
                    gnbVarB0.c(1, j);
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
                        ArrayList arrayList2 = arrayList;
                        int i4 = iY14;
                        j7f j7fVarH = en7.H((int) gnbVarB0.getLong(iY2));
                        String strD02 = gnbVarB0.d0(iY3);
                        String strD03 = gnbVarB0.d0(iY4);
                        byte[] blob = gnbVarB0.getBlob(iY5);
                        dt2 dt2Var = dt2.b;
                        dt2 dt2VarM0 = ht2.m0(blob);
                        dt2 dt2VarM02 = ht2.m0(gnbVarB0.getBlob(iY6));
                        long j2 = gnbVarB0.getLong(iY7);
                        long j3 = gnbVarB0.getLong(iY8);
                        long j4 = gnbVarB0.getLong(iY9);
                        int i5 = (int) gnbVarB0.getLong(iY10);
                        int i6 = iY;
                        int i7 = iY2;
                        tm0 tm0VarE = en7.E((int) gnbVarB0.getLong(iY11));
                        long j5 = gnbVarB0.getLong(iY12);
                        long j6 = gnbVarB0.getLong(iY13);
                        long j7 = gnbVarB0.getLong(i4);
                        int i8 = iY15;
                        long j8 = gnbVarB0.getLong(i8);
                        int i9 = iY13;
                        int i10 = iY16;
                        boolean z = ((int) gnbVarB0.getLong(i10)) != 0;
                        int i11 = iY17;
                        int i12 = iY3;
                        lw8 lw8VarG = en7.G((int) gnbVarB0.getLong(i11));
                        int i13 = iY18;
                        int i14 = iY4;
                        int i15 = (int) gnbVarB0.getLong(i13);
                        int i16 = iY19;
                        int i17 = (int) gnbVarB0.getLong(i16);
                        int i18 = iY20;
                        long j9 = gnbVarB0.getLong(i18);
                        int i19 = iY21;
                        int i20 = (int) gnbVarB0.getLong(i19);
                        int i21 = iY22;
                        int i22 = (int) gnbVarB0.getLong(i21);
                        int i23 = iY23;
                        String strD04 = gnbVarB0.isNull(i23) ? null : gnbVarB0.d0(i23);
                        int i24 = iY24;
                        if (gnbVarB0.isNull(i24)) {
                            i = i20;
                            i2 = i21;
                            numValueOf = null;
                        } else {
                            i = i20;
                            i2 = i21;
                            numValueOf = Integer.valueOf((int) gnbVarB0.getLong(i24));
                        }
                        Boolean boolValueOf = numValueOf != null ? Boolean.valueOf(numValueOf.intValue() != 0) : null;
                        int i25 = iY25;
                        te8 te8VarF = en7.F((int) gnbVarB0.getLong(i25));
                        int i26 = iY26;
                        le8 le8VarT = en7.T(gnbVarB0.getBlob(i26));
                        iY25 = i25;
                        iY26 = i26;
                        int i27 = iY27;
                        boolean z2 = ((int) gnbVarB0.getLong(i27)) != 0;
                        iY27 = i27;
                        int i28 = iY28;
                        boolean z3 = ((int) gnbVarB0.getLong(i28)) != 0;
                        int i29 = iY29;
                        boolean z4 = ((int) gnbVarB0.getLong(i29)) != 0;
                        iY29 = i29;
                        int i30 = iY30;
                        int i31 = iY31;
                        int i32 = iY32;
                        int i33 = iY33;
                        iY33 = i33;
                        arrayList2.add(new c8f(strD0, j7fVarH, strD02, strD03, dt2VarM0, dt2VarM02, j2, j3, j4, new e72(le8VarT, te8VarF, z2, z3, z4, ((int) gnbVarB0.getLong(i30)) != 0, gnbVarB0.getLong(i31), gnbVarB0.getLong(i32), en7.l(gnbVarB0.getBlob(i33))), i5, tm0VarE, j5, j6, j7, j8, z, lw8VarG, i15, i17, j9, i, i22, strD04, boolValueOf));
                        iY30 = i30;
                        iY3 = i12;
                        iY17 = i11;
                        iY19 = i16;
                        iY22 = i2;
                        iY24 = i24;
                        arrayList = arrayList2;
                        iY31 = i31;
                        iY32 = i32;
                        iY = i6;
                        iY14 = i4;
                        iY2 = i7;
                        iY13 = i9;
                        iY15 = i8;
                        iY16 = i10;
                        iY20 = i18;
                        iY21 = i19;
                        iY23 = i23;
                        iY28 = i28;
                        iY4 = i14;
                        iY18 = i13;
                        break;
                    }
                    ArrayList arrayList3 = arrayList;
                    gnbVarB0.close();
                    return arrayList3;
                } catch (Throwable th2) {
                    gnbVarB0.close();
                    throw th2;
                }
        }
    }
}
