.class public Ll/t8k;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/l8k;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/view/View;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VImage;

.field public n:Lv/VFrame;

.field public o:Lv/VRecyclerView;

.field public p:Landroid/widget/TextView;

.field public q:Lv/VLinear;

.field public r:Landroid/widget/TextView;

.field public s:Landroid/widget/TextView;

.field public t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>(Ll/l8k;)V
    .locals 2
    .param p1    # Ll/l8k;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->W8:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic F(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Ll/zbn0;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic H(Ll/t8k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t8k;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/t8k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t8k;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/t8k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t8k;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/t8k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t8k;->N(Landroid/view/View;)V

    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/l8k;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l8k;->d4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/l8k;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l8k;->e4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u8k;->a(Ll/t8k;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/u8k;->b(Ll/t8k;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic Q(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/l8k;

    .line 4
    .line 5
    sget-object p1, Ll/efv;->B:Ljava/lang/String;

    .line 6
    .line 7
    const/high16 v0, 0x440c0000    # 560.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x1b5d

    .line 14
    .line 15
    const/16 v2, 0x18

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public R(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ")V"
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
    new-instance v1, Ll/zbn0;

    .line 7
    .line 8
    invoke-static {p2}, Ll/fln0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-direct {v1, v2}, Ll/zbn0;-><init>(Z)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Ll/t8k;->p:Landroid/widget/TextView;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    const/4 v1, 0x0

    .line 32
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-ge v1, v2, :cond_1

    .line 40
    .line 41
    new-instance v2, Ll/gcn0;

    .line 42
    .line 43
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 52
    .line 53
    check-cast v4, Ll/l8k;

    .line 54
    .line 55
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    new-instance v5, Ll/r8k;

    .line 59
    .line 60
    invoke-direct {v5, v4}, Ll/r8k;-><init>(Ll/l8k;)V

    .line 61
    .line 62
    .line 63
    invoke-direct {v2, v3, v1, v5}, Ll/gcn0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;ILl/y20;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    :goto_1
    iget-object p1, p0, Ll/t8k;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p2}, Ll/t8k;->S(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/fln0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/t8k;->T(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/t8k;->U(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t8k;->W(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 2
    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Y2:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/t8k;->V(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final U(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t8k;->W(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 2
    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Vd:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/t8k;->V(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public V(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t8k;->s:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final W(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t8k;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/s8k;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/s8k;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/d3q;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    check-cast v0, Ll/zbn0;

    .line 21
    .line 22
    invoke-static {p1}, Ll/fln0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v0, p1}, Ll/zbn0;->I(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/t8k;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t8k;->M(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/t8k;->L(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/t8k;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 13
    .line 14
    iget-object v0, p0, Ll/t8k;->o:Lv/VRecyclerView;

    .line 15
    .line 16
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {v1, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/t8k;->o:Lv/VRecyclerView;

    .line 29
    .line 30
    iget-object v0, p0, Ll/t8k;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 36
    .line 37
    check-cast p1, Ll/l8k;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/xzs;->L2()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Ll/t8k;->q:Lv/VLinear;

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/t8k;->n:Lv/VFrame;

    .line 52
    .line 53
    const/high16 v0, 0x43b70000    # 366.0f

    .line 54
    .line 55
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object p1, p0, Ll/t8k;->l:Landroid/widget/LinearLayout;

    .line 63
    .line 64
    new-instance v0, Ll/m8k;

    .line 65
    .line 66
    invoke-direct {v0}, Ll/m8k;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/t8k;->k:Landroid/view/View;

    .line 73
    .line 74
    new-instance v0, Ll/n8k;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/n8k;-><init>(Ll/t8k;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/t8k;->r:Landroid/widget/TextView;

    .line 83
    .line 84
    new-instance v0, Ll/o8k;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/o8k;-><init>(Ll/t8k;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/t8k;->s:Landroid/widget/TextView;

    .line 93
    .line 94
    new-instance v0, Ll/p8k;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Ll/p8k;-><init>(Ll/t8k;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/t8k;->m:Lv/VImage;

    .line 103
    .line 104
    new-instance v0, Ll/q8k;

    .line 105
    .line 106
    invoke-direct {v0, p0}, Ll/q8k;-><init>(Ll/t8k;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method
