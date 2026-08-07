.class public Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;

.field public b:Lv/VLinear;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->g:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->g:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->g:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->g:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c7q;->a(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChallengeMsg;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isDelIn()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "\u6211\u6682\u65f6\u79bb\u5f00\u51e0\u5929~"

    .line 14
    .line 15
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isDelOut()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const-string p0, "\u5bf9\u65b9\u5df2\u6ce8\u9500"

    .line 26
    .line 27
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void

    .line 31
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    invoke-virtual {p4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->link:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "conversation"

    .line 44
    .line 45
    invoke-interface {p4, p2, v0, p1, v1}, Ll/r97;->d5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->eventlog:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->e(ZLjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 6

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ChallengeMsgList;->parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChallengeMsgList;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1, v0, p3}, Ll/r97;->y5(Lcom/p1/mobile/putong/core/data/ChallengeMsgList;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->a:Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;

    .line 30
    .line 31
    sget v1, Ll/qa00;->q:I

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->d:Lv/VText;

    .line 37
    .line 38
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->title:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->e:Lv/VText;

    .line 44
    .line 45
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->subTitle:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->f:Lv/VText;

    .line 51
    .line 52
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->buttonText:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->d:Lv/VText;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->f:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->c:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-interface {v3}, Ll/r97;->T0()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    invoke-virtual {v0, v1, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->c:Lv/VDraweeView;

    .line 104
    .line 105
    invoke-static {p2}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    const/4 v4, 0x2

    .line 118
    const/16 v5, 0xa

    .line 119
    .line 120
    invoke-virtual {v0, v1, v3, v4, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 125
    .line 126
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 127
    .line 128
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-eqz v1, :cond_4

    .line 139
    .line 140
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_4

    .line 145
    .line 146
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->c:Lv/VDraweeView;

    .line 149
    .line 150
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-virtual {v0, v1, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_4
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->c:Lv/VDraweeView;

    .line 161
    .line 162
    invoke-static {p2}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-virtual {v0, v1, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->f:Lv/VText;

    .line 178
    .line 179
    new-instance v1, Ll/b7q;

    .line 180
    .line 181
    invoke-direct {v1, p0, p2, p1, p3}, Ll/b7q;-><init>(Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChallengeMsg;)V

    .line 182
    .line 183
    .line 184
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/ChallengeMsg;->eventlog:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {p0, v2, p1}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->e(ZLjava/lang/String;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final e(ZLjava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "in_harmony_test_string"

    .line 2
    .line 3
    const-string v1, "p_chat_view"

    .line 4
    .line 5
    const-string v2, "e_in_harmony_test_entrance1_messege_card"

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->g:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->g:Z

    .line 16
    .line 17
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {v2, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {p0}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {v2, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->b(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->d:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->e:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemInviteChallengeView;->f:Lv/VText;

    .line 52
    .line 53
    sget v0, Ll/ibc0;->t:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method
