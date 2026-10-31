package ab;

import android.appwidget.AppWidgetManager;
import android.os.UserHandle;
import com.android.launcher3.shortcuts.ShortcutKey;
import java.util.Map;
import java.util.function.Function;

/* loaded from: classes.dex */
public final /* synthetic */ class b0 implements Function {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f685a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f686b;

    public /* synthetic */ b0(Object obj, int i5) {
        this.f685a = i5;
        this.f686b = obj;
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        switch (this.f685a) {
            case 0:
                return ((AppWidgetManager) this.f686b).getInstalledProvidersForProfile((UserHandle) obj).stream();
            case 1:
                return ((fa.w) obj).f0(((fa.x) this.f686b).f54525b);
            case 2:
                return ShortcutKey.d(((fa.w) obj).f54518r, (UserHandle) this.f686b);
            case 3:
                return (Map) ((o0.m) this.f686b).invoke(obj);
            default:
                return (op.k) ((op.h) this.f686b).invoke(obj);
        }
    }
}
