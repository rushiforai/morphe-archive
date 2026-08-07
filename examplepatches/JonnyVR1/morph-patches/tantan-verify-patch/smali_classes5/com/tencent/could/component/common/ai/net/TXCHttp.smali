.class public Lcom/tencent/could/component/common/ai/net/TXCHttp;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static sendRequest(Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;Lcom/tencent/could/component/common/ai/net/IJsonDataListener;)V
    .locals 1

    .line 1
    if-nez p0, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p0, "input param is null!"

    .line 6
    .line 7
    invoke-interface {p1, p0}, Lcom/tencent/could/component/common/ai/net/IJsonDataListener;->onFailed(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    new-instance v0, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;-><init>(Lcom/tencent/could/component/common/ai/net/IJsonDataListener;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Lcom/tencent/could/component/common/ai/net/HttpTask;

    .line 17
    .line 18
    invoke-direct {p1, v0, p0}, Lcom/tencent/could/component/common/ai/net/HttpTask;-><init>(Lcom/tencent/could/component/common/ai/net/CallBackListener;Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/ThreadManager;->getInstance()Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p1}, Lcom/tencent/could/component/common/ai/net/ThreadManager;->addTask(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static stopCurrentRequest()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/ThreadManager;->getInstance()Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/net/ThreadManager;->stopCurrentRequest()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
