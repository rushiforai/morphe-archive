package zz;

import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import e20.r;

/* loaded from: classes.dex */
public final class e extends MediaController.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g f98840a;

    public e(g gVar) {
        this.f98840a = gVar;
    }

    @Override // android.media.session.MediaController.Callback
    public final void onMetadataChanged(MediaMetadata mediaMetadata) {
        this.f98840a.c().a();
    }

    @Override // android.media.session.MediaController.Callback
    public final void onPlaybackStateChanged(PlaybackState playbackState) {
        g gVar = this.f98840a;
        gVar.c().a();
        r rVar = gVar.f98848g;
        if (rVar != null) {
            boolean z11 = false;
            if (playbackState != null && playbackState.getState() == 3) {
                z11 = true;
            }
            rVar.h(z11);
        }
    }

    @Override // android.media.session.MediaController.Callback
    public final void onSessionDestroyed() {
        this.f98840a.c().a();
    }
}
