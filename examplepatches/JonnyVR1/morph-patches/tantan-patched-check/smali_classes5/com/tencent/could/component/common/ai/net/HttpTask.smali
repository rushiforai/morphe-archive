.class public Lcom/tencent/could/component/common/ai/net/HttpTask;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ljava/util/concurrent/Delayed;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

.field public c:I

.field public d:J

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/net/CallBackListener;Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->c:I

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->e:Z

    .line 12
    .line 13
    new-instance v1, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 19
    .line 20
    invoke-interface {v1, p1}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->setListener(Lcom/tencent/could/component/common/ai/net/CallBackListener;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 24
    .line 25
    invoke-interface {p1, p2}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->setNetWorkParam(Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 29
    .line 30
    invoke-interface {p1, v0}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->setNeedUseDeputy(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 34
    .line 35
    invoke-interface {p0, v0}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->setNeedIpBackUrl(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public cleanRequest()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->e:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->cleanExecute()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ljava/util/concurrent/Delayed;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/could/component/common/ai/net/HttpTask;->compareTo(Ljava/util/concurrent/Delayed;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public compareTo(Ljava/util/concurrent/Delayed;)I
    .locals 0

    .line 8
    const/4 p0, 0x0

    return p0
.end method

.method public getDelay(Ljava/util/concurrent/TimeUnit;)J
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/could/component/common/ai/net/HttpTask;->getDelayTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    sub-long/2addr v0, v2

    .line 10
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1, p0}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    return-wide p0
.end method

.method public getDelayTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFailedNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public getIHttpRequest()Lcom/tencent/could/component/common/ai/net/IHttpRequest;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestNetWorkParam()Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->getNetWorkParam()Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTaskError()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->execute()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    iget-boolean v1, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->e:Z

    .line 9
    .line 10
    const-string v2, "HttpTask"

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "already stop , do not net retry"

    .line 19
    .line 20
    invoke-virtual {p0, v2, v0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v3, "fail error: "

    .line 37
    .line 38
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v2, v1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->c:I

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    if-ne v0, v1, :cond_1

    .line 57
    .line 58
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v3, "next try use deputy!"

    .line 63
    .line 64
    invoke-virtual {v0, v2, v3}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 68
    .line 69
    invoke-interface {v0, v1}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->setNeedUseDeputy(Z)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->c:I

    .line 73
    .line 74
    const/4 v3, 0x2

    .line 75
    if-ne v0, v3, :cond_2

    .line 76
    .line 77
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const-string v4, "next try use back ip!"

    .line 82
    .line 83
    invoke-virtual {v0, v2, v4}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 87
    .line 88
    invoke-interface {v0, v1}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->setNeedIpBackUrl(Z)V

    .line 89
    .line 90
    .line 91
    :cond_2
    iget v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->c:I

    .line 92
    .line 93
    if-le v0, v3, :cond_3

    .line 94
    .line 95
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v3, "next try use back ip array!"

    .line 100
    .line 101
    invoke-virtual {v0, v2, v3}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->b:Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 105
    .line 106
    iget v2, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->c:I

    .line 107
    .line 108
    add-int/lit8 v2, v2, -0x3

    .line 109
    .line 110
    invoke-interface {v0, v1, v2}, Lcom/tencent/could/component/common/ai/net/IHttpRequest;->setNeedIpBackUrls(ZI)V

    .line 111
    .line 112
    .line 113
    :cond_3
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/ThreadManager;->getInstance()Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0, p0}, Lcom/tencent/could/component/common/ai/net/ThreadManager;->addFailedTask(Lcom/tencent/could/component/common/ai/net/HttpTask;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public setDelayTime(J)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-long/2addr p1, v0

    .line 6
    iput-wide p1, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->d:J

    .line 7
    .line 8
    return-void
.end method

.method public setFailedNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public setTaskError(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/HttpTask;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
