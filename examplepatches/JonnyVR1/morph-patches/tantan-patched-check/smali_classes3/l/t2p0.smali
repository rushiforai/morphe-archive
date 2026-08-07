.class public Ll/t2p0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/kyo0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VImage;

.field public l:Lv/VLinear;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Landroid/view/View;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/kyo0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->Ca:I

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

.method public static synthetic F(Ll/t2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t2p0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/t2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t2p0;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/t2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t2p0;->L(Landroid/view/View;)V

    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
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

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 5
    .line 6
    check-cast p1, Ll/kyo0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/t2p0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/kyo0;->X4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u2p0;->a(Ll/t2p0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/kyo0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/t2p0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kyo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t2p0;->J(Ll/kyo0;)V

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
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/t2p0;->I(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/t2p0;->k:Lv/VImage;

    .line 8
    .line 9
    new-instance v0, Ll/q2p0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/q2p0;-><init>(Ll/t2p0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/t2p0;->q:Lv/VText;

    .line 18
    .line 19
    new-instance v0, Ll/r2p0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/r2p0;-><init>(Ll/t2p0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/t2p0;->p:Lv/VText;

    .line 28
    .line 29
    new-instance v0, Ll/s2p0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/s2p0;-><init>(Ll/t2p0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kyo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t2p0;->J(Ll/kyo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
