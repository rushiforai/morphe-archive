.class public Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VImage;

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

.method public static synthetic P(Ll/vit;Landroid/view/View;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const-string v0, "p_live_exit_popup"

    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Ll/vit;->b4(ZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;)Ll/j0u;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->f:Ll/j0u;

    return-object p0
.end method

.method public static S(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;
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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->f:Ll/j0u;

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
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$a;

    .line 18
    .line 19
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->e:Lv/VRecyclerView;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->e:Lv/VRecyclerView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->f:Ll/j0u;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public R(Ll/vit;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vit;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;)",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->S(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p2, Ll/hk4;

    .line 14
    .line 15
    invoke-direct {p2, p1}, Ll/hk4;-><init>(Ll/ner;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p2, p1}, Ll/hk4;->c(I)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, p0}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ll/b0f;

    .line 32
    .line 33
    invoke-direct {p0}, Ll/b0f;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    return-object p1
.end method

.method public T()V
    .locals 12

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v2, v1, [F

    .line 8
    .line 9
    fill-array-data v2, :array_0

    .line 10
    .line 11
    .line 12
    const-string v3, "alpha"

    .line 13
    .line 14
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-wide/16 v4, 0x12c

    .line 19
    .line 20
    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    int-to-float v6, v6

    .line 28
    new-array v7, v1, [F

    .line 29
    .line 30
    const/4 v8, 0x0

    .line 31
    aput v6, v7, v8

    .line 32
    .line 33
    const/4 v6, 0x1

    .line 34
    const/4 v9, 0x0

    .line 35
    aput v9, v7, v6

    .line 36
    .line 37
    const-string v9, "translationX"

    .line 38
    .line 39
    invoke-static {p0, v9, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    invoke-virtual {v7, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->d:Lv/VText;

    .line 47
    .line 48
    new-array v5, v1, [F

    .line 49
    .line 50
    fill-array-data v5, :array_1

    .line 51
    .line 52
    .line 53
    invoke-static {v4, v3, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-wide/16 v9, 0x96

    .line 58
    .line 59
    invoke-virtual {v4, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4, v9, v10}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 63
    .line 64
    .line 65
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->c:Lv/VImage;

    .line 66
    .line 67
    new-array v11, v1, [F

    .line 68
    .line 69
    fill-array-data v11, :array_2

    .line 70
    .line 71
    .line 72
    invoke-static {v5, v3, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3, v9, v10}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 80
    .line 81
    .line 82
    new-instance v5, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$c;

    .line 83
    .line 84
    invoke-direct {v5, p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 88
    .line 89
    .line 90
    const/4 p0, 0x4

    .line 91
    new-array p0, p0, [Landroid/animation/Animator;

    .line 92
    .line 93
    aput-object v2, p0, v8

    .line 94
    .line 95
    aput-object v7, p0, v6

    .line 96
    .line 97
    aput-object v4, p0, v1

    .line 98
    .line 99
    const/4 v1, 0x3

    .line 100
    aput-object v3, p0, v1

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public V()V
    .locals 12

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v2, v1, [F

    .line 8
    .line 9
    fill-array-data v2, :array_0

    .line 10
    .line 11
    .line 12
    const-string v3, "alpha"

    .line 13
    .line 14
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-wide/16 v4, 0x12c

    .line 19
    .line 20
    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    int-to-float v6, v6

    .line 28
    new-array v7, v1, [F

    .line 29
    .line 30
    const/4 v8, 0x0

    .line 31
    const/4 v9, 0x0

    .line 32
    aput v9, v7, v8

    .line 33
    .line 34
    const/4 v9, 0x1

    .line 35
    aput v6, v7, v9

    .line 36
    .line 37
    const-string v6, "translationX"

    .line 38
    .line 39
    invoke-static {p0, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-virtual {v6, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->d:Lv/VText;

    .line 47
    .line 48
    new-array v5, v1, [F

    .line 49
    .line 50
    fill-array-data v5, :array_1

    .line 51
    .line 52
    .line 53
    invoke-static {v4, v3, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-wide/16 v10, 0x96

    .line 58
    .line 59
    invoke-virtual {v4, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 60
    .line 61
    .line 62
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->c:Lv/VImage;

    .line 63
    .line 64
    new-array v7, v1, [F

    .line 65
    .line 66
    fill-array-data v7, :array_2

    .line 67
    .line 68
    .line 69
    invoke-static {v5, v3, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v3, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    .line 76
    new-instance v5, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$b;

    .line 77
    .line 78
    invoke-direct {v5, p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x4

    .line 85
    new-array p0, p0, [Landroid/animation/Animator;

    .line 86
    .line 87
    aput-object v2, p0, v8

    .line 88
    .line 89
    aput-object v6, p0, v9

    .line 90
    .line 91
    aput-object v4, p0, v1

    .line 92
    .line 93
    const/4 v1, 0x3

    .line 94
    aput-object v3, p0, v1

    .line 95
    .line 96
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public W(Ll/vit;Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->c:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/ijt;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/ijt;-><init>(Ll/vit;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->d:Lv/VText;

    .line 12
    .line 13
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->recommendPolicyName:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->f:Ll/j0u;

    .line 19
    .line 20
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->pageViewId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {p0, p1, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->R(Ll/vit;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ll/l4g0;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->pageViewId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-direct {p1, p2, p0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ll/l4g0;->l()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->C:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VImage;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->c:Lv/VImage;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->i6:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->d:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->h6:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->e:Lv/VRecyclerView;

    .line 33
    .line 34
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->r()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
