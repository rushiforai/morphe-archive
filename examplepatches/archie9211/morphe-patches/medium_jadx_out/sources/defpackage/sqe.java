package defpackage;

import com.google.android.gms.analytics.wYI.ivbZv;
import java.util.ArrayList;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class sqe implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ sqe(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        String strValueOf;
        gnb gnbVarB0;
        int i;
        int i2;
        Integer numValueOf;
        Boolean boolValueOf;
        int i3;
        Integer numValueOf2;
        Boolean boolValueOf2;
        int i4 = this.a;
        c1e c1eVar = c1e.a;
        switch (i4) {
            case 0:
                return Integer.valueOf((int) ((zw) obj).a);
            case 1:
                return new zw(((vj3) obj).a);
            case 2:
                return new vj3(((zw) obj).a);
            case 3:
                xj3 xj3Var = (xj3) obj;
                return new ax(xj3.a(xj3Var.a), xj3.b(xj3Var.a));
            case 4:
                ax axVar = (ax) obj;
                return new xj3((((long) Float.floatToRawIntBits(axVar.a)) << 32) | (((long) Float.floatToRawIntBits(axVar.b)) & 4294967295L));
            case 5:
                dfc dfcVar = (dfc) obj;
                return new ax(Float.intBitsToFloat((int) (dfcVar.a >> 32)), Float.intBitsToFloat((int) (dfcVar.a & 4294967295L)));
            case 6:
                ax axVar2 = (ax) obj;
                return new dfc((((long) Float.floatToRawIntBits(axVar2.a)) << 32) | (((long) Float.floatToRawIntBits(axVar2.b)) & 4294967295L));
            case 7:
                ip8 ip8Var = (ip8) obj;
                return new ax(Float.intBitsToFloat((int) (ip8Var.a >> 32)), Float.intBitsToFloat((int) (ip8Var.a & 4294967295L)));
            case 8:
                ax axVar3 = (ax) obj;
                return new ip8((((long) Float.floatToRawIntBits(axVar3.a)) << 32) | (((long) Float.floatToRawIntBits(axVar3.b)) & 4294967295L));
            case 9:
                long j = ((k46) obj).a;
                return new ax((int) (j >> 32), (int) (j & 4294967295L));
            case 10:
                ax axVar4 = (ax) obj;
                return new k46((((long) Math.round(axVar4.a)) << 32) | (((long) Math.round(axVar4.b)) & 4294967295L));
            case 11:
                long j2 = ((s46) obj).a;
                return new ax((int) (j2 >> 32), (int) (j2 & 4294967295L));
            case 12:
                ax axVar5 = (ax) obj;
                int iRound = Math.round(axVar5.a);
                if (iRound < 0) {
                    iRound = 0;
                }
                int iRound2 = Math.round(axVar5.b);
                return new s46((((long) iRound) << 32) | (((long) (iRound2 >= 0 ? iRound2 : 0)) & 4294967295L));
            case 13:
                zwa zwaVar = (zwa) obj;
                return new cx(zwaVar.a, zwaVar.b, zwaVar.c, zwaVar.d);
            case 14:
                cx cxVar = (cx) obj;
                return new zwa(cxVar.a, cxVar.b, cxVar.c, cxVar.d);
            case 15:
                return Float.valueOf(((zw) obj).a);
            case 16:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            case 17:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
            case 18:
                return ((f5f) obj).g;
            case 19:
                return ((f5f) obj).f;
            case 20:
                return ((f5f) obj).c;
            case 21:
                return ((f5f) obj).e;
            case 22:
                m5f m5fVar = (m5f) obj;
                m5fVar.getClass();
                return m5fVar;
            case 23:
                String str = (String) obj;
                str.getClass();
                if (str.length() <= 0) {
                    return str;
                }
                StringBuilder sb = new StringBuilder();
                char cCharAt = str.charAt(0);
                if (Character.isLowerCase(cCharAt)) {
                    Locale locale = w5f.a;
                    locale.getClass();
                    strValueOf = kyd.j0(cCharAt, locale);
                } else {
                    strValueOf = String.valueOf(cCharAt);
                }
                sb.append((Object) strValueOf);
                sb.append(str.substring(1));
                return sb.toString();
            case 24:
                o52 o52Var = (o52) obj;
                o52Var.getClass();
                return o52Var.getClass().getSimpleName();
            case 25:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                try {
                    anbVar.B0("DELETE FROM WorkProgress").w0();
                    return c1eVar;
                } finally {
                }
            case 26:
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                gnbVarB0 = anbVar2.B0("SELECT * FROM workspec WHERE state=0 AND schedule_requested_at<>-1");
                try {
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
                        int i5 = iY14;
                        int i6 = iY13;
                        j7f j7fVarH = en7.H((int) gnbVarB0.getLong(iY2));
                        String strD02 = gnbVarB0.d0(iY3);
                        String strD03 = gnbVarB0.d0(iY4);
                        byte[] blob = gnbVarB0.getBlob(iY5);
                        dt2 dt2Var = dt2.b;
                        dt2 dt2VarM0 = ht2.m0(blob);
                        dt2 dt2VarM02 = ht2.m0(gnbVarB0.getBlob(iY6));
                        long j3 = gnbVarB0.getLong(iY7);
                        long j4 = gnbVarB0.getLong(iY8);
                        long j5 = gnbVarB0.getLong(iY9);
                        int i7 = (int) gnbVarB0.getLong(iY10);
                        int i8 = iY2;
                        int i9 = iY;
                        tm0 tm0VarE = en7.E((int) gnbVarB0.getLong(iY11));
                        long j6 = gnbVarB0.getLong(iY12);
                        long j7 = gnbVarB0.getLong(i6);
                        long j8 = gnbVarB0.getLong(i5);
                        int i10 = iY15;
                        long j9 = gnbVarB0.getLong(i10);
                        iY15 = i10;
                        int i11 = iY16;
                        int i12 = iY3;
                        boolean z = ((int) gnbVarB0.getLong(i11)) != 0;
                        int i13 = iY17;
                        lw8 lw8VarG = en7.G((int) gnbVarB0.getLong(i13));
                        iY17 = i13;
                        int i14 = iY18;
                        int i15 = (int) gnbVarB0.getLong(i14);
                        iY18 = i14;
                        int i16 = iY19;
                        int i17 = (int) gnbVarB0.getLong(i16);
                        int i18 = iY20;
                        long j10 = gnbVarB0.getLong(i18);
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
                        if (numValueOf != null) {
                            boolValueOf = Boolean.valueOf(numValueOf.intValue() != 0);
                        } else {
                            boolValueOf = null;
                        }
                        iY24 = i24;
                        int i25 = iY25;
                        te8 te8VarF = en7.F((int) gnbVarB0.getLong(i25));
                        int i26 = iY26;
                        le8 le8VarT = en7.T(gnbVarB0.getBlob(i26));
                        iY25 = i25;
                        int i27 = iY27;
                        boolean z2 = ((int) gnbVarB0.getLong(i27)) != 0;
                        iY27 = i27;
                        int i28 = iY28;
                        boolean z3 = ((int) gnbVarB0.getLong(i28)) != 0;
                        iY28 = i28;
                        int i29 = iY29;
                        boolean z4 = ((int) gnbVarB0.getLong(i29)) != 0;
                        iY29 = i29;
                        int i30 = iY30;
                        int i31 = iY31;
                        int i32 = iY32;
                        iY31 = i31;
                        int i33 = iY33;
                        iY33 = i33;
                        arrayList.add(new c8f(strD0, j7fVarH, strD02, strD03, dt2VarM0, dt2VarM02, j3, j4, j5, new e72(le8VarT, te8VarF, z2, z3, z4, ((int) gnbVarB0.getLong(i30)) != 0, gnbVarB0.getLong(i31), gnbVarB0.getLong(i32), en7.l(gnbVarB0.getBlob(i33))), i7, tm0VarE, j6, j7, j8, j9, z, lw8VarG, i15, i17, j10, i, i22, strD04, boolValueOf));
                        iY32 = i32;
                        iY30 = i30;
                        iY = i9;
                        iY13 = i6;
                        iY2 = i8;
                        iY3 = i12;
                        iY16 = i11;
                        iY19 = i16;
                        iY20 = i18;
                        iY21 = i19;
                        iY22 = i2;
                        iY23 = i23;
                        iY26 = i26;
                        iY14 = i5;
                        break;
                    }
                    return arrayList;
                } finally {
                }
            case 27:
                anb anbVar3 = (anb) obj;
                anbVar3.getClass();
                gnbVarB0 = anbVar3.B0("SELECT * FROM workspec WHERE state=1");
                try {
                    int iY34 = il7.y(gnbVarB0, "id");
                    int iY35 = il7.y(gnbVarB0, "state");
                    int iY36 = il7.y(gnbVarB0, "worker_class_name");
                    int iY37 = il7.y(gnbVarB0, "input_merger_class_name");
                    int iY38 = il7.y(gnbVarB0, "input");
                    int iY39 = il7.y(gnbVarB0, "output");
                    int iY40 = il7.y(gnbVarB0, "initial_delay");
                    int iY41 = il7.y(gnbVarB0, "interval_duration");
                    int iY42 = il7.y(gnbVarB0, "flex_duration");
                    int iY43 = il7.y(gnbVarB0, "run_attempt_count");
                    int iY44 = il7.y(gnbVarB0, "backoff_policy");
                    int iY45 = il7.y(gnbVarB0, "backoff_delay_duration");
                    int iY46 = il7.y(gnbVarB0, "last_enqueue_time");
                    int iY47 = il7.y(gnbVarB0, "minimum_retention_duration");
                    int iY48 = il7.y(gnbVarB0, "schedule_requested_at");
                    int iY49 = il7.y(gnbVarB0, "run_in_foreground");
                    int iY50 = il7.y(gnbVarB0, "out_of_quota_policy");
                    int iY51 = il7.y(gnbVarB0, "period_count");
                    int iY52 = il7.y(gnbVarB0, "generation");
                    int iY53 = il7.y(gnbVarB0, "next_schedule_time_override");
                    int iY54 = il7.y(gnbVarB0, "next_schedule_time_override_generation");
                    int iY55 = il7.y(gnbVarB0, "stop_reason");
                    int iY56 = il7.y(gnbVarB0, "trace_tag");
                    int iY57 = il7.y(gnbVarB0, "backoff_on_system_interruptions");
                    int iY58 = il7.y(gnbVarB0, "required_network_type");
                    int iY59 = il7.y(gnbVarB0, "required_network_request");
                    int iY60 = il7.y(gnbVarB0, "requires_charging");
                    int iY61 = il7.y(gnbVarB0, "requires_device_idle");
                    int iY62 = il7.y(gnbVarB0, "requires_battery_not_low");
                    int iY63 = il7.y(gnbVarB0, "requires_storage_not_low");
                    int iY64 = il7.y(gnbVarB0, "trigger_content_update_delay");
                    int iY65 = il7.y(gnbVarB0, "trigger_max_content_delay");
                    int iY66 = il7.y(gnbVarB0, "content_uri_triggers");
                    ArrayList arrayList2 = new ArrayList();
                    while (gnbVarB0.w0()) {
                        String strD05 = gnbVarB0.d0(iY34);
                        int i34 = iY47;
                        int i35 = iY46;
                        j7f j7fVarH2 = en7.H((int) gnbVarB0.getLong(iY35));
                        String strD06 = gnbVarB0.d0(iY36);
                        String strD07 = gnbVarB0.d0(iY37);
                        byte[] blob2 = gnbVarB0.getBlob(iY38);
                        dt2 dt2Var2 = dt2.b;
                        dt2 dt2VarM03 = ht2.m0(blob2);
                        dt2 dt2VarM04 = ht2.m0(gnbVarB0.getBlob(iY39));
                        long j11 = gnbVarB0.getLong(iY40);
                        long j12 = gnbVarB0.getLong(iY41);
                        long j13 = gnbVarB0.getLong(iY42);
                        int i36 = (int) gnbVarB0.getLong(iY43);
                        int i37 = iY35;
                        int i38 = iY34;
                        tm0 tm0VarE2 = en7.E((int) gnbVarB0.getLong(iY44));
                        long j14 = gnbVarB0.getLong(iY45);
                        long j15 = gnbVarB0.getLong(i35);
                        long j16 = gnbVarB0.getLong(i34);
                        int i39 = iY48;
                        long j17 = gnbVarB0.getLong(i39);
                        int i40 = iY36;
                        int i41 = iY49;
                        boolean z5 = ((int) gnbVarB0.getLong(i41)) != 0;
                        iY49 = i41;
                        int i42 = iY50;
                        lw8 lw8VarG2 = en7.G((int) gnbVarB0.getLong(i42));
                        iY50 = i42;
                        int i43 = iY51;
                        int i44 = (int) gnbVarB0.getLong(i43);
                        iY51 = i43;
                        int i45 = iY52;
                        int i46 = (int) gnbVarB0.getLong(i45);
                        long j18 = gnbVarB0.getLong(iY53);
                        int i47 = iY54;
                        int i48 = (int) gnbVarB0.getLong(i47);
                        iY52 = i45;
                        iY54 = i47;
                        int i49 = iY55;
                        int i50 = (int) gnbVarB0.getLong(i49);
                        int i51 = iY56;
                        String strD08 = gnbVarB0.isNull(i51) ? null : gnbVarB0.d0(i51);
                        int i52 = iY57;
                        if (gnbVarB0.isNull(i52)) {
                            i3 = i50;
                            iY56 = i51;
                            numValueOf2 = null;
                        } else {
                            i3 = i50;
                            iY56 = i51;
                            numValueOf2 = Integer.valueOf((int) gnbVarB0.getLong(i52));
                        }
                        if (numValueOf2 != null) {
                            boolValueOf2 = Boolean.valueOf(numValueOf2.intValue() != 0);
                        } else {
                            boolValueOf2 = null;
                        }
                        iY57 = i52;
                        iY55 = i49;
                        int i53 = iY58;
                        te8 te8VarF2 = en7.F((int) gnbVarB0.getLong(i53));
                        int i54 = iY59;
                        le8 le8VarT2 = en7.T(gnbVarB0.getBlob(i54));
                        iY58 = i53;
                        int i55 = iY60;
                        boolean z6 = ((int) gnbVarB0.getLong(i55)) != 0;
                        iY59 = i54;
                        iY60 = i55;
                        int i56 = iY61;
                        boolean z7 = ((int) gnbVarB0.getLong(i56)) != 0;
                        iY61 = i56;
                        int i57 = iY62;
                        boolean z8 = ((int) gnbVarB0.getLong(i57)) != 0;
                        int i58 = iY63;
                        int i59 = iY64;
                        int i60 = iY65;
                        iY62 = i57;
                        int i61 = iY66;
                        iY66 = i61;
                        arrayList2.add(new c8f(strD05, j7fVarH2, strD06, strD07, dt2VarM03, dt2VarM04, j11, j12, j13, new e72(le8VarT2, te8VarF2, z6, z7, z8, ((int) gnbVarB0.getLong(i58)) != 0, gnbVarB0.getLong(i59), gnbVarB0.getLong(i60), en7.l(gnbVarB0.getBlob(i61))), i36, tm0VarE2, j14, j15, j16, j17, z5, lw8VarG2, i44, i46, j18, i48, i3, strD08, boolValueOf2));
                        iY63 = i58;
                        iY64 = i59;
                        iY65 = i60;
                        iY47 = i34;
                        iY34 = i38;
                        iY35 = i37;
                        iY36 = i40;
                        iY48 = i39;
                        iY46 = i35;
                        break;
                    }
                    return arrayList2;
                } finally {
                }
            case 28:
                return a(obj);
            default:
                anb anbVar4 = (anb) obj;
                anbVar4.getClass();
                gnbVarB0 = anbVar4.B0("Select COUNT(*) FROM workspec WHERE LENGTH(content_uri_triggers)<>0 AND state NOT IN (2, 3, 5)");
                try {
                    int i62 = gnbVarB0.w0() ? (int) gnbVarB0.getLong(0) : 0;
                    gnbVarB0.close();
                    return Integer.valueOf(i62);
                } finally {
                }
        }
    }

    private final Object a(Object obj) throws Exception {
        int i;
        int i2;
        Integer numValueOf;
        anb anbVar = (anb) obj;
        anbVar.getClass();
        gnb gnbVarB0 = anbVar.B0("SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 AND LENGTH(content_uri_triggers)<>0 ORDER BY last_enqueue_time");
        try {
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
            int iY11 = il7.y(gnbVarB0, ivbZv.BLuqah);
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
                int i3 = iY14;
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
                int i4 = (int) gnbVarB0.getLong(iY10);
                int i5 = iY2;
                int i6 = iY3;
                tm0 tm0VarE = en7.E((int) gnbVarB0.getLong(iY11));
                long j4 = gnbVarB0.getLong(iY12);
                long j5 = gnbVarB0.getLong(iY13);
                long j6 = gnbVarB0.getLong(i3);
                int i7 = iY15;
                long j7 = gnbVarB0.getLong(i7);
                int i8 = iY;
                int i9 = iY16;
                boolean z = ((int) gnbVarB0.getLong(i9)) != 0;
                int i10 = iY17;
                int i11 = iY4;
                lw8 lw8VarG = en7.G((int) gnbVarB0.getLong(i10));
                int i12 = iY18;
                int i13 = iY5;
                int i14 = (int) gnbVarB0.getLong(i12);
                int i15 = iY19;
                int i16 = (int) gnbVarB0.getLong(i15);
                int i17 = iY20;
                long j8 = gnbVarB0.getLong(i17);
                int i18 = iY21;
                int i19 = (int) gnbVarB0.getLong(i18);
                int i20 = iY22;
                int i21 = (int) gnbVarB0.getLong(i20);
                int i22 = iY23;
                Boolean boolValueOf = null;
                String strD04 = gnbVarB0.isNull(i22) ? null : gnbVarB0.d0(i22);
                int i23 = iY24;
                if (gnbVarB0.isNull(i23)) {
                    i = i19;
                    i2 = i20;
                    numValueOf = null;
                } else {
                    i = i19;
                    i2 = i20;
                    numValueOf = Integer.valueOf((int) gnbVarB0.getLong(i23));
                }
                if (numValueOf != null) {
                    boolValueOf = Boolean.valueOf(numValueOf.intValue() != 0);
                }
                int i24 = iY25;
                Boolean bool = boolValueOf;
                te8 te8VarF = en7.F((int) gnbVarB0.getLong(i24));
                int i25 = iY26;
                le8 le8VarT = en7.T(gnbVarB0.getBlob(i25));
                iY25 = i24;
                iY26 = i25;
                int i26 = iY27;
                boolean z2 = ((int) gnbVarB0.getLong(i26)) != 0;
                iY27 = i26;
                int i27 = iY28;
                boolean z3 = ((int) gnbVarB0.getLong(i27)) != 0;
                int i28 = iY29;
                boolean z4 = ((int) gnbVarB0.getLong(i28)) != 0;
                iY29 = i28;
                int i29 = iY30;
                int i30 = iY31;
                int i31 = iY32;
                int i32 = iY33;
                iY33 = i32;
                arrayList2.add(new c8f(strD0, j7fVarH, strD02, strD03, dt2VarM0, dt2VarM02, j, j2, j3, new e72(le8VarT, te8VarF, z2, z3, z4, ((int) gnbVarB0.getLong(i29)) != 0, gnbVarB0.getLong(i30), gnbVarB0.getLong(i31), en7.l(gnbVarB0.getBlob(i32))), i4, tm0VarE, j4, j5, j6, j7, z, lw8VarG, i14, i16, j8, i, i21, strD04, bool));
                iY30 = i29;
                iY4 = i11;
                iY17 = i10;
                iY19 = i15;
                iY22 = i2;
                iY24 = i23;
                iY31 = i30;
                iY32 = i31;
                iY2 = i5;
                iY14 = i3;
                iY3 = i6;
                arrayList = arrayList2;
                iY = i8;
                iY15 = i7;
                iY16 = i9;
                iY20 = i17;
                iY21 = i18;
                iY23 = i22;
                iY28 = i27;
                iY5 = i13;
                iY18 = i12;
            }
            ArrayList arrayList3 = arrayList;
            gnbVarB0.close();
            return arrayList3;
        } catch (Throwable th) {
            gnbVarB0.close();
            throw th;
        }
    }
}
