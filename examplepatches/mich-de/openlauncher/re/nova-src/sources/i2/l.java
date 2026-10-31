package i2;

import java.util.List;

/* loaded from: classes2.dex */
public abstract class l {
    public static final void a(List list) {
        if (list.size() < 2) {
            throw new IllegalArgumentException("colors must have length of at least 2 if colorStops is omitted.");
        }
    }
}
