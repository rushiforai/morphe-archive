.class public Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

.field public e:Landroid/widget/RadioGroup;

.field public f:Landroid/widget/RadioButton;

.field public g:Landroid/widget/RadioButton;

.field public h:Lv/VImage;

.field public i:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public j:Landroidx/recyclerview/widget/RecyclerView;

.field public k:Landroid/widget/FrameLayout;

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

.field public m:Ll/x20;

.field public n:Ll/x20;

.field public o:Landroid/view/View$OnClickListener;

.field public p:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->m0(Landroid/widget/RadioGroup;I)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->n0()V

    return-void
.end method

.method public static l0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;
    .locals 3

    .line 1
    sget v0, Ll/yec0;->W3:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 10
    .line 11
    return-object p0
.end method

.method private synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->o:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public getWeekBoardItem()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->f:Landroid/widget/RadioButton;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "currentWeek"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->g:Landroid/widget/RadioButton;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "lastWeek"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    return-object v1
.end method

.method public final k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pny;->a(Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0(Landroid/widget/RadioGroup;I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->n:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->n:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->i:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->getWeekBoardItem()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const-string v0, "currentWeek"

    .line 21
    .line 22
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p1, p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->k:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->getWeekBoardItem()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic n0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->m:Ll/x20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->m:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->k0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->e:Landroid/widget/RadioGroup;

    .line 22
    .line 23
    new-instance v1, Ll/mny;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/mny;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->i:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 32
    .line 33
    new-instance v1, Ll/nny;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/nny;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->h:Lv/VImage;

    .line 42
    .line 43
    new-instance v1, Ll/ony;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/ony;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public p0(Ll/nsv;Ll/cm0;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;",
            "Ll/cm0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->getWeekBoardItem()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "currentWeek"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->k:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->l:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->p:Ll/y20;

    .line 40
    .line 41
    const-string v6, "currentWeek"

    .line 42
    .line 43
    const/4 v7, 0x1

    .line 44
    move-object v4, p1

    .line 45
    move-object v5, p2

    .line 46
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->p(Ll/y20;Ll/nsv;Ll/cm0;Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->k:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public setOnCheckedChangeListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->n:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnJumpClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->o:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnRefreshListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->m:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setShowCardAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;->p:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
