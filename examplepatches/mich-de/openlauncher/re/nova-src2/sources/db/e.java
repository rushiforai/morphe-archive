package db;

import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.teslacoilsw.launcher.util.NamedIntent;
import ga.j;
import java.util.Objects;
import java.util.function.Predicate;
import mx.j0;

/* loaded from: classes.dex */
public final /* synthetic */ class e implements Predicate {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49124a;

    public /* synthetic */ e(int i5) {
        this.f49124a = i5;
    }

    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        switch (this.f49124a) {
            case 0:
                return ((WidgetItem) obj).f21171d != null;
            case 1:
                return ((j) obj).f57289a != -1;
            case 2:
                if (obj == null) {
                    return false;
                }
                throw new ClassCastException();
            case 3:
                return Objects.nonNull((ShortcutKey) obj);
            case 4:
                return ((NamedIntent) obj).f46369b != null;
            case 5:
                return Objects.isNull((ga.e) obj);
            default:
                ((j0) obj).getClass();
                return false;
        }
    }
}
