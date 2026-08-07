.class public Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Ll/g900;

.field public e:Lcom/p1/mobile/putong/core/data/Message;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->f(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/y3q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
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

.method public final synthetic f(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->b0:Lrx/subjects/b;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ll/uqb0;->Z:Ll/a4j;

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 37
    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    const-string v3, "default"

    .line 41
    .line 42
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_0

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 51
    .line 52
    const-string v3, "unknown_"

    .line 53
    .line 54
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 67
    .line 68
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Np(Z)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->d:Ll/g900;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 85
    .line 86
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 87
    .line 88
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 89
    .line 90
    const/4 v8, 0x0

    .line 91
    invoke-virtual {v5, v7, v6, v8}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-virtual {v2, v4, v5}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    new-instance v4, Ll/w3q;

    .line 100
    .line 101
    invoke-direct {v4, p0}, Ll/w3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;)V

    .line 102
    .line 103
    .line 104
    new-instance v5, Ll/x3q;

    .line 105
    .line 106
    invoke-direct {v5}, Ll/x3q;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {v4, v5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v2, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 117
    .line 118
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 119
    .line 120
    const/4 v4, 0x4

    .line 121
    if-ne v2, v4, :cond_2

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    new-array p1, v3, [Ll/sfj0$a;

    .line 132
    .line 133
    const-string v0, "e_wechat_notice"

    .line 134
    .line 135
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    const-string v4, "message_id"

    .line 148
    .line 149
    const-string v5, ""

    .line 150
    .line 151
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    const-string v4, "message_send_status"

    .line 156
    .line 157
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 158
    .line 159
    .line 160
    move-result-object v7

    .line 161
    const-string v4, "message_receiver"

    .line 162
    .line 163
    invoke-static {v4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 164
    .line 165
    .line 166
    move-result-object v8

    .line 167
    const-string v0, "sensitiveword"

    .line 168
    .line 169
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    const-string v0, "sensitive_text"

    .line 174
    .line 175
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 176
    .line 177
    .line 178
    move-result-object v10

    .line 179
    const-string p1, "message_send_values"

    .line 180
    .line 181
    const-string v0, "send"

    .line 182
    .line 183
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 184
    .line 185
    .line 186
    move-result-object v11

    .line 187
    filled-new-array/range {v6 .. v11}, [Ll/sfj0$a;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    const-string v0, "e_chat_view_sensitive_words_send_tips"

    .line 192
    .line 193
    invoke-static {v0, v2, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 194
    .line 195
    .line 196
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->b:Landroid/widget/LinearLayout;

    .line 197
    .line 198
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public h(Ll/g900;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->d:Ll/g900;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->b:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    const/4 p3, 0x1

    .line 8
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->c:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    sget v0, Ll/g9c0;->H:I

    .line 18
    .line 19
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->c:Lv/VText;

    .line 27
    .line 28
    const/4 p3, 0x0

    .line 29
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->c:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    sget v0, Ll/g9c0;->i:I

    .line 53
    .line 54
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    instance-of p1, p1, Ll/yxz;

    .line 74
    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Ll/yxz;

    .line 90
    .line 91
    iget-boolean p1, p1, Ll/yxz;->M1:Z

    .line 92
    .line 93
    if-eqz p1, :cond_1

    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->c:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    sget v0, Ll/ibc0;->R4:I

    .line 102
    .line 103
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->c:Lv/VText;

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    sget v0, Ll/g9c0;->a0:I

    .line 117
    .line 118
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 119
    .line 120
    .line 121
    move-result p3

    .line 122
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    .line 124
    .line 125
    :cond_1
    iget p1, p2, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 126
    .line 127
    const/4 p2, 0x4

    .line 128
    if-ne p1, p2, :cond_2

    .line 129
    .line 130
    const-string p1, "\u6839\u636e\u63a2\u63a2\u541b\u7684\u7ecf\u9a8c\uff0c\u8d38\u7136\u8981\u5fae\u4fe1\u5f88\u5bb9\u6613\u88ab\u51b7\u843d\uff0c\u591a\u804a\u804a\u88ab\u7b54\u5e94\u7684\u6982\u7387\u4f1a\u5927\u5e45\u63d0\u5347\u54e6"

    .line 131
    .line 132
    const-string p2, " \u575a\u6301\u53d1\u9001"

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->V5:I

    .line 140
    .line 141
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->e()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->W5:I

    .line 150
    .line 151
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->c:Lv/VText;

    .line 156
    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-static {p2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_3

    .line 193
    .line 194
    sget v0, Ll/g9c0;->j:I

    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_3
    sget v0, Ll/g9c0;->D:I

    .line 198
    .line 199
    :goto_1
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    const/4 v0, 0x3

    .line 204
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-static {p1, p2, p0, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->c:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ll/v3q;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/v3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
