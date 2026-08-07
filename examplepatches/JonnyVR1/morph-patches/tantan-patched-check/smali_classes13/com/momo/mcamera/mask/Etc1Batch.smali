.class public Lcom/momo/mcamera/mask/Etc1Batch;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private batchMeta:Lcom/momo/mcamera/mask/batchbean/BatchMeta;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "meta"
    .end annotation
.end field

.field batchStickers:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frames"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/batchbean/BatchSticker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getEffectModel(Ljava/lang/String;)Lcom/momo/mcamera/mask/Etc1Batch;
    .locals 2

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/momo/mcamera/mask/Etc1Batch;

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/momo/mcamera/mask/Etc1Batch;

    .line 12
    .line 13
    return-object p0
.end method

.method public static getEtc1Batch(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static toEffectCmd(Lcom/momo/mcamera/mask/Etc1Batch;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/core/glcore/util/JsonUtil;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public getBatchMeta()Lcom/momo/mcamera/mask/batchbean/BatchMeta;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Etc1Batch;->batchMeta:Lcom/momo/mcamera/mask/batchbean/BatchMeta;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBatchStickers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/batchbean/BatchSticker;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Etc1Batch;->batchStickers:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setBatchMeta(Lcom/momo/mcamera/mask/batchbean/BatchMeta;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Etc1Batch;->batchMeta:Lcom/momo/mcamera/mask/batchbean/BatchMeta;

    .line 2
    .line 3
    return-void
.end method

.method public setBatchStickers(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/batchbean/BatchSticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Etc1Batch;->batchStickers:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
