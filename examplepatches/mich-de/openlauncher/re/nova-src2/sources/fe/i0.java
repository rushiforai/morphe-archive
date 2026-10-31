package fe;

import java.util.HashSet;

/* loaded from: classes3.dex */
public abstract class i0 {

    /* renamed from: a, reason: collision with root package name */
    public static final HashSet f54840a = new HashSet();

    /* renamed from: b, reason: collision with root package name */
    public static String f54841b = "goog.exo.core";

    public static synchronized void a(String str) {
        if (f54840a.add(str)) {
            f54841b += ", " + str;
        }
    }
}
