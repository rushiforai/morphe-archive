.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->i(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->l(Ll/pf60;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->n(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->j(Ll/bkj0;)V

    return-void
.end method

.method public static getTA()Ljava/lang/String;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "male"

    .line 19
    .line 20
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    const-string v0, "\u7537\u6027"

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "female"

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    :goto_0
    const-string v0, "\u5973\u6027"

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_2
    const-string v0, "\u7528\u6237"

    .line 47
    .line 48
    return-object v0
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r96;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "title_information"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "e_choose"

    .line 14
    .line 15
    const-string v0, "p_messages_view"

    .line 16
    .line 17
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/OOFMkWebViewAct;->n2(Landroid/content/Context;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic j(Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    const-string p1, "fake_conversation_oof_enter"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->re(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h:Landroid/widget/TextView;

    .line 30
    .line 31
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 32
    .line 33
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 41
    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->d:Landroid/view/View;

    .line 49
    .line 50
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->g:Lv/VText;

    .line 54
    .line 55
    const-string v1, "\u4e0b\u4e00\u8f6e\u8bf7\u660e\u5929\u518d\u6765"

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const/4 v2, 0x1

    .line 62
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->d:Landroid/view/View;

    .line 66
    .line 67
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;->c(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->g:Lv/VText;

    .line 77
    .line 78
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 79
    .line 80
    if-nez v1, :cond_2

    .line 81
    .line 82
    const-string v1, ""

    .line 83
    .line 84
    :cond_2
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    const-string p1, "title_information"

    .line 88
    .line 89
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    filled-new-array {p1}, [Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    const-string v1, "e_choose"

    .line 100
    .line 101
    const-string v2, "p_messages_view"

    .line 102
    .line 103
    invoke-static {v1, v2, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 104
    .line 105
    .line 106
    new-instance p1, Ll/p96;

    .line 107
    .line 108
    invoke-direct {p1, p0, v0}, Ll/p96;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_choose_receive_pick"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

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
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/OOFPickMkWebViewAct;->n2(Landroid/content/Context;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic l(Ll/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h:Landroid/widget/TextView;

    .line 10
    .line 11
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 12
    .line 13
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->d:Landroid/view/View;

    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;->c(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->g:Lv/VText;

    .line 38
    .line 39
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    const-string p1, ""

    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    const-string p0, "e_choose_receive_pick"

    .line 49
    .line 50
    const-string p1, "p_messages_view"

    .line 51
    .line 52
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_selected_entrance"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 11
    .line 12
    iget-object p1, p1, Ll/ura;->R:Ll/vxd0;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "message_entrance"

    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/o2c;->i(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic n(Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    const-string p1, "fake_conversation_profile_featured"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->re(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h:Landroid/widget/TextView;

    .line 30
    .line 31
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 32
    .line 33
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 41
    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->d:Landroid/view/View;

    .line 49
    .line 50
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 v0, 0x1

    .line 55
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->d:Landroid/view/View;

    .line 59
    .line 60
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;->c(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 67
    .line 68
    .line 69
    :goto_0
    const-string p1, "e_selected_entrance"

    .line 70
    .line 71
    const-string v0, "p_messages_view"

    .line 72
    .line 73
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    new-instance p1, Ll/q96;

    .line 77
    .line 78
    invoke-direct {p1, p0}, Ll/q96;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public o(Ll/dq1;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->a:Lv/VImage;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/dbc0;->X5:I

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget v0, Ll/dbc0;->W5:I

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->f:Lv/VText;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/gra;->o3()Lcom/p1/mobile/putong/core/data/OOFEntrenceConfig;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/OOFEntrenceConfig;->chooseEntrenceName:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->f:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->g:Lv/VText;

    .line 42
    .line 43
    const-string v1, ""

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 55
    .line 56
    const-string v2, "fake_conversation_oof_enter"

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_1

    .line 67
    .line 68
    const/4 p2, 0x0

    .line 69
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    goto :goto_1

    .line 74
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    invoke-virtual {v2, p2}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    :goto_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 85
    .line 86
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    new-instance v3, Ll/j96;

    .line 91
    .line 92
    invoke-direct {v3}, Ll/j96;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {v1, p2, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p1, v0, p2}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    new-instance p2, Ll/k96;

    .line 104
    .line 105
    invoke-direct {p2, p0}, Ll/k96;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Ll/sj6;->R:I

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    sget v0, Ll/sj6;->Q:I

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->a:Lv/VImage;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    new-array v2, v2, [Landroid/view/View;

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    aput-object v1, v2, v3

    .line 27
    .line 28
    invoke-static {v0, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->f:Lv/VText;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->g:Lv/VText;

    .line 39
    .line 40
    invoke-static {p0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public p(Ll/dq1;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->f:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/gra;->z()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->a:Lv/VImage;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget v0, Ll/dbc0;->X5:I

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget v0, Ll/dbc0;->W5:I

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->f:Lv/VText;

    .line 31
    .line 32
    const-string v1, "\u6536\u5230\u7684Pick"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->g:Lv/VText;

    .line 38
    .line 39
    const-string v1, ""

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Ll/m96;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/m96;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 59
    .line 60
    const-string v2, "fake_conversation_oof_pick"

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 69
    .line 70
    invoke-virtual {v2, p2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    new-instance v2, Ll/n96;

    .line 75
    .line 76
    invoke-direct {v2}, Ll/n96;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, p2, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p1, v0, p2}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    new-instance p2, Ll/o96;

    .line 88
    .line 89
    invoke-direct {p2, p0}, Ll/o96;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public q(Ll/dq1;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->a:Lv/VImage;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/dbc0;->Jm:I

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget v0, Ll/dbc0;->Im:I

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->f:Lv/VText;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->getTA()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "\u6765\u770b\u770b\u4eca\u65e5\u4e3a\u4f60\u63a8\u8350\u7684\u4f18\u8d28"

    .line 37
    .line 38
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, "\uff01"

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->f:Lv/VText;

    .line 54
    .line 55
    const-string v2, "\u6bcf\u65e5\u7cbe\u9009"

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->g:Lv/VText;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->h()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 72
    .line 73
    const-string v2, "fake_conversation_profile_featured"

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_1

    .line 84
    .line 85
    const/4 p2, 0x0

    .line 86
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    goto :goto_1

    .line 91
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    invoke-virtual {v2, p2}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    :goto_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 102
    .line 103
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    new-instance v3, Ll/j96;

    .line 108
    .line 109
    invoke-direct {v3}, Ll/j96;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-static {v1, p2, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-virtual {p1, v0, p2}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance p2, Ll/l96;

    .line 121
    .line 122
    invoke-direct {p2, p0}, Ll/l96;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;)V

    .line 123
    .line 124
    .line 125
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void
.end method
