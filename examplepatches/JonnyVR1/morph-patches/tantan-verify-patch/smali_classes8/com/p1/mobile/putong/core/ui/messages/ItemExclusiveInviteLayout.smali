.class public Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# static fields
.field public static d:I


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->d(Lcom/p1/mobile/putong/core/api/c0$b;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0}, Ll/cn7;->l3(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/MessageChatHeat;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p2, "is_myself"

    .line 10
    .line 11
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget p1, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string p2, "private_chat_duration"

    .line 22
    .line 23
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "e_private_chat_invite_message"

    .line 32
    .line 33
    const-string p2, "p_chat_view"

    .line 34
    .line 35
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
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

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 10

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {p3, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "exclusive_tag_"

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p3, v2}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    sget-object p3, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p3, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    check-cast p3, Lcom/p1/mobile/putong/core/data/MessageChatHeat;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    move-object v1, p3

    .line 47
    :catch_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    const/4 v2, 0x1

    .line 52
    if-eqz p3, :cond_1

    .line 53
    .line 54
    new-instance p3, Ll/v4q;

    .line 55
    .line 56
    invoke-direct {p3, p2, v1}, Ll/v4q;-><init>(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/MessageChatHeat;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    const-string v4, "is_myself"

    .line 71
    .line 72
    invoke-static {v4, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-static {}, Ll/pzi0;->o()J

    .line 77
    .line 78
    .line 79
    move-result-wide v4

    .line 80
    long-to-double v4, v4

    .line 81
    iget-wide v6, v1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 82
    .line 83
    cmpl-double v4, v4, v6

    .line 84
    .line 85
    if-lez v4, :cond_0

    .line 86
    .line 87
    move v0, v2

    .line 88
    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v4, "is_private_chat_invite_expired"

    .line 93
    .line 94
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget v4, v1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 99
    .line 100
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    const-string v5, "private_chat_duration"

    .line 105
    .line 106
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    filled-new-array {p3, v0, v4}, [Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    const-string v0, "e_private_chat_invite_message"

    .line 115
    .line 116
    const-string v4, "p_chat_view"

    .line 117
    .line 118
    invoke-static {v0, v4, p3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 122
    .line 123
    .line 124
    move-result p3

    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->a:Lv/VText;

    .line 126
    .line 127
    const-string v4, "1v1\u4e13\u5c5e\u804a\u5929\u9080\u8bf7"

    .line 128
    .line 129
    if-eqz p3, :cond_2

    .line 130
    .line 131
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->b:Lv/VText;

    .line 135
    .line 136
    const-string p1, "\u5bf9\u65b9\u572810\u5206\u949f\u5185\u63a5\u53d7\u5373\u53ef\u5f00\u542f"

    .line 137
    .line 138
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_2
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    if-eqz p3, :cond_5

    .line 151
    .line 152
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 153
    .line 154
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    new-instance p3, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    const-string v0, ""

    .line 160
    .line 161
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget v0, v1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 165
    .line 166
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string v0, "\u5206\u949f\u4e13\u5c5e\u4e8e\u5f7c\u6b64\u7684\u804a\u5929"

    .line 170
    .line 171
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->b:Lv/VText;

    .line 175
    .line 176
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p3

    .line 180
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    iget-wide v4, v1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 184
    .line 185
    double-to-long v4, v4

    .line 186
    const-wide/16 v6, 0x0

    .line 187
    .line 188
    cmp-long p3, v4, v6

    .line 189
    .line 190
    if-lez p3, :cond_3

    .line 191
    .line 192
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 193
    .line 194
    const-string p2, "\u5df2\u63a5\u53d7"

    .line 195
    .line 196
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 200
    .line 201
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    sget p2, Ll/g9c0;->l:I

    .line 210
    .line 211
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 221
    .line 222
    .line 223
    move-result-wide v4

    .line 224
    long-to-double v4, v4

    .line 225
    iget-wide v8, v1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 226
    .line 227
    cmpl-double p3, v4, v8

    .line 228
    .line 229
    if-ltz p3, :cond_4

    .line 230
    .line 231
    iget-wide v4, v1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 232
    .line 233
    double-to-long v4, v4

    .line 234
    cmp-long p3, v4, v6

    .line 235
    .line 236
    if-gtz p3, :cond_4

    .line 237
    .line 238
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 239
    .line 240
    const-string p2, "\u5df2\u5931\u6548"

    .line 241
    .line 242
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 243
    .line 244
    .line 245
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 246
    .line 247
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    sget p2, Ll/g9c0;->l:I

    .line 256
    .line 257
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 262
    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :cond_4
    new-instance p3, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 267
    .line 268
    invoke-direct {p3}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p3, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->b(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    const-wide/16 v4, 0x3c

    .line 280
    .line 281
    invoke-virtual {v0, v4, v5}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    const-wide/16 v4, 0x258

    .line 286
    .line 287
    invoke-virtual {v0, v4, v5}, Lcom/p1/mobile/putong/core/api/c0$a;->i(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    new-instance v2, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    iget-object v4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    iget-wide v4, v1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 310
    .line 311
    double-to-long v4, v4

    .line 312
    invoke-virtual {v0, v4, v5}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 317
    .line 318
    .line 319
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 320
    .line 321
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 322
    .line 323
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    iget-wide v0, v1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 327
    .line 328
    double-to-long v0, v0

    .line 329
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->e(J)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 333
    .line 334
    .line 335
    move-result-object p3

    .line 336
    instance-of p3, p3, Lcom/p1/mobile/android/app/Act;

    .line 337
    .line 338
    if-eqz p3, :cond_6

    .line 339
    .line 340
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 341
    .line 342
    .line 343
    move-result-object p3

    .line 344
    check-cast p3, Lcom/p1/mobile/android/app/Act;

    .line 345
    .line 346
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 347
    .line 348
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 349
    .line 350
    new-instance v1, Ljava/lang/StringBuilder;

    .line 351
    .line 352
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 356
    .line 357
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->n(Ljava/lang/String;)Lrx/c;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-interface {p1, p3, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 369
    .line 370
    .line 371
    move-result-object p1

    .line 372
    new-instance p3, Ll/w4q;

    .line 373
    .line 374
    invoke-direct {p3, p0}, Ll/w4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;)V

    .line 375
    .line 376
    .line 377
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 378
    .line 379
    .line 380
    move-result-object p3

    .line 381
    invoke-virtual {p1, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 382
    .line 383
    .line 384
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 385
    .line 386
    new-instance p1, Ll/x4q;

    .line 387
    .line 388
    invoke-direct {p1, p2}, Ll/x4q;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 389
    .line 390
    .line 391
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 392
    .line 393
    .line 394
    goto :goto_0

    .line 395
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->b:Lv/VText;

    .line 396
    .line 397
    const-string p1, "\u4e13\u5c5e\u4e8e\u5f7c\u6b64\u7684\u804a\u5929"

    .line 398
    .line 399
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 400
    .line 401
    .line 402
    :cond_6
    :goto_0
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 2

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/api/c0$b;->d:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->e(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(J)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long v2, v0, p1

    .line 6
    .line 7
    if-lez v2, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 10
    .line 11
    const-string p2, "\u5df2\u5931\u6548"

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    sget v0, Ll/g9c0;->l:I

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    sub-long/2addr p1, v0

    .line 50
    const-wide/32 v0, 0x927c0

    .line 51
    .line 52
    .line 53
    cmp-long v0, p1, v0

    .line 54
    .line 55
    if-ltz v0, :cond_1

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 58
    .line 59
    const-string p2, "\u63a5\u53d7\u9080\u8bf7"

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const-wide/16 v0, 0x3e8

    .line 66
    .line 67
    div-long/2addr p1, v0

    .line 68
    long-to-int p1, p1

    .line 69
    const/4 p2, 0x0

    .line 70
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 75
    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v1, "\u63a5\u53d7\u9080\u8bf7 "

    .line 79
    .line 80
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string p1, "s"

    .line 87
    .line 88
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget p2, Ll/g9c0;->o:I

    .line 109
    .line 110
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Q4:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->a:Lv/VText;

    .line 13
    .line 14
    sget v0, Ll/edc0;->n4:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->b:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/edc0;->b:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->a:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sput p1, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->d:I

    .line 6
    .line 7
    const/high16 v0, 0x40000000    # 2.0f

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 14
    .line 15
    .line 16
    sget p1, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->d:I

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
