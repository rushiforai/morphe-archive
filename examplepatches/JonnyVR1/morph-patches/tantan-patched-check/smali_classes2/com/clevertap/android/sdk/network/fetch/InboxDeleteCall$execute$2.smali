.class final Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->a(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Lkotlin/Unit;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Ll/drb;",
        "Lcom/clevertap/android/sdk/network/fetch/a;",
        "",
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
    c = "com.clevertap.android.sdk.network.fetch.InboxDeleteCall$execute$2"
    f = "InboxDeleteCall.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field label:I

.field final synthetic this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

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

    new-instance p1, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;

    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    invoke-direct {p1, p0, p2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;-><init>(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Lkotlin/Unit;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    const-string v0, "delete HTTP "

    .line 2
    .line 3
    const-string v1, "delete sent successfully (n="

    .line 4
    .line 5
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget v2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->label:I

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
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->e(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    new-instance p0, Lcom/clevertap/android/sdk/network/fetch/a$c;

    .line 29
    .line 30
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 31
    .line 32
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/fetch/a$c;-><init>(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    :try_start_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->f(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ll/hxb0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, v3}, Ll/hxb0;->s(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    new-instance p0, Lcom/clevertap/android/sdk/network/fetch/a$b;

    .line 49
    .line 50
    new-instance p1, Ljava/io/IOException;

    .line 51
    .line 52
    const-string v0, "header build failed"

    .line 53
    .line 54
    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/fetch/a$b;-><init>(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_1
    new-instance v2, Ll/y5f;

    .line 62
    .line 63
    iget-object v4, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    .line 64
    .line 65
    invoke-static {v4}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->e(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-static {v4, v5}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->b(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;Ljava/util/List;)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-direct {v2, p1, v4}, Ll/y5f;-><init>(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2}, Ll/y5f;->a()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 80
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    .line 81
    .line 82
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->d(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ll/axl;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    new-instance v4, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v5, "Send delete (n="

    .line 89
    .line 90
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v5, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    .line 94
    .line 95
    invoke-static {v5}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->e(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v5, "): "

    .line 107
    .line 108
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    const-string v5, "InboxV2"

    .line 119
    .line 120
    invoke-interface {v2, v5, v4}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :try_start_1
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    .line 124
    .line 125
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->c(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ll/yxb;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v2, p1}, Ll/yxb;->o(Ljava/lang/String;)Ll/j5d0;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 134
    .line 135
    :try_start_2
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    const/16 v6, 0xc8

    .line 140
    .line 141
    if-ne v4, v6, :cond_2

    .line 142
    .line 143
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->d(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ll/axl;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v4, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->e(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ljava/util/List;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const/16 v1, 0x29

    .line 164
    .line 165
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-interface {v0, v5, v1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    new-instance v0, Lcom/clevertap/android/sdk/network/fetch/a$c;

    .line 176
    .line 177
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 178
    .line 179
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/network/fetch/a$c;-><init>(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    goto :goto_0

    .line 183
    :catchall_0
    move-exception v0

    .line 184
    goto :goto_1

    .line 185
    :cond_2
    invoke-static {v2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->d(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ll/axl;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    new-instance v2, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1}, Ll/j5d0;->k()I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    const-string v0, " \u2014 V2 inbox disabled for session"

    .line 202
    .line 203
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-interface {v1, v5, v0}, Ll/axl;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    sget-object v0, Lcom/clevertap/android/sdk/network/fetch/a$a;->INSTANCE:Lcom/clevertap/android/sdk/network/fetch/a$a;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 214
    .line 215
    :goto_0
    :try_start_3
    invoke-static {p1, v3}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 216
    .line 217
    .line 218
    return-object v0

    .line 219
    :catch_0
    move-exception p1

    .line 220
    goto :goto_2

    .line 221
    :goto_1
    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 222
    :catchall_1
    move-exception v1

    .line 223
    :try_start_5
    invoke-static {p1, v0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 224
    .line 225
    .line 226
    throw v1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 227
    :goto_2
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall$execute$2;->this$0:Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    .line 228
    .line 229
    invoke-static {p0}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->d(Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;)Ll/axl;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    new-instance v0, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    const-string v1, "delete failed: "

    .line 236
    .line 237
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-interface {p0, v5, v0}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    new-instance p0, Lcom/clevertap/android/sdk/network/fetch/a$b;

    .line 251
    .line 252
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/fetch/a$b;-><init>(Ljava/lang/Throwable;)V

    .line 253
    .line 254
    .line 255
    return-object p0

    .line 256
    :catch_1
    move-exception p0

    .line 257
    new-instance p1, Lcom/clevertap/android/sdk/network/fetch/a$b;

    .line 258
    .line 259
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/network/fetch/a$b;-><init>(Ljava/lang/Throwable;)V

    .line 260
    .line 261
    .line 262
    return-object p1

    .line 263
    :cond_3
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 264
    .line 265
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    return-object v3
.end method
