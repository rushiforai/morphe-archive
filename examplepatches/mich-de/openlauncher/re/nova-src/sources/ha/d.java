package ha;

import android.app.Person;
import java.util.function.Predicate;

/* loaded from: classes2.dex */
public final /* synthetic */ class d implements Predicate {
    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        return ((Person) obj).getKey() != null;
    }
}
