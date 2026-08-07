.class public Ll/h570;
.super Ll/elh;
.source "SourceFile"

# interfaces
.implements Ll/jn50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/elh<",
        "Ll/w370;",
        ">;",
        "Ll/jn50;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/android/app/Act;

.field public B:Ll/jxd0;

.field public C:Ll/h80;

.field public o:Lv/navigationbar/VNavigationBar;

.field public p:Landroid/widget/FrameLayout;

.field public q:Lv/VText;

.field public r:Lv/VImage;

.field public s:Lv/VPullDownRefreshLayout;

.field public t:Lv/VRecyclerView;

.field public u:Lv/VLinear;

.field public v:Lv/VDraweeView;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Landroid/widget/LinearLayout;

.field public z:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/elh;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "HAS_MATCH_REPLY_TIP_CLOSED"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/h570;->B:Ll/jxd0;

    .line 34
    .line 35
    new-instance v0, Ll/h570$a;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/h570$a;-><init>(Ll/h570;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/h570;->C:Ll/h80;

    .line 41
    .line 42
    iput-object p1, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic J(Ll/h570;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h570;->R()V

    return-void
.end method

.method public static synthetic K(Ll/h570;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h570;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/h570;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h570;->T(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic M(Ll/h570;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h570;->Q(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private synthetic R()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/umh;->R1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->S0:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/g570;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/g570;-><init>(Ll/h570;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0, v1}, Ll/k3h;->K0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/mrb0;->k()Lcom/p1/mobile/putong/data/Counter;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/mrb0;->k()Lcom/p1/mobile/putong/data/Counter;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/mrb0;->k()Lcom/p1/mobile/putong/data/Counter;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 48
    .line 49
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "unread_message_num"

    .line 58
    .line 59
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {p0}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_all_read"

    .line 68
    .line 69
    const-string v0, "p_activity"

    .line 70
    .line 71
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/h570;->p:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/h570;->B:Ll/jxd0;

    .line 8
    .line 9
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public N(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/i570;->b(Ll/h570;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/j570;->b(Ll/h570;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P(Ll/w370;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    invoke-super {p0, p1}, Ll/elh;->l(Ll/umh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
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
    if-eqz p1, :cond_2

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const-string v1, "moment_id"

    .line 12
    .line 13
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    const-string v1, "owner_id"

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 37
    .line 38
    iget-object p0, p0, Ll/umh;->a:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v1, "moment_showfrom"

    .line 45
    .line 46
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "moment_type"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_1

    .line 75
    .line 76
    const-string p0, "reply"

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    const-string p0, "comment"

    .line 80
    .line 81
    :goto_0
    const-string p1, "comment_detail"

    .line 82
    .line 83
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_1
    return-object v0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w370;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h570;->P(Ll/w370;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h570;->N(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/h570;->o:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/h570;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget v0, Ll/k9c0;->p0:I

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/h570;->t:Lv/VRecyclerView;

    .line 30
    .line 31
    iput-object p2, p0, Ll/elh;->d:Lv/VRecyclerView;

    .line 32
    .line 33
    iget-object p2, p0, Ll/h570;->u:Lv/VLinear;

    .line 34
    .line 35
    iput-object p2, p0, Ll/elh;->f:Lv/VLinear;

    .line 36
    .line 37
    iget-object p2, p0, Ll/h570;->v:Lv/VDraweeView;

    .line 38
    .line 39
    iput-object p2, p0, Ll/elh;->g:Lv/VDraweeView;

    .line 40
    .line 41
    iget-object p2, p0, Ll/h570;->w:Lv/VText;

    .line 42
    .line 43
    iput-object p2, p0, Ll/elh;->h:Lv/VText;

    .line 44
    .line 45
    iget-object p2, p0, Ll/h570;->x:Lv/VText;

    .line 46
    .line 47
    iput-object p2, p0, Ll/elh;->i:Lv/VText;

    .line 48
    .line 49
    iget-object p2, p0, Ll/h570;->s:Lv/VPullDownRefreshLayout;

    .line 50
    .line 51
    iput-object p2, p0, Ll/elh;->j:Lv/VPullDownRefreshLayout;

    .line 52
    .line 53
    return-object p1
.end method

.method public bridge synthetic l(Ll/umh;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w370;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h570;->P(Ll/w370;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/h570;->x:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/h570;->o:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/h570;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/elh;->a:Ll/umh;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/umh;->h1()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/cmg;->W()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Ll/h570;->o:Lv/navigationbar/VNavigationBar;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->K:I

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->K:I

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object v0, p0, Ll/h570;->o:Lv/navigationbar/VNavigationBar;

    .line 46
    .line 47
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f5:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 50
    .line 51
    .line 52
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Ll/elh;->a:Ll/umh;

    .line 55
    .line 56
    iget-object v1, v1, Ll/umh;->a:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const/4 v1, 0x0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    sget-object v0, Ll/owi;->m:Ll/jxd0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ljava/lang/Boolean;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    new-instance v0, Landroid/widget/TextView;

    .line 80
    .line 81
    iget-object v3, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 87
    .line 88
    iget-object v3, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->i0:I

    .line 95
    .line 96
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 104
    .line 105
    iget-object v3, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    sget v4, Ll/k9c0;->r:I

    .line 112
    .line 113
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 121
    .line 122
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 123
    .line 124
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 128
    .line 129
    const/high16 v3, 0x41600000    # 14.0f

    .line 130
    .line 131
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 135
    .line 136
    const/high16 v3, 0x41400000    # 12.0f

    .line 137
    .line 138
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    const/high16 v5, 0x40e00000    # 7.0f

    .line 143
    .line 144
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    invoke-virtual {v0, v4, v6, v3, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 160
    .line 161
    iget-object v3, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 162
    .line 163
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    sget v4, Ll/lbc0;->f4:I

    .line 168
    .line 169
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ll/h570;->o:Lv/navigationbar/VNavigationBar;

    .line 177
    .line 178
    iget-object v3, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 179
    .line 180
    new-array v2, v2, [Landroid/view/View;

    .line 181
    .line 182
    aput-object v3, v2, v1

    .line 183
    .line 184
    invoke-virtual {v0, v2}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 188
    .line 189
    new-instance v2, Ll/e570;

    .line 190
    .line 191
    invoke-direct {v2, p0}, Ll/e570;-><init>(Ll/h570;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    .line 196
    .line 197
    :cond_2
    iget-object v0, p0, Ll/h570;->p:Landroid/widget/FrameLayout;

    .line 198
    .line 199
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Ll/h570;->s:Lv/VPullDownRefreshLayout;

    .line 203
    .line 204
    invoke-virtual {v0, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Ll/h570;->r:Lv/VImage;

    .line 208
    .line 209
    new-instance v1, Ll/f570;

    .line 210
    .line 211
    invoke-direct {v1, p0}, Ll/f570;-><init>(Ll/h570;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 218
    .line 219
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget-object v1, p0, Ll/h570;->t:Lv/VRecyclerView;

    .line 224
    .line 225
    invoke-virtual {p0, v0, v1}, Ll/h570;->O(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ll/h570;->z:Landroid/widget/FrameLayout;

    .line 229
    .line 230
    iput-object v0, p0, Ll/elh;->m:Landroid/widget/FrameLayout;

    .line 231
    .line 232
    new-instance v0, Ll/b370;

    .line 233
    .line 234
    iget-object v1, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 235
    .line 236
    iget-object v2, p0, Ll/h570;->y:Landroid/widget/LinearLayout;

    .line 237
    .line 238
    iget-object v3, p0, Ll/elh;->a:Ll/umh;

    .line 239
    .line 240
    iget-object v4, p0, Ll/h570;->C:Ll/h80;

    .line 241
    .line 242
    invoke-direct {v0, v1, v2, v3, v4}, Ll/b370;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Ll/omg;Ll/h80;)V

    .line 243
    .line 244
    .line 245
    iput-object v0, p0, Ll/elh;->k:Ll/b370;

    .line 246
    .line 247
    iget-object v0, p0, Ll/h570;->t:Lv/VRecyclerView;

    .line 248
    .line 249
    const/4 v1, 0x4

    .line 250
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 251
    .line 252
    .line 253
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 254
    .line 255
    iget-object v1, p0, Ll/h570;->A:Lcom/p1/mobile/android/app/Act;

    .line 256
    .line 257
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;-><init>(Landroid/content/Context;)V

    .line 258
    .line 259
    .line 260
    iput-object v0, p0, Ll/elh;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 261
    .line 262
    new-instance v0, Ll/s8h;

    .line 263
    .line 264
    iget-object v1, p0, Ll/elh;->k:Ll/b370;

    .line 265
    .line 266
    invoke-direct {v0, v1}, Ll/s8h;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 267
    .line 268
    .line 269
    iput-object v0, p0, Ll/elh;->e:Ll/s8h;

    .line 270
    .line 271
    iget-object v1, p0, Ll/elh;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 272
    .line 273
    invoke-virtual {v0, v1}, Ll/zzk;->H(Landroid/view/View;)V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Ll/h570;->t:Lv/VRecyclerView;

    .line 277
    .line 278
    iget-object p0, p0, Ll/elh;->e:Ll/s8h;

    .line 279
    .line 280
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 281
    .line 282
    .line 283
    return-void
.end method

.method public w2(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/elh;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
