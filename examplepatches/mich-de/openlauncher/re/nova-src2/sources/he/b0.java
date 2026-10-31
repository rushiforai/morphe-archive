package he;

import android.media.AudioDeviceInfo;
import android.media.AudioTrack;

/* loaded from: classes3.dex */
public abstract class b0 {
    public static void a(l lVar, Object obj) {
        u uVar;
        AudioDeviceInfo audioDeviceInfo = (AudioDeviceInfo) obj;
        y yVar = (y) lVar;
        if (audioDeviceInfo == null) {
            uVar = null;
        } else {
            yVar.getClass();
            uVar = new u(audioDeviceInfo);
        }
        yVar.Y = uVar;
        AudioTrack audioTrack = yVar.f59829u;
        if (audioTrack != null) {
            s.a(audioTrack, uVar);
        }
    }
}
