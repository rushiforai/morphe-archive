.class public final Lcom/tantan/library/svga/compose/parser/LayerDataParser;
.super Lcom/tantan/library/svga/compose/parser/DataParser;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/compose/parser/DataParser<",
        "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
        "Ljava/util/List<",
        "+",
        "Lcom/tantan/library/svga/compose/entities/SVGALayer;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u0014\u0012\u0004\u0012\u00020\u0002\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00040\u00030\u0001B\u0005\u00a2\u0006\u0002\u0010\u0005J\u001e\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u00032\u000e\u0010\u0008\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u0003H\u0002J\u0016\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00032\u0006\u0010\u0008\u001a\u00020\u0002H\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/tantan/library/svga/compose/parser/LayerDataParser;",
        "Lcom/tantan/library/svga/compose/parser/DataParser;",
        "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
        "",
        "Lcom/tantan/library/svga/compose/entities/SVGALayer;",
        "()V",
        "buildFrames",
        "Lcom/tantan/library/svga/compose/entities/SVGAFrame;",
        "data",
        "Lcom/tantan/library/svga/compose/proto/FrameEntity;",
        "onParser",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/compose/parser/DataParser;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final buildFrames(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/proto/FrameEntity;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/entities/SVGAFrame;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Iterable;

    .line 4
    .line 5
    new-instance p0, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v0, 0x0

    .line 21
    move-object v1, v0

    .line 22
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/tantan/library/svga/compose/proto/FrameEntity;

    .line 33
    .line 34
    new-instance v3, Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 35
    .line 36
    invoke-direct {v3, v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;-><init>(Lcom/tantan/library/svga/compose/proto/FrameEntity;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getShapes()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ljava/util/Collection;

    .line 44
    .line 45
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_0

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getShapes()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->isKeep()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_0

    .line 66
    .line 67
    move-object v2, v3

    .line 68
    goto :goto_1

    .line 69
    :cond_0
    move-object v2, v0

    .line 70
    :goto_1
    if-eqz v2, :cond_2

    .line 71
    .line 72
    if-eqz v1, :cond_1

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_1
    move-object v2, v0

    .line 76
    :goto_2
    if-eqz v2, :cond_2

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getShapes()Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v3, v1}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->setShapes(Ljava/util/List;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    invoke-interface {p0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-object v1, v3

    .line 92
    goto :goto_0

    .line 93
    :cond_3
    return-object p0

    .line 94
    :cond_4
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method


# virtual methods
.method public bridge synthetic onParser(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 62
    check-cast p1, Lcom/tantan/library/svga/compose/proto/MovieEntity;

    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/compose/parser/LayerDataParser;->onParser(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public onParser(Lcom/tantan/library/svga/compose/proto/MovieEntity;)Ljava/util/List;
    .locals 5
    .param p1    # Lcom/tantan/library/svga/compose/proto/MovieEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
            ")",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/entities/SVGALayer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/MovieEntity;->sprites:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    check-cast p1, Ljava/lang/Iterable;

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/tantan/library/svga/compose/proto/SpriteEntity;

    .line 36
    .line 37
    new-instance v2, Lcom/tantan/library/svga/compose/entities/SVGALayer;

    .line 38
    .line 39
    iget-object v3, v1, Lcom/tantan/library/svga/compose/proto/SpriteEntity;->imageKey:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v4, v1, Lcom/tantan/library/svga/compose/proto/SpriteEntity;->matteKey:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/tantan/library/svga/compose/proto/SpriteEntity;->frames:Ljava/util/List;

    .line 44
    .line 45
    invoke-direct {p0, v1}, Lcom/tantan/library/svga/compose/parser/LayerDataParser;->buildFrames(Ljava/util/List;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-direct {v2, v3, v4, v1}, Lcom/tantan/library/svga/compose/entities/SVGALayer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    return-object v0

    .line 57
    :cond_1
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method
