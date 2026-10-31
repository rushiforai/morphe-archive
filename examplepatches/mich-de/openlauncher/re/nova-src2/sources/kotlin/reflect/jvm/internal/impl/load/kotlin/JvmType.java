package kotlin.reflect.jvm.internal.impl.load.kotlin;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.resolve.jvm.JvmPrimitiveType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public abstract class JvmType {

    @NotNull
    public static final Companion Companion = new Companion(null);

    @NotNull
    private static final Primitive BOOLEAN = new Primitive(JvmPrimitiveType.BOOLEAN);

    @NotNull
    private static final Primitive CHAR = new Primitive(JvmPrimitiveType.CHAR);

    @NotNull
    private static final Primitive BYTE = new Primitive(JvmPrimitiveType.BYTE);

    @NotNull
    private static final Primitive SHORT = new Primitive(JvmPrimitiveType.SHORT);

    @NotNull
    private static final Primitive INT = new Primitive(JvmPrimitiveType.INT);

    @NotNull
    private static final Primitive FLOAT = new Primitive(JvmPrimitiveType.FLOAT);

    @NotNull
    private static final Primitive LONG = new Primitive(JvmPrimitiveType.LONG);

    @NotNull
    private static final Primitive DOUBLE = new Primitive(JvmPrimitiveType.DOUBLE);

    public static final class Array extends JvmType {

        @NotNull
        private final JvmType elementType;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Array(@NotNull JvmType elementType) {
            super(null);
            Intrinsics.g(elementType, "elementType");
            this.elementType = elementType;
        }

        @NotNull
        public final JvmType getElementType() {
            return this.elementType;
        }
    }

    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final Primitive getBOOLEAN$descriptors_jvm() {
            return JvmType.BOOLEAN;
        }

        @NotNull
        public final Primitive getBYTE$descriptors_jvm() {
            return JvmType.BYTE;
        }

        @NotNull
        public final Primitive getCHAR$descriptors_jvm() {
            return JvmType.CHAR;
        }

        @NotNull
        public final Primitive getDOUBLE$descriptors_jvm() {
            return JvmType.DOUBLE;
        }

        @NotNull
        public final Primitive getFLOAT$descriptors_jvm() {
            return JvmType.FLOAT;
        }

        @NotNull
        public final Primitive getINT$descriptors_jvm() {
            return JvmType.INT;
        }

        @NotNull
        public final Primitive getLONG$descriptors_jvm() {
            return JvmType.LONG;
        }

        @NotNull
        public final Primitive getSHORT$descriptors_jvm() {
            return JvmType.SHORT;
        }

        private Companion() {
        }
    }

    public static final class Object extends JvmType {

        @NotNull
        private final String internalName;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Object(@NotNull String internalName) {
            super(null);
            Intrinsics.g(internalName, "internalName");
            this.internalName = internalName;
        }

        @NotNull
        public final String getInternalName() {
            return this.internalName;
        }
    }

    public static final class Primitive extends JvmType {

        @Nullable
        private final JvmPrimitiveType jvmPrimitiveType;

        public Primitive(@Nullable JvmPrimitiveType jvmPrimitiveType) {
            super(null);
            this.jvmPrimitiveType = jvmPrimitiveType;
        }

        @Nullable
        public final JvmPrimitiveType getJvmPrimitiveType() {
            return this.jvmPrimitiveType;
        }
    }

    public /* synthetic */ JvmType(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    @NotNull
    public String toString() {
        return JvmTypeFactoryImpl.INSTANCE.toString(this);
    }

    private JvmType() {
    }
}
