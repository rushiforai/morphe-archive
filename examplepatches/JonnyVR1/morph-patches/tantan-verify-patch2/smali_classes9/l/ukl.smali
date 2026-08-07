.class public Ll/ukl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lll;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/lll;

.field public b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public c:Ll/evl;

.field public final d:Ll/uhl;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ukl$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ukl$a;-><init>(Ll/ukl;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ukl;->d:Ll/uhl;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/ukl;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ukl;->l(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/ukl;)Ll/evl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ukl;->c:Ll/evl;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/ukl;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ukl;->i()I

    move-result p0

    return p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ukl;->a:Ll/lll;

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

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ukl;->a:Ll/lll;

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

.method public d(Ll/lll;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ukl;->a:Ll/lll;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ukl;->q()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ukl;->e()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/evl;->onDestroy()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ukl;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ll/evl;->I(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ukl;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ll/evl;->G()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final f()Ll/evl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ukl;->c:Ll/evl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ll/vhl;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/vhl;-><init>()V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final i()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/evl;->getDialogViewHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lll;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ukl;->d(Ll/lll;)V

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

.method public final j()Ll/evl;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ukl;->C0()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget v0, Ll/yec0;->c2:I

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/evl;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/ukl;->C0()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget v0, Ll/yec0;->d2:I

    .line 35
    .line 36
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/evl;

    .line 41
    .line 42
    return-object p0
.end method

.method public k()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ukl;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ukl;->C0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ukl;->j()Ll/evl;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, p0, Ll/ukl;->c:Ll/evl;

    .line 17
    .line 18
    new-instance v1, Ll/c0s;

    .line 19
    .line 20
    iget-object v2, p0, Ll/ukl;->a:Ll/lll;

    .line 21
    .line 22
    iget-object v3, p0, Ll/ukl;->c:Ll/evl;

    .line 23
    .line 24
    invoke-interface {v3, v0}, Ll/evl;->g(Landroid/content/Context;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Ll/ukl;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 32
    .line 33
    new-instance v0, Ll/tkl;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/tkl;-><init>(Ll/ukl;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/ukl;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->HOUR_LEADER_BOARD:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/ukl;->c:Ll/evl;

    .line 49
    .line 50
    iget-object p0, p0, Ll/ukl;->d:Ll/uhl;

    .line 51
    .line 52
    invoke-interface {v0, p0}, Ll/evl;->K(Ll/uhl;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic l(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ukl;->c:Ll/evl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/evl;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/evl;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/evl;->Y(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/evl;->H(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ukl;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/evl;->i()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ukl;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ukl;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/ukl;->f()Ll/evl;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-interface {v0, v1}, Ll/evl;->I(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ukl;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
