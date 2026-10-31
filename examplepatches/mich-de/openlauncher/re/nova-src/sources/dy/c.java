package dy;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes4.dex */
public final class c extends Thread {

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f49836c;

    /* renamed from: a, reason: collision with root package name */
    public final Object f49834a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public b f49835b = null;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f49837d = new AtomicBoolean(true);

    public c(ArrayList arrayList) {
        this.f49836c = arrayList;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        b bVar;
        while (this.f49837d.get()) {
            synchronized (this.f49836c) {
                int size = this.f49836c.size();
                while (size == 0) {
                    try {
                        this.f49836c.wait();
                    } catch (InterruptedException unused) {
                        if (!this.f49837d.get()) {
                            return;
                        }
                    }
                    size = this.f49836c.size();
                }
                int i5 = size / 2;
                bVar = (b) this.f49836c.get(i5);
                this.f49836c.remove(i5);
            }
            synchronized (this.f49834a) {
                this.f49835b = bVar;
            }
            if (bVar != null) {
                bVar.run();
            }
            synchronized (this.f49834a) {
                this.f49835b = null;
            }
        }
    }
}
