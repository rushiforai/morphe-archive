.class public Ll/ats;
.super Ll/bts;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/bts<",
        "Ll/yuk;",
        "Ll/lsw;",
        ">;"
    }
.end annotation


# instance fields
.field public g:Ll/kuk;

.field public h:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bts;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ats;->h:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic w(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ats;->E(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/ats;->F(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bts;->v()Landroid/widget/FrameLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public B()Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/yuk;

    .line 4
    .line 5
    iget-object p0, p0, Ll/yuk;->q:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 6
    .line 7
    return-object p0
.end method

.method public final C()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/yuk;

    .line 5
    .line 6
    iget-object v1, v1, Ll/yuk;->q:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 7
    .line 8
    check-cast v0, Ll/yuk;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-string v0, "potentialGuard"

    .line 17
    .line 18
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    const-string v0, "onlineGuard"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/ats;->M()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p0}, Ll/ats;->O()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    move-object p4, p0

    .line 4
    check-cast p4, Ll/yuk;

    .line 5
    .line 6
    check-cast p0, Ll/yuk;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yuk;->t4()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p4, p1, p2, p0}, Ll/yuk;->L4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->O()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/mdc0;->G4:I

    .line 2
    .line 3
    invoke-virtual {p5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VText;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->m5:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/yss;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1, p2, p3}, Ll/yss;-><init>(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    sget p2, Ll/mdc0;->f0:I

    .line 23
    .line 24
    invoke-virtual {p5, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lv/VText;

    .line 29
    .line 30
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/zss;

    .line 36
    .line 37
    invoke-direct {v0, p3}, Ll/zss;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-nez p2, :cond_0

    .line 48
    .line 49
    sget p2, Ll/mdc0;->d2:I

    .line 50
    .line 51
    invoke-virtual {p5, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    check-cast p2, Lv/VDraweeView;

    .line 56
    .line 57
    const-string p3, "context_single_room"

    .line 58
    .line 59
    invoke-static {p3, p2, p4}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    sget p2, Ll/mdc0;->w2:I

    .line 63
    .line 64
    invoke-virtual {p5, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    check-cast p2, Lv/VText;

    .line 69
    .line 70
    invoke-virtual {p0, p1, p2}, Ll/ats;->L(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Lv/VText;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/yuk;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/yuk;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/yuk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yuk;->I4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast v0, Ll/yuk;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/yuk;->z4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "renew_power"

    .line 12
    .line 13
    :goto_0
    move-object v4, v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const-string v0, "become_knight"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 19
    .line 20
    check-cast v0, Ll/yuk;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 27
    .line 28
    check-cast v1, Ll/yuk;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/yuk;->t4()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, v1, v4}, Ll/z1r;->b(Ll/oo2;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance v5, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 40
    .line 41
    sget v1, Ll/yec0;->f5:I

    .line 42
    .line 43
    invoke-static {}, Ll/qag0;->g()Ll/rq2;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-direct {v5, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Ll/xzs;ILl/rq2;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/xss;

    .line 51
    .line 52
    move-object v2, p0

    .line 53
    move-object v3, p1

    .line 54
    move-object v6, p2

    .line 55
    invoke-direct/range {v1 .. v6}, Ll/xss;-><init>(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v5, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h0(Ll/y20;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public J(Ll/lsw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ats;->g:Ll/kuk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kuk;->A(Ll/lsw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/yuk;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/yuk;->n4(Ll/y20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Lv/VText;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast v0, Ll/yuk;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/yuk;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 12
    .line 13
    check-cast v0, Ll/yuk;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/yuk;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->t5:I

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 22
    .line 23
    check-cast v2, Ll/yuk;

    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ll/yuk;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    mul-int/2addr v2, v0

    .line 30
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 39
    .line 40
    check-cast p0, Ll/yuk;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/yuk;->z4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-static {p1, p0}, Ll/fvk;->o(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Z)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    filled-new-array {p1, v1}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p0, p1}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0, v1}, Ll/fvk;->q(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public M()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Ll/ats;->h:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/bts;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ll/ats;->h:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/bts;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/ats;->h:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/bts;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 5
    .line 6
    invoke-virtual {p0, v0, v0}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public init()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->init()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kuk;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 7
    .line 8
    check-cast v1, Ll/yuk;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/xzs;->L2()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-direct {v0, p0, v1}, Ll/kuk;-><init>(Ll/ats;Z)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/ats;->g:Ll/kuk;

    .line 18
    .line 19
    iget-object v1, p0, Ll/bts;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/bts;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ats;->C()V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/wss;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/wss;-><init>(Ll/ats;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->s(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/bts;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/bts;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget v0, p0, Ll/ats;->h:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ats;->O()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/ats;->j()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
