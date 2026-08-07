.class public Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VRecyclerView;

.field public f:Ll/j0u;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->X()V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->W()V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;)Ll/j0u;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->f:Ll/j0u;

    return-object p0
.end method

.method public static T(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/r6s;",
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
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    new-instance v3, Ll/r6s;

    .line 22
    .line 23
    invoke-direct {v3}, Ll/r6s;-><init>()V

    .line 24
    .line 25
    .line 26
    const/16 v4, 0x3ea

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ll/r6s;->r(I)V

    .line 29
    .line 30
    .line 31
    new-instance v4, Ll/byu;

    .line 32
    .line 33
    invoke-direct {v4}, Ll/byu;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v2, v4, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 37
    .line 38
    const/4 v2, 0x3

    .line 39
    const-string v5, "live-quit-popup"

    .line 40
    .line 41
    invoke-static {v2, v4, v5}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v4, v1, p1}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v4}, Ll/r6s;->v(Ll/byu;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    return-object v0
.end method

.method private r()V
    .locals 3

    .line 1
    invoke-static {}, Ll/j0u;->H0()Ll/j0u;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->f:Ll/j0u;

    .line 6
    .line 7
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x6

    .line 14
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView$a;

    .line 18
    .line 19
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->e:Lv/VRecyclerView;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->e:Lv/VRecyclerView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->f:Ll/j0u;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public S(Ll/vit;Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vit;",
            "Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Ll/gjt;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-direct {v0, v1, p1}, Ll/gjt;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;Ll/vit;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getSuggestedLives()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    const-string v0, "p_live_exit_popup"

    .line 49
    .line 50
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->T(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    new-instance v0, Ll/hk4;

    .line 55
    .line 56
    invoke-direct {v0, p1}, Ll/hk4;-><init>(Ll/ner;)V

    .line 57
    .line 58
    .line 59
    const/4 p1, 0x1

    .line 60
    invoke-virtual {v0, p1}, Ll/hk4;->c(I)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, p2}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    new-instance p1, Ll/b0f;

    .line 71
    .line 72
    invoke-direct {p1}, Ll/b0f;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    return-object p0
.end method

.method public V()V
    .locals 3

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    const/4 v1, 0x2

    .line 8
    new-array v1, v1, [F

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aput v0, v1, v2

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    aput v0, v1, v2

    .line 16
    .line 17
    const-string v0, "translationX"

    .line 18
    .line 19
    invoke-static {p0, v0, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-wide/16 v1, 0x12c

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/kjt;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/kjt;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic W()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic X()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x8

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Y()V
    .locals 5

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    const/high16 v1, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr v0, v1

    .line 10
    const/4 v1, 0x2

    .line 11
    new-array v2, v1, [F

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x0

    .line 15
    aput v4, v2, v3

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    aput v0, v2, v3

    .line 19
    .line 20
    const-string v0, "translationX"

    .line 21
    .line 22
    invoke-static {p0, v0, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-array v1, v1, [F

    .line 27
    .line 28
    fill-array-data v1, :array_0

    .line 29
    .line 30
    .line 31
    sget-object v2, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 32
    .line 33
    invoke-static {p0, v2, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-wide/16 v2, 0x12c

    .line 38
    .line 39
    filled-new-array {v0, v1}, [Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v2, v3, v0}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/jjt;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/jjt;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public Z(Ll/vit;Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vwt;->b4()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->c:Lv/VText;

    .line 19
    .line 20
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/vwt;->b4()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->popupContent:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->d:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->customContent:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->f:Ll/j0u;

    .line 53
    .line 54
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->S(Ll/vit;Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Ll/l4g0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p2, "p_live_exit_popup"

    .line 72
    .line 73
    invoke-direct {p1, p2, p0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ll/l4g0;->l()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->N6:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->c:Lv/VText;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->b1:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->d:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->C0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VRecyclerView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->e:Lv/VRecyclerView;

    .line 33
    .line 34
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->r()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
