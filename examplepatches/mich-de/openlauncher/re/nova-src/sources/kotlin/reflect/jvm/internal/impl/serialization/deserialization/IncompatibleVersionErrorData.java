package kotlin.reflect.jvm.internal.impl.serialization.deserialization;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class IncompatibleVersionErrorData<T> {
    private final T actualVersion;

    @NotNull
    private final ClassId classId;
    private final T compilerVersion;
    private final T expectedVersion;

    @NotNull
    private final String filePath;
    private final T languageVersion;

    public IncompatibleVersionErrorData(T t6, T t9, T t10, T t11, @NotNull String filePath, @NotNull ClassId classId) {
        Intrinsics.g(filePath, "filePath");
        Intrinsics.g(classId, "classId");
        this.actualVersion = t6;
        this.compilerVersion = t9;
        this.languageVersion = t10;
        this.expectedVersion = t11;
        this.filePath = filePath;
        this.classId = classId;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IncompatibleVersionErrorData)) {
            return false;
        }
        IncompatibleVersionErrorData incompatibleVersionErrorData = (IncompatibleVersionErrorData) obj;
        return Intrinsics.b(this.actualVersion, incompatibleVersionErrorData.actualVersion) && Intrinsics.b(this.compilerVersion, incompatibleVersionErrorData.compilerVersion) && Intrinsics.b(this.languageVersion, incompatibleVersionErrorData.languageVersion) && Intrinsics.b(this.expectedVersion, incompatibleVersionErrorData.expectedVersion) && Intrinsics.b(this.filePath, incompatibleVersionErrorData.filePath) && Intrinsics.b(this.classId, incompatibleVersionErrorData.classId);
    }

    public int hashCode() {
        T t6 = this.actualVersion;
        int iHashCode = (t6 == null ? 0 : t6.hashCode()) * 31;
        T t9 = this.compilerVersion;
        int iHashCode2 = (iHashCode + (t9 == null ? 0 : t9.hashCode())) * 31;
        T t10 = this.languageVersion;
        int iHashCode3 = (iHashCode2 + (t10 == null ? 0 : t10.hashCode())) * 31;
        T t11 = this.expectedVersion;
        return this.classId.hashCode() + c0.e((iHashCode3 + (t11 != null ? t11.hashCode() : 0)) * 31, 31, this.filePath);
    }

    @NotNull
    public String toString() {
        return "IncompatibleVersionErrorData(actualVersion=" + this.actualVersion + ", compilerVersion=" + this.compilerVersion + ", languageVersion=" + this.languageVersion + ", expectedVersion=" + this.expectedVersion + ", filePath=" + this.filePath + ", classId=" + this.classId + ')';
    }
}
