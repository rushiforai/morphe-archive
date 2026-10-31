package n7;

import android.webkit.ValueCallback;
import androidx.webkit.PrerenderException;
import b.kc;

/* loaded from: classes2.dex */
public final /* synthetic */ class z implements ValueCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77966a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f77967b;

    public /* synthetic */ z(Object obj, int i5) {
        this.f77966a = i5;
        this.f77967b = obj;
    }

    @Override // android.webkit.ValueCallback
    public final void onReceiveValue(Object obj) {
        switch (this.f77966a) {
            case 0:
                ((m7.e) this.f77967b).getClass();
                break;
            case 1:
                m7.e eVar = (m7.e) this.f77967b;
                new PrerenderException((Throwable) obj);
                ((kc) eVar).getClass();
                break;
            case 2:
                ((m7.e) this.f77967b).getClass();
                break;
            case 3:
                m7.e eVar2 = (m7.e) this.f77967b;
                new PrerenderException((Throwable) obj);
                ((kc) eVar2).getClass();
                break;
            default:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.bridge.b.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.bridge.b) this.f77967b, (String) obj);
                break;
        }
    }
}
