package sprig.graphics;

import android.app.Activity;
import android.view.Window;
import com.userleap.EventName;
import com.userleap.SprigEvent;
import com.userleap.internal.data.MobileReplaySettings;
import com.userleap.internal.data.ReplayRequest;
import com.userleap.internal.data.SdkConfig;
import defpackage.bu1;
import defpackage.c1e;
import defpackage.co6;
import defpackage.d46;
import defpackage.ny3;
import defpackage.x45;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import org.json.JSONObject;
import sprig.graphics.C0051c;
import sprig.graphics.EnumC0050b;
import sprig.graphics.j;
import sprig.graphics.m;
import sprig.view.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\u000b\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\tH\u0016¢\u0006\u0004\b\u000b\u0010\fR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0014\u001a\u00020\u00118\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u0012\u0010\u0013R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0016\u0010\u0017R\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u00158VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u001a¨\u0006\u001c"}, d2 = {"Lsprig/f/c;", "Lsprig/d/c;", "Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "<init>", "(Lcom/userleap/internal/data/ReplayRequest;)V", "Lc1e;", "record", "()V", "Lsprig/h/b;", "reason", "stopRecording", "(Lsprig/h/b;)V", "a", "Lcom/userleap/internal/data/ReplayRequest;", "getReplayRequest", "()Lcom/userleap/internal/data/ReplayRequest;", "", "b", "J", "REPLAY_WINDOW_EXTENSION_MS", "Lsprig/d/b;", "c", "Lsprig/d/b;", "_sessionRecorder", "getSessionRecorder", "()Lsprig/d/b;", "sessionRecorder", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class c implements sprig.view.c {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final ReplayRequest replayRequest;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final long REPLAY_WINDOW_EXTENSION_MS;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public b _sessionRecorder;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class a {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[EnumC0050b.values().length];
            try {
                iArr[EnumC0050b.RECORDING_COMPLETE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public c(ReplayRequest replayRequest) {
        replayRequest.getClass();
        this.replayRequest = replayRequest;
        this.REPLAY_WINDOW_EXTENSION_MS = 20000L;
    }

    @Override // sprig.view.c
    public ReplayRequest getReplayRequest() {
        return this.replayRequest;
    }

    @Override // sprig.view.c
    /* JADX INFO: renamed from: getSessionRecorder, reason: from getter */
    public b get_sessionRecorder() {
        return this._sessionRecorder;
    }

    @Override // sprig.view.c
    public void record() {
        Set<String> maskClasses;
        Activity currentActivity;
        Window.Callback callback;
        Window window;
        Boolean maskSecureText;
        SdkConfig sdkConfig = SdkConfig.INSTANCE.get$userleap_release();
        if (sdkConfig == null) {
            return;
        }
        MobileReplaySettings mobileReplaySettings = sdkConfig.getMobileReplaySettings();
        Integer maxMobileReplayDurationSeconds = sdkConfig.getMaxMobileReplayDurationSeconds();
        int iIntValue = maxMobileReplayDurationSeconds != null ? maxMobileReplayDurationSeconds.intValue() : 0;
        boolean zBooleanValue = (mobileReplaySettings == null || (maskSecureText = mobileReplaySettings.getMaskSecureText()) == null) ? false : maskSecureText.booleanValue();
        if (mobileReplaySettings == null || (maskClasses = mobileReplaySettings.getMaskClasses()) == null) {
            maskClasses = ny3.a;
        }
        long j = ((long) iIntValue) * 1000;
        if (iIntValue == 0 || (currentActivity = sprig.j.b.INSTANCE.getCurrentActivity()) == null) {
            return;
        }
        ArrayList arrayListT = d46.T(new C0051c(bu1.m1(maskClasses)));
        if (zBooleanValue) {
            arrayListT.add(new j());
        }
        this._sessionRecorder = sprig.e.c.INSTANCE.get$userleap_release().createRecorder(getReplayRequest());
        b bVar = get_sessionRecorder();
        if (bVar == null) {
            return;
        }
        bVar.setReplayWindowSize(j + this.REPLAY_WINDOW_EXTENSION_MS);
        bVar.startRecordingScreen();
        Window window2 = currentActivity.getWindow();
        if (window2 != null && (callback = window2.getCallback()) != null && (window = currentActivity.getWindow()) != null) {
            window.setCallback(new m(callback, new Point(bVar), new C0019c(bVar)));
        }
        bVar.waitForCompletion(new d());
    }

    @Override // sprig.view.c
    public void stopRecording(EnumC0050b reason) {
        reason.getClass();
        b bVar = get_sessionRecorder();
        if (bVar != null) {
            bVar.cancelRecording(reason);
        }
        this._sessionRecorder = null;
        EventName eventName = a.$EnumSwitchMapping$0[reason.ordinal()] == 1 ? EventName.REPLAY_CAPTURE_COMPLETED : EventName.REPLAY_CAPTURE_STOPPED;
        sprig.b.b bVar2 = sprig.b.b.INSTANCE;
        Map mapSingletonMap = Collections.singletonMap("reason", reason.name());
        mapSingletonMap.getClass();
        bVar2.onEvent(new SprigEvent(eventName, new JSONObject(mapSingletonMap)));
    }

    /* JADX INFO: renamed from: sprig.f.c$b, reason: from Kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Landroid/graphics/Point;", "touch", "Lc1e;", "invoke", "(Landroid/graphics/Point;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class Point extends co6 implements x45 {
        final /* synthetic */ b $recorder;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Point(b bVar) {
            super(1);
            this.$recorder = bVar;
        }

        public final void invoke(android.graphics.Point point) {
            point.getClass();
            this.$recorder.onTouch(point);
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) {
            invoke((android.graphics.Point) obj);
            return c1e.a;
        }
    }

    /* JADX INFO: renamed from: sprig.f.c$c, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lsprig/d/b$c;", "swipe", "Lc1e;", "invoke", "(Lsprig/d/b$c;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class C0019c extends co6 implements x45 {
        final /* synthetic */ b $recorder;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0019c(b bVar) {
            super(1);
            this.$recorder = bVar;
        }

        public final void invoke(b.c cVar) {
            cVar.getClass();
            this.$recorder.onSwipe(cVar);
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) {
            invoke((b.c) obj);
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lsprig/g/b;", "outcome", "Lc1e;", "invoke", "(Lsprig/g/b;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class d extends co6 implements x45 {
        public d() {
            super(1);
        }

        public final void invoke(sprig.g.b bVar) {
            bVar.getClass();
            sprig.view.a.INSTANCE.get$userleap_release().sessionRecordingHasEnded(c.this.getReplayRequest(), bVar);
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) {
            invoke((sprig.g.b) obj);
            return c1e.a;
        }
    }
}
