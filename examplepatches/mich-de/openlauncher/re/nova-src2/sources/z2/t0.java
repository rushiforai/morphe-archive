package z2;

import java.util.Map;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public interface t0 extends t {
    s0 K(int i5, int i11, Map map, Function1 function1, Function1 function12);

    default s0 y(int i5, int i11, Map map, Function1 function1) {
        return K(i5, i11, map, null, function1);
    }
}
