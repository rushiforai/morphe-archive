package kotlin.reflect.jvm.internal.impl.load.java;

import b.c0;
import kotlin.KotlinVersion;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.load.java.JavaNullabilityAnnotationsStatus;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JavaNullabilityAnnotationSettingsKt {

    @NotNull
    private static final FqName CHECKER_FRAMEWORK_COMPATQUAL_ANNOTATIONS_PACKAGE;

    @NotNull
    private static final FqName JSPECIFY_ANNOTATIONS_PACKAGE;

    @NotNull
    private static final FqName JSPECIFY_OLD_ANNOTATIONS_PACKAGE;

    @NotNull
    private static final JavaNullabilityAnnotationsStatus JSR_305_DEFAULT_SETTINGS;

    @NotNull
    private static final NullabilityAnnotationStates<JavaNullabilityAnnotationsStatus> NULLABILITY_ANNOTATION_SETTINGS;

    @NotNull
    private static final FqName[] RXJAVA3_ANNOTATIONS;

    @NotNull
    private static final FqName RXJAVA3_ANNOTATIONS_PACKAGE;

    @NotNull
    private static final String RXJAVA3_ANNOTATIONS_PACKAGE_NAME;

    static {
        FqName fqName = new FqName("org.jspecify.nullness");
        JSPECIFY_OLD_ANNOTATIONS_PACKAGE = fqName;
        FqName fqName2 = new FqName("org.jspecify.annotations");
        JSPECIFY_ANNOTATIONS_PACKAGE = fqName2;
        FqName fqName3 = new FqName("io.reactivex.rxjava3.annotations");
        RXJAVA3_ANNOTATIONS_PACKAGE = fqName3;
        FqName fqName4 = new FqName("org.checkerframework.checker.nullness.compatqual");
        CHECKER_FRAMEWORK_COMPATQUAL_ANNOTATIONS_PACKAGE = fqName4;
        String strAsString = fqName3.asString();
        Intrinsics.f(strAsString, "asString(...)");
        RXJAVA3_ANNOTATIONS_PACKAGE_NAME = strAsString;
        RXJAVA3_ANNOTATIONS = new FqName[]{new FqName(c0.E(strAsString, ".Nullable")), new FqName(c0.E(strAsString, ".NonNull"))};
        FqName fqName5 = new FqName("org.jetbrains.annotations");
        JavaNullabilityAnnotationsStatus.Companion companion = JavaNullabilityAnnotationsStatus.Companion;
        Pair pair = new Pair(fqName5, companion.getDEFAULT());
        Pair pair2 = new Pair(new FqName("androidx.annotation"), companion.getDEFAULT());
        Pair pair3 = new Pair(new FqName("android.support.annotation"), companion.getDEFAULT());
        Pair pair4 = new Pair(new FqName("android.annotation"), companion.getDEFAULT());
        Pair pair5 = new Pair(new FqName("com.android.annotations"), companion.getDEFAULT());
        Pair pair6 = new Pair(new FqName("org.eclipse.jdt.annotation"), companion.getDEFAULT());
        Pair pair7 = new Pair(new FqName("org.checkerframework.checker.nullness.qual"), companion.getDEFAULT());
        Pair pair8 = new Pair(fqName4, companion.getDEFAULT());
        Pair pair9 = new Pair(new FqName("javax.annotation"), companion.getDEFAULT());
        Pair pair10 = new Pair(new FqName("edu.umd.cs.findbugs.annotations"), companion.getDEFAULT());
        Pair pair11 = new Pair(new FqName("io.reactivex.annotations"), companion.getDEFAULT());
        FqName fqName6 = new FqName("androidx.annotation.RecentlyNullable");
        ReportLevel reportLevel = ReportLevel.WARN;
        Pair pair12 = new Pair(fqName6, new JavaNullabilityAnnotationsStatus(reportLevel, null, null, 4, null));
        Pair pair13 = new Pair(new FqName("androidx.annotation.RecentlyNonNull"), new JavaNullabilityAnnotationsStatus(reportLevel, null, null, 4, null));
        Pair pair14 = new Pair(new FqName("lombok"), companion.getDEFAULT());
        KotlinVersion kotlinVersion = new KotlinVersion(2, 0, 0);
        ReportLevel reportLevel2 = ReportLevel.STRICT;
        NULLABILITY_ANNOTATION_SETTINGS = new NullabilityAnnotationStatesImpl(MapsKt.j0(pair, pair2, pair3, pair4, pair5, pair6, pair7, pair8, pair9, pair10, pair11, pair12, pair13, pair14, new Pair(fqName, new JavaNullabilityAnnotationsStatus(reportLevel, kotlinVersion, reportLevel2)), new Pair(fqName2, new JavaNullabilityAnnotationsStatus(reportLevel, new KotlinVersion(2, 0, 0), reportLevel2)), new Pair(fqName3, new JavaNullabilityAnnotationsStatus(reportLevel, new KotlinVersion(1, 8, 0), reportLevel2))));
        JSR_305_DEFAULT_SETTINGS = new JavaNullabilityAnnotationsStatus(reportLevel, null, null, 4, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0021  */
    @NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Jsr305Settings getDefaultJsr305Settings(@NotNull KotlinVersion configuredKotlinVersion) {
        ReportLevel reportLevelAfter;
        Intrinsics.g(configuredKotlinVersion, "configuredKotlinVersion");
        JavaNullabilityAnnotationsStatus javaNullabilityAnnotationsStatus = JSR_305_DEFAULT_SETTINGS;
        if (javaNullabilityAnnotationsStatus.getSinceVersion() != null) {
            KotlinVersion sinceVersion = javaNullabilityAnnotationsStatus.getSinceVersion();
            sinceVersion.getClass();
            reportLevelAfter = sinceVersion.f71678d - configuredKotlinVersion.f71678d <= 0 ? javaNullabilityAnnotationsStatus.getReportLevelAfter() : javaNullabilityAnnotationsStatus.getReportLevelBefore();
        }
        ReportLevel reportLevel = reportLevelAfter;
        return new Jsr305Settings(reportLevel, getDefaultMigrationJsr305ReportLevelForGivenGlobal(reportLevel), null, 4, null);
    }

    public static /* synthetic */ Jsr305Settings getDefaultJsr305Settings$default(KotlinVersion kotlinVersion, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            kotlinVersion = KotlinVersion.f71674e;
        }
        return getDefaultJsr305Settings(kotlinVersion);
    }

    @Nullable
    public static final ReportLevel getDefaultMigrationJsr305ReportLevelForGivenGlobal(@NotNull ReportLevel globalReportLevel) {
        Intrinsics.g(globalReportLevel, "globalReportLevel");
        if (globalReportLevel == ReportLevel.WARN) {
            return null;
        }
        return globalReportLevel;
    }

    @NotNull
    public static final ReportLevel getDefaultReportLevelForAnnotation(@NotNull FqName annotationFqName) {
        Intrinsics.g(annotationFqName, "annotationFqName");
        return getReportLevelForAnnotation$default(annotationFqName, NullabilityAnnotationStates.Companion.getEMPTY(), null, 4, null);
    }

    @NotNull
    public static final FqName getJSPECIFY_ANNOTATIONS_PACKAGE() {
        return JSPECIFY_ANNOTATIONS_PACKAGE;
    }

    @NotNull
    public static final FqName[] getRXJAVA3_ANNOTATIONS() {
        return RXJAVA3_ANNOTATIONS;
    }

    @NotNull
    public static final ReportLevel getReportLevelForAnnotation(@NotNull FqName annotation, @NotNull NullabilityAnnotationStates<? extends ReportLevel> configuredReportLevels, @NotNull KotlinVersion configuredKotlinVersion) {
        Intrinsics.g(annotation, "annotation");
        Intrinsics.g(configuredReportLevels, "configuredReportLevels");
        Intrinsics.g(configuredKotlinVersion, "configuredKotlinVersion");
        ReportLevel reportLevel = configuredReportLevels.get(annotation);
        if (reportLevel != null) {
            return reportLevel;
        }
        JavaNullabilityAnnotationsStatus javaNullabilityAnnotationsStatus = NULLABILITY_ANNOTATION_SETTINGS.get(annotation);
        if (javaNullabilityAnnotationsStatus == null) {
            return ReportLevel.IGNORE;
        }
        if (javaNullabilityAnnotationsStatus.getSinceVersion() != null) {
            KotlinVersion sinceVersion = javaNullabilityAnnotationsStatus.getSinceVersion();
            sinceVersion.getClass();
            if (sinceVersion.f71678d - configuredKotlinVersion.f71678d <= 0) {
                return javaNullabilityAnnotationsStatus.getReportLevelAfter();
            }
        }
        return javaNullabilityAnnotationsStatus.getReportLevelBefore();
    }

    public static /* synthetic */ ReportLevel getReportLevelForAnnotation$default(FqName fqName, NullabilityAnnotationStates nullabilityAnnotationStates, KotlinVersion kotlinVersion, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            kotlinVersion = new KotlinVersion(1, 7, 20);
        }
        return getReportLevelForAnnotation(fqName, nullabilityAnnotationStates, kotlinVersion);
    }
}
