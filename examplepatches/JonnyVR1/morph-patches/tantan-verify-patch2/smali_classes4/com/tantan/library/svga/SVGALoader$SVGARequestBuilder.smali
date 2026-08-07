.class public final Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/SVGALoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SVGARequestBuilder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0012\u0010\u0005\u001a\u00020\u00002\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0006J\u000e\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u0008J\u000e\u0010\t\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\u0008J\u0016\u0010\u001b\u001a\u00020\u001c2\u000e\u0010\u001d\u001a\n\u0012\u0004\u0012\u00020\u001f\u0018\u00010\u001eJ \u0010 \u001a\u00020\u001c2\u000e\u0010\u001d\u001a\n\u0012\u0004\u0012\u00020\u001f\u0018\u00010\u001e2\u0008\u0008\u0002\u0010!\u001a\u00020\u0008J\u0006\u0010\"\u001a\u00020\u001cJ\u000e\u0010#\u001a\u00020\u00002\u0006\u0010$\u001a\u00020\rJ\u000e\u0010%\u001a\u00020\u00002\u0006\u0010&\u001a\u00020\u001fJ\u000e\u0010\u000e\u001a\u00020\u00002\u0006\u0010\'\u001a\u00020\u000fJ\u000e\u0010(\u001a\u00020\u00002\u0006\u0010&\u001a\u00020\u001fJ\u000e\u0010)\u001a\u00020\u001c2\u0006\u0010*\u001a\u00020+J\u000e\u0010!\u001a\u00020\u00002\u0006\u0010,\u001a\u00020\u0008J\u0012\u0010\u0012\u001a\u00020\u00002\n\u0008\u0002\u0010-\u001a\u0004\u0018\u00010\u0013J\u0010\u0010.\u001a\u00020\u001c2\u0008\u0008\u0002\u0010!\u001a\u00020\u0008J\u000e\u0010\u0014\u001a\u00020\u00002\u0006\u0010/\u001a\u00020\u0015J\u000e\u00100\u001a\u00020\u00002\u0006\u00101\u001a\u00020\u0015J\u000e\u0010\u0017\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u0008J\'\u00102\u001a\u00020\u001c2\u0006\u0010*\u001a\u00020+2\u0006\u00103\u001a\u0002042\u0008\u0010#\u001a\u0004\u0018\u00010\rH\u0000\u00a2\u0006\u0002\u00085R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0016R\u000e\u0010\u0017\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u00066"
    }
    d2 = {
        "Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;",
        "",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "animListener",
        "Lcom/tantan/library/svga/AnimListener;",
        "audioEnable",
        "",
        "autoPlay",
        "getContext$svga_lib_release",
        "()Landroid/content/Context;",
        "dynamicEntity",
        "Lcom/tantan/library/svga/compose/SVGADynamicEntity;",
        "frameMode",
        "Lcom/tantan/library/svga/SVGAnimationView$FrameMode;",
        "keyBuilder",
        "Lcom/tantan/library/svga/ResourceKey$KeyBuilder;",
        "loadCallback",
        "Lcom/tantan/library/svga/data/request/RequestCallback;",
        "repeatCount",
        "",
        "Ljava/lang/Integer;",
        "smoothTransition",
        "listener",
        "enable",
        "auto",
        "batchDownload",
        "",
        "resources",
        "",
        "",
        "batchPreload",
        "isCacheable",
        "downloadOnly",
        "dynamic",
        "entity",
        "error",
        "source",
        "mode",
        "from",
        "into",
        "view",
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "canCache",
        "callback",
        "preload",
        "count",
        "setInSampleSize",
        "inSampleSize",
        "startRequest",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "startRequest$svga_lib_release",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private animListener:Lcom/tantan/library/svga/AnimListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private audioEnable:Z

.field private autoPlay:Z

.field private final context:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private dynamicEntity:Lcom/tantan/library/svga/compose/SVGADynamicEntity;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private frameMode:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private loadCallback:Lcom/tantan/library/svga/data/request/RequestCallback;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private repeatCount:Ljava/lang/Integer;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private smoothTransition:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->context:Landroid/content/Context;

    .line 8
    .line 9
    new-instance p1, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay:Z

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic animListener$default(Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;Lcom/tantan/library/svga/AnimListener;ILjava/lang/Object;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic batchPreload$default(Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;Ljava/util/List;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->batchPreload(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic loadCallback$default(Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;Lcom/tantan/library/svga/data/request/RequestCallback;ILjava/lang/Object;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic preload$default(Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->preload(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/AnimListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public final audioEnable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->audioEnable:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final batchDownload(Ljava/util/List;)V
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Iterable;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    new-instance v1, Lcom/tantan/library/svga/data/request/ResourceTarget;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 24
    .line 25
    invoke-direct {v1, v2}, Lcom/tantan/library/svga/data/request/ResourceTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 29
    .line 30
    new-instance v3, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 31
    .line 32
    invoke-direct {v3}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-virtual {v3, v4}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setCacheable(Z)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3, v0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->path(Ljava/lang/String;)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->build()Lcom/tantan/library/svga/ResourceKey;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-direct {v2, v0, v1}, Lcom/tantan/library/svga/data/request/ResourceRequest;-><init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/data/request/AbsTarget;->setRequest(Lcom/tantan/library/svga/data/request/ResourceRequest;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/tantan/library/svga/data/request/AbsTarget;->begin()V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method

.method public final batchPreload(Ljava/util/List;Z)V
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Iterable;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    new-instance v1, Lcom/tantan/library/svga/data/request/ResourceTarget;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 24
    .line 25
    invoke-direct {v1, v2}, Lcom/tantan/library/svga/data/request/ResourceTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 29
    .line 30
    new-instance v3, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 31
    .line 32
    invoke-direct {v3}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v4, 0x1

    .line 36
    invoke-virtual {v3, v4}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setPreload(Z)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3, p2}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setCacheable(Z)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3, v0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->path(Ljava/lang/String;)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->build()Lcom/tantan/library/svga/ResourceKey;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {v2, v0, v1}, Lcom/tantan/library/svga/data/request/ResourceRequest;-><init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/data/request/AbsTarget;->setRequest(Lcom/tantan/library/svga/data/request/ResourceRequest;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/tantan/library/svga/data/request/AbsTarget;->begin()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-void
.end method

.method public final downloadOnly()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tantan/library/svga/data/request/ResourceTarget;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/tantan/library/svga/data/request/ResourceTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setCacheable(Z)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->build()Lcom/tantan/library/svga/ResourceKey;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {v1, p0, v0}, Lcom/tantan/library/svga/data/request/ResourceRequest;-><init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/data/request/AbsTarget;->setRequest(Lcom/tantan/library/svga/data/request/ResourceRequest;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/request/AbsTarget;->begin()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/compose/SVGADynamicEntity;
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
    iput-object p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamicEntity:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 5
    .line 6
    return-object p0
.end method

.method public final error(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 1
    .param p1    # Ljava/lang/String;
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
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->error(Ljava/lang/String;)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public final frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/SVGAnimationView$FrameMode;
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
    iput-object p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 5
    .line 6
    return-object p0
.end method

.method public final from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 2
    .param p1    # Ljava/lang/String;
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
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 5
    .line 6
    sget-object v1, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/tantan/library/svga/SVGALoader;->getSvgaGlobalCall()Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {v1, p1}, Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;->replaceSource(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object p1, v1

    .line 22
    :cond_1
    :goto_0
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->path(Ljava/lang/String;)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method public final getContext$svga_lib_release()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final into(Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 2
    .param p1    # Lcom/tantan/library/svga/SVGAnimationView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isPreload$svga_lib_release()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isCacheable$svga_lib_release()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setCacheable$svga_lib_release(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-boolean v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->smoothTransition:Z

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->clearHistory$svga_lib_release(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount:Ljava/lang/Integer;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setMLoops$svga_lib_release(I)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setMFillMode$svga_lib_release(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-boolean v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay:Z

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setMAutoPlay$svga_lib_release(Z)V

    .line 52
    .line 53
    .line 54
    iget-boolean v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->audioEnable:Z

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAudioEnable$svga_lib_release(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->build()Lcom/tantan/library/svga/ResourceKey;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamicEntity:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 71
    .line 72
    invoke-virtual {p0, p1, v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->startRequest$svga_lib_release(Lcom/tantan/library/svga/SVGAnimationView;Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setCacheable$svga_lib_release(Z)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/request/RequestCallback;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public final preload(Z)V
    .locals 3

    .line 1
    new-instance v0, Lcom/tantan/library/svga/data/request/ResourceTarget;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/tantan/library/svga/data/request/ResourceTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setPreload(Z)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setCacheable(Z)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->build()Lcom/tantan/library/svga/ResourceKey;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {v1, p0, v0}, Lcom/tantan/library/svga/data/request/ResourceRequest;-><init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/data/request/AbsTarget;->setRequest(Lcom/tantan/library/svga/data/request/ResourceRequest;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/request/AbsTarget;->begin()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount:Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay:Z

    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public final setInSampleSize(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->keyBuilder:Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setInSampleSize(I)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final smoothTransition(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->smoothTransition:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final startRequest$svga_lib_release(Lcom/tantan/library/svga/SVGAnimationView;Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V
    .locals 3
    .param p1    # Lcom/tantan/library/svga/SVGAnimationView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/tantan/library/svga/compose/SVGADynamicEntity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGALoader;->getTargetViews$svga_lib_release()Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p2}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsValue(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    new-instance v1, Lcom/tantan/library/svga/data/request/ViewTarget;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 26
    .line 27
    invoke-direct {v1, p0, p3}, Lcom/tantan/library/svga/data/request/ViewTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 31
    .line 32
    invoke-direct {p0, p2, v1}, Lcom/tantan/library/svga/data/request/ResourceRequest;-><init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p0}, Lcom/tantan/library/svga/data/request/AbsTarget;->setRequest(Lcom/tantan/library/svga/data/request/ResourceRequest;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/tantan/library/svga/data/request/AbsTarget;->begin()V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGALoader;->getTargetViews$svga_lib_release()Ljava/util/concurrent/ConcurrentHashMap;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p2}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    return-void
.end method
