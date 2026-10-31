package i2;

import android.content.Context;
import android.os.Build;
import androidx.compose.ui.platform.AndroidComposeView;
import kotlin.Unit;

/* loaded from: classes.dex */
public final class e implements z {

    /* renamed from: f, reason: collision with root package name */
    public static boolean f61103f = true;

    /* renamed from: a, reason: collision with root package name */
    public final AndroidComposeView f61104a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f61105b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public m2.a f61106c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f61107d;

    /* renamed from: e, reason: collision with root package name */
    public final d f61108e;

    public e(AndroidComposeView androidComposeView) {
        this.f61104a = androidComposeView;
        d dVar = new d(this);
        this.f61108e = dVar;
        if (androidComposeView.isAttachedToWindow()) {
            Context context = androidComposeView.getContext();
            if (!this.f61107d) {
                context.getApplicationContext().registerComponentCallbacks(dVar);
                this.f61107d = true;
            }
        }
        androidComposeView.addOnAttachStateChangeListener(new eb.f(this, 2));
    }

    @Override // i2.z
    public final l2.b a() {
        l2.d iVar;
        l2.b bVar;
        synchronized (this.f61105b) {
            try {
                AndroidComposeView androidComposeView = this.f61104a;
                int i5 = Build.VERSION.SDK_INT;
                if (i5 >= 29) {
                    androidComposeView.getUniqueDrawingId();
                }
                if (i5 >= 29) {
                    iVar = new l2.g();
                } else if (f61103f) {
                    try {
                        iVar = new l2.e(this.f61104a);
                    } catch (Throwable unused) {
                        f61103f = false;
                        AndroidComposeView androidComposeView2 = this.f61104a;
                        m2.a aVar = this.f61106c;
                        if (aVar == null) {
                            m2.a aVar2 = new m2.a(androidComposeView2.getContext());
                            androidComposeView2.addView(aVar2);
                            this.f61106c = aVar2;
                            aVar = aVar2;
                        }
                        iVar = new l2.i(aVar);
                    }
                } else {
                    AndroidComposeView androidComposeView3 = this.f61104a;
                    m2.a aVar3 = this.f61106c;
                    if (aVar3 == null) {
                        m2.a aVar4 = new m2.a(androidComposeView3.getContext());
                        androidComposeView3.addView(aVar4);
                        this.f61106c = aVar4;
                        aVar3 = aVar4;
                    }
                    iVar = new l2.i(aVar3);
                }
                bVar = new l2.b(iVar);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return bVar;
    }

    @Override // i2.z
    public final void b(l2.b bVar) {
        synchronized (this.f61105b) {
            if (!bVar.f74517s) {
                bVar.f74517s = true;
                bVar.b();
            }
            Unit unit = Unit.f71706a;
        }
    }
}
