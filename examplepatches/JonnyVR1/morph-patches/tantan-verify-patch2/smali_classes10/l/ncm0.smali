.class public Ll/ncm0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/ycm0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/view/View;

.field public l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/view/View;

.field public o:Landroid/view/View;

.field public p:Lv/VRecyclerView;

.field public q:Landroid/widget/Button;

.field public r:Ll/yhn0;

.field public s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/ycm0;)V
    .locals 1
    .param p2    # Ll/ycm0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->g8:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/ncm0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic F(Ll/ncm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ncm0;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/ncm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ncm0;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/ncm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ncm0;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/ncm0;Ll/yhn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ncm0;->P(Ll/yhn0;Landroid/view/View;)V

    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ncm0;->J(Ll/yhn0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ncm0;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ncm0;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final J(Ll/yhn0;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 5
    .line 6
    check-cast v0, Ll/ycm0;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/ycm0;->e4(Ll/yhn0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ncm0;->N()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ocm0;->a(Ll/ncm0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L(Ll/ycm0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final M(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ll/yhn0;",
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
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    move v3, v2

    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/4 v5, 0x1

    .line 22
    if-ge v2, v4, :cond_3

    .line 23
    .line 24
    new-instance v4, Ll/xhn0;

    .line 25
    .line 26
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;

    .line 31
    .line 32
    invoke-direct {v4, v6, v1, v2}, Ll/xhn0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;ZI)V

    .line 33
    .line 34
    .line 35
    new-instance v6, Ll/yhn0;

    .line 36
    .line 37
    invoke-direct {v6, v4}, Ll/yhn0;-><init>(Ll/xhn0;)V

    .line 38
    .line 39
    .line 40
    new-instance v4, Ll/mcm0;

    .line 41
    .line 42
    invoke-direct {v4, p0, v6}, Ll/mcm0;-><init>(Ll/ncm0;Ll/yhn0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v6, v4}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-nez v4, :cond_1

    .line 56
    .line 57
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;

    .line 62
    .line 63
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;->type:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_2

    .line 70
    .line 71
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;

    .line 76
    .line 77
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;->template:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v4, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-eqz v4, :cond_2

    .line 84
    .line 85
    iget-object v3, v6, Ll/yhn0;->a:Ll/xhn0;

    .line 86
    .line 87
    invoke-virtual {v3, v5}, Ll/xhn0;->c(Z)V

    .line 88
    .line 89
    .line 90
    iput-object v6, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 91
    .line 92
    :goto_1
    move v3, v5

    .line 93
    goto :goto_2

    .line 94
    :cond_1
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;

    .line 99
    .line 100
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;->template:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v4, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-eqz v4, :cond_2

    .line 107
    .line 108
    iget-object v3, v6, Ll/yhn0;->a:Ll/xhn0;

    .line 109
    .line 110
    invoke-virtual {v3, v5}, Ll/xhn0;->c(Z)V

    .line 111
    .line 112
    .line 113
    iput-object v6, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    if-nez v3, :cond_4

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    check-cast p1, Ll/yhn0;

    .line 126
    .line 127
    iput-object p1, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    check-cast p0, Ll/yhn0;

    .line 134
    .line 135
    iget-object p0, p0, Ll/yhn0;->a:Ll/xhn0;

    .line 136
    .line 137
    invoke-virtual {p0, v5}, Ll/xhn0;->c(Z)V

    .line 138
    .line 139
    .line 140
    :cond_4
    :goto_3
    return-object v0
.end method

.method public N()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 3
    .line 4
    iget-object v0, p0, Ll/ncm0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final O(Ll/yhn0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 7
    .line 8
    iget-object v0, p1, Ll/yhn0;->a:Ll/xhn0;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/xhn0;->c(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ncm0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    if-ne v0, p1, :cond_1

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object v0, v0, Ll/yhn0;->a:Ll/xhn0;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v2}, Ll/xhn0;->c(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/ncm0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 29
    .line 30
    iget-object v2, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p1, Ll/yhn0;->a:Ll/xhn0;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/xhn0;->c(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ncm0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/ncm0;->r:Ll/yhn0;

    .line 46
    .line 47
    return-void
.end method

.method public final synthetic P(Ll/yhn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ncm0;->O(Ll/yhn0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ncm0;->p:Lv/VRecyclerView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast v2, Ll/ycm0;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/cyr;->C0()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x4

    .line 14
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ncm0;->p:Lv/VRecyclerView;

    .line 21
    .line 22
    iget-object v1, p0, Ll/ncm0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/ncm0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2, p3}, Ll/ncm0;->M(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Ll/ncm0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 37
    .line 38
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 39
    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    rem-int/2addr p2, v3

    .line 46
    if-nez p2, :cond_0

    .line 47
    .line 48
    const/4 p2, 0x0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p2, 0x1

    .line 51
    :goto_0
    iget-object p0, p0, Ll/ncm0;->p:Lv/VRecyclerView;

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    div-int/2addr p1, v3

    .line 58
    add-int/2addr p1, p2

    .line 59
    mul-int/lit8 p1, p1, 0x64

    .line 60
    .line 61
    int-to-float p1, p1

    .line 62
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public U(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p3}, Ll/ncm0;->T(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/ncm0;->q:Landroid/widget/Button;

    .line 8
    .line 9
    new-instance p2, Ll/jcm0;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/jcm0;-><init>(Ll/ncm0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/ncm0;->k:Landroid/view/View;

    .line 18
    .line 19
    new-instance p2, Ll/kcm0;

    .line 20
    .line 21
    invoke-direct {p2, p0}, Ll/kcm0;-><init>(Ll/ncm0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/ncm0;->n:Landroid/view/View;

    .line 28
    .line 29
    new-instance p2, Ll/lcm0;

    .line 30
    .line 31
    invoke-direct {p2, p0}, Ll/lcm0;-><init>(Ll/ncm0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ycm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ncm0;->L(Ll/ycm0;)V

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

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/ncm0;->K(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ycm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ncm0;->L(Ll/ycm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
