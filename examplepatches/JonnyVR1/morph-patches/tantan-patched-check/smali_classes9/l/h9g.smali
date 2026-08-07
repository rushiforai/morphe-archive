.class public Ll/h9g;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/l9g;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

.field public m:Lv/VImage;

.field public n:Lv/VImage;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/l9g;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->n3:I

    .line 2
    .line 3
    const v1, 0x3e99999a    # 0.3f

    .line 4
    .line 5
    .line 6
    invoke-static {v1}, Ll/qag0;->c(F)Ll/rq2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic F(Ll/h9g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h9g;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/h9g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h9g;->K(Landroid/view/View;)V

    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/l9g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l9g;->k4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/l9g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l9g;->o4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/l9g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i9g;->a(Ll/h9g;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Ll/l9g;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h9g;->l:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public M(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/h9g;->m:Lv/VImage;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/h9g;->n:Lv/VImage;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/l9g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h9g;->I(Ll/l9g;)V

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
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/h9g;->H(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 5
    .line 6
    check-cast p1, Ll/l9g;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/l9g;->n4()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/h9g;->l:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 14
    .line 15
    check-cast v0, Ll/l9g;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/tk2;->b4()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->d(Ljava/util/List;Ll/y8s;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/h9g;->m:Lv/VImage;

    .line 27
    .line 28
    new-instance v0, Ll/f9g;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/f9g;-><init>(Ll/h9g;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/h9g;->n:Lv/VImage;

    .line 37
    .line 38
    new-instance v0, Ll/g9g;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/g9g;-><init>(Ll/h9g;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/h9g;->l:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 61
    .line 62
    iget-object p0, p0, Ll/h9g;->l:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/l9g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h9g;->I(Ll/l9g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
