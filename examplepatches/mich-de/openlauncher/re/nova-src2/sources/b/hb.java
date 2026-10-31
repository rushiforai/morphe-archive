package b;

import ads_mobile_sdk.au;
import ads_mobile_sdk.ut3;
import ads_mobile_sdk.vu3;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes2.dex */
public final class hb implements ai.s, androidx.datastore.preferences.protobuf.g, m7.d {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ hb f15864b = new hb(2);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ hb f15865c = new hb(3);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ hb f15866d = new hb(4);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ hb f15867e = new hb(5);

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ hb f15868f = new hb(6);

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ hb f15869g = new hb(7);

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ hb f15870h = new hb(8);

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ hb f15871i = new hb(9);

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ hb f15872j = new hb(10);

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ hb f15873k = new hb(11);

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ hb f15874l = new hb(12);

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ hb f15875m = new hb(13);
    public static final /* synthetic */ hb n = new hb(14);
    public static final /* synthetic */ hb o = new hb(15);

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ hb f15876p = new hb(16);

    /* renamed from: q, reason: collision with root package name */
    public static final /* synthetic */ hb f15877q = new hb(17);

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ hb f15878r = new hb(18);

    /* renamed from: s, reason: collision with root package name */
    public static final /* synthetic */ hb f15879s = new hb(19);

    /* renamed from: t, reason: collision with root package name */
    public static final /* synthetic */ hb f15880t = new hb(20);

    /* renamed from: u, reason: collision with root package name */
    public static final /* synthetic */ hb f15881u = new hb(21);

    /* renamed from: v, reason: collision with root package name */
    public static final /* synthetic */ hb f15882v = new hb(22);

    /* renamed from: w, reason: collision with root package name */
    public static final /* synthetic */ hb f15883w = new hb(23);

    /* renamed from: x, reason: collision with root package name */
    public static final /* synthetic */ hb f15884x = new hb(24);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15885a;

    public /* synthetic */ hb(int i5) {
        this.f15885a = i5;
    }

    public static ads_mobile_sdk.v1 b(int i5) {
        ads_mobile_sdk.v1 v1Var = (ads_mobile_sdk.v1) ads_mobile_sdk.v1.f10542c.get(Integer.valueOf(i5));
        if (v1Var != null) {
            return v1Var;
        }
        throw new Exception("Invalid value for enum " + hb.class.getName() + ": " + i5);
    }

    public static vu3 c(long j11) {
        return vu3.a((d7) new ut3(j11));
    }

    public static void d(long j11, au auVar, boolean z11) throws IOException {
        long[] jArr = {2000490107, 1476547902, 1834034217, 268849430, 1839467528, 4368198174L, 449620248, 1652701270, 1629190168};
        long j12 = jArr[0];
        long j13 = jArr[1];
        long j14 = jArr[2];
        long j15 = jArr[3];
        long j16 = jArr[4];
        long j17 = ((((((~j12) & j13) | j14) + ((j12 & j15) | j16)) - jArr[5]) + jArr[6]) ^ (jArr[7] % jArr[8]);
        int iC = k9.c(1027101999, 1121861623, 2097482120, 23637094) ^ 75118620;
        long j18 = z11 ? (j11 + j11) ^ (j11 >> 63) : j11;
        int i5 = 1;
        while (true) {
            long j19 = j18 & j17;
            j18 >>>= 7;
            boolean z12 = j18 != 0 || i5 < 0;
            int i11 = (int) j19;
            if (z12) {
                i11 = ((i11 | 128) << iC) >> iC;
            }
            ((ByteArrayOutputStream) auVar.f1092a).write((byte) i11);
            if (!z12) {
                return;
            } else {
                i5++;
            }
        }
    }

    @Override // androidx.datastore.preferences.protobuf.g
    public byte[] a(int i5, int i11, byte[] bArr) {
        return Arrays.copyOfRange(bArr, i5, i11 + i5);
    }

    @Override // ai.s
    public Object zza() {
        switch (this.f15885a) {
            case 2:
                return new Boolean(((Boolean) com.google.android.gms.internal.measurement.w3.f33180a.get()).booleanValue());
            case 3:
                List list = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (String) com.google.android.gms.internal.measurement.m3.f32813a.h(14, "measurement.edpb.events_cached_in_no_data_mode", "_f,_v,_cmp").get();
            case 4:
                List list2 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(72, 50000L, "measurement.upload.max_public_events_per_day").get()).longValue());
            case 5:
                List list3 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (String) com.google.android.gms.internal.measurement.m3.f32813a.h(16, "measurement.sgtm.google_signal.url", "https://app-measurement.com/s/d").get();
            case 6:
                List list4 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(52, 21600000L, "measurement.sgtm.upload.retry_max_wait").get();
            case 7:
                List list5 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(46, 5L, "measurement.sgtm.upload.batches_retrieval_limit").get()).longValue());
            case 8:
                List list6 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(5, 86400000L, "measurement.config.cache_time").get();
            case 9:
                List list7 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(9, 1000L, "measurement.upload.debug_upload_interval").get();
            case 10:
                List list8 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(64, 15000L, "measurement.upload.initial_upload_delay_time").get();
            case 11:
                List list9 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(15, 605000L, "measurement.upload.google_signal_max_queue_time").get();
            case 12:
                List list10 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.w4.f33181b.get();
                return (Boolean) com.google.android.gms.internal.measurement.y4.f33247a.b(0, "measurement.test.boolean_flag", false).get();
            case 13:
                List list11 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.w4.f33181b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.y4.f33247a.f(3, -2L, "measurement.test.int_flag").get()).longValue());
            case 14:
                List list12 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(3, 100L, "measurement.max_bundles_per_iteration").get()).longValue());
            case 15:
                List list13 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(18, 1L, "measurement.dma_consent.max_daily_dcu_realtime_events").get()).longValue());
            case 16:
                List list14 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (String) com.google.android.gms.internal.measurement.m3.f32813a.h(32, "measurement.rb.attribution.app_allowlist", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).get();
            case 17:
                List list15 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Long) com.google.android.gms.internal.measurement.m3.f32813a.f(57, 864000000L, "measurement.rb.attribution.max_queue_time").get();
            case 18:
                List list16 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return (Boolean) com.google.android.gms.internal.measurement.m3.f32813a.b(2, "measurement.config.bundle_for_all_apps_on_backgrounded", true).get();
            case 19:
                List list17 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.k3.f32726b.get();
                return Integer.valueOf((int) ((Long) com.google.android.gms.internal.measurement.m3.f32813a.f(66, 65536L, "measurement.upload.max_bundle_size").get()).longValue());
            case 20:
                List list18 = ai.x.f13400a;
                return (Boolean) com.google.android.gms.internal.measurement.x5.f33219a.get();
            case 21:
                List list19 = ai.x.f13400a;
                return (Boolean) com.google.android.gms.internal.measurement.n5.f32844a.get();
            case 22:
                List list20 = ai.x.f13400a;
                com.google.android.gms.internal.measurement.z4.f33288b.get();
                return (Boolean) com.google.android.gms.internal.measurement.b5.f32403a.b(8, "measurement.rb.attribution.uuid_generation", true).get();
            case 23:
                List list21 = ai.x.f13400a;
                return (Boolean) com.google.android.gms.internal.measurement.h5.f32603b.get();
            default:
                return new Boolean(((Boolean) com.google.android.gms.internal.measurement.o4.f32870b.get()).booleanValue());
        }
    }
}
