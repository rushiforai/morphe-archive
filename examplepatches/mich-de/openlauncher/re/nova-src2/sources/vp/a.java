package vp;

import android.media.MediaCodec;
import java.io.IOException;
import w8.e;
import we.h;
import we.i;
import we.j;

/* loaded from: classes4.dex */
public final class a implements e, i {
    public static MediaCodec c(h hVar) throws IOException {
        hVar.f94245a.getClass();
        String str = hVar.f94245a.f94250a;
        wf.a.b("createCodec:" + str);
        MediaCodec mediaCodecCreateByCodecName = MediaCodec.createByCodecName(str);
        wf.a.q();
        return mediaCodecCreateByCodecName;
    }

    @Override // we.i
    public j a(h hVar) {
        MediaCodec mediaCodecC = null;
        try {
            mediaCodecC = c(hVar);
            wf.a.b("configureCodec");
            mediaCodecC.configure(hVar.f94246b, hVar.f94248d, hVar.f94249e, 0);
            wf.a.q();
            wf.a.b("startCodec");
            mediaCodecC.start();
            wf.a.q();
            return new vk.j(mediaCodecC);
        } catch (IOException | RuntimeException e3) {
            if (mediaCodecC != null) {
                mediaCodecC.release();
            }
            throw e3;
        }
    }

    @Override // w8.e
    public boolean b() {
        return true;
    }

    @Override // w8.e
    public void shutdown() {
    }
}
