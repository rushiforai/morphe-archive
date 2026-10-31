package c40;

import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.downloader.t;
import java.util.Map;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19656a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Map f19657b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ t f19658c;

    public /* synthetic */ c(t tVar, Map map) {
        this.f19658c = tVar;
        this.f19657b = map;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f19656a) {
            case 0:
                ConfigManager.a(this.f19658c, this.f19657b);
                break;
            default:
                ConfigManager.a(this.f19657b, this.f19658c);
                break;
        }
    }

    public /* synthetic */ c(Map map, t tVar) {
        this.f19657b = map;
        this.f19658c = tVar;
    }
}
