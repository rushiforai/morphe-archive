.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;
.super Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

.field public e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public f:Lv/VFrame;

.field public g:Lv/VRelative;

.field public h:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

.field public i:Lv/VDraweeView;

.field public j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public k:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public l:Lv/VImage;

.field public m:Lv/VImage;

.field public n:Lv/VFrame;

.field public o:Lv/VImage;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 2

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->T(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V

    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->V(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->S(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->R(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public E(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->E(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->j()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->r:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->r:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->T(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget v1, Lcom/p1/mobile/putong/core/R$string;->im:I

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fk6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->C()Z

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
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->O(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->g:Lv/VRelative;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->W(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 57
    .line 58
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 69
    .line 70
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 71
    .line 72
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->B(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_3

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    :cond_3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 98
    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 100
    .line 101
    sget v4, Ll/dbc0;->i0:I

    .line 102
    .line 103
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 104
    .line 105
    .line 106
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->m:Lv/VImage;

    .line 107
    .line 108
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 111
    .line 112
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-eqz v3, :cond_5

    .line 119
    .line 120
    iget-boolean v3, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 121
    .line 122
    if-nez v3, :cond_5

    .line 123
    .line 124
    move v3, v2

    .line 125
    goto :goto_1

    .line 126
    :cond_5
    move v3, v1

    .line 127
    :goto_1
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->k:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 131
    .line 132
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 136
    .line 137
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    const/16 v3, 0x15

    .line 142
    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_9

    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 156
    .line 157
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 158
    .line 159
    if-nez v0, :cond_9

    .line 160
    .line 161
    :cond_6
    invoke-static {}, Ll/gra;->t1()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-eqz v0, :cond_7

    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 168
    .line 169
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 170
    .line 171
    const-string v4, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 172
    .line 173
    invoke-static {v4}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_9

    .line 182
    .line 183
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->m:Lv/VImage;

    .line 184
    .line 185
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eqz v0, :cond_9

    .line 190
    .line 191
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 192
    .line 193
    if-nez v0, :cond_9

    .line 194
    .line 195
    iget v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 196
    .line 197
    if-ne v0, v3, :cond_8

    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->l:Lv/VImage;

    .line 201
    .line 202
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 203
    .line 204
    .line 205
    const-string v0, "p_messages_view"

    .line 206
    .line 207
    new-array v4, v1, [Ll/sfj0$a;

    .line 208
    .line 209
    const-string v5, "e_new_match_red_dot"

    .line 210
    .line 211
    invoke-static {v5, v0, v4}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 212
    .line 213
    .line 214
    goto :goto_3

    .line 215
    :cond_9
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->l:Lv/VImage;

    .line 216
    .line 217
    const/16 v4, 0x8

    .line 218
    .line 219
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 220
    .line 221
    .line 222
    :goto_3
    iget v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 223
    .line 224
    if-ne v0, v3, :cond_a

    .line 225
    .line 226
    const/4 p3, 0x0

    .line 227
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 228
    .line 229
    .line 230
    move-object v4, p1

    .line 231
    goto :goto_4

    .line 232
    :cond_a
    new-instance v3, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;

    .line 233
    .line 234
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 235
    .line 236
    .line 237
    move-result-object v5

    .line 238
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 239
    .line 240
    move-object v6, p3

    .line 241
    check-cast v6, Ll/pf60;

    .line 242
    .line 243
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 244
    .line 245
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 246
    .line 247
    move-object v4, p1

    .line 248
    invoke-direct/range {v3 .. v8}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Landroid/content/Context;Ll/pf60;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {p0, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 252
    .line 253
    .line 254
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 255
    .line 256
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 257
    .line 258
    .line 259
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 260
    .line 261
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 262
    .line 263
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p3

    .line 267
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    .line 269
    .line 270
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 271
    .line 272
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 277
    .line 278
    const/high16 p3, 0x42700000    # 60.0f

    .line 279
    .line 280
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 285
    .line 286
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 287
    .line 288
    .line 289
    move-result p3

    .line 290
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 291
    .line 292
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 293
    .line 294
    invoke-virtual {p3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 298
    .line 299
    const/high16 p3, 0x3f400000    # 0.75f

    .line 300
    .line 301
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setPicPercent(F)V

    .line 302
    .line 303
    .line 304
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 305
    .line 306
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 307
    .line 308
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->n0(Lcom/p1/mobile/putong/data/User;)V

    .line 309
    .line 310
    .line 311
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 312
    .line 313
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 314
    .line 315
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->m0(Lcom/p1/mobile/putong/data/User;)Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    invoke-virtual {p0, v4, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->K(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Z)V

    .line 320
    .line 321
    .line 322
    iget p1, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 323
    .line 324
    const/16 p3, 0x10

    .line 325
    .line 326
    const/16 v0, 0x11

    .line 327
    .line 328
    if-eq p1, p3, :cond_c

    .line 329
    .line 330
    if-ne p1, v0, :cond_b

    .line 331
    .line 332
    goto :goto_5

    .line 333
    :cond_b
    return-void

    .line 334
    :cond_c
    :goto_5
    if-ne p1, v0, :cond_d

    .line 335
    .line 336
    move v1, v2

    .line 337
    :cond_d
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->G(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Z)V

    .line 338
    .line 339
    .line 340
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->onClick(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final W(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/q3d0;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 40
    .line 41
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-direct {v1, v2, v3}, Ll/q3d0;-><init>(II)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "onVoice"

    .line 57
    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->j:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 65
    .line 66
    if-eqz v1, :cond_0

    .line 67
    .line 68
    const v3, -0x298501

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const v3, -0x9655

    .line 73
    .line 74
    .line 75
    :goto_0
    if-eqz v1, :cond_1

    .line 76
    .line 77
    const v4, -0x578301

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    const v4, -0xa116

    .line 82
    .line 83
    .line 84
    :goto_1
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->e(II)V

    .line 85
    .line 86
    .line 87
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 90
    .line 91
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    new-instance v4, Ll/k66;

    .line 95
    .line 96
    invoke-direct {v4, v3}, Ll/k66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, v0, v4}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->G(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 8

    return-void

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->r:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    iget v0, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->n:Lv/VFrame;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/16 v4, 0xf

    .line 9
    .line 10
    if-ne v0, v4, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->z:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->g:Lv/VRelative;

    .line 25
    .line 26
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->p:Lv/VText;

    .line 41
    .line 42
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->o:Lv/VImage;

    .line 43
    .line 44
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 45
    .line 46
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    .line 47
    .line 48
    move-object v1, p3

    .line 49
    invoke-static/range {v0 .. v6}, Ll/vj30;->x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_0
    iget-object v2, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->x:Lcom/p1/mobile/putong/core/data/Recommended;

    .line 55
    .line 56
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->g:Lv/VRelative;

    .line 63
    .line 64
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 68
    .line 69
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 77
    .line 78
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->p:Lv/VText;

    .line 79
    .line 80
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->o:Lv/VImage;

    .line 81
    .line 82
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 83
    .line 84
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    .line 85
    .line 86
    move-object v1, p1

    .line 87
    move-object v2, p3

    .line 88
    invoke-static/range {v0 .. v7}, Ll/vj30;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :cond_1
    iget-object v2, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->y:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 94
    .line 95
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->g:Lv/VRelative;

    .line 100
    .line 101
    if-eqz v2, :cond_2

    .line 102
    .line 103
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 107
    .line 108
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 116
    .line 117
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->p:Lv/VText;

    .line 118
    .line 119
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->o:Lv/VImage;

    .line 120
    .line 121
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 122
    .line 123
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    .line 124
    .line 125
    move-object v1, p1

    .line 126
    move-object v2, p3

    .line 127
    invoke-static/range {v0 .. v7}, Ll/vj30;->v(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 128
    .line 129
    .line 130
    goto/16 :goto_0

    .line 131
    .line 132
    :cond_2
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 136
    .line 137
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 145
    .line 146
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->p:Lv/VText;

    .line 147
    .line 148
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->o:Lv/VImage;

    .line 149
    .line 150
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 151
    .line 152
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    .line 153
    .line 154
    move-object v1, p3

    .line 155
    invoke-static/range {v0 .. v6}, Ll/vj30;->u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_3
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 167
    .line 168
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 169
    .line 170
    iget-object v4, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v3, v4}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    new-instance v4, Ll/ak6;

    .line 177
    .line 178
    invoke-direct {v4, p0}, Ll/ak6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, v4}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 186
    .line 187
    iget-object v4, v4, Ll/il8;->m:Ll/mm6;

    .line 188
    .line 189
    iget-object v5, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {v4, v5}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object v4

    .line 195
    new-instance v5, Ll/bk6;

    .line 196
    .line 197
    invoke-direct {v5, p0}, Ll/bk6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v4, v5}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    new-instance v5, Ll/ck6;

    .line 205
    .line 206
    invoke-direct {v5}, Ll/ck6;-><init>()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v4, v5}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    new-instance v5, Ll/mie0;

    .line 214
    .line 215
    invoke-direct {v5}, Ll/mie0;-><init>()V

    .line 216
    .line 217
    .line 218
    invoke-static {v3, v4, v5}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    invoke-virtual {p1, v2, v3}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    new-instance v3, Ll/dk6;

    .line 235
    .line 236
    invoke-direct {v3, p0, p1, p3}, Ll/dk6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 237
    .line 238
    .line 239
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 244
    .line 245
    .line 246
    new-instance v2, Ll/ek6;

    .line 247
    .line 248
    invoke-direct {v2, p0, p1, p3}, Ll/ek6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 249
    .line 250
    .line 251
    invoke-static {p0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 252
    .line 253
    .line 254
    :goto_0
    sget v0, Ll/dbc0;->w:I

    .line 255
    .line 256
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 257
    .line 258
    .line 259
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setShowSVipFrame(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 22
    .line 23
    sget v0, Ll/dbc0;->h6:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_5

    .line 17
    .line 18
    iget p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 19
    .line 20
    const/4 p1, 0x3

    .line 21
    if-eq p0, p1, :cond_4

    .line 22
    .line 23
    const/4 p1, 0x4

    .line 24
    if-eq p0, p1, :cond_3

    .line 25
    .line 26
    const/4 p1, 0x5

    .line 27
    if-eq p0, p1, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x6

    .line 30
    if-eq p0, p1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string p0, "new_match"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_2
    const-string p0, "nearby"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_3
    const-string p0, "recent_contact"

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_4
    const-string p0, "active"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_5
    :goto_0
    const-string p0, ""

    .line 46
    .line 47
    return-object p0
.end method
