package kotlin.reflect.jvm.internal.impl.load.java;

import kotlin.KotlinVersion;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class JavaNullabilityAnnotationsStatus {

    @NotNull
    public static final Companion Companion = new Companion(null);

    @NotNull
    private static final JavaNullabilityAnnotationsStatus DEFAULT = new JavaNullabilityAnnotationsStatus(ReportLevel.STRICT, null, null, 6, null);

    @NotNull
    private final ReportLevel reportLevelAfter;

    @NotNull
    private final ReportLevel reportLevelBefore;

    @Nullable
    private final KotlinVersion sinceVersion;

    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final JavaNullabilityAnnotationsStatus getDEFAULT() {
            return JavaNullabilityAnnotationsStatus.DEFAULT;
        }

        private Companion() {
        }
    }

    public JavaNullabilityAnnotationsStatus(@NotNull ReportLevel reportLevelBefore, @Nullable KotlinVersion kotlinVersion, @NotNull ReportLevel reportLevelAfter) {
        Intrinsics.g(reportLevelBefore, "reportLevelBefore");
        Intrinsics.g(reportLevelAfter, "reportLevelAfter");
        this.reportLevelBefore = reportLevelBefore;
        this.sinceVersion = kotlinVersion;
        this.reportLevelAfter = reportLevelAfter;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof JavaNullabilityAnnotationsStatus)) {
            return false;
        }
        JavaNullabilityAnnotationsStatus javaNullabilityAnnotationsStatus = (JavaNullabilityAnnotationsStatus) obj;
        return this.reportLevelBefore == javaNullabilityAnnotationsStatus.reportLevelBefore && Intrinsics.b(this.sinceVersion, javaNullabilityAnnotationsStatus.sinceVersion) && this.reportLevelAfter == javaNullabilityAnnotationsStatus.reportLevelAfter;
    }

    @NotNull
    public final ReportLevel getReportLevelAfter() {
        return this.reportLevelAfter;
    }

    @NotNull
    public final ReportLevel getReportLevelBefore() {
        return this.reportLevelBefore;
    }

    @Nullable
    public final KotlinVersion getSinceVersion() {
        return this.sinceVersion;
    }

    public int hashCode() {
        int iHashCode = this.reportLevelBefore.hashCode() * 31;
        KotlinVersion kotlinVersion = this.sinceVersion;
        return this.reportLevelAfter.hashCode() + ((iHashCode + (kotlinVersion == null ? 0 : kotlinVersion.f71678d)) * 31);
    }

    @NotNull
    public String toString() {
        return "JavaNullabilityAnnotationsStatus(reportLevelBefore=" + this.reportLevelBefore + ", sinceVersion=" + this.sinceVersion + ", reportLevelAfter=" + this.reportLevelAfter + ')';
    }

    public JavaNullabilityAnnotationsStatus(ReportLevel reportLevel, KotlinVersion kotlinVersion, ReportLevel reportLevel2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(reportLevel, (i5 & 2) != 0 ? new KotlinVersion(1, 0, 0) : kotlinVersion, (i5 & 4) != 0 ? reportLevel : reportLevel2);
    }
}
