.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Landroidx/recyclerview/widget/RecyclerView;


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

.method public static synthetic h0(Ll/ats;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ats;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Ll/ats;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ats;->z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kts;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(Ll/ats;Ll/lsw;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/its;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/its;-><init>(Ll/ats;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;->g:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/jts;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/jts;-><init>(Ll/ats;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/guk;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/guk;-><init>(Ll/ats;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p2}, Ll/guk;->H(Ll/lsw;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
