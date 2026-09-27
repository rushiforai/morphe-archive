.class final Lkotlin/internal/PlatformImplementations$ReflectThrowable;
.super Ljava/lang/Object;
.source "PlatformImplementations.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/internal/PlatformImplementations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ReflectThrowable"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPlatformImplementations.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PlatformImplementations.kt\nkotlin/internal/PlatformImplementations$ReflectThrowable\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,94:1\n1#2:95\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0018\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0084\u0008\u0092\u0002\u0002\u0008\u0006\u00a2\u0006\u0002\n\u0000R\u0018\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0084\u0008\u0092\u0002\u0002\u0008\u0006\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0008"
    }
    d2 = {
        "Lkotlin/internal/PlatformImplementations$ReflectThrowable;",
        "",
        "<init>",
        "()V",
        "addSuppressed",
        "Ljava/lang/reflect/Method;",
        "Lkotlin/jvm/JvmField;",
        "getSuppressed",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lkotlin/internal/PlatformImplementations$ReflectThrowable;

.field public static final addSuppressed:Ljava/lang/reflect/Method;

.field public static final getSuppressed:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lkotlin/internal/PlatformImplementations$ReflectThrowable;

    invoke-direct {v0}, Lkotlin/internal/PlatformImplementations$ReflectThrowable;-><init>()V

    sput-object v0, Lkotlin/internal/PlatformImplementations$ReflectThrowable;->INSTANCE:Lkotlin/internal/PlatformImplementations$ReflectThrowable;

    .line 25
    const-class v0, Ljava/lang/Throwable;

    .line 26
    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    .line 27
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_13
    const/4 v5, 0x0

    if-ge v4, v2, :cond_3d

    aget-object v6, v1, v4

    .line 28
    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "addSuppressed"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3a

    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    const-string v8, "getParameterTypes(...)"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, [Ljava/lang/Object;

    invoke-static {v7}, Lkotlin/collections/ArraysKt;->singleOrNull([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3a

    goto :goto_3e

    :cond_3a
    add-int/lit8 v4, v4, 0x1

    goto :goto_13

    :cond_3d
    move-object v6, v5

    .line 27
    :goto_3e
    sput-object v6, Lkotlin/internal/PlatformImplementations$ReflectThrowable;->addSuppressed:Ljava/lang/reflect/Method;

    .line 30
    array-length v0, v1

    :goto_41
    if-ge v3, v0, :cond_56

    aget-object v2, v1, v3

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v6, "getSuppressed"

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_53

    move-object v5, v2

    goto :goto_56

    :cond_53
    add-int/lit8 v3, v3, 0x1

    goto :goto_41

    :cond_56
    :goto_56
    sput-object v5, Lkotlin/internal/PlatformImplementations$ReflectThrowable;->getSuppressed:Ljava/lang/reflect/Method;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
