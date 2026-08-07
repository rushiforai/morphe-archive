.class public Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public isHaveColorData:Z

.field public isNoAction:Z


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
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isHaveColorData:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isNoAction:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public isHaveColorData()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isHaveColorData:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNoAction()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isNoAction:Z

    .line 2
    .line 3
    return p0
.end method

.method public setHaveColorData(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isHaveColorData:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNoAction(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isNoAction:Z

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LiveDataCheckResult{isHaveColorData="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isHaveColorData:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", isNoAction="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isNoAction:Z

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x7d

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
