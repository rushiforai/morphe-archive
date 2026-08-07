.class public final Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0005\u001a\u00020\u0004R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader$Companion;",
        "",
        "()V",
        "instance",
        "Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;",
        "get",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;->access$getInstance$cp()Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const-class p0, Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;

    .line 8
    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    monitor-enter p0

    .line 14
    :try_start_0
    invoke-static {}, Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;->access$getInstance$cp()Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    new-instance v0, Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-direct {v0, v1}, Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;->access$setInstance$cp(Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    monitor-exit p0

    .line 35
    goto :goto_2

    .line 36
    :goto_1
    monitor-exit p0

    .line 37
    throw v0

    .line 38
    :cond_1
    :goto_2
    invoke-static {}, Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;->access$getInstance$cp()Lcom/immomo/svgaplayer/setting/SVGAEntityCacheLoader;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-nez p0, :cond_2

    .line 43
    .line 44
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object p0
.end method
