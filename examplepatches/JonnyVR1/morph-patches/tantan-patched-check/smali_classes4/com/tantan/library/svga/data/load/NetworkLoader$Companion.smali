.class public final Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/load/NetworkLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;",
        "",
        "()V",
        "builder",
        "Lcom/tantan/library/svga/data/load/NetworkLoader;",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/NetworkLoader;
    .locals 2
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Lcom/tantan/library/svga/data/load/NetworkLoader;

    .line 5
    .line 6
    new-instance v0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;

    .line 7
    .line 8
    new-instance v1, Ljava/net/URL;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->get()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;-><init>(Ljava/net/URL;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/tantan/library/svga/data/load/NetworkLoader;-><init>(Lcom/tantan/library/svga/data/fetcher/DataFetcher;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method
