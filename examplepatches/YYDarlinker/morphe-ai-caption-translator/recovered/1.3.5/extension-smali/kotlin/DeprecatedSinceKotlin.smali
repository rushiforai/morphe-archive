.class public interface abstract annotation Lkotlin/DeprecatedSinceKotlin;
.super Ljava/lang/Object;
.source "Annotations.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lkotlin/DeprecatedSinceKotlin;
        errorSince = ""
        hiddenSince = ""
        warningSince = ""
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->CONSTRUCTOR:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->ANNOTATION_TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0087\u0002\u0018\u00002\u00020\u0001B2\u0008F\u0012\u000e\u0008\u0002\u0010\u0002\u001a\u00020\u0003B\u0004\u0008\u0008(\u0004\u0012\u000e\u0008\u0002\u0010\u0005\u001a\u00020\u0003B\u0004\u0008\u0008(\u0004\u0012\u000e\u0008\u0002\u0010\u0006\u001a\u00020\u0003B\u0004\u0008\u0008(\u0004R\u0013\u0010\u0002\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0002\u0010\u0007R\u0013\u0010\u0005\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0007R\u0013\u0010\u0006\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007\u00ca\u0001J\u0008\t\u0012F\u0008\n\u0012B\u0008\u000cJ\u0006\u0008\n0\u000b8\u000cJ\u0006\u0008\n0\u000b8\rJ\u0006\u0008\n0\u000b8\u000eJ\u0006\u0008\n0\u000b8\u000fJ\u0006\u0008\n0\u000b8\u0010J\u0006\u0008\n0\u000b8\u0011J\u0006\u0008\n0\u000b8\u0012J\u0006\u0008\n0\u000b8\u0013\u00ca\u0001\u0002\u0008\u0014\u00ca\u0001\u000c\u0008\u0015\u0012\u0008\u0008\u0016\u0012\u0004\u0008\u0008(\u0017\u00a8\u0006\u0008"
    }
    d2 = {
        "Lkotlin/DeprecatedSinceKotlin;",
        "",
        "warningSince",
        "",
        "",
        "errorSince",
        "hiddenSince",
        "()Ljava/lang/String;",
        "kotlin-stdlib",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "CLASS",
        "FUNCTION",
        "PROPERTY",
        "ANNOTATION_CLASS",
        "CONSTRUCTOR",
        "PROPERTY_SETTER",
        "PROPERTY_GETTER",
        "TYPEALIAS",
        "Lkotlin/annotation/MustBeDocumented;",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.4"
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
        .enum Lkotlin/annotation/AnnotationTarget;->CLASS:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->FUNCTION:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->PROPERTY:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->ANNOTATION_CLASS:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->CONSTRUCTOR:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->PROPERTY_SETTER:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->PROPERTY_GETTER:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->TYPEALIAS:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation


# virtual methods
.method public abstract errorSince()Ljava/lang/String;
.end method

.method public abstract hiddenSince()Ljava/lang/String;
.end method

.method public abstract warningSince()Ljava/lang/String;
.end method
