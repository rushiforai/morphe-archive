.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/k6r;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public f:Landroid/view/View;

.field public g:Ll/k6r;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/animation/Animator;

.field public j:Lv/VDraweeView;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->n0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p0, Ll/z5r;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z5r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->isOrdered:Z

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p1, Ll/z5r;

    .line 2
    .line 3
    iget-object p1, p1, Ll/z5r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->songCode:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->songCode:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private synthetic n0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->g:Ll/k6r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k6r;->c4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->g:Ll/k6r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KtvDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;->showKtvDialog()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k6r;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->l0(Ll/k6r;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public l0(Ll/k6r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->g:Ll/k6r;

    .line 2
    .line 3
    return-void
.end method

.method public m0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/o6r;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/o6r;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->a5:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->f:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/mdc0;->l6:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 21
    .line 22
    sget v0, Ll/mdc0;->d7:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/widget/TextView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->h:Landroid/widget/TextView;

    .line 31
    .line 32
    sget v0, Ll/mdc0;->N5:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VDraweeView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->j:Lv/VDraweeView;

    .line 41
    .line 42
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->C0()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/4 v2, 0x3

    .line 49
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->f:Landroid/view/View;

    .line 70
    .line 71
    new-instance v1, Ll/l6r;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/l6r;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->h:Landroid/widget/TextView;

    .line 80
    .line 81
    new-instance v1, Ll/m6r;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/m6r;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->j:Lv/VDraweeView;

    .line 90
    .line 91
    sget-object v0, Ll/zft;->J:Ljava/lang/String;

    .line 92
    .line 93
    const-string v1, "context_livingAct"

    .line 94
    .line 95
    invoke-static {v1, p0, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public p0(Ljava/util/List;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u6ca1\u6709\u66f4\u591a\u6570\u636e\u4e86"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    move v2, v1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-ge v2, v3, :cond_1

    .line 25
    .line 26
    new-instance v3, Ll/z5r;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->g:Ll/k6r;

    .line 29
    .line 30
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 35
    .line 36
    invoke-direct {v3, v4, v5, v2}, Ll/z5r;-><init>(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->i:Landroid/animation/Animator;

    .line 51
    .line 52
    invoke-static {p1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 53
    .line 54
    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .line 59
    sget-object v8, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 60
    .line 61
    invoke-static {}, Ll/bnl0;->y0()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    int-to-float p1, p1

    .line 66
    const/4 p2, 0x2

    .line 67
    new-array v9, p2, [F

    .line 68
    .line 69
    aput p1, v9, v1

    .line 70
    .line 71
    const/4 p1, 0x0

    .line 72
    const/4 p2, 0x1

    .line 73
    aput p1, v9, p2

    .line 74
    .line 75
    sget-object v3, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 76
    .line 77
    const-wide/16 v4, 0x0

    .line 78
    .line 79
    const-wide/16 v6, 0x1f4

    .line 80
    .line 81
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->i:Landroid/animation/Animator;

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void
.end method

.method public setSongSelected(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/n6r;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/n6r;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/d3q;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
