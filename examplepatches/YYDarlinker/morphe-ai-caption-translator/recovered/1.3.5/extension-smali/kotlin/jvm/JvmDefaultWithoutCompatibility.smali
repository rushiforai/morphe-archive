.class public interface abstract annotation Lkotlin/jvm/JvmDefaultWithoutCompatibility;
.super Ljava/lang/Object;
.source "JvmDefault.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u0002\u0008F\u00ca\u0001\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005\u00ca\u0001\u000e\u0008\u0006\u0012\n\u0008\u0007\u0012\u0006\u0008\n0\u00088\t\u00ca\u0001\u0012\u0008\n\u0012\u000e\u0008\u000b\u0012\n\u0008\u000cJ\u0006\u0008\n0\u000c8\r\u00a8\u0006\u0002"
    }
    d2 = {
        "Lkotlin/jvm/JvmDefaultWithoutCompatibility;",
        "",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.4",
        "Lkotlin/annotation/Retention;",
        "value",
        "Lkotlin/annotation/AnnotationRetention;",
        "SOURCE",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "CLASS"
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
    value = .enum Lkotlin/annotation/AnnotationRetention;->SOURCE:Lkotlin/annotation/AnnotationRetention;
.end annotation

.annotation runtime Lkotlin/annotation/Target;
    allowedTargets = {
        .enum Lkotlin/annotation/AnnotationTarget;->CLASS:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation
