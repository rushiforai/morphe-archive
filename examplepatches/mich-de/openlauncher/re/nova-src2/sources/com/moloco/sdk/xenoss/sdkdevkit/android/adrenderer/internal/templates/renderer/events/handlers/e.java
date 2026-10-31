package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.handlers;

import b.c0;
import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class e {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f39638d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f39639e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f39640f = "CompositeEventHandler";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Set<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a> f39641a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f39642b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Lazy f39643c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public e(@NotNull Set<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a> eventHandlers, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(eventHandlers, "eventHandlers");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f39641a = eventHandlers;
        this.f39642b = metricsRecorder;
        this.f39643c = LazyKt.a(new as.c(this, 24));
    }

    public final Map<String, List<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a>> a() {
        return (Map) this.f39643c.getValue();
    }

    public static final Map a(e eVar) {
        Set<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a> set = eVar.f39641a;
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = set.iterator();
        while (it.hasNext()) {
            b70.d.z0(((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a) it.next()).a(), arrayList);
        }
        int iD0 = b70.k.d0(b70.c.u0(arrayList, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            String str = (String) next;
            Set<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a> set2 = eVar.f39641a;
            ArrayList arrayList2 = new ArrayList();
            for (Object obj : set2) {
                if (((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a) obj).a().contains(str)) {
                    arrayList2.add(obj);
                }
            }
            linkedHashMap.put(next, arrayList2);
        }
        return linkedHashMap;
    }

    public final void a(@NotNull String event) throws JSONException {
        TimerEvent timerEvent;
        String str;
        TimerEvent timerEvent2;
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a aVar;
        TimerEvent timerEvent3;
        MetricsRecorder metricsRecorder;
        String strC;
        Intrinsics.g(event, "event");
        TimerEvent timerEventStartTimerEvent = this.f39642b.startTimerEvent(com.moloco.sdk.internal.client_metrics_data.e.f36321s.c());
        JSONObject jSONObject = new JSONObject(event);
        String string = jSONObject.getString(DatabaseConstants.EVENT_FIELD);
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        MolocoLogger.debug$default(molocoLogger, f39640f, c0.k("Event received: ", string), false, 4, null);
        List<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a> list = a().get(string);
        if (list != null && !list.isEmpty()) {
            if (list.size() > 1) {
                timerEvent = timerEventStartTimerEvent;
                str = "failure";
                MolocoLogger.warn$default(molocoLogger, f39640f, c0.l("Found multiple event handlers for event: ", string, ", using first one"), null, false, 12, null);
                MetricsRecorder metricsRecorder2 = this.f39642b;
                CountEvent countEventWithTag = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.L.c()).withTag(com.moloco.sdk.internal.client_metrics_data.d.f36296d.c(), str);
                Intrinsics.d(string);
                metricsRecorder2.recordCountEvent(countEventWithTag.withTag(DatabaseConstants.EVENT_FIELD, string));
            } else {
                timerEvent = timerEventStartTimerEvent;
                str = "failure";
            }
            TimerEvent timerEventStartTimerEvent2 = this.f39642b.startTimerEvent(com.moloco.sdk.internal.client_metrics_data.e.f36322t.c());
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a aVar2 = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a) b70.g.W0(list);
            try {
                aVar2.a(jSONObject);
                timerEvent2 = timerEventStartTimerEvent2;
            } catch (Exception e3) {
                e = e3;
                timerEvent2 = timerEventStartTimerEvent2;
            }
            try {
                aVar = aVar2;
            } catch (Exception e11) {
                e = e11;
                aVar = aVar2;
                timerEvent3 = timerEvent;
                Exception exc = e;
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, f39640f, c0.k("Event handling failed: ", string), exc, false, 8, null);
                MetricsRecorder metricsRecorder3 = this.f39642b;
                Intrinsics.d(string);
                TimerEvent timerEventWithTag = timerEvent2.withTag(DatabaseConstants.EVENT_FIELD, string).withTag("handler", aVar.b());
                com.moloco.sdk.internal.client_metrics_data.d dVar = com.moloco.sdk.internal.client_metrics_data.d.f36294b;
                TimerEvent timerEventWithTag2 = timerEventWithTag.withTag(dVar.c(), exc.getClass().getSimpleName());
                com.moloco.sdk.internal.client_metrics_data.d dVar2 = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
                metricsRecorder3.recordTimerEvent(timerEventWithTag2.withTag(dVar2.c(), str));
                this.f39642b.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.K.c()).withTag(dVar2.c(), str).withTag(dVar.c(), exc.getClass().getSimpleName()).withTag("handler", aVar.b()).withTag(DatabaseConstants.EVENT_FIELD, string));
                this.f39642b.recordTimerEvent(timerEvent3.withTag(dVar2.c(), str).withTag(dVar.c(), exc.getClass().getSimpleName()).withTag("handler", aVar.b()).withTag(DatabaseConstants.EVENT_FIELD, string));
                return;
            }
            try {
                MolocoLogger.info$default(molocoLogger, f39640f, "Event handled: " + string, null, false, 12, null);
                MetricsRecorder metricsRecorder4 = this.f39642b;
                Intrinsics.d(string);
                TimerEvent timerEventWithTag3 = timerEvent2.withTag(DatabaseConstants.EVENT_FIELD, string).withTag("handler", aVar.b());
                com.moloco.sdk.internal.client_metrics_data.d dVar3 = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
                metricsRecorder4.recordTimerEvent(timerEventWithTag3.withTag(dVar3.c(), "success"));
                this.f39642b.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.K.c()).withTag(dVar3.c(), "success").withTag("handler", aVar.b()).withTag(DatabaseConstants.EVENT_FIELD, string));
                metricsRecorder = this.f39642b;
                strC = dVar3.c();
                timerEvent3 = timerEvent;
            } catch (Exception e12) {
                e = e12;
                timerEvent3 = timerEvent;
                Exception exc2 = e;
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, f39640f, c0.k("Event handling failed: ", string), exc2, false, 8, null);
                MetricsRecorder metricsRecorder32 = this.f39642b;
                Intrinsics.d(string);
                TimerEvent timerEventWithTag4 = timerEvent2.withTag(DatabaseConstants.EVENT_FIELD, string).withTag("handler", aVar.b());
                com.moloco.sdk.internal.client_metrics_data.d dVar4 = com.moloco.sdk.internal.client_metrics_data.d.f36294b;
                TimerEvent timerEventWithTag22 = timerEventWithTag4.withTag(dVar4.c(), exc2.getClass().getSimpleName());
                com.moloco.sdk.internal.client_metrics_data.d dVar22 = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
                metricsRecorder32.recordTimerEvent(timerEventWithTag22.withTag(dVar22.c(), str));
                this.f39642b.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.K.c()).withTag(dVar22.c(), str).withTag(dVar4.c(), exc2.getClass().getSimpleName()).withTag("handler", aVar.b()).withTag(DatabaseConstants.EVENT_FIELD, string));
                this.f39642b.recordTimerEvent(timerEvent3.withTag(dVar22.c(), str).withTag(dVar4.c(), exc2.getClass().getSimpleName()).withTag("handler", aVar.b()).withTag(DatabaseConstants.EVENT_FIELD, string));
                return;
            }
            try {
                metricsRecorder.recordTimerEvent(timerEvent3.withTag(strC, "success").withTag("handler", aVar.b()).withTag(DatabaseConstants.EVENT_FIELD, string));
                return;
            } catch (Exception e13) {
                e = e13;
                Exception exc22 = e;
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, f39640f, c0.k("Event handling failed: ", string), exc22, false, 8, null);
                MetricsRecorder metricsRecorder322 = this.f39642b;
                Intrinsics.d(string);
                TimerEvent timerEventWithTag42 = timerEvent2.withTag(DatabaseConstants.EVENT_FIELD, string).withTag("handler", aVar.b());
                com.moloco.sdk.internal.client_metrics_data.d dVar42 = com.moloco.sdk.internal.client_metrics_data.d.f36294b;
                TimerEvent timerEventWithTag222 = timerEventWithTag42.withTag(dVar42.c(), exc22.getClass().getSimpleName());
                com.moloco.sdk.internal.client_metrics_data.d dVar222 = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
                metricsRecorder322.recordTimerEvent(timerEventWithTag222.withTag(dVar222.c(), str));
                this.f39642b.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.K.c()).withTag(dVar222.c(), str).withTag(dVar42.c(), exc22.getClass().getSimpleName()).withTag("handler", aVar.b()).withTag(DatabaseConstants.EVENT_FIELD, string));
                this.f39642b.recordTimerEvent(timerEvent3.withTag(dVar222.c(), str).withTag(dVar42.c(), exc22.getClass().getSimpleName()).withTag("handler", aVar.b()).withTag(DatabaseConstants.EVENT_FIELD, string));
                return;
            }
        }
        MolocoLogger.error$default(molocoLogger, f39640f, c0.k("Event not handled: ", string), null, false, 12, null);
        MetricsRecorder metricsRecorder5 = this.f39642b;
        CountEvent countEvent = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.K.c());
        com.moloco.sdk.internal.client_metrics_data.d dVar5 = com.moloco.sdk.internal.client_metrics_data.d.f36296d;
        CountEvent countEventWithTag2 = countEvent.withTag(dVar5.c(), "failure");
        com.moloco.sdk.internal.client_metrics_data.d dVar6 = com.moloco.sdk.internal.client_metrics_data.d.f36294b;
        CountEvent countEventWithTag3 = countEventWithTag2.withTag(dVar6.c(), "no_handler");
        Intrinsics.d(string);
        metricsRecorder5.recordCountEvent(countEventWithTag3.withTag(DatabaseConstants.EVENT_FIELD, string));
        this.f39642b.recordTimerEvent(timerEventStartTimerEvent.withTag(dVar5.c(), "failure").withTag(dVar6.c(), "no_handler").withTag(DatabaseConstants.EVENT_FIELD, string));
    }
}
