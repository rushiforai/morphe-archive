package c3;

/* loaded from: classes.dex */
public interface n3 {
    long a();

    long b();

    default float c() {
        return 2.0f;
    }

    default long d() {
        float f11 = 48;
        return vm.d.a(f11, f11);
    }

    default float e() {
        return Float.MAX_VALUE;
    }

    float f();

    default float g() {
        return 16.0f;
    }
}
