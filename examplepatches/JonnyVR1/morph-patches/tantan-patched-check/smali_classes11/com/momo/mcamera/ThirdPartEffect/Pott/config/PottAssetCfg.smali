.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field assets:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "asset"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;",
            ">;"
        }
    .end annotation
.end field

.field version:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "version"
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


# virtual methods
.method public getAssets()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;->assets:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;->version:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAssets(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;->assets:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;->version:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
