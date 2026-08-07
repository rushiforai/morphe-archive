.class public Lcom/tencent/could/component/common/ai/net/ThreadManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/component/common/ai/net/ThreadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/could/component/common/ai/net/ThreadManager;


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/net/ThreadManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$1;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    const-string v0, "ThreadManager"

    .line 2
    .line 3
    :cond_0
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$1;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/tencent/could/component/common/ai/net/ThreadManager;->c:Ljava/util/concurrent/DelayQueue;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/concurrent/DelayQueue;->take()Ljava/util/concurrent/Delayed;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/tencent/could/component/common/ai/net/HttpTask;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$1;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 14
    .line 15
    iput-object v1, v2, Lcom/tencent/could/component/common/ai/net/ThreadManager;->d:Lcom/tencent/could/component/common/ai/net/HttpTask;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/HttpTask;->getFailedNum()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$1;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 22
    .line 23
    if-eqz v3, :cond_3

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/HttpTask;->getRequestNetWorkParam()Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-nez v3, :cond_1

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getRetryTimes()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    :goto_1
    if-ge v2, v3, :cond_2

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/HttpTask;->getFailedNum()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/tencent/could/component/common/ai/net/HttpTask;->setFailedNum(I)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager$1;->a:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/tencent/could/component/common/ai/net/ThreadManager;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v4, "network test time: "

    .line 65
    .line 66
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/HttpTask;->getFailedNum()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v2, v0, v1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catch_0
    move-exception v1

    .line 85
    goto :goto_2

    .line 86
    :cond_2
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/HttpTask;->getIHttpRequest()Lcom/tencent/could/component/common/ai/net/IHttpRequest;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    check-cast v2, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;

    .line 91
    .line 92
    invoke-virtual {v2}, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->getCallBackListener()Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    if-eqz v2, :cond_0

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/HttpTask;->getTaskError()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {v2, v1}, Lcom/tencent/could/component/common/ai/net/CallBackListener;->onFailed(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    const/4 v1, 0x0

    .line 107
    throw v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    :goto_2
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    new-instance v3, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v4, "network error , message: "

    .line 115
    .line 116
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v2, v0, v1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    goto/16 :goto_0
.end method
