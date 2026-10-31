package nd;

import android.content.Context;
import android.text.TextUtils;
import com.vungle.ads.NativeAd;
import com.vungle.ads.internal.ui.view.MediaView;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class d implements ld.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f78201a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f78202b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f78203c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ bg.g f78204d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ String f78205e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ e f78206f;

    public d(e eVar, Context context, String str, int i5, bg.g gVar, String str2) {
        this.f78206f = eVar;
        this.f78201a = context;
        this.f78202b = str;
        this.f78203c = i5;
        this.f78204d = gVar;
        this.f78205e = str2;
    }

    @Override // ld.b
    public final void a(bg.a aVar) {
        aVar.getClass();
        this.f78206f.f78207m.onFailure(aVar);
    }

    @Override // ld.b
    public final void b() {
        e eVar = this.f78206f;
        eVar.f78210r.getClass();
        Context context = this.f78201a;
        Intrinsics.g(context, "context");
        String placementId = this.f78202b;
        Intrinsics.g(placementId, "placementId");
        eVar.o = new NativeAd(context, placementId);
        eVar.o.setAdOptionsPosition(this.f78203c);
        eVar.o.setAdListener(eVar);
        eVar.o.setAdapterAdFormat("VungleRtbNativeAd");
        bg.g gVar = this.f78204d;
        if (gVar != null) {
            eVar.o.getVideoOptions().setStartMuted(Boolean.valueOf(gVar.f17888a));
        }
        eVar.f78208p = new MediaView(context);
        String str = this.f78205e;
        if (!TextUtils.isEmpty(str)) {
            eVar.o.getAdConfig().setWatermark(str);
        }
        eVar.o.load(eVar.f78209q);
    }
}
