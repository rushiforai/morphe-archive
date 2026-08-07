.class public Lcom/sina/weibo/sdk/network/impl/FixRequestTask;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/sina/weibo/sdk/network/RequestCancelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;",
        "Lcom/sina/weibo/sdk/network/RequestCancelable;"
    }
.end annotation


# instance fields
.field private callback:Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/sina/weibo/sdk/network/impl/FixRequestTask<",
            "TT;TR;>.RequestCallback;"
        }
    .end annotation
.end field

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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 7
    .line 8
    new-instance p1, Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-direct {p1, p0, p2}, Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;-><init>(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;Lcom/sina/weibo/sdk/network/impl/FixRequestTask$1;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->callback:Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic access$100(Lcom/sina/weibo/sdk/network/impl/FixRequestTask;)Lcom/sina/weibo/sdk/network/target/Target;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public cancelRequest()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public isCancelRequest()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public run()V
    .locals 7

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/network/base/RequestResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/sina/weibo/sdk/network/base/RequestResult;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 7
    .line 8
    invoke-interface {v1}, Lcom/sina/weibo/sdk/network/IRequestParam;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Lcom/sina/weibo/sdk/net/NetStateManager;->isNetworkConnected(Landroid/content/Context;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const-string v2, "Task"

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    const-string v1, "FixRequestTask:android.permission.ACCESS_NETWORK_STATE"

    .line 21
    .line 22
    invoke-static {v2, v1}, Lcom/sina/weibo/sdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Lcom/sina/weibo/sdk/network/exception/SdkException;

    .line 26
    .line 27
    const-string v3, "android.permission.ACCESS_NETWORK_STATE"

    .line 28
    .line 29
    invoke-direct {v1, v3}, Lcom/sina/weibo/sdk/network/exception/SdkException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->setE(Ljava/lang/Exception;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 36
    .line 37
    invoke-interface {v1}, Lcom/sina/weibo/sdk/network/IRequestParam;->needIntercept()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_5

    .line 42
    .line 43
    :try_start_0
    new-instance v1, Landroid/os/Bundle;

    .line 44
    .line 45
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->init()Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Lcom/sina/weibo/sdk/network/intercept/GlobalInterceptHelper;->getGlobalIntercept()Ljava/util/HashMap;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-eqz v5, :cond_2

    .line 69
    .line 70
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    check-cast v5, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    check-cast v5, Lcom/sina/weibo/sdk/network/IRequestIntercept;

    .line 81
    .line 82
    if-eqz v5, :cond_1

    .line 83
    .line 84
    iget-object v6, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 85
    .line 86
    invoke-interface {v5, v6, v1}, Lcom/sina/weibo/sdk/network/IRequestIntercept;->needIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    if-eqz v6, :cond_1

    .line 91
    .line 92
    iget-object v6, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 93
    .line 94
    invoke-interface {v5, v6, v1}, Lcom/sina/weibo/sdk/network/IRequestIntercept;->doIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :catch_0
    move-exception v1

    .line 99
    goto :goto_2

    .line 100
    :cond_2
    iget-object v3, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 101
    .line 102
    invoke-interface {v3}, Lcom/sina/weibo/sdk/network/IRequestParam;->getIntercept()Ljava/util/ArrayList;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-eqz v4, :cond_4

    .line 115
    .line 116
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    check-cast v4, Lcom/sina/weibo/sdk/network/IRequestIntercept;

    .line 121
    .line 122
    iget-object v5, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 123
    .line 124
    invoke-interface {v4, v5, v1}, Lcom/sina/weibo/sdk/network/IRequestIntercept;->needIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-eqz v5, :cond_3

    .line 129
    .line 130
    iget-object v5, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 131
    .line 132
    invoke-interface {v4, v5, v1}, Lcom/sina/weibo/sdk/network/IRequestIntercept;->doIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_4
    iget-object v3, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 137
    .line 138
    invoke-interface {v3}, Lcom/sina/weibo/sdk/network/IRequestParam;->getGetBundle()Landroid/os/Bundle;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v3, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 143
    .line 144
    .line 145
    iget-object v3, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 146
    .line 147
    invoke-interface {v3}, Lcom/sina/weibo/sdk/network/IRequestParam;->getPostBundle()Landroid/os/Bundle;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V
    :try_end_0
    .catch Lcom/sina/weibo/sdk/network/exception/InterceptException; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .line 153
    .line 154
    goto :goto_3

    .line 155
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    const-string v4, "FixRequestTask:"

    .line 158
    .line 159
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-static {v2, v3}, Lcom/sina/weibo/sdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->setE(Ljava/lang/Exception;)V

    .line 177
    .line 178
    .line 179
    new-instance v1, Landroid/os/Handler;

    .line 180
    .line 181
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->callback:Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;

    .line 186
    .line 187
    invoke-direct {v1, v2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 188
    .line 189
    .line 190
    new-instance p0, Landroid/os/Message;

    .line 191
    .line 192
    invoke-direct {p0}, Landroid/os/Message;-><init>()V

    .line 193
    .line 194
    .line 195
    iput-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 196
    .line 197
    invoke-virtual {v1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :cond_5
    :goto_3
    :try_start_1
    iget-object v1, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->param:Lcom/sina/weibo/sdk/network/IRequestParam;

    .line 202
    .line 203
    invoke-static {v1}, Lcom/sina/weibo/sdk/network/impl/RequestEngine;->request(Lcom/sina/weibo/sdk/network/IRequestParam;)Lcom/sina/weibo/sdk/network/base/WbResponse;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    iget-object v2, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 208
    .line 209
    invoke-interface {v2, v1}, Lcom/sina/weibo/sdk/network/target/Target;->transResponse(Lcom/sina/weibo/sdk/network/base/WbResponse;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    iget-object v3, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->target:Lcom/sina/weibo/sdk/network/target/Target;

    .line 214
    .line 215
    invoke-interface {v3, v2}, Lcom/sina/weibo/sdk/network/target/Target;->onRequestSuccessBg(Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v0, v2}, Lcom/sina/weibo/sdk/network/base/RequestResult;->setResponse(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 219
    .line 220
    .line 221
    :try_start_2
    invoke-virtual {v1}, Lcom/sina/weibo/sdk/network/base/WbResponse;->body()Lcom/sina/weibo/sdk/network/base/WbResponseBody;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual {v1}, Lcom/sina/weibo/sdk/network/base/WbResponseBody;->byteStream()Ljava/io/InputStream;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    if-eqz v1, :cond_6

    .line 230
    .line 231
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 232
    .line 233
    .line 234
    goto :goto_4

    .line 235
    :catch_1
    move-exception v1

    .line 236
    invoke-virtual {v0, v1}, Lcom/sina/weibo/sdk/network/base/RequestResult;->setE(Ljava/lang/Exception;)V

    .line 237
    .line 238
    .line 239
    :catch_2
    :cond_6
    :goto_4
    new-instance v1, Landroid/os/Handler;

    .line 240
    .line 241
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/impl/FixRequestTask;->callback:Lcom/sina/weibo/sdk/network/impl/FixRequestTask$RequestCallback;

    .line 246
    .line 247
    invoke-direct {v1, v2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 248
    .line 249
    .line 250
    new-instance p0, Landroid/os/Message;

    .line 251
    .line 252
    invoke-direct {p0}, Landroid/os/Message;-><init>()V

    .line 253
    .line 254
    .line 255
    iput-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 256
    .line 257
    invoke-virtual {v1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 258
    .line 259
    .line 260
    return-void
.end method
