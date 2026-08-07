.class public final Lcom/bytedance/bpea/basics/TimeAnchor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001:\u0001\u0013B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u000e\u001a\u00020\u000fJ\u0006\u0010\u0010\u001a\u00020\u000fJ\u0008\u0010\u0011\u001a\u00020\u0012H\u0016R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\t\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u0006R\u001a\u0010\u000b\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\u0006\"\u0004\u0008\r\u0010\u0008\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/bytedance/bpea/basics/TimeAnchor;",
        "",
        "()V",
        "absoluteTime",
        "Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;",
        "getAbsoluteTime",
        "()Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;",
        "setAbsoluteTime",
        "(Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;)V",
        "nanoTime",
        "getNanoTime",
        "threadTime",
        "getThreadTime",
        "setThreadTime",
        "end",
        "",
        "start",
        "toString",
        "",
        "TimeAnchorBean",
        "basics_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field private absoluteTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final nanoTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private threadTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->absoluteTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 10
    .line 11
    new-instance v0, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->nanoTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 17
    .line 18
    new-instance v0, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->threadTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/bytedance/bpea/basics/TimeAnchor;->start()V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final end()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->absoluteTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;->setEndTime(J)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->nanoTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;->setEndTime(J)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->threadTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 20
    .line 21
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-virtual {p0, v0, v1}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;->setEndTime(J)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final getAbsoluteTime()Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->absoluteTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getNanoTime()Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->nanoTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getThreadTime()Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->threadTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setAbsoluteTime(Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;)V
    .locals 0
    .param p1    # Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->absoluteTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 5
    .line 6
    return-void
.end method

.method public final setThreadTime(Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;)V
    .locals 0
    .param p1    # Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->threadTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 5
    .line 6
    return-void
.end method

.method public final start()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->absoluteTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;->setStartTime(J)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->nanoTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;->setStartTime(J)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->threadTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 20
    .line 21
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-virtual {p0, v0, v1}, Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;->setStartTime(J)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TimeAnchor(absoluteTime="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->absoluteTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", threadTime="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->threadTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", nanoTime="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/bytedance/bpea/basics/TimeAnchor;->nanoTime:Lcom/bytedance/bpea/basics/TimeAnchor$TimeAnchorBean;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/16 p0, 0x29

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
