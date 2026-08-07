.class Lcom/tantanapp/common/network/NetReqObs$OnSubs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;
.implements Ll/w84;
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/network/NetReqObs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OnSubs"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;",
        "Ll/w84;",
        "Ll/kcg0;"
    }
.end annotation


# instance fields
.field callBack:Lcom/tantanapp/common/network/ApiCallBack;

.field private final dataChecker:Lcom/tantanapp/common/data/DataChecker;

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

.field private final overrideRetry:Z

.field private final parser:Lcom/tantanapp/common/data/INetParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;"
        }
    .end annotation
.end field

.field private postParser:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ll/i5d0;",
            "TT;>;"
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
            "-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;ZLcom/tantanapp/common/data/DataChecker;Ll/z20;Lcom/tantanapp/common/network/ApiCallBack;Ll/qcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;Z",
            "Lcom/tantanapp/common/data/DataChecker;",
            "Ll/z20<",
            "Ll/i5d0;",
            "TT;>;",
            "Lcom/tantanapp/common/network/ApiCallBack;",
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
    iput v0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->retryCount:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->request:Ll/pcj;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->parser:Lcom/tantanapp/common/data/INetParser;

    .line 10
    .line 11
    iput-boolean p3, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->overrideRetry:Z

    .line 12
    .line 13
    iput-object p5, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->postParser:Ll/z20;

    .line 14
    .line 15
    iput-object p4, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->dataChecker:Lcom/tantanapp/common/data/DataChecker;

    .line 16
    .line 17
    iput-object p6, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 18
    .line 19
    iput-object p7, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->httpClient:Ll/qcj;

    .line 20
    .line 21
    return-void
.end method

.method private callOnError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

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
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->request:Ll/pcj;

    .line 10
    .line 11
    invoke-interface {v1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/x1d0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 16
    .line 17
    :try_start_1
    iget-object v2, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-interface {v2, v1}, Lcom/tantanapp/common/network/ApiCallBack;->beforeCall(Ll/x1d0;)Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v1
    :try_end_1
    .catch Lcom/tantanapp/common/network/NetIgnoredException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v2

    .line 27
    move-object v3, v2

    .line 28
    move-object v2, v1

    .line 29
    move-object v1, v0

    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :catch_0
    move-exception v2

    .line 33
    move-object v3, v2

    .line 34
    move-object v2, v0

    .line 35
    move-object v0, v1

    .line 36
    move-object v1, v2

    .line 37
    goto/16 :goto_3

    .line 38
    .line 39
    :catch_1
    move-exception v2

    .line 40
    goto/16 :goto_2

    .line 41
    .line 42
    :cond_1
    :goto_0
    :try_start_2
    iget-object v2, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->httpClient:Ll/qcj;

    .line 43
    .line 44
    invoke-interface {v2, v1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ll/rg50;

    .line 49
    .line 50
    invoke-virtual {v2, v1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 51
    .line 52
    .line 53
    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    :try_start_3
    invoke-interface {v2}, Ll/ry3;->execute()Ll/i5d0;

    .line 55
    .line 56
    .line 57
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 58
    :try_start_4
    iget-object v3, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 59
    .line 60
    if-eqz v3, :cond_3

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/i5d0;->k()Ll/k5d0;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iget-object v4, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 67
    .line 68
    invoke-interface {v4, v0}, Lcom/tantanapp/common/network/ApiCallBack;->decodeResponse(Ll/i5d0;)Ll/k5d0;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    if-eq v4, v3, :cond_2

    .line 73
    .line 74
    invoke-virtual {v3}, Ll/k5d0;->close()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ll/i5d0;->N()Ll/i5d0$a;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3, v4}, Ll/i5d0$a;->b(Ll/k5d0;)Ll/i5d0$a;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v3}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    goto :goto_1

    .line 90
    :catchall_1
    move-exception v3

    .line 91
    move-object v5, v1

    .line 92
    move-object v1, v0

    .line 93
    move-object v0, v2

    .line 94
    move-object v2, v5

    .line 95
    goto/16 :goto_4

    .line 96
    .line 97
    :catch_2
    move-exception v3

    .line 98
    move-object v5, v1

    .line 99
    move-object v1, v0

    .line 100
    move-object v0, v5

    .line 101
    goto :goto_3

    .line 102
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 103
    .line 104
    invoke-interface {v2}, Ll/ry3;->request()Ll/x1d0;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-interface {v3, v4, v0}, Lcom/tantanapp/common/network/ApiCallBack;->whenGetResponse(Ll/x1d0;Ll/i5d0;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    sget-boolean v3, Ll/kmk0;->c:Z

    .line 112
    .line 113
    if-eqz v3, :cond_4

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/x1d0;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    :cond_4
    invoke-virtual {p0, v2, v0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->onResponse(Ll/ry3;Ll/i5d0;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 119
    .line 120
    .line 121
    iget-object v3, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 122
    .line 123
    if-eqz v3, :cond_6

    .line 124
    .line 125
    invoke-interface {v2}, Ll/ry3;->isCanceled()Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_5

    .line 130
    .line 131
    iget-object v2, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 132
    .line 133
    invoke-interface {v2, v1}, Lcom/tantanapp/common/network/ApiCallBack;->requestCancel(Ll/x1d0;)V

    .line 134
    .line 135
    .line 136
    :cond_5
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 137
    .line 138
    invoke-interface {p0, v1}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 139
    .line 140
    .line 141
    :cond_6
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :catch_3
    move-exception v3

    .line 146
    :try_start_5
    invoke-virtual {p0, v1, v3}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->onError(Ll/x1d0;Ljava/lang/Exception;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 147
    .line 148
    .line 149
    iget-object v3, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 150
    .line 151
    if-eqz v3, :cond_8

    .line 152
    .line 153
    if-eqz v2, :cond_7

    .line 154
    .line 155
    invoke-interface {v2}, Ll/ry3;->isCanceled()Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-eqz v2, :cond_7

    .line 160
    .line 161
    iget-object v2, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 162
    .line 163
    invoke-interface {v2, v1}, Lcom/tantanapp/common/network/ApiCallBack;->requestCancel(Ll/x1d0;)V

    .line 164
    .line 165
    .line 166
    :cond_7
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 167
    .line 168
    invoke-interface {p0, v1}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 169
    .line 170
    .line 171
    :cond_8
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :goto_2
    :try_start_6
    invoke-virtual {p0, v1, v2}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->onError(Ll/x1d0;Ljava/lang/Exception;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 179
    .line 180
    if-eqz p0, :cond_9

    .line 181
    .line 182
    invoke-interface {p0, v1}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 183
    .line 184
    .line 185
    :cond_9
    invoke-static {v0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :catchall_2
    move-exception v2

    .line 190
    move-object v1, v0

    .line 191
    move-object v3, v2

    .line 192
    move-object v2, v1

    .line 193
    goto :goto_4

    .line 194
    :catch_4
    move-exception v2

    .line 195
    move-object v1, v0

    .line 196
    move-object v3, v2

    .line 197
    move-object v2, v1

    .line 198
    :goto_3
    :try_start_7
    invoke-virtual {p0, v0, v3}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->onError(Ll/x1d0;Ljava/lang/Exception;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 199
    .line 200
    .line 201
    iget-object v3, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 202
    .line 203
    if-eqz v3, :cond_b

    .line 204
    .line 205
    if-eqz v2, :cond_a

    .line 206
    .line 207
    invoke-interface {v2}, Ll/ry3;->isCanceled()Z

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    if-eqz v2, :cond_a

    .line 212
    .line 213
    iget-object v2, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 214
    .line 215
    invoke-interface {v2, v0}, Lcom/tantanapp/common/network/ApiCallBack;->requestCancel(Ll/x1d0;)V

    .line 216
    .line 217
    .line 218
    :cond_a
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 219
    .line 220
    invoke-interface {p0, v0}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 221
    .line 222
    .line 223
    :cond_b
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :catchall_3
    move-exception v3

    .line 228
    move-object v5, v2

    .line 229
    move-object v2, v0

    .line 230
    move-object v0, v5

    .line 231
    :goto_4
    iget-object v4, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 232
    .line 233
    if-eqz v4, :cond_d

    .line 234
    .line 235
    if-eqz v0, :cond_c

    .line 236
    .line 237
    invoke-interface {v0}, Ll/ry3;->isCanceled()Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-eqz v0, :cond_c

    .line 242
    .line 243
    iget-object v0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 244
    .line 245
    invoke-interface {v0, v2}, Lcom/tantanapp/common/network/ApiCallBack;->requestCancel(Ll/x1d0;)V

    .line 246
    .line 247
    .line 248
    :cond_c
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 249
    .line 250
    invoke-interface {p0, v2}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 251
    .line 252
    .line 253
    :cond_d
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 254
    .line 255
    .line 256
    throw v3
.end method

.method private netWorkTrackThrowable(Ll/x1d0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiError(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 23
    check-cast p1, Ll/gcg0;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->call(Ll/gcg0;)V

    return-void
.end method

.method public call(Ll/gcg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u11;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->executeRequest()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "Should be only called once"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public canRetry(Ll/x1d0;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ll/x1d0;->g()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-boolean p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->overrideRetry:Z

    .line 10
    .line 11
    if-nez p0, :cond_2

    .line 12
    .line 13
    const-string p0, "GET"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    const-string p0, "HEAD"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    const-string p0, "PUT"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_2

    .line 36
    .line 37
    const-string p0, "DELETE"

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    return p0

    .line 48
    :cond_2
    :goto_0
    return v0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

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

.method public onError(Ll/x1d0;Ljava/lang/Exception;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "request error : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", api error : "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "[common][network]"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->netWorkTrackThrowable(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->canRetry(Ll/x1d0;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    iget p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->retryCount:I

    .line 50
    .line 51
    const/4 v0, 0x2

    .line 52
    if-ge p1, v0, :cond_1

    .line 53
    .line 54
    sget-object p2, Ll/kmk0;->a:Ljava/lang/String;

    .line 55
    .line 56
    add-int/lit8 p1, p1, 0x1

    .line 57
    .line 58
    iput p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->retryCount:I

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->executeRequest()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-direct {p0, p2}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callOnError(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p2}, Lcom/tantanapp/common/network/NetReporter;->reportError(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
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
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->onError(Ll/x1d0;Ljava/lang/Exception;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "NetReqObs onResponse ApiExcep : "

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    sget-boolean p0, Ll/kmk0;->c:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/i5d0;->Z()Ll/x1d0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto/16 :goto_3

    .line 27
    .line 28
    :cond_0
    :goto_0
    invoke-static {p2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :try_start_1
    invoke-static {p2}, Lcom/tantanapp/common/network/ExceptionChecker;->check(Ll/i5d0;)Ljava/lang/Exception;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    instance-of v2, v1, Lcom/tantanapp/common/network/ApiExcep;

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    const-string v2, "[common][network]"

    .line 41
    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Ll/i5d0;->Z()Ll/x1d0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v0, ", check error : "

    .line 63
    .line 64
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callBack:Lcom/tantanapp/common/network/ApiCallBack;

    .line 82
    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    check-cast v1, Lcom/tantanapp/common/network/ApiExcep;

    .line 86
    .line 87
    invoke-interface {v0, v1}, Lcom/tantanapp/common/network/ApiCallBack;->whenResponseCheckError(Lcom/tantanapp/common/network/ApiExcep;)Ljava/lang/Exception;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    :cond_2
    if-eqz v1, :cond_5

    .line 92
    .line 93
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-direct {p0, p1, v1}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->netWorkTrackThrowable(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    instance-of p1, v1, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 101
    .line 102
    const/4 v0, 0x3

    .line 103
    if-eqz p1, :cond_3

    .line 104
    .line 105
    iget p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->retryCount:I

    .line 106
    .line 107
    if-ge p1, v0, :cond_3

    .line 108
    .line 109
    add-int/lit8 p1, p1, 0x1

    .line 110
    .line 111
    iput p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->retryCount:I

    .line 112
    .line 113
    invoke-direct {p0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->executeRequest()V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_3
    instance-of p1, v1, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;

    .line 118
    .line 119
    if-eqz p1, :cond_4

    .line 120
    .line 121
    iget p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->retryCount:I

    .line 122
    .line 123
    if-ge p1, v0, :cond_4

    .line 124
    .line 125
    add-int/lit8 p1, p1, 0x1

    .line 126
    .line 127
    iput p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->retryCount:I

    .line 128
    .line 129
    check-cast v1, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;

    .line 130
    .line 131
    iget p1, v1, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;->resetInSeconds:I

    .line 132
    .line 133
    sget-object v0, Ll/kmk0;->a:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    .line 135
    mul-int/lit16 p1, p1, 0x3e8

    .line 136
    .line 137
    int-to-long v0, p1

    .line 138
    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    .line 140
    .line 141
    :catch_0
    :try_start_3
    invoke-direct {p0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->executeRequest()V

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_4
    invoke-direct {p0, v1}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callOnError(Ljava/lang/Throwable;)V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_5
    invoke-static {p2}, Lcom/tantanapp/common/network/ExceptionChecker;->inputStreamAfterCheck(Ll/i5d0;)Ljava/io/InputStream;

    .line 150
    .line 151
    .line 152
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 153
    const/4 v1, 0x0

    .line 154
    if-eqz v0, :cond_6

    .line 155
    .line 156
    :try_start_4
    iget-object v2, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->parser:Lcom/tantanapp/common/data/INetParser;

    .line 157
    .line 158
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {v3}, Ll/x1d0;->k()Ll/rnl;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v3}, Ll/rnl;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    iget-object v4, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->dataChecker:Lcom/tantanapp/common/data/DataChecker;

    .line 171
    .line 172
    invoke-interface {v2, v0, v3, v4}, Lcom/tantanapp/common/data/INetParser;->parse(Ljava/io/InputStream;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iget-object v0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->postParser:Ll/z20;

    .line 177
    .line 178
    if-eqz v0, :cond_6

    .line 179
    .line 180
    invoke-interface {v0, p2, v1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :catch_1
    move-exception v0

    .line 185
    :try_start_5
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->netWorkTrackThrowable(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 190
    .line 191
    .line 192
    invoke-direct {p0, v0}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->callOnError(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    invoke-static {v0}, Lcom/tantanapp/common/network/NetReporter;->reportError(Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    :cond_6
    :goto_1
    iget-object p1, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 199
    .line 200
    if-eqz p1, :cond_7

    .line 201
    .line 202
    invoke-interface {p1, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 206
    .line 207
    if-eqz p0, :cond_7

    .line 208
    .line 209
    invoke-interface {p0}, Ll/bb50;->onCompleted()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 210
    .line 211
    .line 212
    :cond_7
    :goto_2
    invoke-static {p2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :goto_3
    invoke-static {p2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 217
    .line 218
    .line 219
    throw p0
.end method

.method public unsubscribe()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;->subscriber:Ll/gcg0;

    .line 3
    .line 4
    return-void
.end method
