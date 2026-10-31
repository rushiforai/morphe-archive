package wb;

import com.bytedance.sdk.openadsdk.core.syc.dj.sya;

/* loaded from: classes2.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public long f94135a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f94136b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ sya f94137c;

    public c(sya syaVar) {
        this.f94137c = syaVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        long currentPosition;
        sya syaVar = this.f94137c;
        if (((d) syaVar).f94144jc != null) {
            try {
                if (!this.f94136b) {
                    n nVar = (n) ((d) syaVar).f94144jc;
                    nVar.getClass();
                    try {
                        currentPosition = nVar.f94163i.getCurrentPosition();
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "XOs5thaue8KOXudSnxi0IVTg", 244);
                        currentPosition = 0;
                    }
                    ((d) syaVar).syc = Math.max(this.f94135a, currentPosition);
                }
                long unused = ((d) syaVar).syc;
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIdHk3n0lEvFSbgQsyM=", "Sfsj", 1524);
                th3.toString();
            }
        }
        if (((d) syaVar).f94141dy != null) {
            ((d) syaVar).f94141dy.sendEmptyMessageDelayed(100, 0L);
        }
    }
}
