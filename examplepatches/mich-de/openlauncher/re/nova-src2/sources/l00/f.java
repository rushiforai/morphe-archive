package l00;

import android.app.PendingIntent;
import android.content.Context;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72933a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ o f72934b;

    public /* synthetic */ f(o oVar, int i5) {
        this.f72933a = i5;
        this.f72934b = oVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws PendingIntent.CanceledException {
        MediaController.TransportControls transportControls;
        PlaybackState playbackState;
        MediaController.TransportControls transportControls2;
        MediaController.TransportControls transportControls3;
        switch (this.f72933a) {
            case 0:
                zz.g gVarM = this.f72934b.m();
                MediaController mediaControllerB = gVarM.b();
                if (mediaControllerB != null && (transportControls = mediaControllerB.getTransportControls()) != null) {
                    MediaController mediaController = gVarM.f98846e;
                    if (mediaController == null || (playbackState = mediaController.getPlaybackState()) == null || playbackState.getState() != 3) {
                        transportControls.play();
                    } else {
                        transportControls.pause();
                    }
                }
                return Unit.f71706a;
            case 1:
                p pVar = this.f72934b.f72971d;
                if (pVar == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                q00.l lVar = pVar.f72986f;
                if (pVar != null) {
                    lVar.setValue(Boolean.valueOf(!((Boolean) lVar.f83363b.getValue()).booleanValue()));
                    return Unit.f71706a;
                }
                Intrinsics.m("model");
                throw null;
            case 2:
                MediaController mediaControllerB2 = this.f72934b.m().b();
                if (mediaControllerB2 != null && (transportControls2 = mediaControllerB2.getTransportControls()) != null) {
                    transportControls2.skipToPrevious();
                }
                return Unit.f71706a;
            case 3:
                MediaController mediaControllerB3 = this.f72934b.m().b();
                if (mediaControllerB3 != null && (transportControls3 = mediaControllerB3.getTransportControls()) != null) {
                    transportControls3.skipToNext();
                }
                return Unit.f71706a;
            default:
                zz.g gVarM2 = this.f72934b.m();
                Context context = gVarM2.f98842a;
                MediaController mediaControllerB4 = gVarM2.b();
                if (mediaControllerB4 != null) {
                    PendingIntent sessionActivity = mediaControllerB4.getSessionActivity();
                    if (sessionActivity != null) {
                        try {
                            sessionActivity.send();
                        } catch (PendingIntent.CanceledException unused) {
                            vm.d.j(gVarM2, "Failed to start session activity");
                        }
                    } else {
                        try {
                            context.startActivity(context.getPackageManager().getLaunchIntentForPackage(mediaControllerB4.getPackageName()));
                        } catch (Exception e3) {
                            vm.d.j(gVarM2, "Exception while starting activity : " + e3.getMessage());
                        }
                    }
                }
                return Unit.f71706a;
        }
    }
}
