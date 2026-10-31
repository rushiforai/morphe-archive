package f5;

import java.util.Collection;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final List f54310a;

    public l(List credentialOptions) {
        Intrinsics.g(credentialOptions, "credentialOptions");
        this.f54310a = credentialOptions;
        if (credentialOptions.isEmpty()) {
            throw new IllegalArgumentException("credentialOptions should not be empty");
        }
        if (credentialOptions.size() > 1) {
            List<zi.a> list = credentialOptions;
            if (!(list instanceof Collection) || !list.isEmpty()) {
                for (zi.a aVar : list) {
                }
            }
            for (zi.a aVar2 : this.f54310a) {
            }
        }
    }
}
