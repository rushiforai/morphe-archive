package kotlin.reflect.jvm.internal.impl.load.kotlin;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.name.Name;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

/* loaded from: classes5.dex */
public class JvmDescriptorTypeWriter<T> {

    @Nullable
    private T jvmCurrentType;
    private int jvmCurrentTypeArrayLevel;

    @NotNull
    private final JvmTypeFactory<T> jvmTypeFactory;

    public void writeArrayEnd() {
    }

    public void writeArrayType() {
        if (this.jvmCurrentType == null) {
            this.jvmCurrentTypeArrayLevel++;
        }
    }

    public void writeClass(@NotNull T objectType) {
        Intrinsics.g(objectType, "objectType");
        writeJvmTypeAsIs(objectType);
    }

    public final void writeJvmTypeAsIs(@NotNull T type) {
        Intrinsics.g(type, "type");
        if (this.jvmCurrentType == null) {
            if (this.jvmCurrentTypeArrayLevel > 0) {
                type = this.jvmTypeFactory.createFromString(j.D0(this.jvmCurrentTypeArrayLevel, "[") + this.jvmTypeFactory.toString(type));
            }
            this.jvmCurrentType = type;
        }
    }

    public void writeTypeVariable(@NotNull Name name, @NotNull T type) {
        Intrinsics.g(name, "name");
        Intrinsics.g(type, "type");
        writeJvmTypeAsIs(type);
    }
}
