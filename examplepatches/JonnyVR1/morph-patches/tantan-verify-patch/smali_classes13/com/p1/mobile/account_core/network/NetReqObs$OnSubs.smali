.class Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;
.implements Ll/w84;
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/account_core/network/NetReqObs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OnSubs"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
        ">;",
        "Ll/w84;",
        "Ll/kcg0;"
    }
.end annotation


# instance fields
.field callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

.field private currentRequest:Ll/x1d0;

.field httpClient:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ll/x1d0;",
            "Ll/rg50;",
            ">;"
        }
    .end annotation
.end field

.field private final request:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;"
        }
    .end annotation
.end field

.field retryCount:I

.field private subscriber:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/pcj;Lcom/p1/mobile/account_core/network/ApiCallBack;Ll/qcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/p1/mobile/account_core/network/ApiCallBack;",
            "Ll/qcj<",
            "Ll/x1d0;",
            "Ll/rg50;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->retryCount:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->request:Ll/pcj;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->httpClient:Ll/qcj;

    .line 12
    .line 13
    return-void
.end method

.method private callOnError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private executeRequest()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->request:Ll/pcj;

    .line 11
    .line 12
    invoke-interface {v1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/x1d0;

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->currentRequest:Ll/x1d0;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v2, v1}, Lcom/p1/mobile/account_core/network/ApiCallBack;->beforeCall(Ll/x1d0;)Ll/x1d0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->currentRequest:Ll/x1d0;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v1

    .line 32
    goto/16 :goto_5

    .line 33
    .line 34
    :catch_0
    move-exception v1

    .line 35
    goto :goto_3

    .line 36
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->httpClient:Ll/qcj;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->currentRequest:Ll/x1d0;

    .line 39
    .line 40
    invoke-interface {v1, v2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ll/rg50;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->currentRequest:Ll/x1d0;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 53
    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    invoke-interface {v2, v1}, Lcom/p1/mobile/account_core/network/ApiCallBack;->whenGetRealCall(Ll/ry3;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    .line 59
    :cond_2
    :try_start_1
    invoke-interface {v1}, Ll/ry3;->execute()Ll/i5d0;

    .line 60
    .line 61
    .line 62
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    :try_start_2
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 64
    .line 65
    if-eqz v2, :cond_3

    .line 66
    .line 67
    invoke-interface {v2, v1}, Lcom/p1/mobile/account_core/network/ApiCallBack;->whenGetResponse(Ll/i5d0;)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :catchall_1
    move-exception v0

    .line 72
    move-object v3, v1

    .line 73
    move-object v1, v0

    .line 74
    move-object v0, v3

    .line 75
    goto :goto_5

    .line 76
    :catch_1
    move-exception v0

    .line 77
    move-object v3, v1

    .line 78
    move-object v1, v0

    .line 79
    move-object v0, v3

    .line 80
    goto :goto_3

    .line 81
    :cond_3
    :goto_1
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->onResponse(Ll/ry3;Ll/i5d0;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/cmk0;->a(Ljava/io/Closeable;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 88
    .line 89
    if-eqz p0, :cond_6

    .line 90
    .line 91
    invoke-interface {p0}, Lcom/p1/mobile/account_core/network/ApiCallBack;->whenApiFinish()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :catch_2
    move-exception v1

    .line 96
    :try_start_3
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 97
    .line 98
    if-eqz v2, :cond_4

    .line 99
    .line 100
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 101
    .line 102
    invoke-interface {v2, v1}, Lcom/p1/mobile/account_core/network/ApiCallBack;->whenApiError(Ljava/lang/Exception;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->currentRequest:Ll/x1d0;

    .line 106
    .line 107
    invoke-virtual {v2}, Ll/x1d0;->k()Ll/rnl;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->onError(Ll/rnl;Ljava/lang/Exception;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 112
    .line 113
    .line 114
    invoke-static {v0}, Ll/cmk0;->a(Ljava/io/Closeable;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 118
    .line 119
    if-eqz p0, :cond_6

    .line 120
    .line 121
    :goto_2
    invoke-interface {p0}, Lcom/p1/mobile/account_core/network/ApiCallBack;->whenApiFinish()V

    .line 122
    .line 123
    .line 124
    goto :goto_4

    .line 125
    :goto_3
    :try_start_4
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 126
    .line 127
    if-eqz v2, :cond_5

    .line 128
    .line 129
    invoke-interface {v2, v1}, Lcom/p1/mobile/account_core/network/ApiCallBack;->whenApiError(Ljava/lang/Exception;)V

    .line 130
    .line 131
    .line 132
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->currentRequest:Ll/x1d0;

    .line 133
    .line 134
    invoke-virtual {v2}, Ll/x1d0;->k()Ll/rnl;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->onError(Ll/rnl;Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 139
    .line 140
    .line 141
    invoke-static {v0}, Ll/cmk0;->a(Ljava/io/Closeable;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 145
    .line 146
    if-eqz p0, :cond_6

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_6
    :goto_4
    return-void

    .line 150
    :goto_5
    invoke-static {v0}, Ll/cmk0;->a(Ljava/io/Closeable;)V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 154
    .line 155
    if-eqz p0, :cond_7

    .line 156
    .line 157
    invoke-interface {p0}, Lcom/p1/mobile/account_core/network/ApiCallBack;->whenApiFinish()V

    .line 158
    .line 159
    .line 160
    :cond_7
    throw v1
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 36
    check-cast p1, Ll/gcg0;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->call(Ll/gcg0;)V

    return-void
.end method

.method public call(Ll/gcg0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->executeRequest()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "Should be only called once"

    .line 25
    .line 26
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    const-string p0, "Should not be called from main thread"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public canRetry()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->currentRequest:Ll/x1d0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/x1d0;->g()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "GET"

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_2

    .line 18
    .line 19
    const-string v1, "HEAD"

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    const-string v1, "PUT"

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    const-string v1, "DELETE"

    .line 36
    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    return p0

    .line 46
    :cond_2
    :goto_0
    return v0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public onError(Ll/rnl;Ljava/lang/Exception;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->canRetry()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget p1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->retryCount:I

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    add-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->retryCount:I

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->executeRequest()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0, p2}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callOnError(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onFailure(Ll/ry3;Ljava/io/IOException;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->onError(Ll/rnl;Ljava/lang/Exception;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Ll/cmk0;->a(Ljava/io/Closeable;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    :try_start_1
    iget-object p1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callBack:Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-interface {p1, p2}, Lcom/p1/mobile/account_core/network/ApiCallBack;->beforeExceptionCheck(Ll/i5d0;)Ljava/lang/Exception;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_4

    .line 23
    :cond_1
    move-object p1, v0

    .line 24
    :goto_0
    if-nez p1, :cond_2

    .line 25
    .line 26
    invoke-static {p2}, Lcom/p1/mobile/account_core/network/ExceptionChecker;->check(Ll/i5d0;)Ljava/lang/Exception;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :cond_2
    if-eqz p1, :cond_4

    .line 31
    .line 32
    instance-of v0, p1, Lcom/p1/mobile/account_core/exception/TooManyRequests;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    iget v0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->retryCount:I

    .line 37
    .line 38
    const/4 v1, 0x3

    .line 39
    if-ge v0, v1, :cond_3

    .line 40
    .line 41
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    iput v0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->retryCount:I

    .line 44
    .line 45
    check-cast p1, Lcom/p1/mobile/account_core/exception/TooManyRequests;

    .line 46
    .line 47
    iget p1, p1, Lcom/p1/mobile/account_core/exception/TooManyRequests;->resetInSeconds:I

    .line 48
    .line 49
    sget-boolean v0, Ll/tv;->a:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    mul-int/lit16 p1, p1, 0x3e8

    .line 52
    .line 53
    int-to-long v0, p1

    .line 54
    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .line 56
    .line 57
    :catch_0
    :try_start_3
    invoke-direct {p0}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->executeRequest()V

    .line 58
    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    invoke-direct {p0, p1}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callOnError(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_4
    invoke-virtual {p2}, Ll/i5d0;->q()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    const/16 v1, 0xcc

    .line 70
    .line 71
    if-eq p1, v1, :cond_5

    .line 72
    .line 73
    invoke-virtual {p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ll/k5d0;->string()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 81
    goto :goto_1

    .line 82
    :cond_5
    move-object p1, v0

    .line 83
    :goto_1
    if-eqz p1, :cond_6

    .line 84
    .line 85
    :try_start_4
    new-instance v1, Lcom/google/gson/Gson;

    .line 86
    .line 87
    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    .line 88
    .line 89
    .line 90
    const-class v2, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    .line 91
    .line 92
    invoke-virtual {v1, p1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;
    :try_end_4
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 97
    .line 98
    move-object v0, p1

    .line 99
    goto :goto_2

    .line 100
    :catch_1
    move-exception p1

    .line 101
    :try_start_5
    invoke-direct {p0, p1}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->callOnError(Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    :cond_6
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 105
    .line 106
    if-eqz p1, :cond_7

    .line 107
    .line 108
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 112
    .line 113
    if-eqz p0, :cond_7

    .line 114
    .line 115
    invoke-interface {p0}, Ll/bb50;->onCompleted()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 116
    .line 117
    .line 118
    :cond_7
    :goto_3
    invoke-static {p2}, Ll/cmk0;->a(Ljava/io/Closeable;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :goto_4
    invoke-static {p2}, Ll/cmk0;->a(Ljava/io/Closeable;)V

    .line 123
    .line 124
    .line 125
    throw p0
.end method

.method public unsubscribe()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 3
    .line 4
    return-void
.end method
