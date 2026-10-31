package p6;

import android.app.Activity;
import android.content.Context;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lp6/c;", "Lp6/z0;", "Lp6/a;", "navigation-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
@y0("activity")
/* loaded from: classes2.dex */
public class c extends z0 {

    /* renamed from: c, reason: collision with root package name */
    public final Context f82143c;

    /* renamed from: d, reason: collision with root package name */
    public final Activity f82144d;

    public c(Context context) {
        Object next;
        Intrinsics.g(context, "context");
        this.f82143c = context;
        Iterator f71970a = q70.d.p0(context, b.f82130k).getF71970a();
        while (true) {
            if (!f71970a.hasNext()) {
                next = null;
                break;
            } else {
                next = f71970a.next();
                if (((Context) next) instanceof Activity) {
                    break;
                }
            }
        }
        this.f82144d = (Activity) next;
    }

    @Override // p6.z0
    public final e0 a() {
        return new a(this);
    }

    @Override // p6.z0
    public final e0 c(e0 e0Var) {
        throw new IllegalStateException(b.c0.o(new StringBuilder("Destination "), ((a) e0Var).f82157f, " does not have an Intent set.").toString());
    }

    @Override // p6.z0
    public final boolean f() {
        Activity activity = this.f82144d;
        if (activity == null) {
            return false;
        }
        activity.finish();
        return true;
    }
}
