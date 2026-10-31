package nd;

import android.text.TextUtils;
import com.vungle.ads.AdConfig;
import eg.q;

/* loaded from: classes3.dex */
public final class c extends md.d {
    public c(eg.f fVar, ld.a aVar) {
        super(fVar, aVar);
    }

    @Override // md.d
    public final String a(q qVar) {
        return qVar.f52727c;
    }

    @Override // md.d
    public final void b(AdConfig adConfig, q qVar) {
        String str = qVar.f52732h;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        adConfig.setWatermark(str);
    }
}
