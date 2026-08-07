.class public final Ll/zeg0;
.super Ll/ksp0;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/hrg0;

.field public final synthetic d:Ll/chg0;


# direct methods
.method public constructor <init>(Ll/chg0;Ljava/lang/String;Ll/hrg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zeg0;->d:Ll/chg0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zeg0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/zeg0;->c:Ll/hrg0;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/ksp0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/hsp0;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ksp0;->a(Ll/hsp0;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/seg0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/seg0;-><init>(Ll/zeg0;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string p2, "onClosed:"

    .line 15
    .line 16
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/zeg0;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "NetworkDetectionTask"

    .line 29
    .line 30
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final c(Ll/hsp0;Ljava/lang/Throwable;Ll/i5d0;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ksp0;->c(Ll/hsp0;Ljava/lang/Throwable;Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/zeg0;->b:Ljava/lang/String;

    .line 5
    .line 6
    iget-object p3, p0, Ll/zeg0;->c:Ll/hrg0;

    .line 7
    .line 8
    new-instance v0, Ll/qeg0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2, p3}, Ll/qeg0;-><init>(Ll/zeg0;Ljava/lang/String;Ljava/lang/Throwable;Ll/hrg0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final d(Ll/hsp0;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/ksp0;->d(Ll/hsp0;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onMessage:"

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/zeg0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, " text:"

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "NetworkDetectionTask"

    .line 29
    .line 30
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final f(Ll/hsp0;Ll/i5d0;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/ksp0;->f(Ll/hsp0;Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/zeg0;->b:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v0, p0, Ll/zeg0;->c:Ll/hrg0;

    .line 7
    .line 8
    new-instance v1, Ll/reg0;

    .line 9
    .line 10
    invoke-direct {v1, p0, p2, p1, v0}, Ll/reg0;-><init>(Ll/zeg0;Ll/i5d0;Ljava/lang/String;Ll/hrg0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic g()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/zeg0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/zeg0;->a:Z

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic h(Ljava/lang/String;Ljava/lang/Throwable;Ll/hrg0;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/zeg0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/zeg0;->a:Z

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "onFailure:"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, " error:"

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "NetworkDetectionTask"

    .line 36
    .line 37
    invoke-static {v0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 49
    .line 50
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 51
    .line 52
    .line 53
    iput p1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 54
    .line 55
    iput-object p2, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 56
    .line 57
    iget-object p3, p3, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 58
    .line 59
    sget-object v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 60
    .line 61
    iput-object v1, p3, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 62
    .line 63
    iput-object v0, p3, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 64
    .line 65
    iget-object p0, p0, Ll/zeg0;->d:Ll/chg0;

    .line 66
    .line 67
    invoke-virtual {p0, p1, p2}, Ll/chg0;->g(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final i(Ll/i5d0;Ljava/lang/String;Ll/hrg0;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/zeg0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/zeg0;->a:Z

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p1, 0x0

    .line 27
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "onOpen:"

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p2, " body:"

    .line 38
    .line 39
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string p2, "NetworkDetectionTask"

    .line 50
    .line 51
    invoke-static {p2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    new-instance p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 55
    .line 56
    invoke-direct {p1}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 57
    .line 58
    .line 59
    const/4 p2, 0x0

    .line 60
    iput p2, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 61
    .line 62
    const-string p2, "success"

    .line 63
    .line 64
    iput-object p2, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p2, p3, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 67
    .line 68
    sget-object p3, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 69
    .line 70
    iput-object p3, p2, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 71
    .line 72
    iput-object p1, p2, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 73
    .line 74
    iget-object p0, p0, Ll/zeg0;->d:Ll/chg0;

    .line 75
    .line 76
    iget p1, p0, Ll/chg0;->g:I

    .line 77
    .line 78
    add-int/2addr p1, v0

    .line 79
    iput p1, p0, Ll/chg0;->g:I

    .line 80
    .line 81
    iget p2, p0, Ll/chg0;->f:I

    .line 82
    .line 83
    if-ne p1, p2, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/chg0;->h()V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_1
    return-void
.end method
