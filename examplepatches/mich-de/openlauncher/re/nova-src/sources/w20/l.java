package w20;

import android.content.Context;
import android.os.SystemClock;
import java.util.Set;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final String f93686a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f93687b;

    /* renamed from: c, reason: collision with root package name */
    public long f93688c = Long.MIN_VALUE;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f93689d;

    /* renamed from: e, reason: collision with root package name */
    public final j.c f93690e;

    public l(String str, Function1 function1, Function0 function0, Function1 function12) {
        this.f93686a = str;
        this.f93687b = function1;
        this.f93689d = function0;
        this.f93690e = (j.c) function12.invoke(new b00.x(11, this, function0));
    }

    public final boolean a(Context context) {
        return b(context) && context.checkSelfPermission(this.f93686a) == 0;
    }

    public final boolean b(Context context) {
        return !j10.m.a(context, this.f93686a);
    }

    public final void c() {
        Function0 function0 = this.f93689d;
        if (!b((Context) function0.invoke())) {
            this.f93687b.invoke(Boolean.FALSE);
            return;
        }
        j10.m mVar = j10.m.f68628a;
        Set setG = j10.m.g();
        String str = this.f93686a;
        if (setG.contains(str)) {
        }
        this.f93688c = SystemClock.uptimeMillis();
        this.f93690e.a(str, null);
    }
}
