.class public Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->I2:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->a:Lv/VText;

    .line 13
    .line 14
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->a:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget v1, Ll/g9c0;->i:I

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->n7()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isAiStory(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->b:Z

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->b:Z

    .line 31
    .line 32
    const-string v0, "e_ai_story_chat_limit_tips"

    .line 33
    .line 34
    const-string v2, "p_chat_view"

    .line 35
    .line 36
    invoke-static {v0, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->s(Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 43
    .line 44
    const-string v0, "common_tip"

    .line 45
    .line 46
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    const-string v2, "two_sides_different_tip"

    .line 51
    .line 52
    const-string v3, "common_tip_list_show"

    .line 53
    .line 54
    if-nez p2, :cond_1

    .line 55
    .line 56
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 57
    .line 58
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-nez p2, :cond_1

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {p2, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-nez p2, :cond_1

    .line 73
    .line 74
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 75
    .line 76
    const-string v4, "harass_alert"

    .line 77
    .line 78
    invoke-static {p2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p2, :cond_2

    .line 83
    .line 84
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    if-nez p2, :cond_2

    .line 91
    .line 92
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {p2}, Ll/bjq;->b(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-eqz p2, :cond_2

    .line 99
    .line 100
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->a:Lv/VText;

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 103
    .line 104
    const-string v1, "\n"

    .line 105
    .line 106
    const-string v2, "<br/>"

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->p(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->a:Lv/VText;

    .line 120
    .line 121
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    if-nez p2, :cond_3

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-nez p2, :cond_3

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-static {p2, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    if-eqz p2, :cond_5

    .line 158
    .line 159
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 160
    .line 161
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result p2

    .line 165
    if-nez p2, :cond_5

    .line 166
    .line 167
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 168
    .line 169
    const-string v0, "<a>"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    array-length v0, p2

    .line 176
    if-le v0, v1, :cond_4

    .line 177
    .line 178
    aget-object p2, p2, v1

    .line 179
    .line 180
    const-string v0, "</a>"

    .line 181
    .line 182
    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    array-length v0, p2

    .line 187
    if-lez v0, :cond_4

    .line 188
    .line 189
    const/4 v0, 0x0

    .line 190
    aget-object p2, p2, v0

    .line 191
    .line 192
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 193
    .line 194
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->a:Lv/VText;

    .line 199
    .line 200
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    filled-new-array {p2}, [Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    const/4 v0, 0x2

    .line 213
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    const v1, -0x181e3

    .line 218
    .line 219
    .line 220
    invoke-static {p1, p2, v1, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->a:Lv/VText;

    .line 229
    .line 230
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_5
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 237
    .line 238
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result p2

    .line 242
    if-eqz p2, :cond_7

    .line 243
    .line 244
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 245
    .line 246
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 247
    .line 248
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result p2

    .line 252
    if-eqz p2, :cond_7

    .line 253
    .line 254
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 255
    .line 256
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 257
    .line 258
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ConversationNotification;->localeKey:Ljava/lang/String;

    .line 259
    .line 260
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-nez v0, :cond_7

    .line 265
    .line 266
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 267
    .line 268
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 269
    .line 270
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/ConversationNotification;->localeKey:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->J6(Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    if-lez v0, :cond_7

    .line 277
    .line 278
    :try_start_0
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/ConversationNotification;->params:Ljava/util/List;

    .line 279
    .line 280
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    if-nez v1, :cond_6

    .line 285
    .line 286
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 287
    .line 288
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationNotification;->params:Ljava/util/List;

    .line 289
    .line 290
    invoke-interface {p2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object p2

    .line 294
    invoke-virtual {v1, v0, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p2

    .line 298
    goto :goto_0

    .line 299
    :catch_0
    move-exception p2

    .line 300
    goto :goto_1

    .line 301
    :cond_6
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 302
    .line 303
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p2

    .line 307
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->a:Lv/VText;

    .line 308
    .line 309
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :goto_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 314
    .line 315
    .line 316
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemConversationNotification;->a:Lv/VText;

    .line 317
    .line 318
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 321
    .line 322
    .line 323
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_2

    .line 8
    .line 9
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2, p0}, Ll/n100;->b(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 48
    .line 49
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleParameter:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 70
    .line 71
    const-string v0, "p_chat_view"

    .line 72
    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    invoke-static {p2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleParameter:Ljava/lang/String;

    .line 82
    .line 83
    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p2, v0, p1}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    :catch_0
    :cond_2
    return-void
.end method
