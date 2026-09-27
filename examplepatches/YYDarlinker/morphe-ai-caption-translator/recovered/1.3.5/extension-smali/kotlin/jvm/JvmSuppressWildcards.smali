.class public interface abstract annotation Lkotlin/jvm/JvmSuppressWildcards;
.super Ljava/lang/Object;
.source "JvmPlatformAnnotations.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lkotlin/jvm/JvmSuppressWildcards;
        suppress = true
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->CLASS:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u0012\u0008F\u0012\u000e\u0008\u0002\u0010\u0002\u001a\u00020\u0003B\u0004\u0008\u0007\u0010\u0002R\u0013\u0010\u0002\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0002\u0010\u0004\u00ca\u0001*\u0008\u0006\u0012&\u0008\u0007\u0012\"\u0008\u000cJ\u0006\u0008\n0\u00088\tJ\u0006\u0008\n0\u00088\nJ\u0006\u0008\n0\u00088\u000bJ\u0006\u0008\n0\u00088\u000c\u00ca\u0001\u000e\u0008\r\u0012\n\u0008\u000e\u0012\u0006\u0008\n0\u000f8\u0010\u00ca\u0001\u0002\u0008\u0011\u00a8\u0006\u0005"
    }
    d2 = {
        "Lkotlin/jvm/JvmSuppressWildcards;",
        "",
        "suppress",
        "",
        "()Z",
        "kotlin-stdlib",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "CLASS",
        "FUNCTION",
        "PROPERTY",
        "TYPE",
        "Lkotlin/annotation/Retention;",
        "value",
        "Lkotlin/annotation/AnnotationRetention;",
        "BINARY",
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
    value = .enum Lkotlin/annotation/AnnotationRetention;->BINARY:Lkotlin/annotation/AnnotationRetention;
.end annotation

.annotation runtime Lkotlin/annotation/Target;
    allowedTargets = {
        .enum Lkotlin/annotation/AnnotationTarget;->CLASS:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->FUNCTION:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->PROPERTY:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->TYPE:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation


# virtual methods
.method public abstract suppress()Z
.end method
