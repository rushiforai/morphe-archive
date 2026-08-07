.class public Ll/i4p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/jnm0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/c4p0;

.field public b:Ll/jnm0;


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

.method public static synthetic a(Ll/i4p0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i4p0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    return-void
.end method

.method public static synthetic b(Ll/i4p0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/i4p0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;I)V

    return-void
.end method

.method private d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i4p0;->a:Ll/c4p0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c4p0;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private f(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/jlm0;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->type:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1, p2}, Ll/jkp0;->t(Ll/jlm0;Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p2, p0, Ll/i4p0;->a:Ll/c4p0;

    .line 28
    .line 29
    new-instance v0, Ll/h4p0;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/h4p0;-><init>(Ll/i4p0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, v0}, Ll/c4p0;->s(Ll/c4p0$a;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Ll/i4p0;->d()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    :goto_0
    invoke-direct {p0}, Ll/i4p0;->d()V

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c(Ll/jnm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->scheme:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->scheme:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "tantanapp://"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/bae0$a;

    .line 32
    .line 33
    const/16 v1, 0x1b5e

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->scheme:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->type:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, -0x1

    .line 62
    sparse-switch v0, :sswitch_data_0

    .line 63
    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :sswitch_0
    const-string v0, "stopRoom"

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_1

    .line 74
    .line 75
    goto/16 :goto_0

    .line 76
    .line 77
    :cond_1
    const/16 v1, 0xa

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :sswitch_1
    const-string v0, "drawGuess"

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_2

    .line 88
    .line 89
    goto/16 :goto_0

    .line 90
    .line 91
    :cond_2
    const/16 v1, 0x9

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :sswitch_2
    const-string v0, "share"

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_3

    .line 102
    .line 103
    goto/16 :goto_0

    .line 104
    .line 105
    :cond_3
    const/16 v1, 0x8

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :sswitch_3
    const-string v0, "song"

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-nez p1, :cond_4

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_4
    const/4 v1, 0x7

    .line 119
    goto :goto_0

    .line 120
    :sswitch_4
    const-string v0, "game"

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-nez p1, :cond_5

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_5
    const/4 v1, 0x6

    .line 130
    goto :goto_0

    .line 131
    :sswitch_5
    const-string v0, "exit"

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-nez p1, :cond_6

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_6
    const/4 v1, 0x5

    .line 141
    goto :goto_0

    .line 142
    :sswitch_6
    const-string v0, "feedback"

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-nez p1, :cond_7

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_7
    const/4 v1, 0x4

    .line 152
    goto :goto_0

    .line 153
    :sswitch_7
    const-string v0, "roomBackgroundMusic"

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-nez p1, :cond_8

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_8
    const/4 v1, 0x3

    .line 163
    goto :goto_0

    .line 164
    :sswitch_8
    const-string v0, "chattingHall"

    .line 165
    .line 166
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-nez p1, :cond_9

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_9
    const/4 v1, 0x2

    .line 174
    goto :goto_0

    .line 175
    :sswitch_9
    const-string v0, "managerInvite"

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-nez p1, :cond_a

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_a
    const/4 v1, 0x1

    .line 185
    goto :goto_0

    .line 186
    :sswitch_a
    const-string v0, "undercover"

    .line 187
    .line 188
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    if-nez p1, :cond_b

    .line 193
    .line 194
    goto :goto_0

    .line 195
    :cond_b
    const/4 v1, 0x0

    .line 196
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :pswitch_0
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 201
    .line 202
    invoke-virtual {p0}, Ll/jnm0;->P3()V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :pswitch_1
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 207
    .line 208
    invoke-virtual {p0}, Ll/jnm0;->K3()V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :pswitch_2
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 213
    .line 214
    invoke-virtual {p0}, Ll/jnm0;->T3()V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :pswitch_3
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 219
    .line 220
    invoke-virtual {p0}, Ll/jnm0;->L3()V

    .line 221
    .line 222
    .line 223
    return-void

    .line 224
    :pswitch_4
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 225
    .line 226
    invoke-virtual {p0}, Ll/jnm0;->M3()V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :pswitch_5
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 231
    .line 232
    invoke-virtual {p0}, Ll/jnm0;->N3()V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :pswitch_6
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 237
    .line 238
    invoke-virtual {p0}, Ll/jnm0;->X3()V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :pswitch_7
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 243
    .line 244
    invoke-virtual {p0}, Ll/jnm0;->R3()V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :pswitch_8
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 249
    .line 250
    invoke-virtual {p0}, Ll/jnm0;->W3()V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :pswitch_9
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 255
    .line 256
    invoke-virtual {p0}, Ll/jnm0;->S3()V

    .line 257
    .line 258
    .line 259
    return-void

    .line 260
    :pswitch_a
    iget-object p0, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 261
    .line 262
    invoke-virtual {p0}, Ll/jnm0;->V3()V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    nop

    .line 267
    :sswitch_data_0
    .sparse-switch
        -0x6a0ce821 -> :sswitch_a
        -0x49110aea -> :sswitch_9
        -0x4494e461 -> :sswitch_8
        -0x184244c4 -> :sswitch_7
        -0xb6a147b -> :sswitch_6
        0x2fb91e -> :sswitch_5
        0x304bf2 -> :sswitch_4
        0x35f515 -> :sswitch_3
        0x6854fdf -> :sswitch_2
        0x76dbaf3 -> :sswitch_1
        0x66352bfd -> :sswitch_0
    .end sparse-switch

    .line 268
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public i(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i4p0;->a:Ll/c4p0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c4p0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/i4p0;->b:Ll/jnm0;

    .line 8
    .line 9
    sget v2, Ll/yec0;->Ja:I

    .line 10
    .line 11
    invoke-static {}, Ll/qag0;->h()Ll/rq2;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-direct {v0, v1, v2, v3}, Ll/c4p0;-><init>(Ll/xzs;ILl/rq2;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/i4p0;->a:Ll/c4p0;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/i4p0;->a:Ll/c4p0;

    .line 21
    .line 22
    new-instance v1, Ll/g4p0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/g4p0;-><init>(Ll/i4p0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/c4p0;->r(Ll/z20;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/i4p0;->a:Ll/c4p0;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/c4p0;->t(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/jnm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i4p0;->c(Ll/jnm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
