.class public Lcom/immomo/velib/anim/model/PostProcessingModel;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;
    }
.end annotation


# instance fields
.field private filterName:Ljava/lang/String;

.field private params:Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;


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
.method public getFilterName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/PostProcessingModel;->filterName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getParams()Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/PostProcessingModel;->params:Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFilterName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/PostProcessingModel;->filterName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setParams(Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/PostProcessingModel;->params:Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;

    .line 2
    .line 3
    return-void
.end method
