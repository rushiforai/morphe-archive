package io.sentry.hints;

import ads_mobile_sdk.wp;
import ads_mobile_sdk.zt3;
import ai.s;
import ai.x;
import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import b.n6;
import b.u6;
import b3.s2;
import com.google.android.gms.internal.measurement.b5;
import com.google.android.gms.internal.measurement.f4;
import com.google.android.gms.internal.measurement.k3;
import com.google.android.gms.internal.measurement.m3;
import com.google.android.gms.internal.measurement.o4;
import com.google.android.gms.internal.measurement.r4;
import com.google.android.gms.internal.measurement.t3;
import com.google.android.gms.internal.measurement.w4;
import com.google.android.gms.internal.measurement.y4;
import com.google.android.gms.internal.measurement.z4;
import java.io.OutputStream;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.m0;
import t70.y0;
import y70.o;

/* loaded from: classes4.dex */
public final class i implements s, n6, u6 {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ i f67276b = new i(1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ i f67277c = new i(2);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i f67278d = new i(3);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ i f67279e = new i(4);

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i f67280f = new i(5);

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ i f67281g = new i(6);

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ i f67282h = new i(7);

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ i f67283i = new i(8);

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ i f67284j = new i(9);

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ i f67285k = new i(10);

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ i f67286l = new i(11);

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ i f67287m = new i(12);
    public static final /* synthetic */ i n = new i(13);
    public static final /* synthetic */ i o = new i(14);

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ i f67288p = new i(15);

    /* renamed from: q, reason: collision with root package name */
    public static final /* synthetic */ i f67289q = new i(16);

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ i f67290r = new i(17);

    /* renamed from: s, reason: collision with root package name */
    public static final /* synthetic */ i f67291s = new i(18);

    /* renamed from: t, reason: collision with root package name */
    public static final /* synthetic */ i f67292t = new i(19);

    /* renamed from: u, reason: collision with root package name */
    public static final /* synthetic */ i f67293u = new i(20);

    /* renamed from: v, reason: collision with root package name */
    public static final /* synthetic */ i f67294v = new i(21);

    /* renamed from: w, reason: collision with root package name */
    public static final /* synthetic */ i f67295w = new i(22);

    /* renamed from: x, reason: collision with root package name */
    public static final /* synthetic */ i f67296x = new i(23);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67297a;

    public /* synthetic */ i(int i5) {
        this.f67297a = i5;
    }

    public static final int b(int i5, long j11) {
        int i11 = s2.f17340b;
        return ((int) (j11 >> (i5 * 15))) & 32767;
    }

    public static long d() {
        return s2.f17339a;
    }

    public static long e(int i5, int i11, int i12, int i13) {
        return ((i11 & 32767) << 15) | (i5 & 32767) | ((i12 & 32767) << 30) | ((i13 & 32767) << 45) | Long.MIN_VALUE;
    }

    @Override // b.n6
    public byte a(zt3 zt3Var, int i5) {
        return zt3Var.a(i5);
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0077, code lost:
    
        if (t70.m0.y(r11, r2, r0) != r1) goto L29;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object c(Context context, Uri uri, ContinuationImpl continuationImpl) throws Throwable {
        ay.c cVar;
        if (continuationImpl instanceof ay.c) {
            cVar = (ay.c) continuationImpl;
            int i5 = cVar.f15742w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f15742w = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new ay.c(this, continuationImpl);
            }
        }
        Object objY = cVar.f15740u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f15742w;
        Continuation continuation = null;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objY);
            ContentResolver contentResolver = context.getContentResolver();
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            ar.d dVar2 = new ar.d(contentResolver, uri, continuation, 13);
            cVar.f15739t = context;
            cVar.f15742w = 1;
            objY = m0.y(dVar, dVar2, cVar);
            if (objY != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
            return Unit.f71706a;
        }
        context = cVar.f15739t;
        ResultKt.b(objY);
        OutputStream outputStream = (OutputStream) objY;
        int i12 = 0;
        if (outputStream != null) {
            try {
                ay.i.d(context, outputStream);
            } catch (Exception e3) {
                mc0.d.f76206a.o(e3);
            }
            a80.e eVar2 = y0.f88884a;
            u70.d dVar3 = o.f96819a;
            ay.d dVar4 = new ay.d(z11, context, continuation, i12);
            cVar.f15739t = null;
            cVar.f15742w = 2;
        }
        z11 = false;
        a80.e eVar22 = y0.f88884a;
        u70.d dVar32 = o.f96819a;
        ay.d dVar42 = new ay.d(z11, context, continuation, i12);
        cVar.f15739t = null;
        cVar.f15742w = 2;
    }

