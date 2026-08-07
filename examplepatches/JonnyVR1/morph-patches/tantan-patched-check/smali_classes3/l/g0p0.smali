.class public Ll/g0p0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/g0p0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/k1p0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VDraweeView;

.field public l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

.field public m:Lv/VImage;

.field public n:Ll/k1p0;

.field public o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

.field public p:Ll/ixo0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/k1p0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->ua:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ll/qag0;->e(Z)Ll/rq2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic F(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G(Ll/g0p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g0p0;->K(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V

    return-void
.end method

.method public static synthetic H(Ll/g0p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/g0p0;->L(Landroid/view/View;)V

    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 2
    .line 3
    new-instance v1, Ll/nwo0$a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/nwo0$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/g0p0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 18
    .line 19
    iget-object v2, p0, Ll/g0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->f(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/g0p0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 25
    .line 26
    new-instance v2, Ll/g0p0$a;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Ll/g0p0$a;-><init>(Ll/g0p0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->z(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$c;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/g0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 35
    .line 36
    iget-object v2, p0, Ll/g0p0;->p:Ll/ixo0;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/g0p0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->y(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g0p0;->n:Ll/k1p0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h0p0;->a(Ll/g0p0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/k1p0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g0p0;->n:Ll/k1p0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->pageSchema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/g0p0;->n:Ll/k1p0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/16 v1, 0x464

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->pageSchema:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/g0p0;->n:Ll/k1p0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/k1p0;->d4()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public M(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g0p0;->p:Ll/ixo0;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/ixo0;->f0(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/g0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k1p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g0p0;->J(Ll/k1p0;)V

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
    .locals 8

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/g0p0;->I(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/g0p0;->k:Lv/VDraweeView;

    .line 8
    .line 9
    sget-object v0, Ll/zft;->I:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "context_livingAct"

    .line 12
    .line 13
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/g0p0;->k:Lv/VDraweeView;

    .line 17
    .line 18
    const/high16 p1, 0x41800000    # 16.0f

    .line 19
    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    neg-int v6, v0

    .line 25
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    const/4 v3, 0x0

    .line 30
    const/4 v4, 0x0

    .line 31
    const/4 v5, 0x0

    .line 32
    invoke-static/range {v2 .. v7}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/ixo0;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/ixo0;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/g0p0;->p:Ll/ixo0;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/g0p0;->r()V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/g0p0;->p:Ll/ixo0;

    .line 46
    .line 47
    new-instance v0, Ll/d0p0;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/d0p0;-><init>(Ll/g0p0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/ixo0;->g0(Ll/y20;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/g0p0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 56
    .line 57
    new-instance v0, Ll/e0p0;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/e0p0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->A(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/g0p0;->m:Lv/VImage;

    .line 66
    .line 67
    new-instance v0, Ll/f0p0;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/f0p0;-><init>(Ll/g0p0;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k1p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g0p0;->J(Ll/k1p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/g0p0;->n:Ll/k1p0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/k1p0;->u4()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public x()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->x()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/g0p0;->n:Ll/k1p0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/k1p0;->t4()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
