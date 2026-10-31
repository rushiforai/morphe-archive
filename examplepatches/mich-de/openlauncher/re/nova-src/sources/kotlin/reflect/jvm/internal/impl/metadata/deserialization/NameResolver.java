package kotlin.reflect.jvm.internal.impl.metadata.deserialization;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public interface NameResolver {
    @NotNull
    String getQualifiedClassName(int i5);

    @NotNull
    String getString(int i5);

    boolean isLocalClassName(int i5);
}
