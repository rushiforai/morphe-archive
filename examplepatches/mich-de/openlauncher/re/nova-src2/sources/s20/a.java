package s20;

import android.content.pm.ShortcutInfo;
import java.util.function.Predicate;

/* loaded from: classes4.dex */
public final class a implements Predicate {
    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        return b.a(((ShortcutInfo) obj).getPackage());
    }
}
