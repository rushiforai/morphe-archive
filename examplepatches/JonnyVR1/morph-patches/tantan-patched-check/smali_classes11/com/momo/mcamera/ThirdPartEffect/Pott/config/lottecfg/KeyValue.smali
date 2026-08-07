.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public frameNo:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "t"
    .end annotation
.end field

.field public valueArray:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "s"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
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
.method public getFrameNo()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->frameNo:I

    .line 2
    .line 3
    return p0
.end method

.method public getValueArray()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFrameNo(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->frameNo:I

    .line 2
    .line 3
    return-void
.end method

.method public setValueArray(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
