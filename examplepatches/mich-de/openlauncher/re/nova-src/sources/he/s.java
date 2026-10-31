package he;

import android.media.AudioTrack;

/* loaded from: classes3.dex */
public abstract class s {
    public static void a(AudioTrack audioTrack, u uVar) {
        audioTrack.setPreferredDevice(uVar == null ? null : uVar.f59790a);
    }
}
