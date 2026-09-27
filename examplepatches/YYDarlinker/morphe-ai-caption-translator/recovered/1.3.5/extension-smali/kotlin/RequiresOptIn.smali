.class public interface abstract annotation Lkotlin/RequiresOptIn;
.super Ljava/lang/Object;
.source "OptIn.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lkotlin/RequiresOptIn;
        level = .enum Lkotlin/RequiresOptIn$Level;->ERROR:Lkotlin/RequiresOptIn$Level;
        message = ""
    .end subannotation
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/RequiresOptIn$Level;
    }
.end annotation

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
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0087\u0002\u0018\u00002\u00020\u0001:\u0001\nB$\u0008F\u0012\u000e\u0008\u0002\u0010\u0002\u001a\u00020\u0003B\u0004\u0008\u0008(\u0004\u0012\u0010\u0008\u0002\u0010\u0005\u001a\u00020\u0006B\u0006\u0008\n0\u00068\u0007R\u0013\u0010\u0002\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0002\u0010\u0008R\u0013\u0010\u0005\u001a\u00020\u0006X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\t\u00ca\u0001\u0012\u0008\u000c\u0012\u000e\u0008\r\u0012\n\u0008\u000cJ\u0006\u0008\n0\u000e8\u000f\u00ca\u0001\u000e\u0008\u0010\u0012\n\u0008\u0011\u0012\u0006\u0008\n0\u00128\u0013\u00ca\u0001\u0002\u0008\u0014\u00ca\u0001\u000c\u0008\u0015\u0012\u0008\u0008\u0016\u0012\u0004\u0008\u0008(\u0017\u00a8\u0006\u000b"
    }
    d2 = {
        "Lkotlin/RequiresOptIn;",
        "",
        "message",
        "",
        "",
        "level",
        "Lkotlin/RequiresOptIn$Level;",
        "ERROR",
        "()Ljava/lang/String;",
        "()Lkotlin/RequiresOptIn$Level;",
        "Level",
        "kotlin-stdlib",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "ANNOTATION_CLASS",
        "Lkotlin/annotation/Retention;",
        "value",
        "Lkotlin/annotation/AnnotationRetention;",
        "BINARY",
        "Lkotlin/annotation/MustBeDocumented;",
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


# virtual methods
.method public abstract level()Lkotlin/RequiresOptIn$Level;
.end method

.method public abstract message()Ljava/lang/String;
.end method
