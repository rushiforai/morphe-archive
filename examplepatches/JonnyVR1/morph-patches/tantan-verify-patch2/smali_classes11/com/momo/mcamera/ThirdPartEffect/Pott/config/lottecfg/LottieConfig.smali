.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field assetValues:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "assets"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;",
            ">;"
        }
    .end annotation
.end field

.field height:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h"
    .end annotation
.end field

.field layers:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "layers"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;",
            ">;"
        }
    .end annotation
.end field

.field name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "nm"
    .end annotation
.end field

.field width:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "w"
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
.method public getAssetValues()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->assetValues:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getLayers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->layers:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public setAssetValues(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->assetValues:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setLayers(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->layers:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->width:I

    .line 2
    .line 3
    return-void
.end method
