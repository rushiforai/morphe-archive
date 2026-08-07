.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;,
        Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Ll/u46;

.field public c:Ll/w30;

.field public d:Ll/w30;

.field public e:Ll/w30;

.field public f:Ll/th0;

.field public g:Ll/th0;

.field public h:Ll/th0;

.field public i:Ll/w30;

.field public final j:Ll/sj6;


# direct methods
.method public constructor <init>(Ll/sj6;)V
    .locals 1
    .param p1    # Ll/sj6;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 5
    .line 6
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 7
    .line 8
    check-cast v0, Ll/u46;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->b:Ll/u46;

    .line 11
    .line 12
    iget-boolean p1, p1, Ll/sj6;->e:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->a:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;ZLl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->n0(ZLl/pf60;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->o0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/putong/data/User;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->E0(Lcom/p1/mobile/putong/data/User;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->F0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;ZLv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->H0(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;ZLv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->t0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->I0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->z0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;",
            ">;",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 25
    .line 26
    if-ne v0, p1, :cond_1

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    :goto_1
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->q0(ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->m0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->l0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic U(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p2, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget p3, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Ll/fcp;->g(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->G0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f0(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->b:Ljava/lang/CharSequence;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-object v0
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p10}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->C0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic i(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 6

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p2, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByRelationship(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-interface {p2, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByFollowship(Lcom/p1/mobile/putong/data/User;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/4 v4, 0x0

    .line 42
    const/4 v5, 0x0

    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->following(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p2, Ll/ci6;

    .line 49
    .line 50
    invoke-direct {p2, p1}, Ll/ci6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/di6;

    .line 54
    .line 55
    invoke-direct {v0, p1}, Ll/di6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/data/Relationship;

    .line 67
    .line 68
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v0, "blocked"

    .line 72
    .line 73
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 78
    .line 79
    sget p2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 83
    .line 84
    .line 85
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 88
    .line 89
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->qe(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    new-instance v0, Ll/ei6;

    .line 94
    .line 95
    invoke-direct {v0, p1, p0}, Ll/ei6;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    new-instance p0, Ll/fi6;

    .line 99
    .line 100
    invoke-direct {p0, p1}, Ll/fi6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/y;->o3(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic k(Ll/uxj0;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->x0(Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->y0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ll/pf60;)V

    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    const v1, 0x9dcf

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "\u8bbe\u7f6e\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 21
    .line 22
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic r(Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->r0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMutedUsers()Ll/prl;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/prl;->d()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    new-instance p0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-interface {p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMutedUsers()Ll/prl;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p0, p1}, Ll/jyb;->c0(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p2, p0}, Ll/prl;->e(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic w(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->v0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->A0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->w0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->i0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->K0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->J0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/gra;->G0()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const-string p0, "\u5df2\u53d6\u6d88\u7f6e\u9876"

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final synthetic B0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p8, p9, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p8

    .line 7
    invoke-static {p8, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-string p9, "p_messages_view"

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "e_delete_option"

    .line 16
    .line 17
    invoke-static {p1, p9}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {p8, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    const-string p1, "e_top"

    .line 33
    .line 34
    invoke-static {p1, p9}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-static {p8, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    invoke-static {p8, p6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    const-string p1, "e_hide"

    .line 58
    .line 59
    invoke-static {p1, p9}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->Y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    invoke-static {p8, p7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_4

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->N0()V

    .line 75
    .line 76
    .line 77
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic D0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/data/User;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->h0(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic F0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->i:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H0(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;ZLv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    if-ge p8, p6, :cond_16

    .line 6
    .line 7
    if-gez p8, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1, p8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 18
    .line 19
    sget-object p6, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->SET_NICKNAME:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 20
    .line 21
    const-string p7, "p_messages_view"

    .line 22
    .line 23
    if-ne p1, p6, :cond_2

    .line 24
    .line 25
    const-string p1, "e_match_list_set_nickname"

    .line 26
    .line 27
    invoke-static {p1, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/SetNicknameAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    goto/16 :goto_4

    .line 54
    .line 55
    :cond_1
    const-string p1, "p_messages_view,e_match_list_set_nickname,click"

    .line 56
    .line 57
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 58
    .line 59
    invoke-static {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 60
    .line 61
    .line 62
    goto/16 :goto_4

    .line 63
    .line 64
    :cond_2
    sget-object p6, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->UN_MATCH:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 65
    .line 66
    if-eq p1, p6, :cond_14

    .line 67
    .line 68
    sget-object p6, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->SEE_UPGRADED_UN_MATCH:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 69
    .line 70
    if-eq p1, p6, :cond_14

    .line 71
    .line 72
    sget-object p6, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CRUSH_HEARTBEAT:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 73
    .line 74
    if-ne p1, p6, :cond_3

    .line 75
    .line 76
    goto/16 :goto_3

    .line 77
    .line 78
    :cond_3
    sget-object p6, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CLEAN_HISTORY:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 79
    .line 80
    if-ne p1, p6, :cond_4

    .line 81
    .line 82
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->X(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    goto/16 :goto_4

    .line 88
    .line 89
    :cond_4
    sget-object p6, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 90
    .line 91
    const-string p8, "e_delete_option"

    .line 92
    .line 93
    const-string v0, "e_platinum_receive_top_chat_delete"

    .line 94
    .line 95
    if-ne p1, p6, :cond_7

    .line 96
    .line 97
    if-eqz p5, :cond_5

    .line 98
    .line 99
    invoke-static {v0, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_5
    invoke-static {p8, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :goto_0
    invoke-static {}, Ll/gra;->o()Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_6

    .line 111
    .line 112
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    goto/16 :goto_4

    .line 118
    .line 119
    :cond_6
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    goto/16 :goto_4

    .line 125
    .line 126
    :cond_7
    sget-object p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->NORMAL_REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 127
    .line 128
    if-ne p1, p3, :cond_9

    .line 129
    .line 130
    if-eqz p5, :cond_8

    .line 131
    .line 132
    invoke-static {v0, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_8
    invoke-static {p8, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :goto_1
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    goto/16 :goto_4

    .line 145
    .line 146
    :cond_9
    sget-object p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->JUMP_PROFILE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 147
    .line 148
    if-ne p1, p3, :cond_b

    .line 149
    .line 150
    const-string p1, "conversation"

    .line 151
    .line 152
    invoke-static {p2, p4, p7, p1}, Ll/br5;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-eqz p1, :cond_a

    .line 157
    .line 158
    goto/16 :goto_4

    .line 159
    .line 160
    :cond_a
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 161
    .line 162
    const-string p3, "conversation_view"

    .line 163
    .line 164
    const/4 p4, 0x0

    .line 165
    invoke-static {p2, p1, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 170
    .line 171
    .line 172
    goto/16 :goto_4

    .line 173
    .line 174
    :cond_b
    sget-object p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->HEARTBEAT_TEST:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 175
    .line 176
    if-ne p1, p3, :cond_c

    .line 177
    .line 178
    invoke-static {p4}, Ll/dg6;->w(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 179
    .line 180
    .line 181
    goto :goto_4

    .line 182
    :cond_c
    sget-object p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->HEARTBEAT_LIMIT_TEST:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 183
    .line 184
    if-ne p1, p3, :cond_d

    .line 185
    .line 186
    invoke-static {p4}, Ll/dg6;->x(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 187
    .line 188
    .line 189
    goto :goto_4

    .line 190
    :cond_d
    sget-object p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->REPORT:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 191
    .line 192
    if-ne p1, p3, :cond_e

    .line 193
    .line 194
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 195
    .line 196
    new-instance p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$1;

    .line 197
    .line 198
    const/4 p4, 0x0

    .line 199
    invoke-direct {p3, p0, p4, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$1;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/os/Handler;Lcom/p1/mobile/android/app/Act;)V

    .line 200
    .line 201
    .line 202
    const/4 p4, 0x1

    .line 203
    invoke-static {p2, p1, p4, p3}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->b2(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 208
    .line 209
    .line 210
    goto :goto_4

    .line 211
    :cond_e
    sget-object p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->DISMISS:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 212
    .line 213
    if-ne p1, p3, :cond_10

    .line 214
    .line 215
    if-eqz p5, :cond_f

    .line 216
    .line 217
    const-string p1, "e_platinum_receive_top_chat_hide"

    .line 218
    .line 219
    invoke-static {p1, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_f
    const-string p1, "e_hide"

    .line 224
    .line 225
    invoke-static {p1, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    :goto_2
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->Y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    goto :goto_4

    .line 234
    :cond_10
    sget-object p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CANCEL_TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 235
    .line 236
    if-ne p1, p3, :cond_12

    .line 237
    .line 238
    if-eqz p5, :cond_11

    .line 239
    .line 240
    const-string p1, "e_platinum_receive_top_chat_cancel"

    .line 241
    .line 242
    invoke-static {p1, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    :cond_11
    invoke-virtual {p0, p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 246
    .line 247
    .line 248
    goto :goto_4

    .line 249
    :cond_12
    sget-object p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 250
    .line 251
    if-ne p1, p3, :cond_13

    .line 252
    .line 253
    const-string p1, "e_top"

    .line 254
    .line 255
    invoke-static {p1, p7}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 259
    .line 260
    .line 261
    goto :goto_4

    .line 262
    :cond_13
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->FILTER_REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 263
    .line 264
    if-ne p1, p2, :cond_15

    .line 265
    .line 266
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->N0()V

    .line 267
    .line 268
    .line 269
    goto :goto_4

    .line 270
    :cond_14
    :goto_3
    iget-object p3, p4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->b0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 273
    .line 274
    .line 275
    :cond_15
    :goto_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->i:Ll/w30;

    .line 276
    .line 277
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 278
    .line 279
    .line 280
    :cond_16
    :goto_5
    return-void
.end method

.method public final synthetic I0(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->i0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->K0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->J0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/gra;->G0()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const-string p0, "\u5df2\u7f6e\u9876"

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final J0()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->u1:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final K0()V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->B2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final L0()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->Z:Lrx/subjects/a;

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final N0()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p0, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/g;->xo(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/jh6;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/jh6;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/kh6;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/kh6;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public final O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, p2, v1}, Lcom/p1/mobile/putong/core/api/g;->vo(Ljava/lang/String;I)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/vi6;

    .line 17
    .line 18
    invoke-direct {p2, p0}, Ll/vi6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ll/wi6;

    .line 22
    .line 23
    invoke-direct {p0}, Ll/wi6;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final X(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/core/R$string;->jk:I

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/w30$b;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    new-instance v3, Ll/mh6;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Ll/mh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v2, Ll/nh6;

    .line 51
    .line 52
    invoke-direct {v2, p0, p1, p2}, Ll/nh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->e:Ll/w30;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final Y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "e_hide_alert"

    .line 5
    .line 6
    const-string v1, "p_messages_view"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/th0$a;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    sget v1, Lcom/p1/mobile/putong/core/R$string;->J7:I

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Lcom/p1/mobile/putong/core/R$string;->K7:I

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ki:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget v2, Lcom/p1/mobile/putong/core/R$string;->uj:I

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/dh6;

    .line 70
    .line 71
    invoke-direct {v1, p0, p1, p2}, Ll/dh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance p2, Ll/eh6;

    .line 79
    .line 80
    invoke-direct {p2, p0}, Ll/eh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ll/th0$a;->a()Ll/th0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->h:Ll/th0;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "e_delete_confirmation"

    .line 5
    .line 6
    const-string v1, "p_messages_view"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/th0$a;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Lcom/p1/mobile/putong/core/R$string;->P3:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, v1}, Ll/th0$a;->t(Z)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Lcom/p1/mobile/putong/core/R$string;->vj:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ki:I

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget v2, Lcom/p1/mobile/putong/core/R$string;->uj:I

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/sh6;

    .line 83
    .line 84
    invoke-direct {v1, p0, p1, p2}, Ll/sh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance p2, Ll/th6;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Ll/th6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Ll/th0$a;->a()Ll/th0;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->g:Ll/th0;

    .line 105
    .line 106
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "e_delete_confirmation"

    .line 5
    .line 6
    const-string v1, "p_messages_view"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/th0$a;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Lcom/p1/mobile/putong/core/R$string;->P3:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, v1}, Ll/th0$a;->t(Z)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Lcom/p1/mobile/putong/core/R$string;->vj:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ki:I

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget v2, Lcom/p1/mobile/putong/core/R$string;->uj:I

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/ti6;

    .line 83
    .line 84
    invoke-direct {v1, p0, p1, p2}, Ll/ti6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance p2, Ll/ui6;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Ll/ui6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Ll/th0$a;->a()Ll/th0;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->f:Ll/th0;

    .line 105
    .line 106
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final b0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 5
    .line 6
    iget-object v6, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 7
    .line 8
    new-instance v5, Ll/oh6;

    .line 9
    .line 10
    invoke-direct {v5, p2, p1}, Ll/oh6;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/ph6;

    .line 14
    .line 15
    move-object v2, p0

    .line 16
    move-object v3, p1

    .line 17
    move-object v7, p2

    .line 18
    move-object v4, p3

    .line 19
    invoke-direct/range {v1 .. v7}, Ll/ph6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 25
    .line 26
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/core/api/g;->Mg(Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    invoke-virtual {p1, v7}, Lcom/p1/mobile/putong/core/api/g;->Jg(Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance p2, Ll/qh6;

    .line 39
    .line 40
    invoke-direct {p2}, Ll/qh6;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {p0, p1, p2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v3, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final c0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isPlatinumTop()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e2:Ll/pla;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, p2, v1}, Ll/pla;->w3(Ljava/lang/String;Z)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/fh6;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Ll/fh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/gh6;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/gh6;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 57
    .line 58
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    const/4 v1, -0x1

    .line 61
    invoke-virtual {v0, p2, v1}, Lcom/p1/mobile/putong/core/api/g;->vo(Ljava/lang/String;I)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance p2, Ll/hh6;

    .line 70
    .line 71
    invoke-direct {p2, p0}, Ll/hh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 72
    .line 73
    .line 74
    new-instance p0, Ll/ih6;

    .line 75
    .line 76
    invoke-direct {p0}, Ll/ih6;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public d0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w30;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->e:Ll/w30;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->e:Ll/w30;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/w30;->d()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->e:Ll/w30;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->d:Ll/w30;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->d:Ll/w30;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/w30;->d()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->d:Ll/w30;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public final e0()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 2
    .line 3
    iget v0, v0, Ll/sj6;->g:I

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->b:Ll/u46;

    .line 11
    .line 12
    invoke-interface {v2}, Ll/u46;->h()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->b:Ll/u46;

    .line 17
    .line 18
    invoke-interface {v3}, Ll/u46;->k()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    sub-int/2addr v2, v3

    .line 27
    if-lez v2, :cond_0

    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    sub-int/2addr v0, v2

    .line 32
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    :goto_0
    const-string v0, "/"

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->b:Ll/u46;

    .line 47
    .line 48
    invoke-interface {v0}, Ll/u46;->k()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->b:Ll/u46;

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    invoke-interface {p0}, Ll/u46;->k()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    invoke-interface {p0}, Ll/u46;->h()I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method

.method public final g0()Z
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->y:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 14
    .line 15
    iget-object v5, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v4, v0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Bq:I

    .line 25
    .line 26
    invoke-virtual {v4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Cq:I

    .line 31
    .line 32
    invoke-virtual {v4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    sget v1, Lcom/p1/mobile/putong/core/R$string;->I7:I

    .line 37
    .line 38
    invoke-virtual {v4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    sget v1, Lcom/p1/mobile/putong/core/R$string;->z6:I

    .line 43
    .line 44
    invoke-virtual {v4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->FILTER_REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 49
    .line 50
    iget-object v9, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->explain:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Conversation;->isTop()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const-string v2, "p_messages_view"

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    const-string v1, "e_top"

    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object v1, v5, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 79
    .line 80
    const-string v10, "removed"

    .line 81
    .line 82
    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_2

    .line 87
    .line 88
    iget-object v1, v5, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 89
    .line 90
    const-string v10, "invisible"

    .line 91
    .line 92
    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_3

    .line 97
    .line 98
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :cond_3
    const-string v1, "e_delete_option"

    .line 105
    .line 106
    invoke-static {v1, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    const-string v1, "e_hide"

    .line 110
    .line 111
    invoke-static {v1, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    new-instance v10, Ll/w30$b;

    .line 115
    .line 116
    invoke-direct {v10, v4}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v10, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    new-instance v2, Ll/bh6;

    .line 134
    .line 135
    invoke-direct {v2, p0}, Ll/bh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 143
    .line 144
    .line 145
    move-result-object v11

    .line 146
    new-instance v1, Ll/ch6;

    .line 147
    .line 148
    move-object v2, p0

    .line 149
    invoke-direct/range {v1 .. v9}, Ll/ch6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v11, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v10}, Ll/w30$b;->F()Ll/w30;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    iput-object p0, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 162
    .line 163
    .line 164
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    xor-int/lit8 p0, p0, 0x1

    .line 169
    .line 170
    return p0
.end method

.method public final h0(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/r8n;->h:Ll/xyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/HashSet;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v1, v1, Ll/r8n;->h:Ll/xyd0;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/r8n;->r(Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    new-instance v1, Ll/rh6;

    .line 40
    .line 41
    invoke-direct {v1, p1}, Ll/rh6;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 42
    .line 43
    .line 44
    const-string v2, "special_user_relationship"

    .line 45
    .line 46
    const/4 v3, -0x1

    .line 47
    invoke-virtual {v0, v2, v3, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/a0;->w(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 60
    .line 61
    iget-object p1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->n6()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->a:Z

    .line 75
    .line 76
    if-eqz p1, :cond_0

    .line 77
    .line 78
    const-string p1, "matchList"

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    const-string p1, "chatList"

    .line 82
    .line 83
    :goto_0
    const-string v0, "show_where"

    .line 84
    .line 85
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 90
    .line 91
    iget-object v0, v0, Ll/sj6;->i:Ljava/lang/String;

    .line 92
    .line 93
    const-string v1, "request_show_type"

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v1, "show_position"

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->e0()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string v1, "chat_request_operate"

    .line 110
    .line 111
    const-string v2, "ignore"

    .line 112
    .line 113
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    filled-new-array {p1, v0, p0, v1}, [Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    const-string p1, "e_chat_request_operate"

    .line 122
    .line 123
    const-string v0, "p_messages_view"

    .line 124
    .line 125
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final i0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->b:Ll/u46;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public j0()Z
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 2
    .line 3
    iget-object v6, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v4, v0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {v6}, Ll/ue6;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v8, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v8

    .line 15
    :cond_0
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    return v8

    .line 22
    :cond_1
    iget-object v0, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "fake_conversation_city_centre_enter"

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    return v8

    .line 33
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 34
    .line 35
    iget-object v0, v0, Ll/sj6;->y:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1e

    .line 42
    .line 43
    const-string v1, "lovescript"

    .line 44
    .line 45
    iget-object v2, v6, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    goto/16 :goto_4

    .line 54
    .line 55
    :cond_3
    iget-object v1, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    const-string v2, "fake_conversation_anonymous_greeting"

    .line 58
    .line 59
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    return v8

    .line 66
    :cond_4
    invoke-static {v6}, Ll/br5;->m(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    return v8

    .line 73
    :cond_5
    invoke-static {}, Ll/gra;->V1()Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_6

    .line 78
    .line 79
    invoke-static {v6}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_6

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->g0()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    return p0

    .line 90
    :cond_6
    iget-object v1, v6, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 91
    .line 92
    const-string v2, "conversation_intl_fake"

    .line 93
    .line 94
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_7

    .line 99
    .line 100
    return v8

    .line 101
    :cond_7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 104
    .line 105
    iget-object v2, v6, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    const/4 v2, 0x0

    .line 116
    if-eqz v1, :cond_1d

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 119
    .line 120
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 121
    .line 122
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_8

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j:Ll/sj6;

    .line 129
    .line 130
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 131
    .line 132
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 133
    .line 134
    const-string v3, "intlSeeChatRequest"

    .line 135
    .line 136
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_8

    .line 141
    .line 142
    sget v0, Lcom/p1/mobile/putong/core/R$string;->J1:I

    .line 143
    .line 144
    invoke-virtual {v4, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-array v1, v8, [Ljava/lang/CharSequence;

    .line 149
    .line 150
    aput-object v0, v1, v2

    .line 151
    .line 152
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/w30$b;

    .line 157
    .line 158
    invoke-direct {v1, v4}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 166
    .line 167
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    new-instance v3, Ll/ah6;

    .line 176
    .line 177
    invoke-direct {v3, p0}, Ll/ah6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-virtual {v2, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    new-instance v2, Ll/lh6;

    .line 189
    .line 190
    invoke-direct {v2, p0, v5}, Ll/lh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/putong/data/User;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 201
    .line 202
    invoke-virtual {v0}, Ll/w30;->f()V

    .line 203
    .line 204
    .line 205
    return v8

    .line 206
    :cond_8
    invoke-static {}, Ll/fcp;->y()Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-eqz v1, :cond_9

    .line 211
    .line 212
    iget-object v1, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 213
    .line 214
    invoke-static {v1}, Ll/fcp;->p(Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    if-eqz v1, :cond_9

    .line 219
    .line 220
    sget v0, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 221
    .line 222
    invoke-virtual {v4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    new-array v1, v8, [Ljava/lang/CharSequence;

    .line 227
    .line 228
    aput-object v0, v1, v2

    .line 229
    .line 230
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    new-instance v1, Ll/w30$b;

    .line 235
    .line 236
    invoke-direct {v1, v4}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 244
    .line 245
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    new-instance v3, Ll/wh6;

    .line 254
    .line 255
    invoke-direct {v3, p0}, Ll/wh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-virtual {v2, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    new-instance v2, Ll/hi6;

    .line 267
    .line 268
    invoke-direct {v2, v4, v6}, Ll/hi6;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->c:Ll/w30;

    .line 279
    .line 280
    invoke-virtual {v0}, Ll/w30;->f()V

    .line 281
    .line 282
    .line 283
    return v8

    .line 284
    :cond_9
    sget v1, Lcom/p1/mobile/putong/core/R$string;->mk:I

    .line 285
    .line 286
    invoke-virtual {v4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Fq:I

    .line 291
    .line 292
    invoke-virtual {v4, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v3

    .line 296
    invoke-static {v4, v3}, Ll/e1b;->S0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    sget v7, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 301
    .line 302
    invoke-virtual {v4, v7}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    sget v7, Lcom/p1/mobile/putong/core/R$string;->y3:I

    .line 306
    .line 307
    invoke-virtual {v4, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v7

    .line 311
    sget v9, Lcom/p1/mobile/putong/core/R$string;->r1:I

    .line 312
    .line 313
    invoke-virtual {v4, v9}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v9

    .line 317
    sget v10, Lcom/p1/mobile/putong/core/R$string;->jk:I

    .line 318
    .line 319
    invoke-virtual {v4, v10}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v10

    .line 323
    sget v11, Lcom/p1/mobile/putong/core/R$string;->Bq:I

    .line 324
    .line 325
    invoke-virtual {v4, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    sget v11, Lcom/p1/mobile/putong/core/R$string;->Cq:I

    .line 329
    .line 330
    invoke-virtual {v4, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    sget v11, Lcom/p1/mobile/putong/core/R$string;->I7:I

    .line 334
    .line 335
    invoke-virtual {v4, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    sget-object v11, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->SET_NICKNAME:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 339
    .line 340
    invoke-static {v11, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    sget-object v12, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->UN_MATCH:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 345
    .line 346
    invoke-static {v12, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    sget-object v13, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CLEAN_HISTORY:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 351
    .line 352
    invoke-static {v13, v10}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 353
    .line 354
    .line 355
    move-result-object v10

    .line 356
    filled-new-array {v3, v1, v10}, [Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 361
    .line 362
    .line 363
    move-result-object v3

    .line 364
    const-string v1, "e_match_list_set_nickname"

    .line 365
    .line 366
    const-string v10, "p_messages_view"

    .line 367
    .line 368
    invoke-static {v1, v10}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 372
    .line 373
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 374
    .line 375
    iget-object v14, v6, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 376
    .line 377
    invoke-virtual {v1, v14}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 382
    .line 383
    .line 384
    move-result v1

    .line 385
    if-eqz v1, :cond_a

    .line 386
    .line 387
    iget-object v1, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 388
    .line 389
    invoke-static {v3, v12}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 390
    .line 391
    .line 392
    invoke-static {v3, v11}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 393
    .line 394
    .line 395
    goto :goto_0

    .line 396
    :cond_a
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->JUMP_PROFILE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 397
    .line 398
    invoke-static {v1, v7}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    invoke-virtual {v3, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    if-nez v1, :cond_b

    .line 410
    .line 411
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->REPORT:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 412
    .line 413
    invoke-static {v1, v9}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 418
    .line 419
    .line 420
    :cond_b
    :goto_0
    iget-object v1, v6, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 421
    .line 422
    const-string v7, "marriage"

    .line 423
    .line 424
    invoke-static {v1, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 425
    .line 426
    .line 427
    move-result v1

    .line 428
    if-eqz v1, :cond_c

    .line 429
    .line 430
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 431
    .line 432
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 433
    .line 434
    .line 435
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CANCEL_TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 436
    .line 437
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 438
    .line 439
    .line 440
    :cond_c
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 441
    .line 442
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 443
    .line 444
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 445
    .line 446
    invoke-virtual {v1, v7}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 447
    .line 448
    .line 449
    move-result-object v1

    .line 450
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 451
    .line 452
    .line 453
    move-result v1

    .line 454
    if-eqz v1, :cond_d

    .line 455
    .line 456
    invoke-static {v3, v13}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 457
    .line 458
    .line 459
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->DISMISS:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 460
    .line 461
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 462
    .line 463
    .line 464
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->NORMAL_REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 465
    .line 466
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 467
    .line 468
    .line 469
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 470
    .line 471
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 472
    .line 473
    .line 474
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CANCEL_TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 475
    .line 476
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 477
    .line 478
    .line 479
    :cond_d
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 480
    .line 481
    .line 482
    move-result v1

    .line 483
    if-eqz v1, :cond_e

    .line 484
    .line 485
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Conversation;->isSeeUpgradedConv()Z

    .line 486
    .line 487
    .line 488
    move-result v1

    .line 489
    if-eqz v1, :cond_e

    .line 490
    .line 491
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->NORMAL_REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 492
    .line 493
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 494
    .line 495
    .line 496
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 497
    .line 498
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 499
    .line 500
    .line 501
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CANCEL_TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 502
    .line 503
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 504
    .line 505
    .line 506
    :cond_e
    invoke-static {v6, v5}, Ll/br5;->o(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z

    .line 507
    .line 508
    .line 509
    move-result v1

    .line 510
    if-eqz v1, :cond_f

    .line 511
    .line 512
    invoke-static {v3, v13}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 513
    .line 514
    .line 515
    :cond_f
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    .line 516
    .line 517
    .line 518
    move-result v1

    .line 519
    if-eqz v1, :cond_10

    .line 520
    .line 521
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->JUMP_PROFILE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 522
    .line 523
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 524
    .line 525
    .line 526
    :cond_10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 527
    .line 528
    .line 529
    move-result-object v1

    .line 530
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    if-eqz v1, :cond_11

    .line 539
    .line 540
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Conversation;->isPlatinumTop()Z

    .line 541
    .line 542
    .line 543
    move-result v1

    .line 544
    if-eqz v1, :cond_11

    .line 545
    .line 546
    move v7, v8

    .line 547
    goto :goto_1

    .line 548
    :cond_11
    move v7, v2

    .line 549
    :goto_1
    if-eqz v7, :cond_12

    .line 550
    .line 551
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 552
    .line 553
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 554
    .line 555
    .line 556
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CANCEL_TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 557
    .line 558
    const-string v9, "\u53d6\u6d88\u7f6e\u9876"

    .line 559
    .line 560
    invoke-static {v1, v9}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 561
    .line 562
    .line 563
    move-result-object v1

    .line 564
    invoke-virtual {v3, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 565
    .line 566
    .line 567
    :cond_12
    if-nez v0, :cond_13

    .line 568
    .line 569
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->DISMISS:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 570
    .line 571
    invoke-static {v3, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 572
    .line 573
    .line 574
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->NORMAL_REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 575
    .line 576
    invoke-static {v3, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 577
    .line 578
    .line 579
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 580
    .line 581
    invoke-static {v3, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 582
    .line 583
    .line 584
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CANCEL_TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 585
    .line 586
    invoke-static {v3, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->M0(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;)V

    .line 587
    .line 588
    .line 589
    :cond_13
    iget-object v0, v6, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 590
    .line 591
    const-string v1, "removed"

    .line 592
    .line 593
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 594
    .line 595
    .line 596
    move-result v0

    .line 597
    if-nez v0, :cond_14

    .line 598
    .line 599
    iget-object v0, v6, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 600
    .line 601
    const-string v1, "invisible"

    .line 602
    .line 603
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 604
    .line 605
    .line 606
    move-result v0

    .line 607
    if-eqz v0, :cond_15

    .line 608
    .line 609
    :cond_14
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 610
    .line 611
    .line 612
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->FILTER_REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 613
    .line 614
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->explain:Ljava/lang/String;

    .line 615
    .line 616
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 617
    .line 618
    .line 619
    move-result-object v0

    .line 620
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 621
    .line 622
    .line 623
    :cond_15
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 624
    .line 625
    const-string v1, ""

    .line 626
    .line 627
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 628
    .line 629
    .line 630
    move-result-object v0

    .line 631
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 632
    .line 633
    .line 634
    move-result v0

    .line 635
    if-nez v0, :cond_16

    .line 636
    .line 637
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->NORMAL_REMOVE:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 638
    .line 639
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 640
    .line 641
    .line 642
    move-result-object v0

    .line 643
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 644
    .line 645
    .line 646
    move-result v0

    .line 647
    if-eqz v0, :cond_18

    .line 648
    .line 649
    :cond_16
    if-eqz v7, :cond_17

    .line 650
    .line 651
    const-string v0, "e_platinum_receive_top_chat_delete"

    .line 652
    .line 653
    invoke-static {v0, v10}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    .line 655
    .line 656
    goto :goto_2

    .line 657
    :cond_17
    const-string v0, "e_delete_option"

    .line 658
    .line 659
    invoke-static {v0, v10}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 660
    .line 661
    .line 662
    :cond_18
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 663
    .line 664
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 665
    .line 666
    .line 667
    move-result-object v0

    .line 668
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 669
    .line 670
    .line 671
    move-result v0

    .line 672
    if-eqz v0, :cond_19

    .line 673
    .line 674
    const-string v0, "e_top"

    .line 675
    .line 676
    invoke-static {v0, v10}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    :cond_19
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->CANCEL_TOP:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 680
    .line 681
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 682
    .line 683
    .line 684
    move-result-object v0

    .line 685
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 686
    .line 687
    .line 688
    move-result v0

    .line 689
    if-eqz v0, :cond_1a

    .line 690
    .line 691
    if-eqz v7, :cond_1a

    .line 692
    .line 693
    const-string v0, "e_platinum_receive_top_chat_cancel"

    .line 694
    .line 695
    invoke-static {v0, v10}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    .line 697
    .line 698
    :cond_1a
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->DISMISS:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 699
    .line 700
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$a;

    .line 701
    .line 702
    .line 703
    move-result-object v0

    .line 704
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 705
    .line 706
    .line 707
    move-result v0

    .line 708
    if-eqz v0, :cond_1c

    .line 709
    .line 710
    if-eqz v7, :cond_1b

    .line 711
    .line 712
    const-string v0, "e_platinum_receive_top_chat_hide"

    .line 713
    .line 714
    invoke-static {v0, v10}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 715
    .line 716
    .line 717
    goto :goto_3

    .line 718
    :cond_1b
    const-string v0, "e_hide"

    .line 719
    .line 720
    invoke-static {v0, v10}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 721
    .line 722
    .line 723
    :cond_1c
    :goto_3
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->f0(Ljava/util/List;)Ljava/util/List;

    .line 724
    .line 725
    .line 726
    move-result-object v0

    .line 727
    new-instance v1, Ll/w30$b;

    .line 728
    .line 729
    invoke-direct {v1, v4}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 730
    .line 731
    .line 732
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 733
    .line 734
    .line 735
    move-result-object v2

    .line 736
    sget v9, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 737
    .line 738
    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 739
    .line 740
    .line 741
    move-result-object v2

    .line 742
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 743
    .line 744
    .line 745
    move-result-object v1

    .line 746
    new-instance v2, Ll/ri6;

    .line 747
    .line 748
    invoke-direct {v2, p0}, Ll/ri6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 749
    .line 750
    .line 751
    invoke-virtual {v1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 752
    .line 753
    .line 754
    move-result-object v1

    .line 755
    invoke-virtual {v1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 756
    .line 757
    .line 758
    move-result-object v0

    .line 759
    const/4 v1, 0x3

    .line 760
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 761
    .line 762
    .line 763
    move-result-object v1

    .line 764
    invoke-virtual {v0, v1}, Ll/w30$b;->P(Landroid/graphics/Typeface;)Ll/w30$b;

    .line 765
    .line 766
    .line 767
    move-result-object v0

    .line 768
    new-instance v1, Ll/si6;

    .line 769
    .line 770
    move-object v2, p0

    .line 771
    invoke-direct/range {v1 .. v7}, Ll/si6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Z)V

    .line 772
    .line 773
    .line 774
    invoke-virtual {v0, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 775
    .line 776
    .line 777
    move-result-object p0

    .line 778
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 779
    .line 780
    .line 781
    move-result-object p0

    .line 782
    iput-object p0, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->i:Ll/w30;

    .line 783
    .line 784
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 785
    .line 786
    .line 787
    return v8

    .line 788
    :cond_1d
    return v2

    .line 789
    :cond_1e
    :goto_4
    return v8
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->e:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->J0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    sget p3, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    const/4 p4, 0x1

    .line 4
    invoke-virtual {p1, p3, p4}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/api/g;->xn(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance p3, Ll/uh6;

    .line 16
    .line 17
    invoke-direct {p3, p0}, Ll/uh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 18
    .line 19
    .line 20
    new-instance p4, Ll/vh6;

    .line 21
    .line 22
    invoke-direct {p4, p1}, Ll/vh6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    new-instance p5, Ll/xh6;

    .line 26
    .line 27
    invoke-direct {p5, p1}, Ll/xh6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p3, p4, p5}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->e:Ll/w30;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic n0(ZLl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->J0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->K0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->L0()V

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    long-to-double p1, p1

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    sget p3, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    const-string p3, "click_area_msg"

    .line 8
    .line 9
    const-string v0, "1"

    .line 10
    .line 11
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    filled-new-array {p3}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    const-string v0, "e_hide_alert"

    .line 20
    .line 21
    const-string v1, "p_messages_view"

    .line 22
    .line 23
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/gra;->o()Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    invoke-virtual {v0, p2, p3}, Lcom/p1/mobile/putong/core/api/g;->uo(Ljava/lang/String;Z)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/oi6;

    .line 43
    .line 44
    invoke-direct {v0, p0, p3}, Ll/oi6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Z)V

    .line 45
    .line 46
    .line 47
    new-instance p3, Ll/pi6;

    .line 48
    .line 49
    invoke-direct {p3, p1}, Ll/pi6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/qi6;

    .line 53
    .line 54
    invoke-direct {v1, p1}, Ll/qi6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, p3, v1}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->h:Ll/th0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic p0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->h:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    const-string p0, "click_area_msg"

    .line 7
    .line 8
    const-string p1, "0"

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "e_hide_alert"

    .line 19
    .line 20
    const-string v0, "p_messages_view"

    .line 21
    .line 22
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic q0(ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->J0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->K0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->L0()V

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    long-to-double p1, p1

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    sget p3, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    const-string p3, "click_area_msg"

    .line 8
    .line 9
    const-string v0, "1"

    .line 10
    .line 11
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    filled-new-array {p3}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    const-string v0, "e_delete_confirmation"

    .line 20
    .line 21
    const-string v1, "p_messages_view"

    .line 22
    .line 23
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/gra;->o()Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    invoke-virtual {v0, p2, p3}, Lcom/p1/mobile/putong/core/api/g;->wo(Ljava/lang/String;Z)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/li6;

    .line 43
    .line 44
    invoke-direct {v0, p0, p3}, Ll/li6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Z)V

    .line 45
    .line 46
    .line 47
    new-instance p3, Ll/mi6;

    .line 48
    .line 49
    invoke-direct {p3, p1}, Ll/mi6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/ni6;

    .line 53
    .line 54
    invoke-direct {v1, p1}, Ll/ni6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, p3, v1}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->g:Ll/th0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic s0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->g:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    const-string p0, "click_area_msg"

    .line 7
    .line 8
    const-string p1, "0"

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "e_delete_confirmation"

    .line 19
    .line 20
    const-string v0, "p_messages_view"

    .line 21
    .line 22
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    sget p3, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    const-string p3, "click_area_msg"

    .line 8
    .line 9
    const-string v0, "1"

    .line 10
    .line 11
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    filled-new-array {p3}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    const-string v0, "e_delete_confirmation"

    .line 20
    .line 21
    const-string v1, "p_messages_view"

    .line 22
    .line 23
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 29
    .line 30
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/api/g;->xn(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/api/g;->Tf(Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/gi6;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/gi6;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {p3, p2, v0}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    new-instance p3, Ll/ii6;

    .line 52
    .line 53
    invoke-direct {p3, p0}, Ll/ii6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Ll/ji6;

    .line 57
    .line 58
    invoke-direct {v0, p1}, Ll/ji6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 59
    .line 60
    .line 61
    new-instance v1, Ll/ki6;

    .line 62
    .line 63
    invoke-direct {v1, p1}, Ll/ki6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p3, v0, v1}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->f:Ll/th0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic u0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->f:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    const-string p0, "click_area_msg"

    .line 7
    .line 8
    const-string p1, "0"

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "e_delete_confirmation"

    .line 19
    .line 20
    const-string v0, "p_messages_view"

    .line 21
    .line 22
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic v0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->J0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic x0(Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    iget-object p5, p6, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p5

    .line 7
    invoke-virtual {p5}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p6

    .line 11
    invoke-interface {p1, p6}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const-string p6, ""

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    const-string p1, "receiver_user_id"

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->a:Z

    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    const-string p2, "message_allmatch"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p2, "message_chat"

    .line 38
    .line 39
    :goto_0
    const-string p7, "source_type"

    .line 40
    .line 41
    invoke-static {p7, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const-string p7, "cancel_item"

    .line 46
    .line 47
    invoke-virtual {p5}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {p7, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p7

    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 58
    .line 59
    invoke-virtual {v0, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 72
    .line 73
    invoke-virtual {v0, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->matchFromForTrack()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    goto :goto_1

    .line 82
    :cond_1
    move-object p3, p6

    .line 83
    :goto_1
    const-string v0, "matchfrom"

    .line 84
    .line 85
    invoke-static {v0, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    filled-new-array {p1, p2, p7, p3}, [Ll/sfj0$a;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const-string p2, "e_cancelmatch"

    .line 94
    .line 95
    const-string p3, "p_messages_view"

    .line 96
    .line 97
    invoke-static {p2, p3, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    invoke-virtual {p5}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Qq:I

    .line 105
    .line 106
    invoke-virtual {p4, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    if-eqz p2, :cond_3

    .line 115
    .line 116
    const-string p6, "dont_talk"

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_3
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Uq:I

    .line 120
    .line 121
    invoke-virtual {p4, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-eqz p2, :cond_4

    .line 130
    .line 131
    const-string p6, "spam"

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_4
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Tq:I

    .line 135
    .line 136
    invoke-virtual {p4, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    if-eqz p2, :cond_5

    .line 145
    .line 146
    const-string p6, "harassment"

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_5
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Sq:I

    .line 150
    .line 151
    invoke-virtual {p4, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    if-eqz p2, :cond_6

    .line 160
    .line 161
    const-string p6, "fake_profile"

    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_6
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Rq:I

    .line 165
    .line 166
    invoke-virtual {p4, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    if-eqz p2, :cond_7

    .line 175
    .line 176
    const-string p6, "dont_want_to_tell_you"

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_7
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Vq:I

    .line 180
    .line 181
    invoke-virtual {p4, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_8

    .line 190
    .line 191
    const-string p6, "swiped_wrong"

    .line 192
    .line 193
    :cond_8
    :goto_2
    const-string p1, "unmatch_reason"

    .line 194
    .line 195
    invoke-static {p1, p6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    const-string p2, "e_chat_unmatch"

    .line 204
    .line 205
    const-string p3, "p_unmatch_dialog"

    .line 206
    .line 207
    invoke-static {p2, p3, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->d:Ll/w30;

    .line 211
    .line 212
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ll/pf60;)V
    .locals 7

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p6, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Uq:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Tq:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Qq:I

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p6, p6, Ll/pf60;->b:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p6, Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result p6

    .line 52
    if-nez p6, :cond_1

    .line 53
    .line 54
    sget p6, Lcom/p1/mobile/putong/core/R$string;->Vq:I

    .line 55
    .line 56
    invoke-virtual {p1, p6}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p6

    .line 60
    invoke-virtual {v1, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_1
    sget p6, Lcom/p1/mobile/putong/core/R$string;->Sq:I

    .line 64
    .line 65
    invoke-virtual {p1, p6}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p6

    .line 69
    invoke-virtual {v1, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    sget p6, Lcom/p1/mobile/putong/core/R$string;->Rq:I

    .line 73
    .line 74
    invoke-virtual {p1, p6}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p6

    .line 78
    invoke-virtual {v1, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    const-class p6, Lcom/p1/mobile/android/app/Dialog;

    .line 82
    .line 83
    invoke-virtual {p6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p6

    .line 87
    const-string v0, "p_unmatch_dialog"

    .line 88
    .line 89
    invoke-static {v0, p6}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 90
    .line 91
    .line 92
    move-result-object p6

    .line 93
    new-instance v2, Lorg/json/JSONObject;

    .line 94
    .line 95
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 96
    .line 97
    .line 98
    :try_start_0
    const-string v0, "tooltips_trigger_mode"

    .line 99
    .line 100
    const-string v3, "active"

    .line 101
    .line 102
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 103
    .line 104
    .line 105
    const-string v0, "unmatch_dialog_show_from"

    .line 106
    .line 107
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->a:Z

    .line 108
    .line 109
    if-eqz v3, :cond_2

    .line 110
    .line 111
    const-string v3, "match_list"

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :catch_0
    move-exception v0

    .line 115
    goto :goto_2

    .line 116
    :cond_2
    const-string v3, "chat_list"

    .line 117
    .line 118
    :goto_1
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :goto_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    :goto_3
    invoke-virtual {p6, v2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 126
    .line 127
    .line 128
    new-instance v0, Ll/w30$b;

    .line 129
    .line 130
    invoke-direct {v0, p1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 131
    .line 132
    .line 133
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;->SEE_UPGRADED_UN_MATCH:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$LongActionType;

    .line 134
    .line 135
    if-ne p2, v2, :cond_3

    .line 136
    .line 137
    const-string p2, "\u786e\u5b9a\u8981\u7ed3\u675f\u5373\u523b\u804a\u5929\uff1f"

    .line 138
    .line 139
    invoke-virtual {v0, p2}, Ll/w30$b;->N(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    const-string v2, "\u8bf7\u544a\u8bc9\u6211\u4eec\u7ed3\u675f\u804a\u5929\u7684\u539f\u56e0\uff0c\u6211\u4eec\u5c06\u4e3a\u60a8\u63a8\u8350\u66f4\u5408\u9002\u7684\u4eba"

    .line 144
    .line 145
    invoke-virtual {p2, v2}, Ll/w30$b;->L(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 146
    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_3
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Wq:I

    .line 150
    .line 151
    invoke-virtual {v0, p2}, Ll/w30$b;->M(I)Ll/w30$b;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Pq:I

    .line 156
    .line 157
    invoke-virtual {p2, v2}, Ll/w30$b;->K(I)Ll/w30$b;

    .line 158
    .line 159
    .line 160
    :goto_4
    sget p2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 161
    .line 162
    invoke-virtual {v0, p2}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    new-instance v2, Ll/yh6;

    .line 167
    .line 168
    invoke-direct {v2, p0}, Ll/yh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p2, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-virtual {p2, v1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    new-instance v1, Ll/zh6;

    .line 180
    .line 181
    move-object v2, p0

    .line 182
    move-object v6, p1

    .line 183
    move-object v3, p3

    .line 184
    move-object v4, p4

    .line 185
    move-object v5, p5

    .line 186
    invoke-direct/range {v1 .. v6}, Ll/zh6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    new-instance p1, Ll/ai6;

    .line 194
    .line 195
    invoke-direct {p1, p6}, Ll/ai6;-><init>(Ll/l4g0;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0, p1}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    new-instance p1, Ll/bi6;

    .line 203
    .line 204
    invoke-direct {p1, p6}, Ll/bi6;-><init>(Ll/l4g0;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0, p1}, Ll/w30$b;->W(Landroid/content/DialogInterface$OnShowListener;)Ll/w30$b;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, Ll/w30$b;->F()Ll/w30;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    iput-object p0, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->d:Ll/w30;

    .line 215
    .line 216
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public final synthetic z0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->i0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->K0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->J0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/gra;->G0()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const-string p0, "\u5df2\u53d6\u6d88\u7f6e\u9876"

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method
