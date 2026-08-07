.class public Ll/cjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fjg;",
        ">;"
    }
.end annotation


# static fields
.field public static e:I = 0x3eb

.field public static f:I = 0x3ec


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

.field public b:Ll/bzl0;

.field public c:Ll/fjg;

.field public d:Ll/osn0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/fjg;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/cjg$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/cjg$a;-><init>(Ll/cjg;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/cjg;->d:Ll/osn0;

    .line 10
    .line 11
    iput-object p2, p0, Ll/cjg;->c:Ll/fjg;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->l0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Ll/cjg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cjg;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/cjg;Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cjg;->n(Landroid/widget/RadioGroup;I)V

    return-void
.end method

.method public static synthetic c(Ll/cjg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cjg;->k(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Ll/cjg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cjg;->l()V

    return-void
.end method

.method public static bridge synthetic e(Ll/cjg;)Ll/fjg;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjg;->c:Ll/fjg;

    return-object p0
.end method

.method private synthetic l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjg;->c:Ll/fjg;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fjg;->b4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/cjg;->c:Ll/fjg;

    .line 2
    .line 3
    sget-object p1, Ll/efv;->M:Ljava/lang/String;

    .line 4
    .line 5
    const v0, 0x440f8000    # 574.0f

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v1, 0x1004

    .line 13
    .line 14
    const/16 v2, 0x18

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Ll/fjg;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->i:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fjg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cjg;->f(Ll/fjg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public init()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 2
    .line 3
    new-instance v1, Ll/yig;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/yig;-><init>(Ll/cjg;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->setShowCardAction(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 12
    .line 13
    new-instance v1, Ll/zig;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/zig;-><init>(Ll/cjg;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->setOnRefreshListener(Ll/x20;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 22
    .line 23
    new-instance v1, Ll/ajg;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/ajg;-><init>(Ll/cjg;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->setOnJumpClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->f:Landroid/widget/RadioButton;

    .line 34
    .line 35
    const-string v1, "\u672c\u5468\u699c\u5355"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->g:Landroid/widget/RadioButton;

    .line 43
    .line 44
    const-string v1, "\u4e0a\u5468\u699c\u5355"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->e:Landroid/widget/RadioGroup;

    .line 52
    .line 53
    new-instance v1, Ll/bjg;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/bjg;-><init>(Ll/cjg;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->e:Landroid/widget/RadioGroup;

    .line 64
    .line 65
    sget v1, Ll/mdc0;->Y0:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ll/bzl0;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/bzl0;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Ll/cjg;->b:Ll/bzl0;

    .line 76
    .line 77
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 78
    .line 79
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->e:Landroid/widget/RadioGroup;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->f:Landroid/widget/RadioButton;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    invoke-virtual {v1, v0}, Landroid/widget/RadioGroup;->check(I)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/cjg;->b:Ll/bzl0;

    .line 91
    .line 92
    iget-object v1, p0, Ll/cjg;->d:Ll/osn0;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ll/bzl0;->H(Ll/osn0;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 100
    .line 101
    iget-object p0, p0, Ll/cjg;->b:Ll/bzl0;

    .line 102
    .line 103
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public j()Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjg;->c:Ll/fjg;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/kny;->c(Ll/i6t;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n(Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cjg;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->e:Landroid/widget/RadioGroup;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sget v1, Ll/mdc0;->Y0:I

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/cjg;->c:Ll/fjg;

    .line 16
    .line 17
    sget v1, Ll/cjg;->e:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/fjg;->c4(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->e:Landroid/widget/RadioGroup;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sget v1, Ll/mdc0;->Z2:I

    .line 32
    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/cjg;->c:Ll/fjg;

    .line 36
    .line 37
    sget v1, Ll/cjg;->f:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/fjg;->c4(I)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->k:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/cjg;->b:Ll/bzl0;

    .line 10
    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;->leaderboards:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ll/bzl0;->G(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;->myLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 17
    .line 18
    iget-object v2, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object p1, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->k:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->k:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/cjg;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->l:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansBoardMeItemView;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;->myLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 39
    .line 40
    iget-object v1, p0, Ll/cjg;->d:Ll/osn0;

    .line 41
    .line 42
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansBoardMeItemView;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0}, Ll/cjg;->i()V

    .line 46
    .line 47
    .line 48
    return-void
.end method
