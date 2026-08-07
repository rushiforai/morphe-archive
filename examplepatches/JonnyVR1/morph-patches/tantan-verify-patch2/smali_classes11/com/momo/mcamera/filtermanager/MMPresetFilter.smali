.class public Lcom/momo/mcamera/filtermanager/MMPresetFilter;
.super Lcom/momo/mcamera/filtermanager/MMFilter;
.source "SourceFile"


# instance fields
.field public isFilterFileExist:Z

.field public isIconLocal:Z

.field public lookupUrl:Ljava/lang/String;

.field public mFilterIcon:Ljava/lang/String;

.field public mFilterId:Ljava/lang/String;

.field public mPercent:F

.field public manifestUrl:Ljava/lang/String;

.field public postionInList:Ljava/lang/String;

.field public tag:Ljava/lang/String;

.field public zipUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Lcom/momo/mcamera/filtermanager/MMFilter;-><init>()V

    .line 16
    const-string v0, ""

    iput-object v0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->postionInList:Ljava/lang/String;

    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->manifestUrl:Ljava/lang/String;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    iput v0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mPercent:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/filtermanager/MMFilter;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->postionInList:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->manifestUrl:Ljava/lang/String;

    .line 9
    .line 10
    const/high16 p1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput p1, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mPercent:F

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterIcon:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPercent()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mPercent:F

    .line 2
    .line 3
    return p0
.end method

.method public getPostionInList()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->postionInList:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->tag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getmFilterId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isLocal()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isIconLocal:Z

    .line 2
    .line 3
    return p0
.end method

.method public setPercent(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mPercent:F

    .line 2
    .line 3
    return-void
.end method

.method public setPostionInList(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->postionInList:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->tag:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
