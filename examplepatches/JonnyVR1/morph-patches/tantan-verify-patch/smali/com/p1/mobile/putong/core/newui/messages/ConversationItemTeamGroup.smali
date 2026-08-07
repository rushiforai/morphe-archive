.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public g:Lv/VText;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/core/api/c0$a;

.field public final k:Ljava/util/concurrent/atomic/AtomicLong;

.field public l:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->k:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->k:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public static synthetic a(Ll/vg60;)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->n(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->m(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/bkj0;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 16
    .line 17
    iget-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    invoke-virtual {v3, v4, v5}, Lcom/p1/mobile/putong/core/api/g;->jg(Ljava/lang/String;Z)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 25
    .line 26
    iget-object v4, v4, Ll/il8;->c:Ll/t600;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v4, v5, v1, v2, v3}, Ll/t600;->Z(Ljava/lang/String;DZ)Ll/wzh0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/wzh0$a;->j()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1, v0}, Ll/ue6;->t(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/Message;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {p0, v0, v1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Lcom/p1/mobile/putong/core/data/Conversation;Ll/u46;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->k(Lcom/p1/mobile/putong/core/data/Conversation;Ll/u46;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Ll/u46;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->l(Ll/u46;Ll/bkj0;)V

    return-void
.end method

.method private i()Lcom/p1/mobile/android/app/Act;
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


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mc6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/16 v0, 0x8

    .line 15
    .line 16
    if-ge p0, v0, :cond_1

    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "..."

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/data/Conversation;Ll/u46;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->i()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->i()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/teamgroup/TeamGroupAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object p3, p3, Ll/dkb;->C5:Ll/byd0;

    .line 21
    .line 22
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    check-cast p3, Ljava/lang/Long;

    .line 27
    .line 28
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 33
    .line 34
    double-to-long v2, v2

    .line 35
    cmp-long p3, v0, v2

    .line 36
    .line 37
    if-gez p3, :cond_0

    .line 38
    .line 39
    const-string p3, "1"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string p3, "0"

    .line 43
    .line 44
    :goto_0
    const-string v0, "red_dot_state"

    .line 45
    .line 46
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    filled-new-array {p3}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    const-string v0, "e_subscription_content"

    .line 55
    .line 56
    const-string v1, "p_messages_view"

    .line 57
    .line 58
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->o(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic l(Ll/u46;Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v1, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->p(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;->c(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 14
    .line 15
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "\u6536\u5230\u7684\u79f0\u8d5e\uff1a%s%s"

    .line 20
    .line 21
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public o(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3
    .param p1    # Ll/u46;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 4
    .line 5
    const-string v1, "fake_conversation_surprise_gift_box"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 11
    .line 12
    const-string v1, "\u8ba2\u9605\u5185\u5bb9"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->h:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-wide v1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/fc6;

    .line 29
    .line 30
    invoke-direct {v0, p0, p2, p1}, Ll/fc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Lcom/p1/mobile/putong/core/data/Conversation;Ll/u46;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->l:Ll/kcg0;

    .line 37
    .line 38
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->i()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->df()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/gc6;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/gc6;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/sb8;

    .line 63
    .line 64
    invoke-direct {v1}, Ll/sb8;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/hc6;

    .line 80
    .line 81
    invoke-direct {v1}, Ll/hc6;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {p1, p2, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    new-instance v0, Ll/ic6;

    .line 101
    .line 102
    invoke-direct {v0, p0, p1}, Ll/ic6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Ll/u46;)V

    .line 103
    .line 104
    .line 105
    new-instance p1, Ll/jc6;

    .line 106
    .line 107
    invoke-direct {p1}, Ll/jc6;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->l:Ll/kcg0;

    .line 119
    .line 120
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->h(Landroid/view/View;)V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->h:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 39
    .line 40
    invoke-static {p0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final p(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4
    .param p2    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->C5:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-wide v2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 18
    .line 19
    double-to-long v2, v2

    .line 20
    cmp-long v0, v0, v2

    .line 21
    .line 22
    if-gez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->i:Lv/VText;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->q(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-static {}, Ll/gra;->z()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    sget v0, Ll/dbc0;->e6:I

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    sget v0, Ll/dbc0;->d6:I

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->i:Lv/VText;

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->d:Landroid/view/View;

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    :goto_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->r(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->s(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public q(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V
    .locals 5
    .param p1    # Ll/u46;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "-"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/4 v2, 0x0

    .line 40
    const/4 v3, 0x1

    .line 41
    const/4 v4, -0x1

    .line 42
    sparse-switch v1, :sswitch_data_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :sswitch_0
    const-string v1, "fake_conversation_profile_like_enter"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/4 v4, 0x5

    .line 56
    goto :goto_0

    .line 57
    :sswitch_1
    const-string v1, "fake_conversation_oof_pick"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    const/4 v4, 0x4

    .line 67
    goto :goto_0

    .line 68
    :sswitch_2
    const-string v1, "fake_conversation_profile_featured"

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_3

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    const/4 v4, 0x3

    .line 78
    goto :goto_0

    .line 79
    :sswitch_3
    const-string v1, "fake_conversation_surprise_gift_box"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_4

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    const/4 v4, 0x2

    .line 89
    goto :goto_0

    .line 90
    :sswitch_4
    const-string v1, "fake_conversation_blindbox_enter"

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_5

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_5
    move v4, v3

    .line 100
    goto :goto_0

    .line 101
    :sswitch_5
    const-string v1, "fake_conversation_oof_enter"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_6

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_6
    move v4, v2

    .line 111
    :goto_0
    const/4 v0, 0x0

    .line 112
    packed-switch v4, :pswitch_data_0

    .line 113
    .line 114
    .line 115
    goto/16 :goto_6

    .line 116
    .line 117
    :pswitch_0
    invoke-static {}, Ll/gra;->z()Z

    .line 118
    .line 119
    .line 120
    move-result p3

    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 122
    .line 123
    if-eqz p3, :cond_7

    .line 124
    .line 125
    sget p3, Ll/dbc0;->gn:I

    .line 126
    .line 127
    invoke-virtual {v0, p3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_7
    sget p3, Ll/dbc0;->fn:I

    .line 132
    .line 133
    invoke-virtual {v0, p3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 134
    .line 135
    .line 136
    :goto_1
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 137
    .line 138
    if-eqz p3, :cond_d

    .line 139
    .line 140
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 141
    .line 142
    if-eqz p3, :cond_d

    .line 143
    .line 144
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->i()Lcom/p1/mobile/android/app/Act;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 149
    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 151
    .line 152
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 153
    .line 154
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 155
    .line 156
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v0, p2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    new-instance v0, Ll/td;

    .line 163
    .line 164
    invoke-direct {v0}, Ll/td;-><init>()V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    invoke-virtual {p2, v3}, Lrx/c;->take(I)Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-interface {p1, p3, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    new-instance p2, Ll/kc6;

    .line 180
    .line 181
    invoke-direct {p2, p0}, Ll/kc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;)V

    .line 182
    .line 183
    .line 184
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 189
    .line 190
    .line 191
    goto/16 :goto_5

    .line 192
    .line 193
    :pswitch_1
    invoke-static {}, Ll/gra;->z()Z

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 198
    .line 199
    if-eqz p1, :cond_8

    .line 200
    .line 201
    sget p1, Ll/dbc0;->Jm:I

    .line 202
    .line 203
    invoke-virtual {p2, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 204
    .line 205
    .line 206
    goto :goto_2

    .line 207
    :cond_8
    sget p1, Ll/dbc0;->Im:I

    .line 208
    .line 209
    invoke-virtual {p2, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 210
    .line 211
    .line 212
    :goto_2
    if-eqz p3, :cond_d

    .line 213
    .line 214
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 215
    .line 216
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;->c(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 217
    .line 218
    .line 219
    goto/16 :goto_5

    .line 220
    .line 221
    :pswitch_2
    invoke-static {}, Ll/gra;->z()Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 226
    .line 227
    if-eqz p1, :cond_9

    .line 228
    .line 229
    sget p1, Ll/dbc0;->c6:I

    .line 230
    .line 231
    invoke-virtual {p2, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 232
    .line 233
    .line 234
    goto :goto_3

    .line 235
    :cond_9
    sget p1, Ll/dbc0;->b6:I

    .line 236
    .line 237
    invoke-virtual {p2, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 238
    .line 239
    .line 240
    :goto_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 241
    .line 242
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 243
    .line 244
    iget-object p1, p1, Ll/j7b;->b0:Ll/wyd0;

    .line 245
    .line 246
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    check-cast p1, Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 253
    .line 254
    .line 255
    move-result p2

    .line 256
    if-nez p2, :cond_d

    .line 257
    .line 258
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 259
    .line 260
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;->d(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    goto :goto_5

    .line 264
    :pswitch_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 265
    .line 266
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 267
    .line 268
    invoke-virtual {p1}, Ll/d19;->D3()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    invoke-static {}, Ll/gra;->z()Z

    .line 273
    .line 274
    .line 275
    move-result p2

    .line 276
    if-eqz p2, :cond_a

    .line 277
    .line 278
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 279
    .line 280
    sget p2, Ll/dbc0;->K5:I

    .line 281
    .line 282
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 283
    .line 284
    .line 285
    goto :goto_6

    .line 286
    :cond_a
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->icon:Ljava/lang/String;

    .line 287
    .line 288
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result p2

    .line 292
    if-eqz p2, :cond_b

    .line 293
    .line 294
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 295
    .line 296
    sget p2, Ll/dbc0;->J5:I

    .line 297
    .line 298
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 299
    .line 300
    .line 301
    goto :goto_6

    .line 302
    :cond_b
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 303
    .line 304
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 305
    .line 306
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->icon:Ljava/lang/String;

    .line 307
    .line 308
    invoke-virtual {p2, p3, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    goto :goto_6

    .line 312
    :pswitch_4
    invoke-static {}, Ll/gra;->z()Z

    .line 313
    .line 314
    .line 315
    move-result p1

    .line 316
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->a:Lv/VDraweeView;

    .line 317
    .line 318
    if-eqz p1, :cond_c

    .line 319
    .line 320
    sget p1, Ll/dbc0;->X5:I

    .line 321
    .line 322
    invoke-virtual {p2, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 323
    .line 324
    .line 325
    goto :goto_4

    .line 326
    :cond_c
    sget p1, Ll/dbc0;->W5:I

    .line 327
    .line 328
    invoke-virtual {p2, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 329
    .line 330
    .line 331
    :goto_4
    if-eqz p3, :cond_d

    .line 332
    .line 333
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 334
    .line 335
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;->c(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 336
    .line 337
    .line 338
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 339
    .line 340
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 341
    .line 342
    .line 343
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->d:Landroid/view/View;

    .line 344
    .line 345
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
    :cond_d
    :goto_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->c:Lcom/p1/mobile/putong/core/newui/messages/anim/view/FriendsMomentAvatarView;

    .line 350
    .line 351
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 352
    .line 353
    .line 354
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->d:Landroid/view/View;

    .line 355
    .line 356
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 357
    .line 358
    .line 359
    return-void

    .line 360
    nop

    .line 361
    :sswitch_data_0
    .sparse-switch
        -0x63787cb3 -> :sswitch_5
        -0x61b08eff -> :sswitch_4
        0x17db1840 -> :sswitch_3
        0x434adad6 -> :sswitch_2
        0x4f64210c -> :sswitch_1
        0x75dab8d8 -> :sswitch_0
    .end sparse-switch

    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_0
    .end packed-switch
.end method

.method public r(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 6
    .param p1    # Ll/u46;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "-"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "%s\uff1a%s"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/sj6;

    .line 14
    .line 15
    new-instance v2, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-direct {v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, v2, p1, p2}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 25
    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, v0, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    iput-object p3, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    invoke-static {}, Ll/kj6;->g()Ll/kj6;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0, p4}, Ll/kj6;->h(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 48
    .line 49
    iget-object p2, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    iget-object p4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    const-string v2, "fake_conversation_surprise_gift_box"

    .line 73
    .line 74
    const/4 v3, 0x1

    .line 75
    const/4 v4, -0x1

    .line 76
    sparse-switch v0, :sswitch_data_0

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :sswitch_0
    const-string v0, "fake_conversation_profile_like_enter"

    .line 81
    .line 82
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p4

    .line 86
    if-nez p4, :cond_1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const/4 v4, 0x5

    .line 90
    goto :goto_0

    .line 91
    :sswitch_1
    const-string v0, "fake_conversation_oof_pick"

    .line 92
    .line 93
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p4

    .line 97
    if-nez p4, :cond_2

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    const/4 v4, 0x4

    .line 101
    goto :goto_0

    .line 102
    :sswitch_2
    const-string v0, "fake_conversation_profile_featured"

    .line 103
    .line 104
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p4

    .line 108
    if-nez p4, :cond_3

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    const/4 v4, 0x3

    .line 112
    goto :goto_0

    .line 113
    :sswitch_3
    invoke-virtual {p4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    if-nez p4, :cond_4

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_4
    const/4 v4, 0x2

    .line 121
    goto :goto_0

    .line 122
    :sswitch_4
    const-string v0, "fake_conversation_blindbox_enter"

    .line 123
    .line 124
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p4

    .line 128
    if-nez p4, :cond_5

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_5
    move v4, v3

    .line 132
    goto :goto_0

    .line 133
    :sswitch_5
    const-string v0, "fake_conversation_oof_enter"

    .line 134
    .line 135
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p4

    .line 139
    if-nez p4, :cond_6

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_6
    const/4 v4, 0x0

    .line 143
    :goto_0
    const-string p4, "\uff1a"

    .line 144
    .line 145
    const-string v0, ""

    .line 146
    .line 147
    packed-switch v4, :pswitch_data_0

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :pswitch_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 152
    .line 153
    if-eqz p3, :cond_8

    .line 154
    .line 155
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 156
    .line 157
    if-nez p3, :cond_7

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->i()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 165
    .line 166
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 167
    .line 168
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 169
    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 171
    .line 172
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {p4, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 175
    .line 176
    .line 177
    move-result-object p4

    .line 178
    new-instance v0, Ll/td;

    .line 179
    .line 180
    invoke-direct {v0}, Ll/td;-><init>()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p4, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 184
    .line 185
    .line 186
    move-result-object p4

    .line 187
    invoke-virtual {p4, v3}, Lrx/c;->take(I)Lrx/c;

    .line 188
    .line 189
    .line 190
    move-result-object p4

    .line 191
    invoke-interface {p1, p3, p4}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    new-instance p3, Ll/lc6;

    .line 196
    .line 197
    invoke-direct {p3, p0, p2}, Ll/lc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 198
    .line 199
    .line 200
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_8
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 209
    .line 210
    const-string p1, "\u8d44\u6599\u70b9\u8d5e\uff1a\u8fd8\u672a\u6536\u5230\u79f0\u8d5e"

    .line 211
    .line 212
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :pswitch_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 217
    .line 218
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 219
    .line 220
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-eqz p1, :cond_9

    .line 225
    .line 226
    goto :goto_2

    .line 227
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    :goto_2
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    const-string p2, "\u6536\u5230\u7684Pick%s"

    .line 246
    .line 247
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    .line 253
    .line 254
    return-void

    .line 255
    :pswitch_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 256
    .line 257
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->getTA()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    const-string p2, "\u7cbe\u9009\u4e13\u533a\uff1a\u6765\u770b\u770b\u4eca\u65e5\u4e3a\u4f60\u63a8\u8350\u7684\u4f18\u8d28%s!"

    .line 266
    .line 267
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :pswitch_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 276
    .line 277
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 278
    .line 279
    iget-object p1, p1, Ll/j7b;->Y:Ll/byd0;

    .line 280
    .line 281
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    check-cast p1, Ljava/lang/Long;

    .line 286
    .line 287
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 288
    .line 289
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 290
    .line 291
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 292
    .line 293
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 294
    .line 295
    .line 296
    move-result-wide v0

    .line 297
    invoke-static {}, Ll/pzi0;->o()J

    .line 298
    .line 299
    .line 300
    move-result-wide v4

    .line 301
    sub-long/2addr v0, v4

    .line 302
    invoke-virtual {p3, v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->k(J)Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p3

    .line 306
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object p3

    .line 310
    const-string p4, "\u60ca\u559c\u793c\u76d2\uff1a\u5269\u4f59\u6709\u6548\u671f %s"

    .line 311
    .line 312
    invoke-static {p4, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p3

    .line 316
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 317
    .line 318
    .line 319
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 320
    .line 321
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 322
    .line 323
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 324
    .line 325
    .line 326
    new-instance p2, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 327
    .line 328
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 329
    .line 330
    .line 331
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->j:Lcom/p1/mobile/putong/core/api/c0$a;

    .line 332
    .line 333
    invoke-virtual {p2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 334
    .line 335
    .line 336
    move-result-object p2

    .line 337
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 338
    .line 339
    .line 340
    move-result-object p2

    .line 341
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 342
    .line 343
    .line 344
    move-result-object p2

    .line 345
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 346
    .line 347
    .line 348
    move-result-wide p3

    .line 349
    invoke-virtual {p2, p3, p4}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 350
    .line 351
    .line 352
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 353
    .line 354
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 355
    .line 356
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->j:Lcom/p1/mobile/putong/core/api/c0$a;

    .line 357
    .line 358
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    return-void

    .line 362
    :pswitch_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 363
    .line 364
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 365
    .line 366
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 367
    .line 368
    invoke-virtual {p1}, Ll/d19;->D3()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 369
    .line 370
    .line 371
    move-result-object p1

    .line 372
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->title:Ljava/lang/String;

    .line 373
    .line 374
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 375
    .line 376
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 377
    .line 378
    invoke-virtual {p2}, Ll/d19;->D3()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 379
    .line 380
    .line 381
    move-result-object p2

    .line 382
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->subTitle:Ljava/lang/String;

    .line 383
    .line 384
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 393
    .line 394
    .line 395
    return-void

    .line 396
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 397
    .line 398
    if-nez p3, :cond_a

    .line 399
    .line 400
    const-string p1, "\u6781\u9650\u56db\u9009\u4e00\uff1a\u4e0b\u4e00\u8f6e\u8bf7\u660e\u5929\u518d\u6765"

    .line 401
    .line 402
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 403
    .line 404
    .line 405
    return-void

    .line 406
    :cond_a
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 407
    .line 408
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    if-eqz p1, :cond_b

    .line 413
    .line 414
    goto :goto_3

    .line 415
    :cond_b
    new-instance p1, Ljava/lang/StringBuilder;

    .line 416
    .line 417
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 421
    .line 422
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    :goto_3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    move-result-object p1

    .line 433
    const-string p2, "\u6781\u9650\u56db\u9009\u4e00%s"

    .line 434
    .line 435
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 440
    .line 441
    .line 442
    return-void

    .line 443
    :sswitch_data_0
    .sparse-switch
        -0x63787cb3 -> :sswitch_5
        -0x61b08eff -> :sswitch_4
        0x17db1840 -> :sswitch_3
        0x434adad6 -> :sswitch_2
        0x4f64210c -> :sswitch_1
        0x75dab8d8 -> :sswitch_0
    .end sparse-switch

    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final s(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    sub-long/2addr v0, v2

    .line 12
    const-wide/16 v2, 0x1f4

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 20
    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 26
    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object p0, p0, Ll/dkb;->C5:Ll/byd0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/Long;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 45
    .line 46
    double-to-long p0, p0

    .line 47
    cmp-long p0, v0, p0

    .line 48
    .line 49
    if-gez p0, :cond_1

    .line 50
    .line 51
    const-string p0, "1"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const-string p0, "0"

    .line 55
    .line 56
    :goto_0
    const-string p1, "red_dot_state"

    .line 57
    .line 58
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    filled-new-array {p0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "e_subscription_content"

    .line 67
    .line 68
    const-string v0, "p_messages_view"

    .line 69
    .line 70
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    const-string p4, "fake_conversation_surprise_gift_box"

    .line 2
    .line 3
    invoke-static {p4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->g:Lv/VText;

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    cmp-long p4, p6, p2

    .line 16
    .line 17
    if-gez p4, :cond_2

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/och0;->a()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 33
    .line 34
    sub-long/2addr p6, p2

    .line 35
    invoke-virtual {p0, p6, p7}, Lcom/p1/mobile/putong/core/api/c0;->k(J)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p2, "\u60ca\u559c\u793c\u76d2\uff1a\u5269\u4f59\u6709\u6548\u671f %s"

    .line 44
    .line 45
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
