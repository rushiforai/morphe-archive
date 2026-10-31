package nd;

import android.text.TextUtils;
import com.vungle.ads.VungleBannerView;
import eg.l;

/* loaded from: classes3.dex */
public final class b extends md.c {
    public b(eg.f fVar, ld.a aVar) {
        super(fVar, aVar);
    }

    @Override // md.c
    public final void a(VungleBannerView vungleBannerView, l lVar) {
        String str = lVar.f52717c;
        String str2 = lVar.f52723i;
        if (!TextUtils.isEmpty(str2)) {
            vungleBannerView.getAdConfig().setWatermark(str2);
        }
        vungleBannerView.load(str);
    }
}
