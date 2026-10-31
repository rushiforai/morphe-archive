package kotlin.reflect.jvm.internal.impl.load.java.structure;

import kotlin.reflect.jvm.internal.impl.builtins.PrimitiveType;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public interface JavaPrimitiveType extends JavaType {
    @Nullable
    PrimitiveType getType();
}
