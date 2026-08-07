.class public Lcom/sina/weibo/sdk/network/impl/RequestTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"

# interfaces
.implements Lcom/sina/weibo/sdk/network/RequestCancelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Lcom/sina/weibo/sdk/network/base/RequestResult;",
        ">;",
        "Lcom/sina/weibo/sdk/network/RequestCancelable;"
    }
.end annotation


# instance fields
.field private param:Lcom/sina/weibo/sdk/network/IRequestParam;

.field tClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field private target:Lcom/sina/weibo/sdk/network/target/Target;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/sina/weibo/sdk/network/target/Target<",
            "TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/sina/weibo/sdk/network/IRequestParam;Lcom/sina/weibo/sdk/network/target/Target;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sina/weibo/sdk/network/IRequestParam;",
            "Lcom/sina/weibo/sdk/network/target/Target<",
            "TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 0

    return-void
.end method

.method public varargs doInBackground([Ljava/lang/Object;)Lcom/sina/weibo/sdk/network/base/RequestResult;
    .locals 5

    .line 1
    new-instance p1, Lcom/sina/weibo/sdk/network/base/RequestResult;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/sina/weibo/sdk/network/base/RequestResult;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/sina/weibo/sdk/net/NetStateManager;->isNetworkConnected(Landroid/content/Context;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const-string v0, "Task"

    .line 19
    .line 20
    const-string v1, "RequestTask:android.permission.ACCESS_NETWORK_STATE"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/sina/weibo/sdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Lcom/sina/weibo/sdk/network/exception/SdkException;

    .line 26
    .line 27
    const-string v1, "android.permission.ACCESS_NETWORK_STATE"

    .line 28
    .line 29
    invoke-direct {v0, v1}, Lcom/sina/weibo/sdk/network/exception/SdkException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/sina/weibo/sdk/network/base/RequestResult;->setE(Ljava/lang/Exception;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 36
    .line 37
    invoke-interface {v0}, Lcom/sina/weibo/sdk/network/IRequestParam;->needIntercept()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_5

    .line 42
    .line 43
    :try_start_0
    new-instance v0, Landroid/os/Bundle;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->init()Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->getGlobalIntercept()Ljava/util/HashMap;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_2

    .line 69
    .line 70
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Lcom/sina/weibo/sdk/network/IRequestIntercept;

    .line 81
    .line 82
    if-eqz v3, :cond_1

    .line 83
    .line 84
    iget-object v4, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 85
    .line 86
    invoke-interface {v3, v4, v0}, Lcom/sina/weibo/sdk/network/IRequestIntercept;->needIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-eqz v4, :cond_1

    .line 91
    .line 92
    iget-object v4, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 93
    .line 94
    invoke-interface {v3, v4, v0}, Lcom/sina/weibo/sdk/network/IRequestIntercept;->doIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :catch_0
    move-exception p0

    .line 99
    goto :goto_2

    .line 100
    :cond_2
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 101
    .line 102
    invoke-interface {v1}, Lcom/sina/weibo/sdk/network/IRequestParam;->getIntercept()Ljava/util/ArrayList;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_4

    .line 115
    .line 116
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    check-cast v2, Lcom/sina/weibo/sdk/network/IRequestIntercept;

    .line 121
    .line 122
    iget-object v3, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 123
    .line 124
    invoke-interface {v2, v3, v0}, Lcom/sina/weibo/sdk/network/IRequestIntercept;->needIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-eqz v3, :cond_3

    .line 129
    .line 130
    iget-object v3, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 131
    .line 132
    invoke-interface {v2, v3, v0}, Lcom/sina/weibo/sdk/network/IRequestIntercept;->doIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_4
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 137
    .line 138
    invoke-interface {v1}, Lcom/sina/weibo/sdk/network/IRequestParam;->getPostBundle()Landroid/os/Bundle;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v1, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V
    :try_end_0
    .catch Lcom/sina/weibo/sdk/network/exception/InterceptException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :goto_2
    invoke-virtual {p1, p0}, Lcom/sina/weibo/sdk/network/base/RequestResult;->setE(Ljava/lang/Exception;)V

    .line 147
    .line 148
    .line 149
    return-object p1

    .line 150
    :cond_5
    :goto_3
    :try_start_1
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 151
    .line 152
    invoke-static {v0}, Lcom/sina/weibo/sdk/network/impl/RequestEngine;->request(Lcom/sina/weibo/sdk/network/IRequestParam;)Lcom/sina/weibo/sdk/network/base/WbResponse;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 157
    .line 158
    invoke-interface {v1, v0}, Lcom/sina/weibo/sdk/network/target/Target;->transResponse(Lcom/sina/weibo/sdk/network/base/WbResponse;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 163
    .line 164
    invoke-interface {p0, v1}, Lcom/sina/weibo/sdk/network/target/Target;->onRequestSuccessBg(Ljava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1, v1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->setResponse(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 168
    .line 169
    .line 170
    :try_start_2
    invoke-virtual {v0}, Lcom/sina/weibo/sdk/network/base/WbResponse;->body()Lcom/sina/weibo/sdk/network/base/WbResponseBody;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p0}, Lcom/sina/weibo/sdk/network/base/WbResponseBody;->byteStream()Ljava/io/InputStream;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    if-eqz p0, :cond_6

    .line 179
    .line 180
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 181
    .line 182
    .line 183
    goto :goto_4

    .line 184
    :catch_1
    move-exception p0

    .line 185
    invoke-virtual {p1, p0}, Lcom/sina/weibo/sdk/network/base/RequestResult;->setE(Ljava/lang/Exception;)V

    .line 186
    .line 187
    .line 188
    :catch_2
    :cond_6
    :goto_4
    return-object p1
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 189
    invoke-virtual {p0, p1}, Lcom/sina/weibo/sdk/network/impl/RequestTask;->doInBackground([Ljava/lang/Object;)Lcom/sina/weibo/sdk/network/base/RequestResult;

    move-result-object p0

    return-object p0
.end method

.method public isCancelRequest()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onPostExecute(Lcom/sina/weibo/sdk/network/base/RequestResult;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/sina/weibo/sdk/network/target/Target;->onRequestDone()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->getE()Ljava/lang/Exception;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->getE()Ljava/lang/Exception;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {v1, p1}, Lcom/sina/weibo/sdk/network/target/Target;->onFailure(Ljava/lang/Exception;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/RequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 27
    .line 28
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/target/Target;->onError()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->getResponse()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {v1, p0}, Lcom/sina/weibo/sdk/network/target/Target;->onRequestSuccess(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/sina/weibo/sdk/network/base/RequestResult;

    invoke-virtual {p0, p1}, Lcom/sina/weibo/sdk/network/impl/RequestTask;->onPostExecute(Lcom/sina/weibo/sdk/network/base/RequestResult;)V

    return-void
.end method
