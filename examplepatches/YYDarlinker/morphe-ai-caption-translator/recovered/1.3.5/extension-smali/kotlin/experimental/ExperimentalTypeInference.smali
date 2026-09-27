.class public interface abstract annotation Lkotlin/experimental/ExperimentalTypeInference;
.super Ljava/lang/Object;
.source "inferenceMarker.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->CLASS:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->ANNOTATION_TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u0002\u0008F\u00ca\u0001\u000e\u0008\u0003\u0012\n\u0008\u0004\u0012\u0006\u0008\n0\u00058\u0006\u00ca\u0001\u0002\u0008\u0007\u00ca\u0001\u000e\u0008\u0008\u0012\n\u0008\t\u0012\u0006\u0008\n0\n8\u000b\u00ca\u0001\u0012\u0008\u000c\u0012\u000e\u0008\r\u0012\n\u0008\u000cJ\u0006\u0008\n0\u000e8\u000f\u00ca\u0001\u000c\u0008\u0010\u0012\u0008\u0008\u0011\u0012\u0004\u0008\u0008(\u0012\u00a8\u0006\u0002"
    }
    d2 = {
        "Lkotlin/experimental/ExperimentalTypeInference;",
        "",
        "kotlin-stdlib",
        "Lkotlin/RequiresOptIn;",
        "level",
        "Lkotlin/RequiresOptIn$Level;",
        "ERROR",
        "Lkotlin/annotation/MustBeDocumented;",
        "Lkotlin/annotation/Retention;",
        "value",
        "Lkotlin/annotation/AnnotationRetention;",
        "BINARY",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "ANNOTATION_CLASS",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/annotation/MustBeDocumented;
.end annotation

.annotation runtime Lkotlin/annotation/Retention;
    value = .enum Lkotlin/annotation/AnnotationRetention;->BINARY:Lkotlin/annotation/AnnotationRetention;
.end annotation

.annotation runtime Lkotlin/annotation/Target;
    allowedTargets = {
        .enum Lkotlin/annotation/AnnotationTarget;->ANNOTATION_CLASS:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation
