package o50;

import io.ktor.http.IllegalHeaderNameException;
import io.ktor.http.IllegalHeaderValueException;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n extends s50.l {
    @Override // s50.l
    public final void i(String name) {
        Intrinsics.g(name, "name");
        List list = p.f79582a;
        int i5 = 0;
        int i11 = 0;
        while (i5 < name.length()) {
            char cCharAt = name.charAt(i5);
            int i12 = i11 + 1;
            if (Intrinsics.h(cCharAt, 32) <= 0 || r70.k.L0("\"(),/:;<=>?@[\\]{}", cCharAt)) {
                throw new IllegalHeaderNameException(name, i11);
            }
            i5++;
            i11 = i12;
        }
    }

    @Override // s50.l
    public final void j(String value) {
        Intrinsics.g(value, "value");
        List list = p.f79582a;
        int i5 = 0;
        int i11 = 0;
        while (i5 < value.length()) {
            char cCharAt = value.charAt(i5);
            int i12 = i11 + 1;
            if (Intrinsics.h(cCharAt, 32) < 0 && cCharAt != '\t') {
                throw new IllegalHeaderValueException(value, i11);
            }
            i5++;
            i11 = i12;
        }
    }
}
