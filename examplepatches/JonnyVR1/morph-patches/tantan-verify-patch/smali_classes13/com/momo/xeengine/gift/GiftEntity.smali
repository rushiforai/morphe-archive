.class public Lcom/momo/xeengine/gift/GiftEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private extendValues:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private id:Ljava/lang/String;

.field private loops:I

.field private name:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

.field private scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

.field private specJson:Ljava/lang/String;

.field private syncDownloadResource:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/momo/xeengine/gift/GiftEntity;->loops:I

    .line 6
    .line 7
    sget-object v1, Lcom/momo/xeengine/gift/SVGAScaleType;->AUTO:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftEntity;->scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 10
    .line 11
    sget-object v1, Lcom/momo/xeengine/gift/SVGAPositionType;->AUTO:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftEntity;->positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftEntity;->syncDownloadResource:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public getExtendValues()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLoops()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->loops:I

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPositionType()Lcom/momo/xeengine/gift/SVGAPositionType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScaleType()Lcom/momo/xeengine/gift/SVGAScaleType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpecJson()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->specJson:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isSyncDownloadResource()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->syncDownloadResource:Z

    .line 2
    .line 3
    return p0
.end method

.method public setExtendValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setExtendValues(Ljava/lang/String;Ljava/util/List;)V
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ge v0, v1, :cond_1

    .line 18
    .line 19
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    .line 26
    .line 27
    new-instance v3, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v4, "_"

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public setExtendValues(Ljava/util/Map;)V
    .locals 1
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    .line 56
    :cond_0
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->extendValues:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftEntity;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLoops(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/GiftEntity;->loops:I

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftEntity;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftEntity;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPositionType(Lcom/momo/xeengine/gift/SVGAPositionType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftEntity;->positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 2
    .line 3
    return-void
.end method

.method public setScaleType(Lcom/momo/xeengine/gift/SVGAScaleType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftEntity;->scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 2
    .line 3
    return-void
.end method

.method public setSpecJson(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftEntity;->specJson:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSyncDownloadResource(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/gift/GiftEntity;->syncDownloadResource:Z

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GiftEntity{path=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->path:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "\'}"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public verify()Z
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftEntity;->path:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftResourceVerifier;->verifyGiftResources(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    return p0

    .line 8
    :catchall_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method
