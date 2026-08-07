.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field keyValues:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "k"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;",
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


# virtual methods
.method public getKeyValues()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;->keyValues:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setKeyValues(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;->keyValues:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
