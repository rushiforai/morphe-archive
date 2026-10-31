package kotlin.reflect.jvm.internal.impl.resolve.scopes;

import b70.d;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.name.Name;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class MemberScopeKt {
    @Nullable
    public static final Set<Name> flatMapClassifierNamesOrNull(@NotNull Iterable<? extends MemberScope> iterable) {
        Intrinsics.g(iterable, "<this>");
        HashSet hashSet = new HashSet();
        Iterator<? extends MemberScope> it = iterable.iterator();
        while (it.hasNext()) {
            Set<Name> classifierNames = it.next().getClassifierNames();
            if (classifierNames == null) {
                return null;
            }
            d.z0(classifierNames, hashSet);
        }
        return hashSet;
    }
}
