.class public Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public d:Lcom/p1/mobile/putong/core/ui/messages/ItemText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;Lcom/p1/mobile/putong/core/data/ContinuousChatTip;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c(Lcom/p1/mobile/putong/core/data/ContinuousChatTip;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h35;->a(Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c(Lcom/p1/mobile/putong/core/data/ContinuousChatTip;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array p2, p2, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_chat_continuous_chat_tips_message"

    .line 5
    .line 6
    const-string v1, "p_chat_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    instance-of p2, p2, Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->clickH5Url:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0, p1}, Ll/g96;->c(Landroid/app/Activity;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public d(ILcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->b:Lv/VDraweeView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, Ll/g900;->N(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    const/16 v2, 0xf9

    .line 26
    .line 27
    if-ne p1, v2, :cond_1

    .line 28
    .line 29
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 30
    .line 31
    const-string v3, "local_friend_active_remind_female"

    .line 32
    .line 33
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->getFriendActiveRemindFemaleText()Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 49
    .line 50
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 55
    .line 56
    .line 57
    goto/16 :goto_3

    .line 58
    .line 59
    :cond_1
    const/16 v2, 0xfc

    .line 60
    .line 61
    if-ne p1, v2, :cond_2

    .line 62
    .line 63
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 64
    .line 65
    const-string v2, "continuous_chat_tip"

    .line 66
    .line 67
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->setContinuousChatTip(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 74
    .line 75
    .line 76
    goto/16 :goto_3

    .line 77
    .line 78
    :cond_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_a

    .line 83
    .line 84
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_3

    .line 91
    .line 92
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->androidValue:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_a

    .line 99
    .line 100
    :cond_3
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_6

    .line 107
    .line 108
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {p3, p1}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_6

    .line 115
    .line 116
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {p3, p1}, Ll/n100;->b(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    instance-of p1, p1, Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    if-eqz p1, :cond_4

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    goto :goto_0

    .line 140
    :cond_4
    const-string p1, ""

    .line 141
    .line 142
    :goto_0
    iget-object p3, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleParameter:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 149
    .line 150
    if-eqz p3, :cond_5

    .line 151
    .line 152
    invoke-static {v2, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_5
    :try_start_0
    new-instance p3, Lorg/json/JSONObject;

    .line 157
    .line 158
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleParameter:Ljava/lang/String;

    .line 159
    .line 160
    invoke-direct {p3, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-static {v2, p1, p3}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    .line 165
    .line 166
    :catch_0
    :cond_6
    :goto_1
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->androidValue:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-nez p1, :cond_8

    .line 173
    .line 174
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 175
    .line 176
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_8

    .line 181
    .line 182
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 183
    .line 184
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 185
    .line 186
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_8

    .line 191
    .line 192
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->androidValue:Ljava/lang/String;

    .line 193
    .line 194
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 195
    .line 196
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 197
    .line 198
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 199
    .line 200
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 201
    .line 202
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    if-eqz p1, :cond_7

    .line 207
    .line 208
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 209
    .line 210
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 211
    .line 212
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 213
    .line 214
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->androidValue:Ljava/lang/String;

    .line 215
    .line 216
    iput-object p3, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 217
    .line 218
    :cond_7
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 219
    .line 220
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 221
    .line 222
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 223
    .line 224
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    if-eqz p1, :cond_8

    .line 229
    .line 230
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 231
    .line 232
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->chatTips:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 233
    .line 234
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 235
    .line 236
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->androidValue:Ljava/lang/String;

    .line 237
    .line 238
    iput-object p3, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 239
    .line 240
    :cond_8
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->style:Ljava/lang/String;

    .line 241
    .line 242
    const-string p3, "redBackground"

    .line 243
    .line 244
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 249
    .line 250
    if-eqz p1, :cond_9

    .line 251
    .line 252
    sget p1, Ll/ibc0;->f1:I

    .line 253
    .line 254
    invoke-static {p1}, Ll/k3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    invoke-virtual {p3, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 262
    .line 263
    sget p3, Ll/qa00;->j:I

    .line 264
    .line 265
    invoke-static {p1, p3}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 266
    .line 267
    .line 268
    goto :goto_2

    .line 269
    :cond_9
    const/4 p1, 0x0

    .line 270
    invoke-virtual {p3, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 274
    .line 275
    invoke-static {p1, v1}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 276
    .line 277
    .line 278
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 279
    .line 280
    iget-object p3, v0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {p1, p3, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->D(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 283
    .line 284
    .line 285
    goto :goto_3

    .line 286
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 287
    .line 288
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 289
    .line 290
    .line 291
    :goto_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 292
    .line 293
    const/16 p1, 0x11

    .line 294
    .line 295
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 296
    .line 297
    .line 298
    return-void
.end method

.method public getFriendActiveRemindFemaleText()Ljava/lang/CharSequence;
    .locals 5

    .line 1
    const-string v0, "\u70b9\u51fb\u53ef\u5173\u95ed"

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    sget v2, Ll/g9c0;->j:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget v2, Ll/g9c0;->o:I

    .line 25
    .line 26
    :goto_0
    const/4 v3, 0x3

    .line 27
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "\u5bf9\u65b9\u6ca1\u6709\u56de\u590d\uff1f\u7cfb\u7edf\u5c06\u4e3a\u60a8\u518d\u6b21\u63d0\u9192\u5bf9\u65b9\n\u70b9\u51fb\u53ef\u5173\u95ed"

    .line 32
    .line 33
    invoke-static {v4, v1, v2, v3}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem$a;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/16 v3, 0x21

    .line 51
    .line 52
    invoke-virtual {v1, v2, p0, v0, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 53
    .line 54
    .line 55
    return-object v1
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->i:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v1, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public setContinuousChatTip(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 29
    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->days:I

    .line 31
    .line 32
    if-lez v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->b:Lv/VDraweeView;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 41
    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->b:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->flameImgUrl:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->days:I

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v2, "\u5df2\u8fde\u7eed\u804a\u5929%d\u5929\uff0c\u70b9\u4eae"

    .line 65
    .line 66
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 71
    .line 72
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 76
    .line 77
    const-string v2, "\u6807\u8bc6"

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 83
    .line 84
    const-string v2, "#FF8231"

    .line 85
    .line 86
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 94
    .line 95
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 100
    .line 101
    .line 102
    const-string v0, "p_chat_view"

    .line 103
    .line 104
    new-array v1, v1, [Ll/sfj0$a;

    .line 105
    .line 106
    const-string v2, "e_chat_continuous_chat_tips_message"

    .line 107
    .line 108
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 109
    .line 110
    .line 111
    :cond_0
    new-instance v0, Ll/g35;

    .line 112
    .line 113
    invoke-direct {v0, p0, p1}, Ll/g35;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;Lcom/p1/mobile/putong/core/data/ContinuousChatTip;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 121
    .line 122
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    return-void
.end method
