.class public Lcom/p1/mobile/putong/feed/ui/moments/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Lcom/p1/mobile/putong/feed/ui/moments/a$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/uv00;",
        ">;",
        "Lcom/p1/mobile/putong/feed/ui/moments/a$b;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VFrame_Shadow;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VEditText;

.field public g:Lv/VText;

.field public h:Landroid/view/View;

.field public i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

.field public final j:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public l:Z

.field public m:Z

.field public n:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vv00;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/vv00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->k:Ll/y20;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->l:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->m:Z

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->j:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 17
    .line 18
    return-void
.end method

.method private synthetic A(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->f:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->g:Lv/VText;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v0}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollBy(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic C(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->n:Ll/y20;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private H()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 29
    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    new-instance v2, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    :goto_0
    if-gt v0, v1, :cond_2

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 54
    .line 55
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->I(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-nez v4, :cond_1

    .line 64
    .line 65
    const-string v4, "http"

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eqz v4, :cond_1

    .line 72
    .line 73
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    const/4 v5, 0x5

    .line 78
    if-ge v4, v5, :cond_1

    .line 79
    .line 80
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-lez p0, :cond_3

    .line 91
    .line 92
    invoke-static {v2}, Ll/uqb0;->T0(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    :goto_1
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/ui/moments/b;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/b;->x(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Jq()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/ui/moments/b;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->C(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/ui/moments/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->z()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/ui/moments/b;Lcom/p1/mobile/putong/data/IntlOperationBanner;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/b;->E(Lcom/p1/mobile/putong/data/IntlOperationBanner;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/ui/moments/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/ui/moments/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->y()V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/ui/moments/b;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->A(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/ui/moments/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->H()V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->j:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic E(Lcom/p1/mobile/putong/data/IntlOperationBanner;Landroid/view/View;)V
    .locals 1

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
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, ""

    .line 11
    .line 12
    :goto_0
    const-string p2, "intl_campaign_id"

    .line 13
    .line 14
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p1}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p2, "e_community_icon"

    .line 23
    .line 24
    const-string v0, "p_moments_view"

    .line 25
    .line 26
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p2, 0x0

    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-interface {p1, p0, p2, v0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pa(Landroid/content/Context;ILcom/p1/mobile/putong/data/IntlOperationBanner;Lcom/p1/mobile/putong/data/IntlOperationArticles;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public F(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->U(IILandroid/content/Intent;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public G(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Ll/vel0;

    .line 23
    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-direct {v1, v0}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-wide v0, v1, Ll/vel0;->b:J

    .line 40
    .line 41
    const-wide/16 v2, 0x3a98

    .line 42
    .line 43
    cmp-long v0, v0, v2

    .line 44
    .line 45
    if-lez v0, :cond_0

    .line 46
    .line 47
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->z3:I

    .line 48
    .line 49
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    instance-of v0, p1, Ljava/util/ArrayList;

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    check-cast p1, Ljava/util/ArrayList;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 63
    .line 64
    .line 65
    move-object p1, v0

    .line 66
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->n(Ljava/util/ArrayList;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public I(ZILcom/p1/mobile/putong/data/IntlOperationBanner;Z)V
    .locals 3

    .line 1
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->l:Z

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->m:Z

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p3, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p1, ""

    .line 23
    .line 24
    :goto_0
    const-string v1, "intl_campaign_id"

    .line 25
    .line 26
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    filled-new-array {p1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v1, "e_community_icon"

    .line 35
    .line 36
    const-string v2, "p_moments_view"

    .line 37
    .line 38
    invoke-static {v1, v2, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->m:Z

    .line 42
    .line 43
    :cond_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->l:Z

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->e:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 v2, 0x4

    .line 55
    if-ne p1, v2, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->b:Lv/VFrame_Shadow;

    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->b:Lv/VFrame_Shadow;

    .line 64
    .line 65
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->d:Lv/VText;

    .line 69
    .line 70
    if-nez p2, :cond_3

    .line 71
    .line 72
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->d:Lv/VText;

    .line 80
    .line 81
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    :goto_2
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_4

    .line 93
    .line 94
    iget-object p1, p3, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UrlParentData;->url:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_4

    .line 103
    .line 104
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 105
    .line 106
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->c:Lv/VDraweeView;

    .line 107
    .line 108
    iget-object p4, p3, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 109
    .line 110
    iget-object p4, p4, Lcom/p1/mobile/putong/data/UrlParentData;->url:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p1, p2, p4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_4
    if-eqz p4, :cond_5

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    new-instance p2, Ll/bw00;

    .line 123
    .line 124
    invoke-direct {p2}, Ll/bw00;-><init>()V

    .line 125
    .line 126
    .line 127
    const-wide/16 v0, 0x7d0

    .line 128
    .line 129
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 130
    .line 131
    .line 132
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->c:Lv/VDraweeView;

    .line 133
    .line 134
    sget p2, Ll/lbc0;->s3:I

    .line 135
    .line 136
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 137
    .line 138
    .line 139
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->b:Lv/VFrame_Shadow;

    .line 140
    .line 141
    new-instance p2, Ll/cw00;

    .line 142
    .line 143
    invoke-direct {p2, p0, p3}, Ll/cw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;Lcom/p1/mobile/putong/data/IntlOperationBanner;)V

    .line 144
    .line 145
    .line 146
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->j:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uv00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->m(Ll/uv00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/b;->l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->n:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget v0, Ll/tec0;->H4:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->n:Landroid/view/View;

    .line 27
    .line 28
    return-object p0
.end method

.method public l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dw00;->b(Lcom/p1/mobile/putong/feed/ui/moments/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Ll/uv00;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->O(Ljava/util/ArrayList;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 6
    .line 7
    new-instance v0, Ll/aw00;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/aw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public q(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->f:Lv/VEditText;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->p(Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->e:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    const/4 v0, 0x4

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->j:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 33
    .line 34
    new-instance v0, Ll/yv00;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/yv00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v1, 0xc8

    .line 40
    .line 41
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->j:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 45
    .line 46
    new-instance v0, Ll/zv00;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/zv00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 49
    .line 50
    .line 51
    const/16 v1, 0x1f4

    .line 52
    .line 53
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Frag;->m4(Ljava/lang/Runnable;I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/4 p1, 0x1

    .line 61
    invoke-static {p0, p1}, Ll/mrb0;->P(Lcom/p1/mobile/android/app/Act;Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/mrb0;->x(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->p(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->f:Lv/VEditText;

    .line 13
    .line 14
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->l:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->b:Lv/VFrame_Shadow;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->b:Lv/VFrame_Shadow;

    .line 30
    .line 31
    const/4 v1, 0x4

    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->e:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->f:Lv/VEditText;

    .line 46
    .line 47
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public u()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/moments/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/a;->q(Lcom/p1/mobile/putong/feed/ui/moments/a$b;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->j:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 19
    .line 20
    invoke-virtual {v1, v0, v2, v3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->W(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;ZLcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->n:Landroid/view/View;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->n:Landroid/view/View;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->k:Ll/y20;

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public v(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->f:Lv/VEditText;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Lv/VEditText;->i(Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/wv00;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/wv00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/xv00;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/xv00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->t(Landroid/view/View;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    sget v1, Ll/k9c0;->T:I

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->a:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 81
    .line 82
    const/4 v1, 0x2

    .line 83
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 89
    .line 90
    const/16 v0, 0xa

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->setFoldLimit(I)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 98
    .line 99
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/moments/b$a;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/b$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/moments/b$b;

    .line 116
    .line 117
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/b$b;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 124
    .line 125
    const/high16 p1, 0x41000000    # 8.0f

    .line 126
    .line 127
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->j:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic x(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->q(Z)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public final synthetic y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->l:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->b:Lv/VFrame_Shadow;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->b:Lv/VFrame_Shadow;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b;->f:Lv/VEditText;

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
