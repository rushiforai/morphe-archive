.class public interface abstract annotation Lkotlin/annotation/Target;
.super Ljava/lang/Object;
.source "Annotations.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->ANNOTATION_TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u0016\u0008F\u0012\u0012\u0010\u0002\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00040\u0003\"\u00020\u0004R\u001b\u0010\u0002\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00040\u0003X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0002\u0010\u0005\u00ca\u0001\u0012\u0008\u0000\u0012\u000e\u0008\u0002\u0012\n\u0008\u000cJ\u0006\u0008\n0\u00048\u0007\u00ca\u0001\u0002\u0008\u0008\u00a8\u0006\u0006"
    }
    d2 = {
        "Lkotlin/annotation/Target;",
        "",
        "allowedTargets",
        "",
        "Lkotlin/annotation/AnnotationTarget;",
        "()[Lkotlin/annotation/AnnotationTarget;",
        "kotlin-stdlib",
        "ANNOTATION_CLASS",
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

.annotation runtime Lkotlin/annotation/Target;
    allowedTargets = {
        .enum Lkotlin/annotation/AnnotationTarget;->ANNOTATION_CLASS:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation


# virtual methods
.method public abstract allowedTargets()[Lkotlin/annotation/AnnotationTarget;
.end method
