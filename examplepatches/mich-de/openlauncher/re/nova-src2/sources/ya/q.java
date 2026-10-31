package ya;

import android.content.ComponentName;
import java.util.function.Consumer;

/* loaded from: classes2.dex */
public final /* synthetic */ class q implements Consumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97204a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f97205b;

    public /* synthetic */ q(r rVar, int i5) {
        this.f97204a = i5;
        this.f97205b = rVar;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        int i5 = this.f97204a;
        r rVar = this.f97205b;
        switch (i5) {
            case 0:
                rVar.c(((Integer) obj).intValue());
                break;
            default:
                ComponentName componentName = v.f97214a;
                rVar.c(((ga.e) obj).f57289a);
                break;
        }
    }
}
