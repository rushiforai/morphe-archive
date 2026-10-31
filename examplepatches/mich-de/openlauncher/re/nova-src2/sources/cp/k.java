package cp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongArray;

/* loaded from: classes4.dex */
public final class k extends z {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f47751a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ z f47752b;

    public /* synthetic */ k(z zVar, int i5) {
        this.f47751a = i5;
        this.f47752b = zVar;
    }

    @Override // cp.z
    public final Object b(kp.a aVar) {
        switch (this.f47751a) {
            case 0:
                return new AtomicLong(((Number) this.f47752b.b(aVar)).longValue());
            default:
                ArrayList arrayList = new ArrayList();
                aVar.a();
                while (aVar.p()) {
                    arrayList.add(Long.valueOf(((Number) this.f47752b.b(aVar)).longValue()));
                }
                aVar.e();
                int size = arrayList.size();
                AtomicLongArray atomicLongArray = new AtomicLongArray(size);
                for (int i5 = 0; i5 < size; i5++) {
                    atomicLongArray.set(i5, ((Long) arrayList.get(i5)).longValue());
                }
                return atomicLongArray;
        }
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException {
        switch (this.f47751a) {
            case 0:
                this.f47752b.c(bVar, Long.valueOf(((AtomicLong) obj).get()));
                break;
            default:
                AtomicLongArray atomicLongArray = (AtomicLongArray) obj;
                bVar.b();
                int length = atomicLongArray.length();
                for (int i5 = 0; i5 < length; i5++) {
                    this.f47752b.c(bVar, Long.valueOf(atomicLongArray.get(i5)));
                }
                bVar.e();
                break;
        }
    }
}
