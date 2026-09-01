package defpackage;

import android.media.session.MediaSession;
import android.os.RemoteCallbackList;
import android.support.v4.media.session.MediaSessionCompat$Token;
import android.support.v4.media.session.b;
import com.medium.android.donkey.audio.AudioService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class wm7 {
    public final MediaSession a;
    public final b b;
    public final MediaSessionCompat$Token c;
    public final Object d = new Object();
    public final RemoteCallbackList e = new RemoteCallbackList();
    public ms f;
    public an7 g;

    public wm7(AudioService audioService) {
        MediaSession mediaSessionA = a(audioService);
        this.a = mediaSessionA;
        b bVar = new b(this);
        this.b = bVar;
        this.c = new MediaSessionCompat$Token(mediaSessionA.getSessionToken(), bVar);
        mediaSessionA.setFlags(3);
    }

    public MediaSession a(AudioService audioService) {
        return new MediaSession(audioService, "audioservice");
    }

    public final ms b() {
        ms msVar;
        synchronized (this.d) {
            msVar = this.f;
        }
        return msVar;
    }

    public an7 c() {
        an7 an7Var;
        synchronized (this.d) {
            an7Var = this.g;
        }
        return an7Var;
    }

    public void d(an7 an7Var) {
        synchronized (this.d) {
            this.g = an7Var;
        }
    }
}
