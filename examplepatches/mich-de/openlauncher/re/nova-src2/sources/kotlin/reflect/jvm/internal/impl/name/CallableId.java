package kotlin.reflect.jvm.internal.impl.name;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

/* loaded from: classes5.dex */
public final class CallableId {

    @NotNull
    public static final Companion Companion = new Companion(null);

    @NotNull
    private static final Name LOCAL_NAME;

    @NotNull
    private static final FqName PACKAGE_FQ_NAME_FOR_LOCAL;

    @NotNull
    private final Name callableName;

    @Nullable
    private final FqName className;

    @NotNull
    private final FqName packageName;

    @Nullable
    private final FqName pathToLocal;

    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    static {
        Name name = SpecialNames.LOCAL;
        LOCAL_NAME = name;
        FqName fqName = FqName.topLevel(name);
        Intrinsics.f(fqName, "topLevel(...)");
        PACKAGE_FQ_NAME_FOR_LOCAL = fqName;
    }

    public CallableId(@NotNull FqName packageName, @Nullable FqName fqName, @NotNull Name callableName, @Nullable FqName fqName2) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(callableName, "callableName");
        this.packageName = packageName;
        this.className = fqName;
        this.callableName = callableName;
        this.pathToLocal = fqName2;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CallableId)) {
            return false;
        }
        CallableId callableId = (CallableId) obj;
        return Intrinsics.b(this.packageName, callableId.packageName) && Intrinsics.b(this.className, callableId.className) && Intrinsics.b(this.callableName, callableId.callableName) && Intrinsics.b(this.pathToLocal, callableId.pathToLocal);
    }

    public int hashCode() {
        int iHashCode = this.packageName.hashCode() * 31;
        FqName fqName = this.className;
        int iHashCode2 = (this.callableName.hashCode() + ((iHashCode + (fqName == null ? 0 : fqName.hashCode())) * 31)) * 31;
        FqName fqName2 = this.pathToLocal;
        return iHashCode2 + (fqName2 != null ? fqName2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder();
        String strAsString = this.packageName.asString();
        Intrinsics.f(strAsString, "asString(...)");
        sb2.append(j.E0(strAsString, '.', '/'));
        sb2.append("/");
        FqName fqName = this.className;
        if (fqName != null) {
            sb2.append(fqName);
            sb2.append(".");
        }
        sb2.append(this.callableName);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public /* synthetic */ CallableId(FqName fqName, FqName fqName2, Name name, FqName fqName3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(fqName, fqName2, name, (i5 & 8) != 0 ? null : fqName3);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public CallableId(@NotNull FqName packageName, @NotNull Name callableName) {
        this(packageName, null, callableName, null, 8, null);
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(callableName, "callableName");
    }
}
