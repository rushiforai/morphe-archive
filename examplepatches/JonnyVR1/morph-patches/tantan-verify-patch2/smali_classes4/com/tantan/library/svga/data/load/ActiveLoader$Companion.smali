.class public final Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/load/ActiveLoader;
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
        "Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;",
        "",
        "()V",
        "builder",
        "Lcom/tantan/library/svga/data/load/ActiveLoader;",
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
    invoke-direct {p0}, Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/ActiveLoader;
    .locals 1
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
    new-instance p0, Lcom/tantan/library/svga/data/load/ActiveLoader;

    .line 5
    .line 6
    sget-object v0, Lcom/tantan/library/svga/data/load/MemoryLoader;->Companion:Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;->builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/MemoryLoader;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/data/load/ActiveLoader;-><init>(Lcom/tantan/library/svga/data/load/DataLoader;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method
