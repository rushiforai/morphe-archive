.class public Ll/a2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/d2c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

.field public b:Ll/d2c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->c(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/a2c;Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a2c;->e(Landroid/widget/RadioGroup;I)V

    return-void
.end method

.method public static synthetic b(Ll/a2c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a2c;->f()V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/d2c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a2c;->b:Ll/d2c;

    .line 2
    .line 3
    return-void
.end method

.method public d()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e(Landroid/widget/RadioGroup;I)V
    .locals 2

    .line 1
    sget p1, Ll/mdc0;->N4:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ne p2, p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move p1, v0

    .line 9
    :goto_0
    iget-object p2, p0, Ll/a2c;->b:Ll/d2c;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const-string v1, "today"

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    const-string v1, "yesterday"

    .line 17
    .line 18
    :goto_1
    invoke-virtual {p2, v1}, Ll/d2c;->Y3(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->f:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 31
    .line 32
    invoke-virtual {p2, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    const/high16 p1, 0x42a40000    # 82.0f

    .line 42
    .line 43
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move p1, v0

    .line 49
    :goto_2
    invoke-virtual {p0, v0, v0, v0, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic f()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a2c;->b:Ll/d2c;

    .line 2
    .line 3
    const-string v0, "today"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/d2c;->Y3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->h(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/d2c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a2c;->c(Ll/d2c;)V

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

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->a:Landroid/widget/RadioGroup;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object p0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->b:Landroid/widget/RadioButton;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-ne v1, p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i(Ljava/util/List;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/a2c;->b:Ll/d2c;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->e(Ll/qhl;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->g(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->b:Landroid/widget/RadioButton;

    .line 17
    .line 18
    const-string v1, "\u4eca\u65e5\u699c\u5355"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->c:Landroid/widget/RadioButton;

    .line 26
    .line 27
    const-string v1, "\u6628\u65e5\u699c\u5355"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->a:Landroid/widget/RadioGroup;

    .line 35
    .line 36
    new-instance v1, Ll/y1c;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/y1c;-><init>(Ll/a2c;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 47
    .line 48
    new-instance v1, Ll/z1c;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/z1c;-><init>(Ll/a2c;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a2c;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

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
