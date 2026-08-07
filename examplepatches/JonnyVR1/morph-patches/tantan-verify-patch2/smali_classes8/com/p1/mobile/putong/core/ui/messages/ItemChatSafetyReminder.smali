.class public Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Ljava/lang/String;


# direct methods
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
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    .line 7
    .line 8
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

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

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

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->e(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/b4q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
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

.method public final synthetic e(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "e_alert_cheat_prevention__dangerous_user_tips"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p1, v0}, Ll/ucq;->f0(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p0, "e_alert_cheat_prevention__sensitive_words_tips"

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p1, p0}, Ll/ucq;->f0(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v0, v0, Ll/yxz;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/yxz;

    .line 39
    .line 40
    iget-boolean v0, v0, Ll/yxz;->M1:Z

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->a:Lv/VText;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget v3, Ll/ibc0;->R4:I

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->a:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    sget v3, Ll/g9c0;->a0:I

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_1

    .line 100
    .line 101
    sget v3, Ll/g9c0;->i:I

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    sget v3, Ll/g9c0;->k:I

    .line 105
    .line 106
    :goto_0
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->a:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 116
    .line 117
    .line 118
    :cond_2
    :goto_1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 119
    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    .line 121
    .line 122
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 123
    .line 124
    const-string v2, "p_chat_view"

    .line 125
    .line 126
    const/4 v3, 0x3

    .line 127
    const-string v4, "sans-serif"

    .line 128
    .line 129
    const/16 v5, 0x21

    .line 130
    .line 131
    if-eqz v0, :cond_4

    .line 132
    .line 133
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 134
    .line 135
    const-string v0, "\u4e0e\u964c\u751f\u4eba\u4ea4\u53cb\u8fc7\u7a0b\u4e2d\uff0c\u8bf7\u52a0\u5f3a\u81ea\u6211\u9632\u8303\u610f\u8bc6\uff0c\u6ce8\u610f\u9690\u79c1\u548c\u8d22\u4ea7\u5b89\u5168\uff01\u6233\u4e00\u6233"

    .line 136
    .line 137
    invoke-direct {p1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    const-string v6, "\u4e86\u89e3\u66f4\u591a\u9632\u9a97\u6280\u5de7"

    .line 145
    .line 146
    invoke-virtual {p1, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 147
    .line 148
    .line 149
    new-instance v6, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder$a;

    .line 150
    .line 151
    invoke-direct {v6, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;)V

    .line 152
    .line 153
    .line 154
    add-int/lit8 v7, v0, 0x8

    .line 155
    .line 156
    invoke-virtual {p1, v6, v0, v7, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 157
    .line 158
    .line 159
    new-instance v6, Lv/text/CustomTypefaceSpan;

    .line 160
    .line 161
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 170
    .line 171
    .line 172
    move-result-object v8

    .line 173
    invoke-virtual {v8}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    invoke-interface {v8}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    if-eqz v8, :cond_3

    .line 182
    .line 183
    sget v8, Ll/g9c0;->j:I

    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_3
    sget v8, Ll/g9c0;->F:I

    .line 187
    .line 188
    :goto_2
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 189
    .line 190
    .line 191
    move-result v7

    .line 192
    invoke-direct {v6, v4, v3, v7}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;I)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    invoke-virtual {p1, v6, v0, v3, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 200
    .line 201
    .line 202
    const-string v0, "\u200b"

    .line 203
    .line 204
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->a:Lv/VText;

    .line 208
    .line 209
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->a:Lv/VText;

    .line 213
    .line 214
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v3, "e_alert_cheat_prevention__dangerous_user_tips"

    .line 236
    .line 237
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-interface {p1, v0}, Ll/ucq;->L(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-nez p1, :cond_6

    .line 249
    .line 250
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 257
    .line 258
    .line 259
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-interface {p1, p0}, Ll/ucq;->J(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    new-array p0, v1, [Ll/sfj0$a;

    .line 275
    .line 276
    invoke-static {v3, v2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :cond_4
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 281
    .line 282
    if-eqz p1, :cond_6

    .line 283
    .line 284
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 285
    .line 286
    const-string v0, "\u5bf9\u4e8e\u6025\u4e8e\u4ea4\u6362\u5fae\u4fe1\u3001QQ\u7b49\u8054\u7cfb\u65b9\u5f0f\u7684\u7528\u6237\uff0c\u8bf7\u63d0\u9ad8\u8b66\u60d5\uff0c\u907f\u514d\u4e0e\u964c\u751f\u4eba\u53d1\u751f\u8d44\u91d1\u5f80\u6765\uff0c\u70b9\u51fb"

    .line 287
    .line 288
    invoke-direct {p1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    const-string v6, "\u5b89\u5168\u4ea4\u53cb\u6d4b\u8bd5"

    .line 296
    .line 297
    invoke-virtual {p1, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 298
    .line 299
    .line 300
    new-instance v6, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder$b;

    .line 301
    .line 302
    invoke-direct {v6, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;)V

    .line 303
    .line 304
    .line 305
    add-int/lit8 v7, v0, 0x6

    .line 306
    .line 307
    invoke-virtual {p1, v6, v0, v7, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 308
    .line 309
    .line 310
    new-instance v6, Lv/text/CustomTypefaceSpan;

    .line 311
    .line 312
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 313
    .line 314
    .line 315
    move-result-object v3

    .line 316
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 317
    .line 318
    .line 319
    move-result-object v7

    .line 320
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 321
    .line 322
    .line 323
    move-result-object v8

    .line 324
    invoke-virtual {v8}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 325
    .line 326
    .line 327
    move-result-object v8

    .line 328
    invoke-interface {v8}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 329
    .line 330
    .line 331
    move-result v8

    .line 332
    if-eqz v8, :cond_5

    .line 333
    .line 334
    sget v8, Ll/g9c0;->j:I

    .line 335
    .line 336
    goto :goto_3

    .line 337
    :cond_5
    sget v8, Ll/g9c0;->F:I

    .line 338
    .line 339
    :goto_3
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 340
    .line 341
    .line 342
    move-result v7

    .line 343
    invoke-direct {v6, v4, v3, v7}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;I)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 347
    .line 348
    .line 349
    move-result v3

    .line 350
    invoke-virtual {p1, v6, v0, v3, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 351
    .line 352
    .line 353
    const-string v0, "\uff0c\u770b\u770b\u4f60\u7684\u5b89\u5168\u610f\u8bc6\u591f\u4e0d\u591f"

    .line 354
    .line 355
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 356
    .line 357
    .line 358
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->a:Lv/VText;

    .line 359
    .line 360
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    .line 362
    .line 363
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->a:Lv/VText;

    .line 364
    .line 365
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 373
    .line 374
    .line 375
    move-result-object p1

    .line 376
    new-instance v0, Ljava/lang/StringBuilder;

    .line 377
    .line 378
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 379
    .line 380
    .line 381
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    const-string v3, "e_alert_cheat_prevention__sensitive_words_tips"

    .line 387
    .line 388
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-interface {p1, v0}, Ll/ucq;->L(Ljava/lang/String;)Z

    .line 396
    .line 397
    .line 398
    move-result p1

    .line 399
    if-nez p1, :cond_6

    .line 400
    .line 401
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 402
    .line 403
    .line 404
    move-result-object p1

    .line 405
    new-instance v0, Ljava/lang/StringBuilder;

    .line 406
    .line 407
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 408
    .line 409
    .line 410
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->b:Ljava/lang/String;

    .line 411
    .line 412
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object p0

    .line 422
    invoke-interface {p1, p0}, Ll/ucq;->J(Ljava/lang/String;)V

    .line 423
    .line 424
    .line 425
    new-array p0, v1, [Ll/sfj0$a;

    .line 426
    .line 427
    invoke-static {v3, v2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 428
    .line 429
    .line 430
    :cond_6
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->c(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;->a:Lv/VText;

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
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    instance-of v0, v0, Ll/ner;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ll/ner;

    .line 49
    .line 50
    invoke-interface {v0}, Ll/ner;->lifecycle()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/z3q;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/z3q;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/a4q;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/a4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatSafetyReminder;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method
