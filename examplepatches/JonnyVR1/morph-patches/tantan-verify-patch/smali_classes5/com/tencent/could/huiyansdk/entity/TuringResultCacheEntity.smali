.class public Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public extraInfo:Ljava/lang/String;

.field public frameParam:Ljava/lang/String;

.field public isNeedFrameCheck:Z

.field public turingEnvErrorStr:Ljava/lang/String;

.field public turingFrameResult:Ljava/lang/String;

.field public turingResultDate:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingResultDate:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingEnvErrorStr:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->isNeedFrameCheck:Z

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingFrameResult:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->frameParam:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->extraInfo:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public getExtraInfo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->extraInfo:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrameParam()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->frameParam:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTuringEnvErrorStr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingEnvErrorStr:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTuringFrameResult()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingFrameResult:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTuringResultDate()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingResultDate:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isNeedFrameCheck()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->isNeedFrameCheck:Z

    .line 2
    .line 3
    return p0
.end method

.method public reset()V
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingResultDate:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->isNeedFrameCheck:Z

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingFrameResult:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->frameParam:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->extraInfo:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingEnvErrorStr:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public setExtraInfo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->extraInfo:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFrameParam(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->frameParam:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setNeedFrameCheck(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->isNeedFrameCheck:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTuringEnvErrorStr(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingEnvErrorStr:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTuringFrameResult(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingFrameResult:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTuringResultDate(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->turingResultDate:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
