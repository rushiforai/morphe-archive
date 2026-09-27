.class public interface abstract annotation Lkotlin/jvm/Strictfp;
.super Ljava/lang/Object;
.source "JvmFlagAnnotations.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->CONSTRUCTOR:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u0002\u0008F\u00ca\u00012\u0008\u0003\u0012.\u0008\u0004\u0012*\u0008\u000cJ\u0006\u0008\n0\u00058\u0006J\u0006\u0008\n0\u00058\u0007J\u0006\u0008\n0\u00058\u0008J\u0006\u0008\n0\u00058\tJ\u0006\u0008\n0\u00058\n\u00ca\u0001\u000e\u0008\u000b\u0012\n\u0008\u000c\u0012\u0006\u0008\n0\r8\u000e\u00ca\u0001\u0002\u0008\u000f\u00a8\u0006\u0002"
    }
    d2 = {
        "Lkotlin/jvm/Strictfp;",
        "",
        "kotlin-stdlib",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "FUNCTION",
        "CONSTRUCTOR",
        "PROPERTY_GETTER",
        "PROPERTY_SETTER",
        "CLASS",
        "Lkotlin/annotation/Retention;",
        "value",
        "Lkotlin/annotation/AnnotationRetention;",
        "SOURCE",
        "Lkotlin/annotation/MustBeDocumented;"
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
    value = .enum Lkotlin/annotation/AnnotationRetention;->SOURCE:Lkotlin/annotation/AnnotationRetention;
.end annotation

.annotation runtime Lkotlin/annotation/Target;
    allowedTargets = {
        .enum Lkotlin/annotation/AnnotationTarget;->FUNCTION:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->CONSTRUCTOR:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->PROPERTY_GETTER:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->PROPERTY_SETTER:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->CLASS:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation
