.class final Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->a(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/drb;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lcom/clevertap/android/sdk/network/fetch/a<",
        "+",
        "Lorg/json/JSONObject;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Ll/drb;",
        "Lcom/clevertap/android/sdk/network/fetch/a;",
        "Lorg/json/JSONObject;",
        "<anonymous>",
        "(Ll/drb;)Lcom/clevertap/android/sdk/network/fetch/a;"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.clevertap.android.sdk.network.fetch.InboxFetchCall$execute$2"
    f = "InboxFetchCall.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field label:I

.field final synthetic this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;

    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    invoke-direct {p1, p0, p2}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;-><init>(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/drb;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/network/fetch/a<",
            "+",
            "Lorg/json/JSONObject;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    const-string v0, "HTTP "

    .line 2
    .line 3
    const-string v1, "fetch sent successfully (HTTP 200, "

    .line 4
    .line 5
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget v2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->label:I

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez v2, :cond_3

    .line 12
    .line 13
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->g(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/hxb0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, v3}, Ll/hxb0;->s(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p0, Lcom/clevertap/android/sdk/network/fetch/a$b;

    .line 29
    .line 30
    new-instance p1, Ljava/io/IOException;

    .line 31
    .line 32
    const-string v0, "header build failed"

    .line 33
    .line 34
    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/fetch/a$b;-><init>(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_0
    const-string v2, "wzrk_fetch"

    .line 42
    .line 43
    new-instance v4, Lorg/json/JSONObject;

    .line 44
    .line 45
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v5, "t"

    .line 49
    .line 50
    const/4 v6, 0x7

    .line 51
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    iget-object v5, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    .line 59
    .line 60
    invoke-static {v5}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->c(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/bu9;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    iget-object v6, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    .line 65
    .line 66
    invoke-static {v6}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->b(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/oa5;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    iget-object v7, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    .line 71
    .line 72
    invoke-static {v7}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->f(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    invoke-static {v2, v4, v5, v6, v7}, Ll/dtm;->a(Ljava/lang/String;Lorg/json/JSONObject;Ll/bu9;Ll/oa5;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    new-instance v4, Ll/y5f;

    .line 81
    .line 82
    invoke-direct {v4, p1, v2}, Ll/y5f;-><init>(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4}, Ll/y5f;->a()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 89
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    .line 90
    .line 91
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->e(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/axl;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    new-instance v4, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v5, "Send fetch (t=7): "

    .line 98
    .line 99
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    const-string v5, "InboxV2"

    .line 110
    .line 111
    invoke-interface {v2, v5, v4}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :try_start_1
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    .line 115
    .line 116
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->d(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/yxb;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v2, p1}, Ll/yxb;->p(Ljava/lang/String;)Ll/j5d0;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 125
    .line 126
    :try_start_2
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    const/16 v6, 0xc8

    .line 131
    .line 132
    if-ne v4, v6, :cond_2

    .line 133
    .line 134
    invoke-virtual {p1}, Ll/j5d0;->q()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    if-nez v0, :cond_1

    .line 139
    .line 140
    new-instance v0, Lcom/clevertap/android/sdk/network/fetch/a$b;

    .line 141
    .line 142
    new-instance v1, Ljava/io/IOException;

    .line 143
    .line 144
    const-string v2, "empty body"

    .line 145
    .line 146
    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/network/fetch/a$b;-><init>(Ljava/lang/Throwable;)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :catchall_0
    move-exception v0

    .line 154
    goto :goto_1

    .line 155
    :cond_1
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->e(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/axl;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    new-instance v4, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v1, " bytes)"

    .line 172
    .line 173
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-interface {v2, v5, v1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    new-instance v1, Lcom/clevertap/android/sdk/network/fetch/a$c;

    .line 184
    .line 185
    new-instance v2, Lorg/json/JSONObject;

    .line 186
    .line 187
    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-direct {v1, v2}, Lcom/clevertap/android/sdk/network/fetch/a$c;-><init>(Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    move-object v0, v1

    .line 194
    goto :goto_0

    .line 195
    :cond_2
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->e(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/axl;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    new-instance v2, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v0, " \u2014 V2 inbox disabled for session"

    .line 212
    .line 213
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-interface {v1, v5, v0}, Ll/axl;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    sget-object v0, Lcom/clevertap/android/sdk/network/fetch/a$a;->INSTANCE:Lcom/clevertap/android/sdk/network/fetch/a$a;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 224
    .line 225
    :goto_0
    :try_start_3
    invoke-static {p1, v3}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 226
    .line 227
    .line 228
    return-object v0

    .line 229
    :catch_0
    move-exception p1

    .line 230
    goto :goto_2

    .line 231
    :goto_1
    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 232
    :catchall_1
    move-exception v1

    .line 233
    :try_start_5
    invoke-static {p1, v0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 234
    .line 235
    .line 236
    throw v1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 237
    :goto_2
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;

    .line 238
    .line 239
    invoke-static {p0}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->e(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/axl;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    new-instance v0, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    const-string v1, "fetch failed: "

    .line 246
    .line 247
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-interface {p0, v5, v0}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    new-instance p0, Lcom/clevertap/android/sdk/network/fetch/a$b;

    .line 261
    .line 262
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/fetch/a$b;-><init>(Ljava/lang/Throwable;)V

    .line 263
    .line 264
    .line 265
    return-object p0

    .line 266
    :catch_1
    move-exception p0

    .line 267
    new-instance p1, Lcom/clevertap/android/sdk/network/fetch/a$b;

    .line 268
    .line 269
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/network/fetch/a$b;-><init>(Ljava/lang/Throwable;)V

    .line 270
    .line 271
    .line 272
    return-object p1

    .line 273
    :cond_3
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 274
    .line 275
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    return-object v3
.end method
