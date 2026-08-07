.class public final Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/load/MemoryLoader;
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
        "Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;",
        "",
        "()V",
        "builder",
        "Lcom/tantan/library/svga/data/load/MemoryLoader;",
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
    invoke-direct {p0}, Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/MemoryLoader;
    .locals 4
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
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->get()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x2

    .line 9
    const/4 v1, 0x0

    .line 10
    const-string v2, "http"

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-static {p0, v2, v3, v0, v1}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    new-instance p0, Lcom/tantan/library/svga/data/load/MemoryLoader;

    .line 20
    .line 21
    sget-object v0, Lcom/tantan/library/svga/data/load/DiskLoader;->Companion:Lcom/tantan/library/svga/data/load/DiskLoader$Companion;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/data/load/DiskLoader$Companion;->builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/DiskLoader;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/data/load/MemoryLoader;-><init>(Lcom/tantan/library/svga/data/load/DataLoader;)V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    new-instance p0, Lcom/tantan/library/svga/data/load/MemoryLoader;

    .line 32
    .line 33
    sget-object v0, Lcom/tantan/library/svga/data/load/AssetsLoader;->Companion:Lcom/tantan/library/svga/data/load/AssetsLoader$Companion;

    .line 34
    .line 35
    const-string v1, "svga"

    .line 36
    .line 37
    invoke-virtual {v0, p1, v1}, Lcom/tantan/library/svga/data/load/AssetsLoader$Companion;->builder(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/String;)Lcom/tantan/library/svga/data/load/AssetsLoader;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/data/load/MemoryLoader;-><init>(Lcom/tantan/library/svga/data/load/DataLoader;)V

    .line 42
    .line 43
    .line 44
    return-object p0
.end method
