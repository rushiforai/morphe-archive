package he;

import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioTrack;
import xk.s0;
import xk.v0;

/* loaded from: classes3.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final AudioAttributes f59679a = new AudioAttributes.Builder().setUsage(1).setContentType(3).setFlags(0).build();

    public static int[] a() {
        s0 s0VarL = v0.l();
        lh.h it = f.f59692e.keySet().iterator();
        while (it.hasNext()) {
            Integer num = (Integer) it.next();
            if (AudioTrack.isDirectPlaybackSupported(new AudioFormat.Builder().setChannelMask(12).setEncoding(num.intValue()).setSampleRate(48000).build(), f59679a)) {
                s0VarL.a(num);
            }
        }
        s0VarL.a(2);
        return ul.b.f0(s0VarL.f());
    }

    public static int b(int i5, int i11) {
        for (int i12 = 8; i12 > 0; i12--) {
            if (AudioTrack.isDirectPlaybackSupported(new AudioFormat.Builder().setEncoding(i5).setSampleRate(i11).setChannelMask(wf.v.k(i12)).build(), f59679a)) {
                return i12;
            }
        }
        return 0;
    }
}
