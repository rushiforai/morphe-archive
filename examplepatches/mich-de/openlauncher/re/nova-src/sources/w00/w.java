package w00;

import com.google.android.gms.tasks.Task;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class w implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93621a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Task f93622b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fi.b f93623c;

    public /* synthetic */ w(Task task, fi.b bVar, int i5) {
        this.f93621a = i5;
        this.f93622b = task;
        this.f93623c = bVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f93621a) {
            case 0:
                if (!this.f93622b.p()) {
                    this.f93623c.a();
                }
                break;
            default:
                if (!this.f93622b.p()) {
                    this.f93623c.a();
                }
                break;
        }
        return Unit.f71706a;
    }
}
