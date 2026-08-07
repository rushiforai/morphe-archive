.class public Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->g()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->h(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private synthetic g()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 8
    .line 9
    new-instance v2, Lcom/alipay/sdk/app/AuthTask;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-direct {v2, v3}, Lcom/alipay/sdk/app/AuthTask;-><init>(Landroid/app/Activity;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ll/lqb;->k4(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/nfq;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/nfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/ofq;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/ofq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget v0, Ll/qa00;->f:I

    .line 9
    .line 10
    invoke-virtual {p0, v1, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget v0, Ll/qa00;->f:I

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_8

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    .line 30
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    move-object v3, v0

    .line 37
    check-cast v3, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 38
    .line 39
    :try_start_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 48
    .line 49
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 56
    .line 57
    move-object v2, v0

    .line 58
    goto :goto_2

    .line 59
    :catch_0
    move-exception v0

    .line 60
    goto :goto_1

    .line 61
    :catch_1
    move-exception v0

    .line 62
    move-object v3, v2

    .line 63
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_2
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_8

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->b:Lv/VText;

    .line 73
    .line 74
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->redPacketTitle:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->redPacketId:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    iget-boolean v0, v2, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->localIsRedPacketOpen:Z

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->l0:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->setPacketOpen(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_2
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    const-string v0, "finish"

    .line 112
    .line 113
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->localRedPacketStatus:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->k0:I

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->setPacketOpen(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_3
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_4

    .line 140
    .line 141
    const-string v0, "expired"

    .line 142
    .line 143
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->localRedPacketStatus:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_4

    .line 150
    .line 151
    const-string v0, "\u5df2\u8fc7\u671f"

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->setPacketOpen(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->c:Lv/VText;

    .line 158
    .line 159
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->a:Landroid/widget/LinearLayout;

    .line 163
    .line 164
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    sget v4, Ll/ibc0;->f4:I

    .line 169
    .line 170
    invoke-virtual {v1, v4}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->e:Landroid/view/View;

    .line 178
    .line 179
    const-string v1, "#fdb96b"

    .line 180
    .line 181
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d:Landroid/widget/ImageView;

    .line 189
    .line 190
    sget v1, Ll/ibc0;->e4:I

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 193
    .line 194
    .line 195
    :goto_3
    const-string v0, "average"

    .line 196
    .line 197
    iget-object v1, v3, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->redPacketSplitType:Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_5

    .line 204
    .line 205
    const-string v0, "normal_red_packet"

    .line 206
    .line 207
    :goto_4
    move-object v9, v0

    .line 208
    goto :goto_5

    .line 209
    :cond_5
    const-string v0, "luck_red_packet"

    .line 210
    .line 211
    goto :goto_4

    .line 212
    :goto_5
    if-eqz v2, :cond_7

    .line 213
    .line 214
    iget-wide v0, v2, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->expireTime:J

    .line 215
    .line 216
    const-wide/16 v3, 0x3e8

    .line 217
    .line 218
    mul-long/2addr v0, v3

    .line 219
    invoke-static {}, Ll/pzi0;->o()J

    .line 220
    .line 221
    .line 222
    move-result-wide v3

    .line 223
    cmp-long v0, v0, v3

    .line 224
    .line 225
    if-gez v0, :cond_7

    .line 226
    .line 227
    iget-wide v0, v2, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->expireTime:J

    .line 228
    .line 229
    const-wide/16 v2, 0x0

    .line 230
    .line 231
    cmp-long v0, v0, v2

    .line 232
    .line 233
    if-nez v0, :cond_6

    .line 234
    .line 235
    goto :goto_7

    .line 236
    :cond_6
    const-string v0, "overdue"

    .line 237
    .line 238
    :goto_6
    move-object v10, v0

    .line 239
    goto :goto_8

    .line 240
    :cond_7
    :goto_7
    const-string v0, "effective"

    .line 241
    .line 242
    goto :goto_6

    .line 243
    :goto_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->a:Landroid/widget/LinearLayout;

    .line 244
    .line 245
    new-instance v5, Ll/kfq;

    .line 246
    .line 247
    move-object v6, p0

    .line 248
    move-object v8, p1

    .line 249
    invoke-direct/range {v5 .. v10}, Ll/kfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-static {v0, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 253
    .line 254
    .line 255
    iget-object p0, v6, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->a:Landroid/widget/LinearLayout;

    .line 256
    .line 257
    new-instance p1, Ll/lfq;

    .line 258
    .line 259
    invoke-direct {p1}, Ll/lfq;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 263
    .line 264
    .line 265
    :cond_8
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public e(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 15
    .line 16
    const v0, 0xa3b1

    .line 17
    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->n7:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const v0, 0xa3b2

    .line 28
    .line 29
    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Ll/tcz;->I(Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 41
    .line 42
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 47
    .line 48
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public f(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/16 v1, 0x2328

    .line 17
    .line 18
    if-ne v1, v0, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->o7:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string v0, "41905"

    .line 27
    .line 28
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->n7:I

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const-string v0, "41906"

    .line 43
    .line 44
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/tcz;->I(Lcom/p1/mobile/android/app/Act;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 61
    .line 62
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic h(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p5, "red_packet_id"

    .line 2
    .line 3
    invoke-static {p5, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p5

    .line 7
    const-string v0, "actor_user_id"

    .line 8
    .line 9
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "red_packet_type"

    .line 16
    .line 17
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    const-string v1, "groupchat_id"

    .line 22
    .line 23
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "red_packet_state"

    .line 30
    .line 31
    invoke-static {v2, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    filled-new-array {p5, v0, p3, v1, p4}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    const-string p4, "e_red_packet"

    .line 40
    .line 41
    const-string p5, "p_group_chat_view"

    .line 42
    .line 43
    invoke-static {p4, p5, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    if-nez p3, :cond_0

    .line 51
    .line 52
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 53
    .line 54
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    if-nez p3, :cond_2

    .line 63
    .line 64
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 67
    .line 68
    invoke-virtual {p3}, Ll/lqb;->C4()Z

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    if-eqz p3, :cond_1

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-interface {p3}, Ll/r97;->Q()Z

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    if-nez p3, :cond_2

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 93
    .line 94
    .line 95
    move-result-object p4

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 97
    .line 98
    .line 99
    move-result-object p5

    .line 100
    invoke-virtual {p5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 101
    .line 102
    .line 103
    move-result-object p5

    .line 104
    invoke-virtual {p5}, Ll/clz;->r3()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p5

    .line 108
    invoke-static {p4, p2, p1, p5}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;->a2(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p3, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    sget p1, Ll/y7c0;->c:I

    .line 120
    .line 121
    sget p2, Ll/y7c0;->d:I

    .line 122
    .line 123
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    new-instance p2, Ll/mfq;

    .line 132
    .line 133
    invoke-direct {p2, p0}, Ll/mfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;)V

    .line 134
    .line 135
    .line 136
    invoke-static {p1, p2}, Ll/tcz;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 137
    .line 138
    .line 139
    :cond_2
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->L3:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/LinearLayout;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->a:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    sget v0, Ll/edc0;->Q4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->b:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/edc0;->o4:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->c:Lv/VText;

    .line 33
    .line 34
    sget v0, Ll/edc0;->k1:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/ImageView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d:Landroid/widget/ImageView;

    .line 43
    .line 44
    sget v0, Ll/edc0;->u0:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->e:Landroid/view/View;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->c:Lv/VText;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public setPacketOpen(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Ll/ibc0;->g4:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->e:Landroid/view/View;

    .line 17
    .line 18
    const-string v1, "#80fdb96b"

    .line 19
    .line 20
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->d:Landroid/widget/ImageView;

    .line 28
    .line 29
    sget v1, Ll/ibc0;->h4:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->c:Lv/VText;

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->c:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
