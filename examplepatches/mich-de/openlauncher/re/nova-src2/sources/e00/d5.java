package e00;

import java.util.Comparator;
import java.util.Map;

/* loaded from: classes4.dex */
public final class d5 implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return ab.e0.t((Integer) ((Map.Entry) obj2).getValue(), (Integer) ((Map.Entry) obj).getValue());
    }
}
