.class public final Ll/fzg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vlg0;


# instance fields
.field public final synthetic a:Ll/hrg0;

.field public final synthetic b:Ll/chg0;


# direct methods
.method public constructor <init>(Ll/chg0;Ll/hrg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fzg0;->b:Ll/chg0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fzg0;->a:Ll/hrg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onFailure(ILjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "networkdetection failure:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " retMsg:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "NetworkDetectionTask"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 29
    .line 30
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 31
    .line 32
    .line 33
    iput p1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 34
    .line 35
    iput-object p2, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Ll/fzg0;->a:Ll/hrg0;

    .line 38
    .line 39
    iget-object v1, v1, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 40
    .line 41
    sget-object v2, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 42
    .line 43
    iput-object v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 44
    .line 45
    iput-object v0, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 46
    .line 47
    iget-object p0, p0, Ll/fzg0;->b:Ll/chg0;

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Ll/chg0;->g(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final onSuccess(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 2
    .line 3
    invoke-direct {p1}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 8
    .line 9
    const-string v0, "success"

    .line 10
    .line 11
    iput-object v0, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p0, Ll/fzg0;->a:Ll/hrg0;

    .line 14
    .line 15
    iget-object v0, v0, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 16
    .line 17
    sget-object v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 18
    .line 19
    iput-object v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 20
    .line 21
    iput-object p1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 22
    .line 23
    iget-object p0, p0, Ll/fzg0;->b:Ll/chg0;

    .line 24
    .line 25
    iget p1, p0, Ll/chg0;->g:I

    .line 26
    .line 27
    add-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    iput p1, p0, Ll/chg0;->g:I

    .line 30
    .line 31
    iget v0, p0, Ll/chg0;->f:I

    .line 32
    .line 33
    if-ne p1, v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/chg0;->h()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
