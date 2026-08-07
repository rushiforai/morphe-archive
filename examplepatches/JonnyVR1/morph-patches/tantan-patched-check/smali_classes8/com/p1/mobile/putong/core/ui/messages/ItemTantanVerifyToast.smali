.class public Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

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

.method public static synthetic a(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "\u4e0d\u60f3\u9519\u8fc7\u6700\u65b0\u56de\u590d"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string p1, "p_chat_view"

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "e_miss_open_tips"

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string p0, "e_offline_open_tips"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ll/r97;->T()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_offline_open_notification"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ll/r97;->T()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->h(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic f(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "messages_friend_comment_toast"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/clz;->v6(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    new-array p0, p0, [Ll/sfj0$a;

    .line 26
    .line 27
    const-string p1, "e_impression_update"

    .line 28
    .line 29
    const-string v0, "p_chat_view"

    .line 30
    .line 31
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->Y(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ll/d3z;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/d3z;->u0()Ll/azy;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/azy;->d0()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/d3z;->a2()V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_toast_chat_page_verification_guide"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v1, 0x0

    .line 25
    const-string v2, "im"

    .line 26
    .line 27
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dn(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 12

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    const v1, 0x9d93

    .line 4
    .line 5
    .line 6
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    const-string v2, "p_chat_view"

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const-string v0, "e_wechat_notice"

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Ll/n100;->b(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const-string v3, "receiver_user_id"

    .line 42
    .line 43
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    filled-new-array {v3}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-static {v0, v2, v3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v4, :cond_1

    .line 81
    .line 82
    sget v4, Ll/g9c0;->i:I

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    sget v4, Ll/g9c0;->H:I

    .line 86
    .line 87
    :goto_0
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    instance-of v0, v0, Ll/yxz;

    .line 107
    .line 108
    if-eqz v0, :cond_2

    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 117
    .line 118
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Ll/yxz;

    .line 123
    .line 124
    iget-boolean v0, v0, Ll/yxz;->M1:Z

    .line 125
    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    sget v4, Ll/ibc0;->R4:I

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    sget v4, Ll/g9c0;->a0:I

    .line 150
    .line 151
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    .line 157
    .line 158
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const-string v3, "local_friend_comment_toast"

    .line 163
    .line 164
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    const/4 v3, 0x3

    .line 169
    if-eqz v0, :cond_4

    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 172
    .line 173
    const-string p2, "\u7acb\u5373\u67e5\u770b"

    .line 174
    .line 175
    filled-new-array {p2}, [Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    if-eqz v1, :cond_3

    .line 200
    .line 201
    sget v1, Ll/g9c0;->j:I

    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_3
    sget v1, Ll/g9c0;->D:I

    .line 205
    .line 206
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    const-string v2, "\u66f4\u65b0\u4e86\u597d\u53cb\u5370\u8c61\uff0c\u7acb\u5373\u67e5\u770b"

    .line 215
    .line 216
    invoke-static {v2, p2, v0, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 224
    .line 225
    new-instance p2, Ll/ygq;

    .line 226
    .line 227
    invoke-direct {p2, p0}, Ll/ygq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;)V

    .line 228
    .line 229
    .line 230
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 231
    .line 232
    .line 233
    return-void

    .line 234
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 235
    .line 236
    const-string v4, "local_real_shot_tips"

    .line 237
    .line 238
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-eqz v0, :cond_7

    .line 243
    .line 244
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 245
    .line 246
    .line 247
    move-result-object p2

    .line 248
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 249
    .line 250
    .line 251
    move-result-object p2

    .line 252
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->Q4:I

    .line 253
    .line 254
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p2

    .line 258
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->O4:I

    .line 267
    .line 268
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    const-string v1, "2"

    .line 277
    .line 278
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    if-eqz p1, :cond_5

    .line 285
    .line 286
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->P4:I

    .line 295
    .line 296
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    invoke-virtual {p1, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 305
    .line 306
    invoke-static {p2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 319
    .line 320
    .line 321
    move-result-object v2

    .line 322
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 323
    .line 324
    .line 325
    move-result v2

    .line 326
    if-eqz v2, :cond_6

    .line 327
    .line 328
    sget v2, Ll/g9c0;->j:I

    .line 329
    .line 330
    goto :goto_2

    .line 331
    :cond_6
    sget v2, Ll/g9c0;->D:I

    .line 332
    .line 333
    :goto_2
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 338
    .line 339
    .line 340
    move-result-object v2

    .line 341
    invoke-static {v0, p2, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 342
    .line 343
    .line 344
    move-result-object p2

    .line 345
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 346
    .line 347
    .line 348
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 349
    .line 350
    new-instance p2, Ll/zgq;

    .line 351
    .line 352
    invoke-direct {p2, p0}, Ll/zgq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;)V

    .line 353
    .line 354
    .line 355
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 356
    .line 357
    .line 358
    return-void

    .line 359
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 360
    .line 361
    const-string v4, "local_normal_tips"

    .line 362
    .line 363
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 364
    .line 365
    .line 366
    move-result v0

    .line 367
    if-eqz v0, :cond_8

    .line 368
    .line 369
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 370
    .line 371
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 372
    .line 373
    .line 374
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 375
    .line 376
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 377
    .line 378
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 379
    .line 380
    .line 381
    return-void

    .line 382
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 383
    .line 384
    const-string v1, "local_push_switch"

    .line 385
    .line 386
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 387
    .line 388
    .line 389
    move-result v0

    .line 390
    const-string v4, "\u4ed6"

    .line 391
    .line 392
    const-string v5, "\u5979"

    .line 393
    .line 394
    if-eqz v0, :cond_e

    .line 395
    .line 396
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 397
    .line 398
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 399
    .line 400
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    invoke-static {}, Ll/pzi0;->o()J

    .line 409
    .line 410
    .line 411
    move-result-wide v6

    .line 412
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 413
    .line 414
    .line 415
    move-result v0

    .line 416
    if-eqz v0, :cond_11

    .line 417
    .line 418
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 419
    .line 420
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move-result v0

    .line 424
    if-eqz v0, :cond_11

    .line 425
    .line 426
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 427
    .line 428
    .line 429
    move-result v0

    .line 430
    const-wide v8, 0x41124f8000000000L    # 300000.0

    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    if-eqz v0, :cond_a

    .line 436
    .line 437
    invoke-virtual {p2, v1}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-nez v0, :cond_a

    .line 442
    .line 443
    invoke-virtual {p2, v1}, Ll/n100;->b(Ljava/lang/String;)V

    .line 444
    .line 445
    .line 446
    long-to-double v0, v6

    .line 447
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 448
    .line 449
    iget-wide v10, p2, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 450
    .line 451
    sub-double/2addr v0, v10

    .line 452
    cmpg-double p2, v0, v8

    .line 453
    .line 454
    if-gez p2, :cond_9

    .line 455
    .line 456
    const-string p2, "e_miss_open_tips"

    .line 457
    .line 458
    invoke-static {p2, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 459
    .line 460
    .line 461
    goto :goto_3

    .line 462
    :cond_9
    const-string p2, "e_offline_open_tips"

    .line 463
    .line 464
    invoke-static {p2, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 465
    .line 466
    .line 467
    :cond_a
    :goto_3
    long-to-double v0, v6

    .line 468
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 469
    .line 470
    iget-wide v6, p2, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 471
    .line 472
    sub-double/2addr v0, v6

    .line 473
    cmpg-double p2, v0, v8

    .line 474
    .line 475
    if-gez p2, :cond_b

    .line 476
    .line 477
    const-string p1, "\u4e0d\u60f3\u9519\u8fc7\u6700\u65b0\u56de\u590d\uff1f\u70b9\u51fb\u5f00\u542f\u63d0\u9192"

    .line 478
    .line 479
    goto :goto_4

    .line 480
    :cond_b
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 481
    .line 482
    .line 483
    move-result p1

    .line 484
    if-eqz p1, :cond_c

    .line 485
    .line 486
    move-object v4, v5

    .line 487
    :cond_c
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 488
    .line 489
    .line 490
    move-result-object p1

    .line 491
    const-string p2, "%s\u4e0d\u5728\u7ebf\uff0c\u70b9\u51fb\u5f00\u542f\u63d0\u9192\u4e0a\u7ebf\u540e\u53ca\u65f6\u901a\u77e5\u4f60"

    .line 492
    .line 493
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 494
    .line 495
    .line 496
    move-result-object p1

    .line 497
    :goto_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 498
    .line 499
    const-string v0, "\u70b9\u51fb\u5f00\u542f\u63d0\u9192"

    .line 500
    .line 501
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 506
    .line 507
    .line 508
    move-result-object v1

    .line 509
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 510
    .line 511
    .line 512
    move-result-object v2

    .line 513
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 514
    .line 515
    .line 516
    move-result-object v2

    .line 517
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 518
    .line 519
    .line 520
    move-result v2

    .line 521
    if-eqz v2, :cond_d

    .line 522
    .line 523
    sget v2, Ll/g9c0;->j:I

    .line 524
    .line 525
    goto :goto_5

    .line 526
    :cond_d
    sget v2, Ll/g9c0;->D:I

    .line 527
    .line 528
    :goto_5
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 529
    .line 530
    .line 531
    move-result v1

    .line 532
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 533
    .line 534
    .line 535
    move-result-object v2

    .line 536
    invoke-static {p1, v0, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 541
    .line 542
    .line 543
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 544
    .line 545
    new-instance p2, Ll/ahq;

    .line 546
    .line 547
    invoke-direct {p2, p1}, Ll/ahq;-><init>(Ljava/lang/String;)V

    .line 548
    .line 549
    .line 550
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 551
    .line 552
    .line 553
    return-void

    .line 554
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 555
    .line 556
    const-string v1, "local_push_switch_plus"

    .line 557
    .line 558
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 559
    .line 560
    .line 561
    move-result v0

    .line 562
    if-eqz v0, :cond_12

    .line 563
    .line 564
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 565
    .line 566
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 567
    .line 568
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 569
    .line 570
    .line 571
    move-result-object p1

    .line 572
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 573
    .line 574
    .line 575
    move-result-object p1

    .line 576
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 577
    .line 578
    .line 579
    move-result v0

    .line 580
    if-eqz v0, :cond_11

    .line 581
    .line 582
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 583
    .line 584
    .line 585
    move-result v0

    .line 586
    if-eqz v0, :cond_f

    .line 587
    .line 588
    invoke-virtual {p2, v1}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 589
    .line 590
    .line 591
    move-result v0

    .line 592
    if-nez v0, :cond_f

    .line 593
    .line 594
    invoke-virtual {p2, v1}, Ll/n100;->b(Ljava/lang/String;)V

    .line 595
    .line 596
    .line 597
    const-string p2, "e_offline_open_notification"

    .line 598
    .line 599
    invoke-static {p2, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 600
    .line 601
    .line 602
    :cond_f
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 603
    .line 604
    .line 605
    move-result p1

    .line 606
    if-eqz p1, :cond_10

    .line 607
    .line 608
    move-object v4, v5

    .line 609
    :cond_10
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 610
    .line 611
    .line 612
    move-result-object p1

    .line 613
    const-string p2, "\u5f00\u542f\u901a\u77e5\u540e\u53ca\u65f6\u63a5\u6536%s\u7684\u6d88\u606f"

    .line 614
    .line 615
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 616
    .line 617
    .line 618
    move-result-object p1

    .line 619
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 620
    .line 621
    const-string v0, "\u5f00\u542f\u901a\u77e5"

    .line 622
    .line 623
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 624
    .line 625
    .line 626
    move-result-object v0

    .line 627
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 628
    .line 629
    .line 630
    move-result-object v1

    .line 631
    sget v2, Ll/g9c0;->D:I

    .line 632
    .line 633
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 634
    .line 635
    .line 636
    move-result v1

    .line 637
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 638
    .line 639
    .line 640
    move-result-object v2

    .line 641
    invoke-static {p1, v0, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 642
    .line 643
    .line 644
    move-result-object p1

    .line 645
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 646
    .line 647
    .line 648
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 649
    .line 650
    new-instance p1, Ll/bhq;

    .line 651
    .line 652
    invoke-direct {p1}, Ll/bhq;-><init>()V

    .line 653
    .line 654
    .line 655
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 656
    .line 657
    .line 658
    :cond_11
    return-void

    .line 659
    :cond_12
    invoke-static {}, Ll/nrb0;->b()Z

    .line 660
    .line 661
    .line 662
    move-result p1

    .line 663
    if-eqz p1, :cond_13

    .line 664
    .line 665
    const-string p1, "\u5934\u50cf\u8ba4\u8bc1"

    .line 666
    .line 667
    goto :goto_6

    .line 668
    :cond_13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 669
    .line 670
    .line 671
    move-result-object p1

    .line 672
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 673
    .line 674
    .line 675
    move-result-object p1

    .line 676
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->f3:I

    .line 677
    .line 678
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 679
    .line 680
    .line 681
    move-result-object p1

    .line 682
    :goto_6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 683
    .line 684
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 685
    .line 686
    .line 687
    move-result-object v0

    .line 688
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 689
    .line 690
    .line 691
    move-result-object v0

    .line 692
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->g3:I

    .line 693
    .line 694
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 695
    .line 696
    .line 697
    move-result-object v2

    .line 698
    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 699
    .line 700
    .line 701
    move-result-object v0

    .line 702
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 703
    .line 704
    .line 705
    move-result-object p1

    .line 706
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 707
    .line 708
    .line 709
    move-result-object v1

    .line 710
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 711
    .line 712
    .line 713
    move-result-object v2

    .line 714
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 715
    .line 716
    .line 717
    move-result-object v2

    .line 718
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 719
    .line 720
    .line 721
    move-result v2

    .line 722
    if-eqz v2, :cond_14

    .line 723
    .line 724
    sget v2, Ll/g9c0;->j:I

    .line 725
    .line 726
    goto :goto_7

    .line 727
    :cond_14
    sget v2, Ll/g9c0;->D:I

    .line 728
    .line 729
    :goto_7
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 730
    .line 731
    .line 732
    move-result v1

    .line 733
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 734
    .line 735
    .line 736
    move-result-object v2

    .line 737
    invoke-static {v0, p1, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 738
    .line 739
    .line 740
    move-result-object p1

    .line 741
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 742
    .line 743
    .line 744
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 745
    .line 746
    new-instance p2, Ll/chq;

    .line 747
    .line 748
    invoke-direct {p2, p0}, Ll/chq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;)V

    .line 749
    .line 750
    .line 751
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 752
    .line 753
    .line 754
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->y4:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanVerifyToast;->a:Lv/VText;

    .line 13
    .line 14
    return-void
.end method
