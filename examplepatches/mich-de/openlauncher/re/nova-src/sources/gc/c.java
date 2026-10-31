package gc;

import android.os.Handler;
import android.os.HandlerThread;

/* loaded from: classes2.dex */
public final class c extends HandlerThread {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57341a;

    /* renamed from: b, reason: collision with root package name */
    public Object f57342b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(String str) {
        super(str);
        this.f57341a = 2;
    }

    public Handler a() {
        synchronized (this) {
            if (((Handler) this.f57342b) == null) {
                this.f57342b = new Handler(getLooper());
            }
        }
        return (Handler) this.f57342b;
    }

    @Override // android.os.HandlerThread
    public void onLooperPrepared() {
        switch (this.f57341a) {
            case 0:
                ((e) this.f57342b).f57351f = new Handler(getLooper(), (e) this.f57342b);
                e.f((e) this.f57342b);
                break;
            case 1:
                ((e) this.f57342b).f57350e = new Handler(getLooper(), (e) this.f57342b);
                e.f((e) this.f57342b);
                break;
            default:
                super.onLooperPrepared();
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, int i5) {
        super("AppLogS");
        this.f57341a = i5;
        switch (i5) {
            case 1:
                this.f57342b = eVar;
                super("AppLogU");
                break;
            default:
                this.f57342b = eVar;
                break;
        }
    }
}
