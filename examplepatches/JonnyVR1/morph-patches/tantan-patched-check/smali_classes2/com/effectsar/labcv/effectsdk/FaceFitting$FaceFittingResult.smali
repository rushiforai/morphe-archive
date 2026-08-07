.class public Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/FaceFitting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FaceFittingResult"
.end annotation


# instance fields
.field config:Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshConfig;

.field faceCount:I

.field faceFittingMeshInfo:[Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;->config:Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshConfig;

    .line 6
    .line 7
    const/4 v0, 0x6

    .line 8
    new-array v0, v0, [Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshInfo;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;->faceFittingMeshInfo:[Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshInfo;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getConfig()Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;->config:Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;->faceCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getFaceFittingMeshInfo()[Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;->faceFittingMeshInfo:[Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshInfo;

    .line 2
    .line 3
    return-object p0
.end method
