package xk;

import java.util.Map;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public abstract class b2 implements vk.g {

    /* renamed from: a, reason: collision with root package name */
    public static final z1 f95870a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ b2[] f95871b;

    static {
        z1 z1Var = new z1();
        f95870a = z1Var;
        f95871b = new b2[]{z1Var, new b2() { // from class: xk.a2
            @Override // vk.g
            public final Object apply(Object obj) {
                return ((Map.Entry) obj).getValue();
            }
        }};
    }

    public static b2 valueOf(String str) {
        return (b2) Enum.valueOf(b2.class, str);
    }

    public static b2[] values() {
        return (b2[]) f95871b.clone();
    }
}
