package kotlin.annotation;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/annotation/AnnotationTarget;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class AnnotationTarget {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ AnnotationTarget[] f71711a;

    static {
        AnnotationTarget[] annotationTargetArr = {new AnnotationTarget("CLASS", 0), new AnnotationTarget("ANNOTATION_CLASS", 1), new AnnotationTarget("TYPE_PARAMETER", 2), new AnnotationTarget("PROPERTY", 3), new AnnotationTarget("FIELD", 4), new AnnotationTarget("LOCAL_VARIABLE", 5), new AnnotationTarget("VALUE_PARAMETER", 6), new AnnotationTarget("CONSTRUCTOR", 7), new AnnotationTarget("FUNCTION", 8), new AnnotationTarget("PROPERTY_GETTER", 9), new AnnotationTarget("PROPERTY_SETTER", 10), new AnnotationTarget("TYPE", 11), new AnnotationTarget("EXPRESSION", 12), new AnnotationTarget("FILE", 13), new AnnotationTarget("TYPEALIAS", 14)};
        f71711a = annotationTargetArr;
        EnumEntriesKt.a(annotationTargetArr);
    }

    public static AnnotationTarget valueOf(String str) {
        return (AnnotationTarget) Enum.valueOf(AnnotationTarget.class, str);
    }

    public static AnnotationTarget[] values() {
        return (AnnotationTarget[]) f71711a.clone();
    }
}
