.class public interface abstract annotation Lkotlin/jvm/JvmDefault;
.super Ljava/lang/Object;
.source "JvmDefault.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Deprecated;
    level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
    message = "Switch to new -jvm-default modes: `enable` or `no-compatibility`"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u0002\u0008F\u00ca\u0001\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005\u00ca\u0001\u001a\u0008\u0006\u0012\u0016\u0008\u0007\u0012\u0012\u0008\u000cJ\u0006\u0008\n0\u00088\tJ\u0006\u0008\n0\u00088\n\u00ca\u0001\u0018\u0008\u000b\u0012\u0008\u0008\u000c\u0012\u0004\u0008\u0008(\r\u0012\n\u0008\u000e\u0012\u0006\u0008\n0\u000f8\u0010\u00a8\u0006\u0002"
    }
    d2 = {
        "Lkotlin/jvm/JvmDefault;",
        "",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.2",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "FUNCTION",
        "PROPERTY",
        "Lkotlin/Deprecated;",
        "message",
        "Switch to new -jvm-default modes: `enable` or `no-compatibility`",
        "level",
        "Lkotlin/DeprecationLevel;",
        "HIDDEN"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/annotation/Target;
    allowedTargets = {
        .enum Lkotlin/annotation/AnnotationTarget;->FUNCTION:Lkotlin/annotation/AnnotationTarget;,
        .enum Lkotlin/annotation/AnnotationTarget;->PROPERTY:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation
