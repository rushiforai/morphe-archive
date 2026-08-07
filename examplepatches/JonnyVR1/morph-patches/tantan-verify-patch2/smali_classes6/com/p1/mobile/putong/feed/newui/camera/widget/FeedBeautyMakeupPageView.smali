.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Landroid/widget/TextView;

.field public f:Landroidx/recyclerview/widget/RecyclerView;

.field public g:I

.field public h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

.field public i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

.field public j:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

.field public p:I

.field public q:I

.field public r:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->g:I

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->l:Ljava/util/List;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->m:Ljava/util/List;

    .line 20
    .line 21
    new-instance p1, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->n:Ljava/util/Map;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->q:I

    .line 30
    .line 31
    new-instance p1, Ll/zqg;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/zqg;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->r:Ljava/lang/Runnable;

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->m(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->q(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic c()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->J0:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->p(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->r(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->o(Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public A(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->T(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public B(I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p1, v1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->c:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->o:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->D(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-lez p1, :cond_0

    .line 28
    .line 29
    move v0, v1

    .line 30
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->q:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->o:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->q:I

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->o:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 48
    .line 49
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->q:I

    .line 50
    .line 51
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->m0(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->c:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 60
    .line 61
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance v1, Landroid/util/Pair;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-direct {v1, p0, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->s(Landroid/util/Pair;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hrg;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j()Lcom/p1/mobile/android/app/Act;
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

.method public k(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {v1, v2, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/a;-><init>(Landroid/content/Context;I)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->l:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/a;->K(Landroid/content/Context;Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 54
    .line 55
    new-instance v0, Ll/arg;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/arg;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/a;->I(Ll/a30;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->d:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    new-instance v0, Ll/brg;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/brg;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->j()Ll/s120;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/crg;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/crg;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v0, v1}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public l(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->m:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->U(Landroid/content/Context;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 29
    .line 30
    invoke-direct {v2, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;-><init>(I)V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->m:Ljava/util/List;

    .line 59
    .line 60
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->U(Landroid/content/Context;Ljava/util/List;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 64
    .line 65
    new-instance v0, Ll/frg;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/frg;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->S(Ll/a30;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->c()Ll/s120;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/grg;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/grg;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v0, v1}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->o:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->p:I

    .line 8
    .line 9
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->e:Landroid/widget/TextView;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->name:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j:Ll/a30;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-interface {v0, p1, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->isNone()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->w(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x2

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->B(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic o(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->E()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->z(II)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x2

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->B(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->q:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->k:Ll/a30;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic q(Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->D(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->A(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->r:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->q(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Ljava/util/List;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->t(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->l(I)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->B(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public s(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->l:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->l:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setOnCategoryClicked(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->j:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public setOnItemClicked(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->k:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public t(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->m:Ljava/util/List;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public u(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->Q(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x1

    .line 20
    if-le v1, v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->t(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x2

    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->l(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->B(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->r:Ljava/lang/Runnable;

    .line 34
    .line 35
    const-wide/16 v1, 0x5dc

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 41
    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/a;->Q2(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/drg;

    .line 57
    .line 58
    invoke-direct {v1, p0, p1}, Ll/drg;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;)V

    .line 59
    .line 60
    .line 61
    new-instance p0, Ll/erg;

    .line 62
    .line 63
    invoke-direct {p0}, Ll/erg;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public x()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->b()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->e()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->d()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->c()V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->h0(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->l:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    iput v3, v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->all:F

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/a;->M(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public y()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->g:I

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->B(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/b;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->T(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public z(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/a;->J(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
