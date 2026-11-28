.class public interface abstract annotation Lkotlin/ReplaceWith;
.super Ljava/lang/Object;
.source "Annotations.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->CLASS:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {}
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u001e\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0012\u0010\u0004\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00030\u0005\"\u00020\u0003R\u0013\u0010\u0002\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0002\u0010\u0006R\u001b\u0010\u0004\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00030\u0005X\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0007\u00ca\u0001\n\u0008\t\u0012\u0006\u0008\n\u0012\u0002\u0008\u000c\u00ca\u0001\u000e\u0008\u000b\u0012\n\u0008\u000c\u0012\u0006\u0008\n0\r8\u000e\u00ca\u0001\u0002\u0008\u000f\u00a8\u0006\u0008"
    }
    d2 = {
        "Lkotlin/ReplaceWith;",
        "",
        "expression",
        "",
        "imports",
        "",
        "()Ljava/lang/String;",
        "()[Ljava/lang/String;",
        "kotlin-stdlib",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
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
    allowedTargets = {}
.end annotation


# virtual methods
.method public abstract expression()Ljava/lang/String;
.end method

.method public abstract imports()[Ljava/lang/String;
.end method
