package wb;

import com.bytedance.sdk.component.fby.ycx.ycx;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94130a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d f94131b;

    public /* synthetic */ a(d dVar, int i5) {
        this.f94130a = i5;
        this.f94131b = dVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f94130a) {
            case 0:
                d dVar = this.f94131b;
                if (dVar.f94144jc == null) {
                    try {
                        dVar.f94144jc = new n();
                    } catch (Throwable th2) {
                        sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIdH7w==", "Sfsj", 261);
                        th2.getMessage();
                    }
                    if (dVar.f94144jc != null) {
                        l unused = dVar.f94144jc;
                        dVar.f94143hf = "0";
                        ((n) dVar.f94144jc).f94155a = dVar;
                        ((n) dVar.f94144jc).f94156b = dVar;
                        ((n) dVar.f94144jc).f94160f = dVar;
                        ((n) dVar.f94144jc).f94157c = dVar;
                        ((n) dVar.f94144jc).f94158d = dVar;
                        ((n) dVar.f94144jc).f94161g = dVar;
                        ((n) dVar.f94144jc).f94159e = dVar;
                        try {
                            ((n) dVar.f94144jc).f94163i.setLooping(false);
                        } catch (Throwable th3) {
                            sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIdH7w==", "Sfsj", 278);
                        }
                        dVar.f94142ea = false;
                        break;
                    }
                }
                break;
            case 1:
                d dVar2 = this.f94131b;
                if (dVar2.ul() && dVar2.f94144jc != null) {
                    try {
                        ((n) dVar2.f94144jc).f94163i.start();
                        for (WeakReference weakReference : dVar2.sya) {
                            if (weakReference != null && weakReference.get() != null) {
                                ((nb.b) weakReference.get()).lud(dVar2);
                            }
                        }
                        dVar2.xkz = Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE;
                        break;
                    } catch (Throwable th4) {
                        sya.ycx(th4, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIdH6A==", "Sfsj", 381);
                        th4.getMessage();
                        return;
                    }
                }
                break;
            case 2:
                d dVar3 = this.f94131b;
                if (dVar3.f94141dy != null) {
                    dVar3.f94141dy.sendEmptyMessage(101);
                    break;
                }
                break;
            case 3:
                d dVar4 = this.f94131b;
                if (dVar4.f94141dy != null) {
                    dVar4.f94141dy.sendEmptyMessage(101);
                    break;
                }
                break;
            case 4:
                d dVar5 = this.f94131b;
                if (dVar5.f94141dy != null) {
                    dVar5.f94141dy.sendEmptyMessage(104);
                    break;
                }
                break;
            case 5:
                d dVar6 = this.f94131b;
                if (dVar6.f94141dy != null && dVar6.f94141dy.getLooper() != null) {
                    try {
                        ycx.ycx().ycx(dVar6.f94141dy);
                        dVar6.f94141dy = null;
                        break;
                    } catch (Throwable th5) {
                        sya.ycx(th5, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIdH7T0=", "Sfsj", 967);
                        return;
                    }
                }
                break;
            default:
                d dVar7 = this.f94131b;
                try {
                    ((n) dVar7.f94144jc).f94163i.pause();
                    dVar7.xkz = Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE;
                    dVar7.kgy = false;
                    break;
                } catch (Throwable th6) {
                    sya.ycx(th6, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIdH7Tw=", "Sfsj", 1194);
                }
        }
    }
}
