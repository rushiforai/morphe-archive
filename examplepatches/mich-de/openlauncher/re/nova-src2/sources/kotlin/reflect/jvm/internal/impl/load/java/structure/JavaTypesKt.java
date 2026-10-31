package kotlin.reflect.jvm.internal.impl.load.java.structure;

import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JavaTypesKt {
    public static final boolean isSuperWildcard(@Nullable JavaType javaType) {
        JavaWildcardType javaWildcardType = javaType instanceof JavaWildcardType ? (JavaWildcardType) javaType : null;
        return (javaWildcardType == null || javaWildcardType.getBound() == null || javaWildcardType.isExtends()) ? false : true;
    }
}
