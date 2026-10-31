package je;

import android.os.Looper;
import com.facebook.ads.AdError;
import com.google.android.exoplayer2.drm.DrmSession$DrmSessionException;
import com.google.android.exoplayer2.drm.UnsupportedDrmException;
import fe.k0;
import ge.m;
import gf.a0;

/* loaded from: classes3.dex */
public final class c implements e {
    @Override // je.e
    public final f a(a0 a0Var, k0 k0Var) {
        if (k0Var.o == null) {
            return null;
        }
        return new f(new DrmSession$DrmSessionException(new UnsupportedDrmException(), AdError.MEDIAVIEW_MISSING_ERROR_CODE), 0);
    }

    @Override // je.e
    public final void b(Looper looper, m mVar) {
    }

    @Override // je.e
    public final int d(k0 k0Var) {
        return k0Var.o != null ? 1 : 0;
    }
}