    @Override // ai.s
    public Object zza() {
        switch (this.f67297a) {
            case 1:
                return new Boolean(((Boolean) t3.f33075b.get()).booleanValue());
            case 2:
                List list = x.f13400a;
                k3.f32726b.get();
                return (String) m3.f32813a.h(4, "measurement.gbraid_campaign.campaign_params_triggering_info_update", "gclid,gbraid,gad_campaignid").get();
            case 3:
                List list2 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(69, 1000L, "measurement.upload.max_error_events_per_day").get()).longValue());
            case 4:
                List list3 = x.f13400a;
                k3.f32726b.get();
                return (String) m3.f32813a.h(78, "measurement.upload.url", "https://app-measurement.com/a").get();
            case 5:
                List list4 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(29, 86400000L, "measurement.monitoring.sample_period_millis").get();
            case 6:
                List list5 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(47, 5000L, "measurement.sgtm.upload.max_queued_batches").get()).longValue());
            case 7:
                List list6 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(40, 240000L, "measurement.sgtm.batch.long_queuing_threshold").get();
            case 8:
                List list7 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(33, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, "measurement.upload.realtime_upload_interval").get();
            case 9:
                List list8 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(34, 604800000L, "measurement.upload.refresh_blacklisted_config_interval").get();
            case 10:
                List list9 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(73, 518400000L, "measurement.upload.max_queue_time").get();
            case 11:
                List list10 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(38, 1000L, "measurement.service_client.reconnect_millis").get();
            case 12:
                List list11 = x.f13400a;
                w4.f33181b.get();
                return (Long) y4.f33247a.f(1, -1L, "measurement.test.cached_long_flag").get();
            case 13:
                List list12 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(19, 500L, "measurement.upload.max_event_parameter_value_length").get()).longValue());
            case 14:
                List list13 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(26, 7L, "measurement.rb.attribution.client.min_ad_services_version").get()).longValue());
            case 15:
                List list14 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(12, 3600000L, "measurement.session.engagement_interval").get();
            case 16:
                List list15 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(75, 65536L, "measurement.upload.max_batch_size").get()).longValue());
            case 17:
                List list16 = x.f13400a;
                k3.f32726b.get();
                return Integer.valueOf((int) ((Long) m3.f32813a.f(24, 1000L, "measurement.rb.max_trigger_registrations_per_day").get()).longValue());
            case 18:
                List list17 = x.f13400a;
                k3.f32726b.get();
                return (Long) m3.f32813a.f(11, 3600000L, "45769094").get();
            case 19:
                List list18 = x.f13400a;
                return (Boolean) r4.f33026a.get();
            case 20:
                List list19 = x.f13400a;
                return (Boolean) f4.f32526b.get();
            case 21:
                List list20 = x.f13400a;
                z4.f33288b.get();
                return (Boolean) b5.f32403a.b(1, "measurement.rb.attribution.client2", true).get();
            case 22:
                List list21 = x.f13400a;
                z4.f33288b.get();
                return (Boolean) b5.f32403a.b(2, "measurement.rb.attribution.service.trigger_uris_high_priority", true).get();
            default:
                return new Boolean(((Boolean) o4.f32869a.get()).booleanValue());
        }
    }

    public /* synthetic */ i(boolean z11) {
        this.f67297a = 27;
    }

    @Override // b.u6
    public Object a(int i5) {
        wp wpVar = wp.UNKNOWN;
        wp wpVar2 = i5 != 0 ? i5 != 1 ? null : wp.COLLECTED_BIDDING_SIGNAL : wpVar;
        return wpVar2 == null ? wpVar : wpVar2;
    }

    @Override // b.n6
    public zt3 a(zt3 zt3Var, int i5, int i11) {
        byte[] bArr;
        if (i5 >= 0 && i5 <= i11) {
            byte[] bArr2 = zt3Var.f12665a;
            if (i11 <= bArr2.length) {
                if (i5 > i11 || i11 > bArr2.length) {
                    throw new IndexOutOfBoundsException();
                }
                int i12 = i11 - i5;
                if (i12 == 0) {
                    bArr = new byte[0];
                } else {
                    byte[] bArr3 = new byte[i12];
                    System.arraycopy(bArr2, i5, bArr3, 0, i12);
                    bArr = bArr3;
                }
                return new zt3(bArr);
            }
        }
        throw new IndexOutOfBoundsException();
    }

    @Override // b.n6
    public n6 a() {
        return new i(false);
    }
}
