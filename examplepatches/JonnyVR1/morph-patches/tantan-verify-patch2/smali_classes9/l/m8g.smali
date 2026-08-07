.class public Ll/m8g;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/d9g;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/widget/FrameLayout;

.field public l:Lv/VImage;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

.field public o:Lv/VText;

.field public p:Landroidx/recyclerview/widget/RecyclerView;

.field public q:Lv/VText;

.field public final r:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/d9g;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->m3:I

    .line 2
    .line 3
    invoke-static {}, Ll/qag0;->b()Ll/rq2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 11
    .line 12
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/m8g;->r:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic F(Ll/m8g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m8g;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/m8g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m8g;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Ll/zds;
    .locals 2

    .line 1
    new-instance v0, Ll/zds;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Ll/zds;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic I(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic J(Ll/m8g;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m8g;->O(Ll/ruf0;)V

    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/d9g;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/d9g;->t4()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->q(Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n8g;->a(Ll/m8g;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L(Ll/d9g;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic O(Ll/ruf0;)V
    .locals 4

    .line 1
    instance-of v0, p1, Ll/oag;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/oag;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/oag;->b()Landroid/graphics/Bitmap;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/oag;->b()Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-float v1, v1

    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    mul-float/2addr v1, v2

    .line 30
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    int-to-float v0, v0

    .line 35
    div-float/2addr v1, v0

    .line 36
    iget-object v0, p0, Ll/m8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->i:Lv/VImage;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    int-to-float v0, v0

    .line 45
    mul-float/2addr v1, v0

    .line 46
    float-to-int v0, v1

    .line 47
    iget-object v1, p0, Ll/m8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->i:Lv/VImage;

    .line 50
    .line 51
    const/4 v2, 0x1

    .line 52
    new-array v2, v2, [Landroid/view/View;

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    aput-object v1, v2, v3

    .line 56
    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object p0, p0, Ll/m8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->i:Lv/VImage;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    return-void
.end method

.method public Q()V
    .locals 0

    .line 1
    return-void
.end method

.method public R(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->j0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/m8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->setSettingButtonVisibility(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/u8n;->a()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iget-object p0, p0, Ll/m8g;->q:Lv/VText;

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->C3:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->P3:I

    .line 30
    .line 31
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->B3:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->O3:I

    .line 45
    .line 46
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public T(Ll/a8g;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/m8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->memberCount:I

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->k0(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->summary:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;->rankInfo:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Ll/m8g;->o:Lv/VText;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;->rankInfo:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p1, p1, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->icons:Ljava/util/List;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/m8g;->V(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public U(Ll/cm0;Ll/a8g;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p2, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->defaultMedal:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->grade:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p2, 0x1

    .line 15
    :goto_0
    iget-object v0, p1, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p1, p1, Ll/cm0;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p2, v0, p1}, Ll/vag;->i(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 26
    .line 27
    check-cast p2, Ll/d9g;

    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Ll/j8g;

    .line 34
    .line 35
    invoke-direct {p2, p0}, Ll/j8g;-><init>(Ll/m8g;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/k8g;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/k8g;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public final V(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x3

    .line 7
    if-lt v0, v2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v2, v1

    .line 22
    :goto_0
    iget-object v0, p0, Ll/m8g;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    new-instance v3, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-direct {v3, v4, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/l8g;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/l8g;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ll/m8g;->r:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 46
    .line 47
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/m8g;->r:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/d9g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m8g;->L(Ll/d9g;)V

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
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/m8g;->K(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/m8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->l0(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/m8g;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    iget-object v0, p0, Ll/m8g;->r:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/m8g;->q:Lv/VText;

    .line 21
    .line 22
    new-instance v0, Ll/h8g;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/h8g;-><init>(Ll/m8g;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 v1, 0x5dc

    .line 28
    .line 29
    invoke-static {p1, v0, v1, v2}, Ll/ynp0;->F(Landroid/view/View;Landroid/view/View$OnClickListener;J)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/m8g;->l:Lv/VImage;

    .line 33
    .line 34
    new-instance v0, Ll/i8g;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/i8g;-><init>(Ll/m8g;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/d9g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m8g;->L(Ll/d9g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
