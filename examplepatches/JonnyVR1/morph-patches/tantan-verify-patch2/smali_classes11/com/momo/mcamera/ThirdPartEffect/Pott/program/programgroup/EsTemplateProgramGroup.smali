.class public abstract Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/ThirdPartEffect/Pott/config/ProgramGroupRenderInterface;
.implements Ll/gam;


# static fields
.field private static final ErrorCode:I = -0x1

.field public static final RENDERING_READY:I = 0x0

.field public static final RENDER_END:I = 0x3

.field public static final RENDER_RUNNING:I = 0x1

.field public static final RENDER_TAIL:I = 0x2


# instance fields
.field protected baseFolder:Ljava/lang/String;

.field curTimeStamp:J

.field errorListener:Ll/jk90;

.field firstRenderTime:J

.field initialized:Z

.field lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

.field normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

.field renderHeight:I

.field renderRunners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;",
            ">;"
        }
    .end annotation
.end field

.field renderWidth:I

.field rendingStatus:I

.field templateFolder:Ljava/lang/String;

.field public templateTailerTimeInMs:J

.field public templateTotalTimeInMs:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 14
    .line 15
    const-wide/16 v0, -0x1

    .line 16
    .line 17
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->firstRenderTime:J

    .line 18
    .line 19
    const-wide/32 v0, 0xc350

    .line 20
    .line 21
    .line 22
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTotalTimeInMs:J

    .line 23
    .line 24
    const-wide/32 v0, 0xea60

    .line 25
    .line 26
    .line 27
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTailerTimeInMs:J

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->initialized:Z

    .line 31
    .line 32
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->rendingStatus:I

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 36
    .line 37
    const-string v0, ""

    .line 38
    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateFolder:Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method

.method private updateRunningStatus(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTailerTimeInMs:J

    .line 8
    .line 9
    cmp-long v0, p1, v0

    .line 10
    .line 11
    if-gtz v0, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->rendingStatus:I

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTailerTimeInMs:J

    .line 18
    .line 19
    cmp-long v0, p1, v0

    .line 20
    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTotalTimeInMs:J

    .line 24
    .line 25
    cmp-long v0, p1, v0

    .line 26
    .line 27
    if-gtz v0, :cond_1

    .line 28
    .line 29
    const/4 p1, 0x2

    .line 30
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->rendingStatus:I

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTotalTimeInMs:J

    .line 34
    .line 35
    cmp-long p1, p1, v0

    .line 36
    .line 37
    if-lez p1, :cond_2

    .line 38
    .line 39
    const/4 p1, 0x3

    .line 40
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->rendingStatus:I

    .line 41
    .line 42
    :cond_2
    return-void
.end method


# virtual methods
.method public addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;-><init>(Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;Ll/d33;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->recycleAllData()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/d33;->destroy()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->rendingStatus:I

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->recycleData()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateFolder:Ljava/lang/String;

    .line 47
    .line 48
    return-void
.end method

.method public declared-synchronized drawGroup()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->initialized:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "FilterProcess"

    .line 7
    .line 8
    const-string v1, "Current render group is not initilaized !! Error !!"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->firstRenderTime:J

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-gez v0, :cond_1

    .line 24
    .line 25
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 26
    .line 27
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->firstRenderTime:J

    .line 28
    .line 29
    :cond_1
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 30
    .line 31
    iget-wide v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->firstRenderTime:J

    .line 32
    .line 33
    sub-long/2addr v0, v2

    .line 34
    invoke-direct {p0, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->updateRunningStatus(J)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->rendingStatus:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    if-ne v0, v1, :cond_2

    .line 41
    .line 42
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    add-int/lit8 v0, v0, -0x1

    .line 51
    .line 52
    :goto_0
    if-ltz v0, :cond_3

    .line 53
    .line 54
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;

    .line 61
    .line 62
    iget-wide v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 63
    .line 64
    invoke-virtual {v1, v2, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->renderRunning(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    .line 66
    .line 67
    add-int/lit8 v0, v0, -0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    monitor-exit p0

    .line 71
    return-void

    .line 72
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 73
    throw v0
.end method

.method public getFadeOutDurationInMs()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTotalTimeInMs:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTailerTimeInMs:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

.method public getRendingStatus()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->rendingStatus:I

    .line 2
    .line 3
    return p0
.end method

.method public initAllInfo()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->initProgram()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "FilterProcess"

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p0, "Init all program error !!"

    .line 11
    .line 12
    invoke-static {v2, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->parseConfig()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-string p0, "Parse config  error !!"

    .line 23
    .line 24
    invoke-static {v2, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public initProgram()Z
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method public abstract onParseLayers(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;)Z
.end method

.method public parseConfig()Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->initialized:Z

    .line 6
    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "/config.json"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/momo/mcamera/util/JsonConfigParseHelpler;->loadLottieFile(Ljava/lang/String;)Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    const-string v2, "FilterProcess"

    .line 36
    .line 37
    if-eqz v0, :cond_4

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->getAssetValues()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->getLayers()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->getAssetValues()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_1

    .line 74
    .line 75
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;

    .line 80
    .line 81
    invoke-virtual {v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getImageId()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 90
    .line 91
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->getLayers()Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-eqz v4, :cond_3

    .line 104
    .line 105
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    check-cast v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;

    .line 110
    .line 111
    invoke-virtual {v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;->getLayerName()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;->getRefImageId()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    check-cast v5, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;

    .line 123
    .line 124
    iget-object v6, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 125
    .line 126
    invoke-virtual {p0, v6, v4, v5}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->onParseLayers(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;)Z

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    if-nez v4, :cond_2

    .line 131
    .line 132
    const-string v0, "Parse lottie layers failed !! return !"

    .line 133
    .line 134
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->recycleAllData()V

    .line 138
    .line 139
    .line 140
    return v1

    .line 141
    :cond_3
    const/4 v0, 0x1

    .line 142
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->initialized:Z

    .line 143
    .line 144
    return v0

    .line 145
    :cond_4
    :goto_1
    const-string v0, "Parse config error !"

    .line 146
    .line 147
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->recycleAllData()V

    .line 151
    .line 152
    .line 153
    return v1

    .line 154
    :cond_5
    iget-boolean p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->initialized:Z

    .line 155
    .line 156
    return p0
.end method

.method public recycleAllData()V
    .locals 0

    return-void
.end method

.method public recycleImageBuffers()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->recycleImageBuffers()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public declared-synchronized resetStatus()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->rendingStatus:I

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 8
    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->firstRenderTime:J

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->info:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->resetStatus()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw v0
.end method

.method public setBaseFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setErrorListener(Ll/jk90;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setTemplateTailerTimeInMs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTailerTimeInMs:J

    .line 2
    .line 3
    return-void
.end method

.method public setTemplateTotalTimeInMs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->templateTotalTimeInMs:J

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized setTimeStamp(J)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public updateRenderSize(II)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderHeight:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x1

    .line 12
    .line 13
    :goto_0
    if-ltz v0, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->renderRunners:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;

    .line 22
    .line 23
    invoke-virtual {v1, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->updateRnederSize(II)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, -0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method
