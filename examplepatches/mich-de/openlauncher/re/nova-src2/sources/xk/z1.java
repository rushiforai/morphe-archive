package xk;

import java.util.Map;

/* loaded from: classes.dex */
public enum z1 extends b2 {
    public z1() {
        super("KEY", 0);
    }

    @Override // vk.g
    public final Object apply(Object obj) {
        return ((Map.Entry) obj).getKey();
    }
}
