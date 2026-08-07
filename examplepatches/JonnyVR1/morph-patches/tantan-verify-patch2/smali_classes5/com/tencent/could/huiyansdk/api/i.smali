.class public Lcom/tencent/could/huiyansdk/api/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/api/j;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/api/j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 524
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 525
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/AuthState;->ON_EXIT_BOT:Lcom/tencent/could/huiyansdk/enums/AuthState;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    return-void
.end method

.method public a(IZZ)V
    .locals 0

    .line 526
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 527
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    packed-switch p1, :pswitch_data_0

    .line 528
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    .line 529
    :pswitch_0
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->ALL_ACTION_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :pswitch_1
    if-eqz p2, :cond_0

    .line 530
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->SILENCE_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->SILENCE_CHECK:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :pswitch_2
    if-eqz p2, :cond_1

    .line 531
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->SHAKE_HEAD_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->SHAKE_HEAD_CHECK:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :pswitch_3
    if-eqz p2, :cond_2

    .line 532
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->NOD_HEAD_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->NOD_HEAD_CHECK:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :pswitch_4
    if-eqz p2, :cond_3

    .line 533
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->OPEN_MOUTH_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :cond_3
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->OPEN_MOUTH_CHECK:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :pswitch_5
    if-eqz p2, :cond_4

    .line 534
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->BLINK_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    goto :goto_0

    :cond_4
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->BLINK_CHECK:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 535
    :goto_0
    invoke-virtual {p0, p1, p3}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;Z)V

    if-nez p2, :cond_5

    .line 536
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 537
    iget-boolean p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->d:Z

    if-eqz p1, :cond_5

    .line 538
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/AuthState;->ON_ENTRY_OTHER_ACTION:Lcom/tencent/could/huiyansdk/enums/AuthState;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    :cond_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(Ljava/lang/String;)V
    .locals 2

    .line 539
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 540
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    if-eqz v0, :cond_0

    .line 541
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string p1, "HuiYanSdkImp"

    const-string v0, "ConfigDataSuccess but isCurrentFinish is ture!"

    const/4 v1, 0x2

    .line 542
    invoke-virtual {p0, v1, p1, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 543
    :cond_0
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    if-eqz p0, :cond_1

    .line 544
    invoke-interface {p0, p1}, Lcom/tencent/could/huiyansdk/api/f;->onSelectSuccess(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public a(Ljava/util/HashMap;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "AuthStateManager"

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 16
    .line 17
    const-string p1, "context is null"

    .line 18
    .line 19
    invoke-virtual {p0, v2, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v3, "ui_extra_tips"

    .line 24
    .line 25
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    const-string v5, "string"

    .line 30
    .line 31
    const/4 v6, -0x1

    .line 32
    if-eqz v4, :cond_5

    .line 33
    .line 34
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-eqz v4, :cond_1

    .line 45
    .line 46
    sget-object v3, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 47
    .line 48
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    .line 49
    .line 50
    if-eqz v4, :cond_6

    .line 51
    .line 52
    check-cast v4, Lcom/tencent/could/huiyansdk/fragments/f;

    .line 53
    .line 54
    invoke-virtual {v4, v0, v6, v3}, Lcom/tencent/could/huiyansdk/fragments/f;->a(Landroid/content/Context;ILcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    invoke-virtual {v4, v3, v5, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/manager/b;->g:[I

    .line 71
    .line 72
    invoke-virtual {p0, v3, v4}, Lcom/tencent/could/huiyansdk/manager/b;->a(I[I)Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-nez v4, :cond_2

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 80
    .line 81
    if-nez v4, :cond_3

    .line 82
    .line 83
    sget-object v4, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    check-cast v4, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 91
    .line 92
    if-nez v4, :cond_4

    .line 93
    .line 94
    sget-object v4, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 95
    .line 96
    :cond_4
    :goto_0
    iget-object v7, p0, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    .line 97
    .line 98
    if-eqz v7, :cond_6

    .line 99
    .line 100
    check-cast v7, Lcom/tencent/could/huiyansdk/fragments/f;

    .line 101
    .line 102
    invoke-virtual {v7, v0, v3, v4}, Lcom/tencent/could/huiyansdk/fragments/f;->a(Landroid/content/Context;ILcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_5
    sget-object v3, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 107
    .line 108
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    .line 109
    .line 110
    if-eqz v4, :cond_6

    .line 111
    .line 112
    check-cast v4, Lcom/tencent/could/huiyansdk/fragments/f;

    .line 113
    .line 114
    invoke-virtual {v4, v0, v6, v3}, Lcom/tencent/could/huiyansdk/fragments/f;->a(Landroid/content/Context;ILcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;)V

    .line 115
    .line 116
    .line 117
    :cond_6
    :goto_1
    const-string v3, "ui_tips"

    .line 118
    .line 119
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    check-cast v3, Ljava/lang/String;

    .line 124
    .line 125
    sget-object v4, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 126
    .line 127
    iget-object v7, v4, Lcom/tencent/could/huiyansdk/manager/e;->c:Lcom/tencent/could/huiyansdk/callback/LoggerInfoCallBack;

    .line 128
    .line 129
    const/4 v8, 0x0

    .line 130
    if-nez v7, :cond_7

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    iget-object v7, v4, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 134
    .line 135
    if-nez v7, :cond_8

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_8
    iget-object v7, v4, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 139
    .line 140
    invoke-virtual {v7}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    iput v8, v7, Landroid/os/Message;->what:I

    .line 145
    .line 146
    iput-object v3, v7, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 147
    .line 148
    iget-object v9, v4, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 149
    .line 150
    invoke-virtual {v9, v7}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 151
    .line 152
    .line 153
    :goto_2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    const/4 v9, 0x1

    .line 158
    if-nez v7, :cond_c

    .line 159
    .line 160
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 161
    .line 162
    .line 163
    move-result-object v7

    .line 164
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v10

    .line 168
    invoke-virtual {v7, v3, v5, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    sget v5, Lcom/tencent/could/huiyansdk/R$string;->rst_failed:I

    .line 173
    .line 174
    if-ne v3, v5, :cond_d

    .line 175
    .line 176
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->txy_local_check_fail:I

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    const-string v2, "error_code"

    .line 183
    .line 184
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    if-eqz v3, :cond_a

    .line 189
    .line 190
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    check-cast p1, Ljava/lang/Integer;

    .line 195
    .line 196
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    const v3, 0x400003

    .line 201
    .line 202
    .line 203
    if-ne v2, v3, :cond_9

    .line 204
    .line 205
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->txy_local_check_out_time:I

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v1, "(code:"

    .line 220
    .line 221
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string p1, ")"

    .line 228
    .line 229
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    :cond_a
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 237
    .line 238
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 239
    .line 240
    if-eqz p1, :cond_b

    .line 241
    .line 242
    const-string v2, "AuthCheckStage"

    .line 243
    .line 244
    const-string v3, "YouTuLocalCheckError"

    .line 245
    .line 246
    invoke-interface {p1, v2, v3, v1}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    :cond_b
    new-instance p1, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 250
    .line 251
    invoke-direct {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 252
    .line 253
    .line 254
    const/16 v2, 0xe4

    .line 255
    .line 256
    invoke-virtual {p1, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p1, v1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/AuthState;->AUTH_FAIL:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 263
    .line 264
    invoke-virtual {p0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 265
    .line 266
    .line 267
    :cond_c
    :goto_3
    move v3, v6

    .line 268
    goto :goto_5

    .line 269
    :cond_d
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->h:[I

    .line 270
    .line 271
    invoke-virtual {p0, v3, p1}, Lcom/tencent/could/huiyansdk/manager/b;->a(I[I)Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-eqz p1, :cond_e

    .line 276
    .line 277
    goto :goto_3

    .line 278
    :cond_e
    if-eq v3, v6, :cond_10

    .line 279
    .line 280
    sget p1, Lcom/tencent/could/huiyansdk/R$string;->fl_no_face:I

    .line 281
    .line 282
    if-eq v3, p1, :cond_10

    .line 283
    .line 284
    sget p1, Lcom/tencent/could/huiyansdk/R$string;->msg_fsm_pause:I

    .line 285
    .line 286
    if-eq v3, p1, :cond_10

    .line 287
    .line 288
    iget-boolean p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->d:Z

    .line 289
    .line 290
    if-nez p1, :cond_10

    .line 291
    .line 292
    iput-boolean v9, p0, Lcom/tencent/could/huiyansdk/manager/b;->d:Z

    .line 293
    .line 294
    sget-object p1, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 295
    .line 296
    iput-boolean v9, p1, Lcom/tencent/could/huiyansdk/turing/f;->b:Z

    .line 297
    .line 298
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 299
    .line 300
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 301
    .line 302
    .line 303
    move-result-object p1

    .line 304
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck()Z

    .line 305
    .line 306
    .line 307
    move-result p1

    .line 308
    const/4 v5, 0x0

    .line 309
    if-eqz p1, :cond_f

    .line 310
    .line 311
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/AuthState;->ON_ENTRY_BOT:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 312
    .line 313
    invoke-virtual {p0, p1, v5}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    goto :goto_4

    .line 317
    :cond_f
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/AuthState;->ON_FIRST_FOUND_FACE:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 318
    .line 319
    invoke-virtual {p0, p1, v5}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 320
    .line 321
    .line 322
    :goto_4
    const-string p1, "found face!"

    .line 323
    .line 324
    invoke-virtual {v4, v2, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    :cond_10
    :goto_5
    if-ne v3, v6, :cond_11

    .line 328
    .line 329
    goto/16 :goto_c

    .line 330
    .line 331
    :cond_11
    iget p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->j:I

    .line 332
    .line 333
    if-ne p1, v3, :cond_12

    .line 334
    .line 335
    iput v8, p0, Lcom/tencent/could/huiyansdk/manager/b;->k:I

    .line 336
    .line 337
    :goto_6
    move p1, v6

    .line 338
    goto :goto_7

    .line 339
    :cond_12
    iget p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->k:I

    .line 340
    .line 341
    const/4 v1, 0x3

    .line 342
    if-lt p1, v1, :cond_13

    .line 343
    .line 344
    iput v3, p0, Lcom/tencent/could/huiyansdk/manager/b;->j:I

    .line 345
    .line 346
    iput v3, p0, Lcom/tencent/could/huiyansdk/manager/b;->i:I

    .line 347
    .line 348
    iput v8, p0, Lcom/tencent/could/huiyansdk/manager/b;->k:I

    .line 349
    .line 350
    move p1, v3

    .line 351
    goto :goto_7

    .line 352
    :cond_13
    iget v1, p0, Lcom/tencent/could/huiyansdk/manager/b;->i:I

    .line 353
    .line 354
    if-eq v1, v3, :cond_14

    .line 355
    .line 356
    iput v3, p0, Lcom/tencent/could/huiyansdk/manager/b;->i:I

    .line 357
    .line 358
    iput v8, p0, Lcom/tencent/could/huiyansdk/manager/b;->k:I

    .line 359
    .line 360
    goto :goto_6

    .line 361
    :cond_14
    add-int/2addr p1, v9

    .line 362
    iput p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->k:I

    .line 363
    .line 364
    goto :goto_6

    .line 365
    :goto_7
    if-ne p1, v6, :cond_15

    .line 366
    .line 367
    goto/16 :goto_c

    .line 368
    .line 369
    :cond_15
    iget p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->p:I

    .line 370
    .line 371
    sget-object v1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 372
    .line 373
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 374
    .line 375
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 376
    .line 377
    if-nez v4, :cond_16

    .line 378
    .line 379
    sget-object v4, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Light:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 380
    .line 381
    goto :goto_8

    .line 382
    :cond_16
    invoke-virtual {v4}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getPageColorStyle()Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 383
    .line 384
    .line 385
    move-result-object v4

    .line 386
    :goto_8
    sget-object v5, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Dark:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 387
    .line 388
    if-ne v4, v5, :cond_17

    .line 389
    .line 390
    if-eqz v2, :cond_17

    .line 391
    .line 392
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackTxtColor()I

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    if-ne v2, v6, :cond_17

    .line 397
    .line 398
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 399
    .line 400
    .line 401
    move-result-object p1

    .line 402
    sget v2, Lcom/tencent/could/huiyansdk/R$color;->txy_white:I

    .line 403
    .line 404
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 405
    .line 406
    .line 407
    move-result p1

    .line 408
    :cond_17
    if-ne v3, v6, :cond_18

    .line 409
    .line 410
    goto :goto_9

    .line 411
    :cond_18
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/manager/b;->e:[I

    .line 412
    .line 413
    invoke-virtual {p0, v3, v2}, Lcom/tencent/could/huiyansdk/manager/b;->a(I[I)Z

    .line 414
    .line 415
    .line 416
    move-result v2

    .line 417
    if-eqz v2, :cond_19

    .line 418
    .line 419
    iget p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->o:I

    .line 420
    .line 421
    :cond_19
    :goto_9
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 422
    .line 423
    .line 424
    move-result-object v2

    .line 425
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v2

    .line 429
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    .line 430
    .line 431
    if-eqz v4, :cond_1a

    .line 432
    .line 433
    check-cast v4, Lcom/tencent/could/huiyansdk/fragments/f;

    .line 434
    .line 435
    invoke-virtual {v4, v2, p1}, Lcom/tencent/could/huiyansdk/fragments/f;->a(Ljava/lang/String;I)V

    .line 436
    .line 437
    .line 438
    :cond_1a
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 439
    .line 440
    .line 441
    move-result-object p1

    .line 442
    sget v0, Lcom/tencent/could/huiyansdk/R$color;->txy_circle_color:I

    .line 443
    .line 444
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 445
    .line 446
    .line 447
    move-result p1

    .line 448
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->e:[I

    .line 449
    .line 450
    invoke-virtual {p0, v3, v0}, Lcom/tencent/could/huiyansdk/manager/b;->a(I[I)Z

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    if-eqz v0, :cond_1b

    .line 455
    .line 456
    iget p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->q:I

    .line 457
    .line 458
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/manager/b;->a(I)V

    .line 459
    .line 460
    .line 461
    goto :goto_a

    .line 462
    :cond_1b
    if-ne v3, v6, :cond_1c

    .line 463
    .line 464
    goto :goto_a

    .line 465
    :cond_1c
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->f:[I

    .line 466
    .line 467
    invoke-virtual {p0, v3, v0}, Lcom/tencent/could/huiyansdk/manager/b;->a(I[I)Z

    .line 468
    .line 469
    .line 470
    move-result v0

    .line 471
    if-eqz v0, :cond_1d

    .line 472
    .line 473
    iget p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->r:I

    .line 474
    .line 475
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/manager/b;->a(I)V

    .line 476
    .line 477
    .line 478
    goto :goto_a

    .line 479
    :cond_1d
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    .line 480
    .line 481
    if-eqz v0, :cond_1e

    .line 482
    .line 483
    check-cast v0, Lcom/tencent/could/huiyansdk/fragments/f;

    .line 484
    .line 485
    invoke-virtual {v0, p1}, Lcom/tencent/could/huiyansdk/fragments/f;->b(I)V

    .line 486
    .line 487
    .line 488
    :cond_1e
    :goto_a
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->m:Landroid/util/SparseArray;

    .line 489
    .line 490
    if-nez p1, :cond_1f

    .line 491
    .line 492
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 493
    .line 494
    goto :goto_b

    .line 495
    :cond_1f
    invoke-virtual {p1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object p1

    .line 499
    check-cast p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 500
    .line 501
    if-nez p1, :cond_20

    .line 502
    .line 503
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 504
    .line 505
    :cond_20
    :goto_b
    if-nez p1, :cond_21

    .line 506
    .line 507
    sget-object p0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 508
    .line 509
    invoke-virtual {v1, p0, v8}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Z)V

    .line 510
    .line 511
    .line 512
    return-void

    .line 513
    :cond_21
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/b;->n:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 514
    .line 515
    if-ne v0, p1, :cond_22

    .line 516
    .line 517
    :goto_c
    return-void

    .line 518
    :cond_22
    invoke-virtual {v1, p1, v8}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Z)V

    .line 519
    .line 520
    .line 521
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/manager/b;->n:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 522
    .line 523
    return-void
.end method

.method public b()V
    .locals 15

    .line 1
    const-string v0, "HuiYanSdkImp"

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 6
    .line 7
    iget-object v3, v2, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v5, 0x2

    .line 11
    if-eqz v3, :cond_14

    .line 12
    .line 13
    :try_start_0
    sget-object v6, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 14
    .line 15
    const-string v7, "change_point_num"

    .line 16
    .line 17
    :try_start_1
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getChangePointNum()I

    .line 18
    .line 19
    .line 20
    move-result v8

    .line 21
    int-to-long v8, v8

    .line 22
    invoke-virtual {v6, v7, v8, v9}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V

    .line 23
    .line 24
    .line 25
    sget-object v7, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 26
    .line 27
    const-string v8, "update you tu config!"

    .line 28
    .line 29
    const/4 v9, 0x1

    .line 30
    :try_start_2
    invoke-virtual {v7, v9, v0, v8}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenFullLog()Z

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    iput-boolean v7, v6, Lcom/tencent/could/huiyansdk/helper/b;->c:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 38
    .line 39
    const-string v7, "timeout_countdown_ms"

    .line 40
    .line 41
    :try_start_3
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getAuthTimeOutMs()J

    .line 42
    .line 43
    .line 44
    move-result-wide v10

    .line 45
    invoke-virtual {v6, v7, v10, v11}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 46
    .line 47
    .line 48
    const-string v7, "action_frame_num"

    .line 49
    .line 50
    :try_start_4
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getPackageTest()Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 51
    .line 52
    .line 53
    move-result-object v8
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 54
    :try_start_5
    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result v8
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 58
    if-eqz v8, :cond_0

    .line 59
    .line 60
    if-eq v8, v9, :cond_0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const-wide/16 v10, 0x8

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :catch_0
    :goto_0
    const-wide/16 v10, 0x14

    .line 67
    .line 68
    :goto_1
    :try_start_6
    invoke-virtual {v6, v7, v10, v11}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V

    .line 69
    .line 70
    .line 71
    sget-object v6, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 72
    .line 73
    const-string v7, "secondary_roll_threshold"

    .line 74
    .line 75
    :try_start_7
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getBestImageRoll()F

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 80
    .line 81
    .line 82
    const-string v7, "secondary_yaw_threshold"

    .line 83
    .line 84
    :try_start_8
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getBestImageYaw()F

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    .line 89
    .line 90
    .line 91
    const-string v7, "secondary_pitch_threshold"

    .line 92
    .line 93
    :try_start_9
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getBestImagePitch()F

    .line 94
    .line 95
    .line 96
    move-result v8

    .line 97
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 98
    .line 99
    .line 100
    const-string v7, "continuous_angle_num_threshold"

    .line 101
    .line 102
    :try_start_a
    iget-object v8, v2, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 103
    .line 104
    invoke-virtual {v8}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getBestImageContinuousFrameNum()I

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    int-to-long v10, v8

    .line 109
    invoke-virtual {v6, v7, v10, v11}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    .line 110
    .line 111
    .line 112
    const-string v7, "need_angle_detect_reflection"

    .line 113
    .line 114
    :try_start_b
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenAngleDetect()Z

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_1

    .line 119
    .line 120
    .line 121
    const-string v7, "bigface_ratio_threshold"

    .line 122
    .line 123
    :try_start_c
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getBigFaceRatioThreshold()F

    .line 124
    .line 125
    .line 126
    move-result v8

    .line 127
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenAngleDetect()Z

    .line 131
    .line 132
    .line 133
    move-result v7
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1

    .line 134
    const-string v8, "correction_angle_action_type"

    .line 135
    .line 136
    if-eqz v7, :cond_1

    .line 137
    .line 138
    :try_start_d
    const-string v7, "1,5"

    .line 139
    .line 140
    invoke-virtual {v6, v8, v7}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_1
    iget-object v7, v6, Lcom/tencent/could/huiyansdk/helper/b;->a:Lorg/json/JSONObject;

    .line 145
    .line 146
    if-nez v7, :cond_2

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_2
    invoke-virtual {v6}, Lcom/tencent/could/huiyansdk/helper/b;->a()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v7

    .line 153
    iget-object v10, v6, Lcom/tencent/could/huiyansdk/helper/b;->a:Lorg/json/JSONObject;

    .line 154
    .line 155
    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 156
    .line 157
    .line 158
    move-result v10

    .line 159
    if-eqz v10, :cond_3

    .line 160
    .line 161
    iget-object v10, v6, Lcom/tencent/could/huiyansdk/helper/b;->a:Lorg/json/JSONObject;

    .line 162
    .line 163
    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 164
    .line 165
    .line 166
    move-result-object v10

    .line 167
    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    iget-object v8, v6, Lcom/tencent/could/huiyansdk/helper/b;->a:Lorg/json/JSONObject;

    .line 171
    .line 172
    invoke-virtual {v8, v7, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 173
    .line 174
    .line 175
    :cond_3
    :goto_2
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode()Z

    .line 176
    .line 177
    .line 178
    move-result v7
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1

    .line 179
    const-string v8, "smallface_ratio_threshold"

    .line 180
    .line 181
    const-wide/16 v10, 0x1

    .line 182
    .line 183
    const-string v12, "screen_orientation"

    .line 184
    .line 185
    if-eqz v7, :cond_4

    .line 186
    .line 187
    :try_start_e
    invoke-virtual {v6, v12, v10, v11}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLandCloseRatio()F

    .line 191
    .line 192
    .line 193
    move-result v7

    .line 194
    invoke-virtual {v6, v8, v7}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V

    .line 195
    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_4
    const-wide/16 v13, 0x0

    .line 199
    .line 200
    invoke-virtual {v6, v12, v13, v14}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getPortraitCloseRatio()F

    .line 204
    .line 205
    .line 206
    move-result v7

    .line 207
    invoke-virtual {v6, v8, v7}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V

    .line 208
    .line 209
    .line 210
    :goto_3
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck()Z

    .line 211
    .line 212
    .line 213
    move-result v7
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1

    .line 214
    const-string v8, "need_local_face_best_image"

    .line 215
    .line 216
    const-string v12, "need_face_quality"

    .line 217
    .line 218
    if-eqz v7, :cond_7

    .line 219
    .line 220
    :try_start_f
    invoke-virtual {v6, v12, v9}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v6, v8, v9}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_1

    .line 224
    .line 225
    .line 226
    const-string v7, "local_face_best_image_quality"

    .line 227
    .line 228
    :try_start_10
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckBestImageQuality()I

    .line 229
    .line 230
    .line 231
    move-result v13

    .line 232
    int-to-long v13, v13

    .line 233
    invoke-virtual {v6, v7, v13, v14}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLongCheckUseLocalCloseMouthThreshold()Z

    .line 237
    .line 238
    .line 239
    move-result v7

    .line 240
    if-eqz v7, :cond_5

    .line 241
    .line 242
    const-string v7, "need_local_close_mouth_threshold"

    .line 243
    .line 244
    invoke-virtual {v6, v7, v9}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V

    .line 245
    .line 246
    .line 247
    :cond_5
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isNeedCropBestImageMode()Z

    .line 248
    .line 249
    .line 250
    move-result v7
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_1

    .line 251
    const-string v13, "quality_face_real_min_height_threshold"

    .line 252
    .line 253
    if-eqz v7, :cond_6

    .line 254
    .line 255
    :try_start_11
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckFaceRealMinHeightThreshold()F

    .line 256
    .line 257
    .line 258
    move-result v7

    .line 259
    invoke-virtual {v6, v13, v7}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V

    .line 260
    .line 261
    .line 262
    goto :goto_4

    .line 263
    :cond_6
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckFaceMinHeightThreshold()F

    .line 264
    .line 265
    .line 266
    move-result v7

    .line 267
    invoke-virtual {v6, v13, v7}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V

    .line 268
    .line 269
    .line 270
    :goto_4
    const-string v7, "continuous_quality_num_threshold"

    .line 271
    .line 272
    const-wide/16 v13, 0xa

    .line 273
    .line 274
    invoke-virtual {v6, v7, v13, v14}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V

    .line 275
    .line 276
    .line 277
    :cond_7
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBestFaceImage()Z

    .line 278
    .line 279
    .line 280
    move-result v7

    .line 281
    if-eqz v7, :cond_8

    .line 282
    .line 283
    invoke-virtual {v6, v12, v9}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v6, v8, v4}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V

    .line 287
    .line 288
    .line 289
    :cond_8
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck()Z

    .line 290
    .line 291
    .line 292
    move-result v7

    .line 293
    if-nez v7, :cond_9

    .line 294
    .line 295
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBestFaceImage()Z

    .line 296
    .line 297
    .line 298
    move-result v7
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_1

    .line 299
    if-eqz v7, :cond_a

    .line 300
    .line 301
    :cond_9
    const-string v7, "quality_face_max_height_threshold"

    .line 302
    .line 303
    :try_start_12
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckFaceMaxHeightThreshold()F

    .line 304
    .line 305
    .line 306
    move-result v8

    .line 307
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_1

    .line 308
    .line 309
    .line 310
    const-string v7, "quality_face_min_height_threshold"

    .line 311
    .line 312
    :try_start_13
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckFaceMinHeightThreshold()F

    .line 313
    .line 314
    .line 315
    move-result v8

    .line 316
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_1

    .line 317
    .line 318
    .line 319
    const-string v7, "quality_close_mouth_threshold"

    .line 320
    .line 321
    :try_start_14
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckCloseMouthThreshold()F

    .line 322
    .line 323
    .line 324
    move-result v8

    .line 325
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_1

    .line 326
    .line 327
    .line 328
    const-string v7, "quality_close_eye_right_threshold"

    .line 329
    .line 330
    :try_start_15
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckCloseEyeRightThreshold()F

    .line 331
    .line 332
    .line 333
    move-result v8

    .line 334
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_1

    .line 335
    .line 336
    .line 337
    const-string v7, "quality_close_eye_left_threshold"

    .line 338
    .line 339
    :try_start_16
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckCloseEyeLeftThreshold()F

    .line 340
    .line 341
    .line 342
    move-result v8

    .line 343
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;F)V

    .line 344
    .line 345
    .line 346
    :cond_a
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera()Z

    .line 347
    .line 348
    .line 349
    move-result v7

    .line 350
    if-eqz v7, :cond_b

    .line 351
    .line 352
    const-string v7, "rear_camera_tag"

    .line 353
    .line 354
    invoke-virtual {v6, v7, v10, v11}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_1

    .line 355
    .line 356
    .line 357
    :cond_b
    const-string v7, "need_best_original_size"

    .line 358
    .line 359
    :try_start_17
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckNeedBestOriginalSize()I

    .line 360
    .line 361
    .line 362
    move-result v8

    .line 363
    int-to-long v10, v8

    .line 364
    invoke-virtual {v6, v7, v10, v11}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V

    .line 365
    .line 366
    .line 367
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getUseCustomerModelPath()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v7

    .line 371
    if-eqz v6, :cond_13

    .line 372
    .line 373
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 374
    .line 375
    .line 376
    move-result v8

    .line 377
    if-eqz v8, :cond_c

    .line 378
    .line 379
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 380
    .line 381
    const-string v7, "YouTuSdkHelper"

    .line 382
    .line 383
    const-string v8, "no need load model!"

    .line 384
    .line 385
    invoke-virtual {v1, v9, v7, v8}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    goto :goto_5

    .line 389
    :cond_c
    const-string v8, "resource_online"

    .line 390
    .line 391
    invoke-virtual {v6, v8, v9}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v7, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 395
    .line 396
    .line 397
    move-result v8

    .line 398
    if-nez v8, :cond_d

    .line 399
    .line 400
    invoke-virtual {v7, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v7

    .line 404
    :cond_d
    const-string v1, "resource_download_path"

    .line 405
    .line 406
    invoke-virtual {v6, v1, v7}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    :goto_5
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getHuiYanLiveMode()Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 410
    .line 411
    .line 412
    move-result-object v1

    .line 413
    sget-object v7, Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;->ACTION_REFLECT_MODE:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_1

    .line 414
    .line 415
    if-ne v1, v7, :cond_f

    .line 416
    .line 417
    const-string v7, "need_encrypt"

    .line 418
    .line 419
    :try_start_18
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCloseEncrypt()Z

    .line 420
    .line 421
    .line 422
    move-result v8

    .line 423
    xor-int/2addr v8, v9

    .line 424
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V

    .line 425
    .line 426
    .line 427
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCloseEncrypt()Z

    .line 428
    .line 429
    .line 430
    move-result v7
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_1

    .line 431
    if-nez v7, :cond_f

    .line 432
    .line 433
    const-string v7, "enhance_encrypt_method"

    .line 434
    .line 435
    :try_start_19
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getEncryptMode()Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;

    .line 436
    .line 437
    .line 438
    move-result-object v8

    .line 439
    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    .line 440
    .line 441
    .line 442
    move-result v8

    .line 443
    if-eq v8, v9, :cond_e

    .line 444
    .line 445
    move v8, v4

    .line 446
    goto :goto_6

    .line 447
    :cond_e
    move v8, v9

    .line 448
    :goto_6
    int-to-long v10, v8

    .line 449
    invoke-virtual {v6, v7, v10, v11}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_1

    .line 450
    .line 451
    .line 452
    :cond_f
    const-string v7, "relaxed_shelter_threshold"

    .line 453
    .line 454
    :try_start_1a
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRelaxed()Z

    .line 455
    .line 456
    .line 457
    move-result v8

    .line 458
    invoke-virtual {v6, v7, v8}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_1

    .line 459
    .line 460
    .line 461
    const-string v7, "shelter_judge_level"

    .line 462
    .line 463
    :try_start_1b
    iget-object v2, v2, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 464
    .line 465
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getFaceOcclusionLevel()Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 466
    .line 467
    .line 468
    move-result-object v2

    .line 469
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 470
    .line 471
    .line 472
    move-result v2

    .line 473
    if-eq v2, v9, :cond_12

    .line 474
    .line 475
    const/4 v8, 0x3

    .line 476
    if-eq v2, v5, :cond_11

    .line 477
    .line 478
    if-eq v2, v8, :cond_10

    .line 479
    .line 480
    goto :goto_7

    .line 481
    :cond_10
    const/4 v9, 0x4

    .line 482
    goto :goto_7

    .line 483
    :cond_11
    move v9, v8

    .line 484
    goto :goto_7

    .line 485
    :cond_12
    move v9, v5

    .line 486
    :goto_7
    int-to-long v8, v9

    .line 487
    invoke-virtual {v6, v7, v8, v9}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;J)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_1

    .line 488
    .line 489
    .line 490
    const-string v2, "need_pose_check_mouth_open"

    .line 491
    .line 492
    :try_start_1c
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOtherActionCheckMouthOpen()Z

    .line 493
    .line 494
    .line 495
    move-result v7

    .line 496
    invoke-virtual {v6, v2, v7}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V

    .line 497
    .line 498
    .line 499
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;->ACTION_MODE:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 500
    .line 501
    if-ne v1, v2, :cond_14

    .line 502
    .line 503
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getActions()[Lcom/tencent/could/huiyansdk/enums/HuiYanAction;

    .line 504
    .line 505
    .line 506
    move-result-object v1

    .line 507
    invoke-static {v1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->changeActions([Lcom/tencent/could/huiyansdk/enums/HuiYanAction;)[I

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    if-eqz v1, :cond_14

    .line 512
    .line 513
    const-string v2, "action_default_seq"

    .line 514
    .line 515
    invoke-virtual {v6, v2, v1}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;[I)V

    .line 516
    .line 517
    .line 518
    goto :goto_8

    .line 519
    :cond_13
    const/4 v1, 0x0

    .line 520
    throw v1
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_1

    .line 521
    :catch_1
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 522
    .line 523
    const-string v2, "update you tu config error!"

    .line 524
    .line 525
    invoke-virtual {v1, v5, v0, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    :cond_14
    :goto_8
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 529
    .line 530
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 531
    .line 532
    if-eqz p0, :cond_15

    .line 533
    .line 534
    const-string v0, "StartYTAuthUseTime"

    .line 535
    .line 536
    const-string v1, ""

    .line 537
    .line 538
    invoke-interface {p0, v0, v5, v4, v1}, Lcom/tencent/could/huiyansdk/api/b;->onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V

    .line 539
    .line 540
    .line 541
    :cond_15
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 4

    .line 542
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v1, "get compare result data."

    const/4 v2, 0x2

    .line 543
    const-string v3, "HuiYanSdkImp"

    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 544
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 545
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 546
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 547
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Ljava/lang/String;)V

    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/AuthState;->ON_ENTRY_BOT:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFail(ILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->closeCurrentFragment()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Lcom/tencent/could/huiyansdk/api/j;->a(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "code: "

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, " msg: "

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    const-string p2, "InitSDKStage"

    .line 43
    .line 44
    const-string v0, "HuiYanInitError"

    .line 45
    .line 46
    invoke-interface {p0, p2, v0, p1}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/tencent/could/huiyansdk/api/b;->onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/i;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v1, p1

    .line 8
    move v2, p2

    .line 9
    move-wide v3, p3

    .line 10
    move-object v5, p5

    .line 11
    invoke-interface/range {v0 .. v5}, Lcom/tencent/could/huiyansdk/api/b;->updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
