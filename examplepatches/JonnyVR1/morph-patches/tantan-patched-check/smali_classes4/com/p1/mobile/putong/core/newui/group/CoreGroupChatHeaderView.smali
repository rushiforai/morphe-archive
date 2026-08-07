.class public Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static l:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

.field public b:Lv/VRelative;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Lv/VRelative;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupApply;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->l:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->y(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->E(Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GroupApply;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lv/VLinear;Lcom/p1/mobile/putong/core/data/ChatGroupTag;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->w(Lv/VLinear;Lcom/p1/mobile/putong/core/data/ChatGroupTag;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->x(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Ll/y20;Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->D(Ll/y20;Lcom/p1/mobile/putong/core/data/CoreData;)V

    return-void
.end method

.method public static synthetic l(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->C(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->F(Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->B(Ll/uxj0;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->rh(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic B(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->J()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic C(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->f:Lv/VRelative;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic D(Ll/y20;Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->i:Ljava/util/List;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->j:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p2, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->I(Ljava/util/List;Ljava/util/List;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic E(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->v()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;->a2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "circle_detail_tab"

    .line 20
    .line 21
    const-string p2, "group"

    .line 22
    .line 23
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p2, "group_name"

    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    const-string v0, "groupchat_id"

    .line 36
    .line 37
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    filled-new-array {p0, p2, p1}, [Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p1, "e_group_chat_list"

    .line 48
    .line 49
    const-string p2, "p_circle_detail"

    .line 50
    .line 51
    invoke-static {p1, p2, p0}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final G(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->u(Lcom/p1/mobile/putong/core/data/ChatGroup;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->e:Lv/VLinear;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    if-le v0, v1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->e:Lv/VLinear;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Ll/edc0;->F1:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lv/VText;

    .line 33
    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    :goto_0
    return-void

    .line 37
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 38
    .line 39
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;Lv/VText;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public H(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/api/e;->p6(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance p2, Ll/pz8;

    .line 20
    .line 21
    invoke-direct {p2, p0, p3}, Ll/pz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/qz8;

    .line 25
    .line 26
    invoke-direct {v0, p0, p3}, Ll/qz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final I(Ljava/util/List;Ljava/util/List;Ll/y20;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupApply;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-interface {p3, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->e:Lv/VLinear;

    .line 23
    .line 24
    invoke-virtual {p3}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 25
    .line 26
    .line 27
    const/4 p3, 0x0

    .line 28
    move v0, p3

    .line 29
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-ge v0, v1, :cond_5

    .line 34
    .line 35
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 40
    .line 41
    const-string v2, "circle_detail_tab"

    .line 42
    .line 43
    const-string v3, "group"

    .line 44
    .line 45
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const-string v3, "group_name"

    .line 50
    .line 51
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string v4, "groupchat_id"

    .line 58
    .line 59
    iget-object v5, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v4, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    filled-new-array {v2, v3, v4}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    const-string v3, "e_group_chat_list"

    .line 70
    .line 71
    const-string v4, "p_circle_detail"

    .line 72
    .line 73
    invoke-static {v3, v4, v2}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {v2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    sget v3, Ll/qec0;->g0:I

    .line 85
    .line 86
    const/4 v4, 0x0

    .line 87
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    sget v3, Ll/edc0;->c1:I

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    check-cast v3, Lv/VDraweeView;

    .line 98
    .line 99
    sget v4, Ll/edc0;->F1:I

    .line 100
    .line 101
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    check-cast v4, Lv/VText;

    .line 106
    .line 107
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    const/4 v7, 0x1

    .line 116
    if-eqz v6, :cond_2

    .line 117
    .line 118
    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 119
    .line 120
    .line 121
    :cond_2
    sget v5, Ll/edc0;->E2:I

    .line 122
    .line 123
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    check-cast v5, Lv/VText;

    .line 128
    .line 129
    invoke-virtual {v5}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 130
    .line 131
    .line 132
    move-result-object v6

    .line 133
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v8

    .line 137
    if-eqz v8, :cond_3

    .line 138
    .line 139
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 140
    .line 141
    .line 142
    :cond_3
    sget v6, Ll/edc0;->Z:I

    .line 143
    .line 144
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    check-cast v6, Lv/VText;

    .line 149
    .line 150
    sget v7, Ll/edc0;->u4:I

    .line 151
    .line 152
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    check-cast v7, Lv/VLinear;

    .line 157
    .line 158
    iget-object v8, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    .line 162
    .line 163
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 169
    .line 170
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    if-lez v5, :cond_4

    .line 175
    .line 176
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 177
    .line 178
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 179
    .line 180
    invoke-interface {v6, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v6

    .line 184
    check-cast v6, Lcom/p1/mobile/putong/data/Picture;

    .line 185
    .line 186
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 191
    .line 192
    .line 193
    move-result-object v6

    .line 194
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    invoke-virtual {v5, v3, v6}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_4
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {p0, v3, p2}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->t(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    invoke-virtual {p0, v1, v3, v4}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;Lv/VText;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0, v7, v1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->r(Lv/VLinear;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 211
    .line 212
    .line 213
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    .line 214
    .line 215
    const/4 v4, -0x1

    .line 216
    const/4 v5, -0x2

    .line 217
    invoke-direct {v3, v4, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 218
    .line 219
    .line 220
    const/high16 v4, 0x42980000    # 76.0f

    .line 221
    .line 222
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    iput v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 227
    .line 228
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 229
    .line 230
    .line 231
    new-instance v3, Ll/fz8;

    .line 232
    .line 233
    invoke-direct {v3, p0, v1}, Ll/fz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 234
    .line 235
    .line 236
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 237
    .line 238
    .line 239
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->e:Lv/VLinear;

    .line 240
    .line 241
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 242
    .line 243
    .line 244
    add-int/lit8 v0, v0, 0x1

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :cond_5
    return-void

    .line 249
    :cond_6
    :goto_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    if-eqz p1, :cond_7

    .line 254
    .line 255
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 256
    .line 257
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 258
    .line 259
    .line 260
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->v()V

    .line 261
    .line 262
    .line 263
    return-void
.end method

.method public J()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->B6()Ljava/util/HashMap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->i:Ljava/util/List;

    .line 30
    .line 31
    new-instance v4, Ll/rz8;

    .line 32
    .line 33
    invoke-direct {v4, v2}, Ll/rz8;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v3, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 41
    .line 42
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-eqz v4, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 53
    .line 54
    if-nez v2, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 60
    .line 61
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 62
    .line 63
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-nez v4, :cond_0

    .line 68
    .line 69
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 72
    .line 73
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 74
    .line 75
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->G(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->d:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->g:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->h:Lv/VText;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->d:Lv/VText;

    .line 69
    .line 70
    new-instance v1, Ll/ez8;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/ez8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->h:Lv/VText;

    .line 79
    .line 80
    new-instance v1, Ll/kz8;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/kz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->B6()Ljava/util/HashMap;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/e;->A6()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/lz8;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/lz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;)V

    .line 126
    .line 127
    .line 128
    new-instance v2, Ll/mz8;

    .line 129
    .line 130
    invoke-direct {v2}, Ll/mz8;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    sget-object v1, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->l:Lrx/subjects/b;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-instance v1, Ll/nz8;

    .line 159
    .line 160
    invoke-direct {v1, p0}, Ll/nz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;)V

    .line 161
    .line 162
    .line 163
    new-instance p0, Ll/oz8;

    .line 164
    .line 165
    invoke-direct {p0}, Ll/oz8;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tz8;->a(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q()Lcom/p1/mobile/android/app/Act;
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

.method public r(Lv/VLinear;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-lez v0, :cond_2

    .line 31
    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 33
    .line 34
    new-instance v0, Ll/jz8;

    .line 35
    .line 36
    invoke-direct {v0, p0, p1}, Ll/jz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lv/VLinear;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;Lv/VText;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 4
    .line 5
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 12
    .line 13
    const-string v1, "default"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Ll/ibc0;->q0:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->y:I

    .line 35
    .line 36
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Ll/g9c0;->Z:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 60
    .line 61
    const-string v1, "approved"

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget v1, Ll/ibc0;->p0:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->Q:I

    .line 83
    .line 84
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sget v1, Ll/g9c0;->a0:I

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget v1, Ll/ibc0;->p0:I

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->D:I

    .line 115
    .line 116
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget v1, Ll/g9c0;->a0:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    .line 131
    .line 132
    :goto_0
    new-instance v0, Ll/gz8;

    .line 133
    .line 134
    invoke-direct {v0, p0, p1, p2}, Ll/gz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;)V

    .line 135
    .line 136
    .line 137
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final t(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/GroupApply;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupApply;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/GroupApply;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance p0, Ll/iz8;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/iz8;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 19
    .line 20
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/core/data/ChatGroup;)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->i:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->i:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    return v0

    .line 29
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, -0x1

    .line 33
    return p0
.end method

.method public final v()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->b:Lv/VRelative;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->c:Lv/VText;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->d:Lv/VText;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->e:Lv/VLinear;

    .line 8
    .line 9
    const/4 v3, 0x4

    .line 10
    new-array v3, v3, [Landroid/view/View;

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    aput-object v0, v3, v4

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    aput-object v1, v3, v0

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    aput-object v2, v3, v0

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    aput-object p0, v3, v0

    .line 23
    .line 24
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Ll/sz8;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/sz8;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic w(Lv/VLinear;Lcom/p1/mobile/putong/core/data/ChatGroupTag;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/high16 v1, 0x41600000    # 14.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, -0x2

    .line 10
    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v1, p0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0x10

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->name:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    const/high16 p0, 0x41100000    # 9.0f

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 35
    .line 36
    .line 37
    const-string p0, "#4C000000"

    .line 38
    .line 39
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 47
    .line 48
    sget p2, Ll/ibc0;->r0:I

    .line 49
    .line 50
    invoke-virtual {p0, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    const/high16 p0, 0x40a00000    # 5.0f

    .line 58
    .line 59
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-virtual {v1, p2, v2, p0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 69
    .line 70
    .line 71
    const/high16 p0, 0x40800000    # 4.0f

    .line 72
    .line 73
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, p1, v1, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/GroupApply;Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p3, "circle_detail_tab"

    .line 2
    .line 3
    const-string v0, "group"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "group_name"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "is_anonymou_group"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "groupchat_id"

    .line 32
    .line 33
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    filled-new-array {p3, v0, v1, v2}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    const-string v0, "e_enter_group_chat"

    .line 44
    .line 45
    const-string v1, "p_circle_detail"

    .line 46
    .line 47
    invoke-static {v0, v1, p3}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-interface {p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    if-eqz p3, :cond_0

    .line 63
    .line 64
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->H0:I

    .line 65
    .line 66
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 71
    .line 72
    const-string v0, "default"

    .line 73
    .line 74
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    if-eqz p3, :cond_1

    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 82
    .line 83
    const-string p3, "approved"

    .line 84
    .line 85
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    if-eqz p2, :cond_3

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_2

    .line 104
    .line 105
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->H0:I

    .line 106
    .line 107
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 118
    .line 119
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/api/g;->Dg(Ljava/lang/String;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    new-instance p2, Ll/sb8;

    .line 130
    .line 131
    invoke-direct {p2}, Ll/sb8;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    const/4 p2, 0x1

    .line 139
    invoke-virtual {p1, p2}, Lrx/c;->take(I)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    new-instance p2, Ll/hz8;

    .line 144
    .line 145
    invoke-direct {p2, p0}, Ll/hz8;-><init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;)V

    .line 146
    .line 147
    .line 148
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 161
    .line 162
    const-string p2, ""

    .line 163
    .line 164
    const-string p3, "suggest"

    .line 165
    .line 166
    invoke-static {p0, p1, p2, p3}, Ll/jek;->t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->q()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v1, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestAct;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
