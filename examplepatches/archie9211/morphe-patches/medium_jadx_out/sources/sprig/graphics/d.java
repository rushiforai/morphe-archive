package sprig.graphics;

import android.app.Activity;
import android.content.ComponentCallbacks2;
import com.userleap.EventName;
import com.userleap.SprigEvent;
import com.userleap.internal.data.ReplayRequest;
import com.userleap.internal.sessions.util.UploadWorker;
import defpackage.b55;
import defpackage.br7;
import defpackage.c1e;
import defpackage.co6;
import defpackage.ct2;
import defpackage.f09;
import defpackage.ff7;
import defpackage.g76;
import defpackage.iy6;
import defpackage.j55;
import defpackage.j7f;
import defpackage.k55;
import defpackage.k7f;
import defpackage.kn8;
import defpackage.m7f;
import defpackage.n92;
import defpackage.p4d;
import defpackage.qd5;
import defpackage.r13;
import defpackage.sb2;
import defpackage.tm0;
import defpackage.uv2;
import defpackage.vt8;
import defpackage.vx0;
import defpackage.wt8;
import defpackage.x45;
import defpackage.xg3;
import defpackage.ygf;
import java.io.File;
import java.net.URL;
import java.util.concurrent.TimeUnit;
import kotlin.Metadata;
import sprig.g.c;
import sprig.graphics.l;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J#\u0010\n\u001a\u00020\b2\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\b0\u0006H\u0016¢\u0006\u0004\b\n\u0010\u000bR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\f\u0010\r\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lsprig/f/d;", "Lsprig/d/d;", "Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "<init>", "(Lcom/userleap/internal/data/ReplayRequest;)V", "Lkotlin/Function1;", "Lsprig/g/c;", "Lc1e;", "completionHandler", "upload", "(Lx45;)V", "a", "Lcom/userleap/internal/data/ReplayRequest;", "getReplayRequest", "()Lcom/userleap/internal/data/ReplayRequest;", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class d implements sprig.view.d {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final ReplayRequest replayRequest;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class a implements kn8, k55 {
        public final /* synthetic */ x45 a;

        public a(x45 x45Var) {
            x45Var.getClass();
            this.a = x45Var;
        }

        public final boolean equals(Object obj) {
            if ((obj instanceof kn8) && (obj instanceof k55)) {
                return g76.L(getFunctionDelegate(), ((k55) obj).getFunctionDelegate());
            }
            return false;
        }

        @Override // defpackage.k55
        public final j55 getFunctionDelegate() {
            return this.a;
        }

        public final int hashCode() {
            return getFunctionDelegate().hashCode();
        }

        @Override // defpackage.kn8
        public final /* synthetic */ void onChanged(Object obj) {
            this.a.invoke(obj);
        }
    }

    public d(ReplayRequest replayRequest) {
        replayRequest.getClass();
        this.replayRequest = replayRequest;
    }

    @Override // sprig.view.d
    public ReplayRequest getReplayRequest() {
        return this.replayRequest;
    }

    @Override // sprig.view.d
    public void upload(x45 completionHandler) {
        URL sessionRecordingFileUrl;
        completionHandler.getClass();
        Activity currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
        if (currentActivity == null || (sessionRecordingFileUrl = getReplayRequest().getSessionRecordingFileUrl()) == null) {
            return;
        }
        String absolutePath = new File(sessionRecordingFileUrl.toURI()).getAbsolutePath();
        l.INSTANCE.get$userleap_release().queueSessionForUploading(getReplayRequest());
        vt8 vt8Var = new vt8(UploadWorker.class);
        f09[] f09VarArr = {new f09(UploadWorker.KEY_GENERATE_URL_PAYLOAD, getReplayRequest().getGenerateVideoUploadUrlPayloadAsJsonString()), new f09(UploadWorker.KEY_FILE, absolutePath), new f09("directory", new File(absolutePath).getParent())};
        ct2 ct2Var = new ct2(0, false);
        for (int i = 0; i < 3; i++) {
            f09 f09Var = f09VarArr[i];
            ct2Var.d((String) f09Var.a, f09Var.b);
        }
        vt8Var.c.e = ct2Var.a();
        wt8 wt8Var = (wt8) ((vt8) vt8Var.d(tm0.EXPONENTIAL, TimeUnit.MINUTES)).a();
        m7f m7fVarF = m7f.f(currentActivity);
        m7fVarF.getClass();
        m7fVarF.c(wt8Var);
        r13 r13Var = xg3.a;
        vx0.c0(qd5.a, ff7.a, null, new b(currentActivity, wt8Var, completionHandler, this, sessionRecordingFileUrl, null), 2);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotSessionUploader$upload$1$1", f = "ScreenshotSessionUploader.kt", l = {}, m = "invokeSuspend")
    public static final class b extends p4d implements b55 {
        final /* synthetic */ x45 $completionHandler;
        final /* synthetic */ Activity $context;
        final /* synthetic */ wt8 $upload;
        final /* synthetic */ URL $url;
        int label;
        final /* synthetic */ d this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(Activity activity, wt8 wt8Var, x45 x45Var, d dVar, URL url, n92<? super b> n92Var) {
            super(2, n92Var);
            this.$context = activity;
            this.$upload = wt8Var;
            this.$completionHandler = x45Var;
            this.this$0 = dVar;
            this.$url = url;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return new b(this.$context, this.$upload, this.$completionHandler, this.this$0, this.$url, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((b) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            ComponentCallbacks2 currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
            if (currentActivity instanceof iy6) {
                Activity activity = this.$context;
                activity.getClass();
                m7f m7fVarF = m7f.f(activity);
                m7fVarF.getClass();
                m7fVarF.g(this.$upload.a).d((iy6) currentActivity, new a(new a(this.this$0, this.$completionHandler, this.$url)));
            } else {
                this.$completionHandler.invoke(new c.a(new IllegalStateException("Current activity is not a LifecycleOwner")));
            }
            return c1e.a;
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0006\u001a\u00020\u00032\u000e\u0010\u0002\u001a\n \u0001*\u0004\u0018\u00010\u00000\u0000H\n¢\u0006\u0004\b\u0004\u0010\u0005"}, d2 = {"Lk7f;", "kotlin.jvm.PlatformType", "it", "Lc1e;", "invoke", "(Lk7f;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
        public static final class a extends co6 implements x45 {
            final /* synthetic */ x45 $completionHandler;
            final /* synthetic */ URL $url;
            final /* synthetic */ d this$0;

            /* JADX INFO: renamed from: sprig.f.d$b$a$a, reason: collision with other inner class name */
            /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
            @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
            public /* synthetic */ class C0020a {
                public static final /* synthetic */ int[] $EnumSwitchMapping$0;

                static {
                    int[] iArr = new int[j7f.values().length];
                    try {
                        iArr[j7f.SUCCEEDED.ordinal()] = 1;
                    } catch (NoSuchFieldError unused) {
                    }
                    try {
                        iArr[j7f.FAILED.ordinal()] = 2;
                    } catch (NoSuchFieldError unused2) {
                    }
                    $EnumSwitchMapping$0 = iArr;
                }
            }

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(d dVar, x45 x45Var, URL url) {
                super(1);
                this.this$0 = dVar;
                this.$completionHandler = x45Var;
                this.$url = url;
            }

            public final void invoke(k7f k7fVar) {
                int i = C0020a.$EnumSwitchMapping$0[k7fVar.b.ordinal()];
                if (i == 1) {
                    l.INSTANCE.get$userleap_release().removeSessionFromUploadQueue(this.this$0.getReplayRequest());
                    sprig.b.b.INSTANCE.onEvent(new SprigEvent(EventName.REPLAY_UPLOAD_COMPLETED, null));
                    this.$completionHandler.invoke(new c.b(this.$url));
                } else {
                    if (i != 2) {
                        return;
                    }
                    l.INSTANCE.get$userleap_release().removeSessionFromUploadQueue(this.this$0.getReplayRequest());
                    this.$completionHandler.invoke(new c.a(new Exception("Upload failed")));
                }
            }

            @Override // defpackage.x45
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((k7f) obj);
                return c1e.a;
            }
        }
    }
}
