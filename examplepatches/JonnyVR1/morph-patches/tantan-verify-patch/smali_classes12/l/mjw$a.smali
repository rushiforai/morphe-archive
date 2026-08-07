.class final Ll/mjw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/MessageQueue$IdleHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mjw;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "queueIdle"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Ll/mjw$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/mjw$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mjw$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/mjw$a;->INSTANCE:Ll/mjw$a;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final queueIdle()Z
    .locals 13

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    const-string v1, "MKCachePoolManager"

    .line 4
    .line 5
    const-string v0, "lehua:boost \u521b\u5efa\u7f13\u5b58\u6c60 \u52a0\u901f\u5668MKWebView \u5b9e\u4f8b "

    .line 6
    .line 7
    const-string v2, "lehua:boost \u7f13\u5b58\u6c60\u53c2\u6570 "

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    :try_start_0
    sget-object v4, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 11
    .line 12
    invoke-static {v4}, Ll/mjw;->d(Ll/mjw;)I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    if-gtz v5, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/yfi;->r()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    invoke-static {v4, v5}, Ll/mjw;->j(Ll/mjw;I)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/yfi;->n()Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-static {v4, v5}, Ll/mjw;->h(Ll/mjw;Z)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/yfi;->v()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    mul-int/lit8 v5, v5, 0x3c

    .line 37
    .line 38
    int-to-long v5, v5

    .line 39
    const-wide/16 v7, 0x3e8

    .line 40
    .line 41
    mul-long/2addr v5, v7

    .line 42
    invoke-static {v4, v5, v6}, Ll/mjw;->g(Ll/mjw;J)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto/16 :goto_3

    .line 48
    .line 49
    :cond_0
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v4}, Ll/mjw;->a(Ll/mjw;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v1, v2}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v4}, Ll/mjw;->d(Ll/mjw;)I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-lez v2, :cond_4

    .line 73
    .line 74
    invoke-static {v4}, Ll/mjw;->b(Ll/mjw;)Ljava/lang/ref/SoftReference;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 83
    .line 84
    if-eqz v2, :cond_4

    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    if-eqz v5, :cond_4

    .line 91
    .line 92
    invoke-static {v4}, Ll/mjw;->d(Ll/mjw;)I

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    invoke-static {v4}, Ll/mjw;->e(Ll/mjw;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    sub-int/2addr v5, v6

    .line 105
    if-lez v5, :cond_4

    .line 106
    .line 107
    const/4 v5, 0x1

    .line 108
    const/4 v6, 0x0

    .line 109
    invoke-static {v4, v6, v5, v6}, Ll/mjw;->n(Ll/mjw;Landroid/content/Context;ILjava/lang/Object;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    if-eqz v7, :cond_4

    .line 114
    .line 115
    invoke-virtual {v2, v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 119
    .line 120
    .line 121
    move-result-wide v8

    .line 122
    invoke-static {v4, v8, v9}, Ll/mjw;->i(Ll/mjw;J)V

    .line 123
    .line 124
    .line 125
    invoke-static {v4}, Ll/mjw;->c(Ll/mjw;)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_4

    .line 130
    .line 131
    invoke-static {}, Ll/yfi;->m()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {}, Ll/yfi;->j()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    if-eqz v2, :cond_1

    .line 140
    .line 141
    const-string v8, "https://"

    .line 142
    .line 143
    const/4 v9, 0x2

    .line 144
    invoke-static {v2, v8, v3, v9, v6}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    if-eqz v6, :cond_1

    .line 149
    .line 150
    move-object v6, v2

    .line 151
    goto :goto_1

    .line 152
    :cond_1
    move-object v6, p0

    .line 153
    :goto_1
    sget-object v8, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 154
    .line 155
    invoke-virtual {v8}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 156
    .line 157
    .line 158
    move-result-object v8

    .line 159
    invoke-virtual {v8, v4, v6}, Lcom/hellogroup/fep/base/core/FepManager;->i(Ljava/lang/String;Ljava/lang/String;)J

    .line 160
    .line 161
    .line 162
    move-result-wide v8

    .line 163
    invoke-static {}, Ll/yfi;->f()Z

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-eqz v4, :cond_3

    .line 168
    .line 169
    sget-object v4, Ll/hjw;->INSTANCE:Ll/hjw;

    .line 170
    .line 171
    invoke-virtual {v4, v8, v9}, Ll/hjw;->a(J)Z

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    if-eqz v4, :cond_3

    .line 176
    .line 177
    if-eqz v2, :cond_3

    .line 178
    .line 179
    invoke-static {v2}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    if-eqz v4, :cond_2

    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-static {v2}, Ll/sjw;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v7, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setWebUserAgent(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object v0, v7, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 209
    .line 210
    invoke-virtual {v0, v5}, Ll/gjw;->d(Z)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v8, v9}, Ll/gjw;->g(J)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, v2}, Ll/gjw;->f(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v7, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V0(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    goto :goto_4

    .line 223
    :cond_3
    :goto_2
    const-string v0, "lehua:boost \u521b\u5efa\u7f13\u5b58\u6c60 \u666e\u901aMKWebView \u5b9e\u4f8b"

    .line 224
    .line 225
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object v0, v7, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 229
    .line 230
    invoke-virtual {v0, v3}, Ll/gjw;->d(Z)V

    .line 231
    .line 232
    .line 233
    const-wide/16 v4, 0x0

    .line 234
    .line 235
    invoke-virtual {v0, v4, v5}, Ll/gjw;->g(J)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0, p0}, Ll/gjw;->f(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    const-string v9, "<html><style>html,body{background:transparent;}</style><body></body><html>"

    .line 242
    .line 243
    const-string v10, "text/html"

    .line 244
    .line 245
    const-string v11, "UTF-8"

    .line 246
    .line 247
    const/4 v12, 0x0

    .line 248
    const/4 v8, 0x0

    .line 249
    invoke-virtual/range {v7 .. v12}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 250
    .line 251
    .line 252
    goto :goto_4

    .line 253
    :goto_3
    invoke-static {v1, p0, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 254
    .line 255
    .line 256
    :cond_4
    :goto_4
    return v3
.end method
