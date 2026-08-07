.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public baseFolder:Ljava/lang/String;

.field fadeoutStartFrmNo:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "fadeoutStartFrmNo"
    .end annotation
.end field

.field subFolder:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "folder"
    .end annotation
.end field

.field totalNum:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "totalNum"
    .end annotation
.end field

.field type:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
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
.method public getFadeoutStartFrmNo()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->fadeoutStartFrmNo:I

    .line 2
    .line 3
    return p0
.end method

.method public getSubFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->subFolder:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTotalNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->totalNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFadeoutStartFrmNo(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->fadeoutStartFrmNo:I

    .line 2
    .line 3
    return-void
.end method

.method public setSubFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->subFolder:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTotalNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->totalNum:I

    .line 2
    .line 3
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
