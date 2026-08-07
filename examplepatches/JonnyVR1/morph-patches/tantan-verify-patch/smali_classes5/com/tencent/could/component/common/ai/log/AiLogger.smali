.class public Lcom/tencent/could/component/common/ai/log/AiLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public config:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

.field public printer:Lcom/tencent/could/component/common/ai/log/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tencent/could/component/common/ai/log/AiLogConfig;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->config:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 5
    .line 6
    new-instance v0, Lcom/tencent/could/component/common/ai/log/b;

    .line 7
    .line 8
    invoke-direct {v0, p1, p2}, Lcom/tencent/could/component/common/ai/log/b;-><init>(Landroid/content/Context;Lcom/tencent/could/component/common/ai/log/AiLogConfig;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    .line 12
    .line 13
    return-void
.end method

.method private varargs formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    array-length p1, p2

    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    if-ge v0, p1, :cond_2

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string v1, ", "

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    :cond_1
    aget-object v1, p2, v0

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method


# virtual methods
.method public asset(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->config:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getDefaultTag()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->asset(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public asset(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 11
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    if-eqz p0, :cond_0

    const/4 v0, 0x7

    .line 12
    invoke-virtual {p0, v0, p1, p2}, Lcom/tencent/could/component/common/ai/log/b;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public varargs asset(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 13
    invoke-direct {p0, p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLogger;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->asset(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public debug(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->config:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getDefaultTag()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 11
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    if-eqz p0, :cond_0

    const/4 v0, 0x3

    .line 12
    invoke-virtual {p0, v0, p1, p2}, Lcom/tencent/could/component/common/ai/log/b;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public varargs debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 13
    invoke-direct {p0, p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLogger;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->config:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getDefaultTag()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 11
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    if-eqz p0, :cond_0

    const/4 v0, 0x6

    .line 12
    invoke-virtual {p0, v0, p1, p2}, Lcom/tencent/could/component/common/ai/log/b;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public varargs error(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 13
    invoke-direct {p0, p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLogger;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public info(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->config:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getDefaultTag()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 11
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    if-eqz p0, :cond_0

    const/4 v0, 0x4

    .line 12
    invoke-virtual {p0, v0, p1, p2}, Lcom/tencent/could/component/common/ai/log/b;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public varargs info(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 13
    invoke-direct {p0, p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLogger;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v2, v0, Lcom/tencent/could/component/common/ai/log/b;->e:Lcom/tencent/could/component/common/ai/log/c;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "FilePrinter"

    .line 11
    .line 12
    const-string v2, "writeHandler is null"

    .line 13
    .line 14
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v3, 0x1

    .line 19
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 20
    .line 21
    .line 22
    iget-object v2, v0, Lcom/tencent/could/component/common/ai/log/b;->e:Lcom/tencent/could/component/common/ai/log/c;

    .line 23
    .line 24
    iget-object v3, v2, Lcom/tencent/could/component/common/ai/log/c;->d:Lcom/tencent/could/component/common/ai/log/f;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/log/f;->a()V

    .line 29
    .line 30
    .line 31
    :cond_1
    iput-object v1, v2, Lcom/tencent/could/component/common/ai/log/c;->d:Lcom/tencent/could/component/common/ai/log/f;

    .line 32
    .line 33
    iput-object v1, v0, Lcom/tencent/could/component/common/ai/log/b;->e:Lcom/tencent/could/component/common/ai/log/c;

    .line 34
    .line 35
    iget-object v2, v0, Lcom/tencent/could/component/common/ai/log/b;->f:Landroid/os/HandlerThread;

    .line 36
    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/Thread;->isAlive()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    iget-object v0, v0, Lcom/tencent/could/component/common/ai/log/b;->f:Landroid/os/HandlerThread;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    .line 51
    .line 52
    return-void
.end method

.method public verbose(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->config:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getDefaultTag()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public verbose(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 11
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    if-eqz p0, :cond_0

    const/4 v0, 0x3

    .line 12
    invoke-virtual {p0, v0, p1, p2}, Lcom/tencent/could/component/common/ai/log/b;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public varargs verbose(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 13
    invoke-direct {p0, p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLogger;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public warn(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->config:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getDefaultTag()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 11
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogger;->printer:Lcom/tencent/could/component/common/ai/log/b;

    if-eqz p0, :cond_0

    const/4 v0, 0x5

    .line 12
    invoke-virtual {p0, v0, p1, p2}, Lcom/tencent/could/component/common/ai/log/b;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public varargs warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 13
    invoke-direct {p0, p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLogger;->formatString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/component/common/ai/log/AiLogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
