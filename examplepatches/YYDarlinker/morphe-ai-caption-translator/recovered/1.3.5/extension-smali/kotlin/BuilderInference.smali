.class public interface abstract annotation Lkotlin/BuilderInference;
.super Ljava/lang/Object;
.source "Inference.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->CLASS:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->PARAMETER:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Deprecated;
    message = "BuilderInference annotation must not be used anymore. Builder inference is enabled automatically for builder calls if needed."
.end annotation

.annotation runtime Lkotlin/DeprecatedSinceKotlin;
    errorSince = "2.5"
    hiddenSince = "2.6"
    warningSince = "2.0"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u0002\u0008F\u00ca\u0001\"\u0008\u0003\u0012\u001e\u0008\u0004\u0012\u001a\u0008\u000cJ\u0006\u0008\n0\u00058\u0006J\u0006\u0008\n0\u00058\u0007J\u0006\u0008\n0\u00058\u0008\u00ca\u0001\u000e\u0008\t\u0012\n\u0008\n\u0012\u0006\u0008\n0\u000b8\u000c\u00ca\u0001\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000f\u00ca\u0001\u0002\u0008\u0010\u00ca\u0001\u000c\u0008\u0011\u0012\u0008\u0008\u0012\u0012\u0004\u0008\u0008(\u0013\u00ca\u0001 \u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0016\u0012\u0008\u0008\u0017\u0012\u0004\u0008\u0008(\u0018\u0012\u0008\u0008\u0019\u0012\u0004\u0008\u0008(\u001a\u00a8\u0006\u0002"
    }
    d2 = {
        "Lkotlin/BuilderInference;",
        "",
        "kotlin-stdlib",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "VALUE_PARAMETER",
        "FUNCTION",
        "PROPERTY",
        "Lkotlin/annotation/Retention;",
        "value",
        "Lkotlin/annotation/AnnotationRetention;",
        "BINARY",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "Lkotlin/experimental/ExperimentalTypeInference;",
        "Lkotlin/Deprecated;",
        "message",
        "BuilderInference annotation must not be used anymore. Builder inference is enabled automatically for builder calls if needed.",
        "Lkotlin/DeprecatedSinceKotlin;",
        "warningSince",
        "2.0",
        "errorSince",
        "2.5",
        "hiddenSince",
        "2.6"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/annotation/Retention;
    value = .enum Lkotlin/annotation/AnnotationRetention;->BINARY:Lkotlin/annotation/AnnotationRetention;
.end annotation

.annotation runtime Lkotlin/annotation/Target;
    allowedTargets = {
        .enum Lkotlin/annotation/AnnotationTarget;->VALUE_PARAMETER:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->FUNCTION:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->PROPERTY:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation
