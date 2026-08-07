.class public Ll/zm80;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

.field public j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public k:Z

.field public l:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/q260;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/zm80;->k:Z

    .line 6
    .line 7
    new-instance p1, Ljava/util/LinkedList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/zm80;->l:Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic J3(Ll/zm80;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm80;->S3(Ll/q260;)V

    return-void
.end method

.method public static synthetic K3(Ll/zm80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zm80;->R3()V

    return-void
.end method

.method public static synthetic L3(Ll/zm80;Ll/a260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm80;->T3(Ll/a260;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/zm80;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm80;->X3(Ll/q260;)V

    return-void
.end method

.method private U3()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/zm80;->k:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->destroy()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->getPresenter()Ll/i6t;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->getPresenter()Ll/i6t;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/l6t;->C2(Ll/l6t;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 41
    .line 42
    iget-object v1, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/zm80;->Y3()V

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public final N3(Ll/q260;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/q260;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/zm80;->l:Ljava/util/LinkedList;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Ll/q260;->l()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object p0, p0, Ll/zm80;->l:Ljava/util/LinkedList;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final O3(Ll/q260;)Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/q260;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;

    .line 8
    .line 9
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-object p1

    .line 15
    :cond_0
    invoke-virtual {p1}, Ll/q260;->l()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;

    .line 22
    .line 23
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BoostStartView;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    return-object p1

    .line 29
    :cond_1
    invoke-virtual {p1}, Ll/q260;->j()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;

    .line 36
    .line 37
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_2
    invoke-virtual {p1}, Ll/q260;->m()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const/4 v0, 0x0

    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/ticketAnim/view/UserAnchorTicketView;

    .line 51
    .line 52
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/ticketAnim/view/UserAnchorTicketView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    .line 56
    .line 57
    return-object p1

    .line 58
    :cond_3
    return-object v0
.end method

.method public P3()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zm80;->l:Ljava/util/LinkedList;

    .line 2
    .line 3
    new-instance v0, Ll/xm80;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/xm80;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final synthetic R3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/zm80;->j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 23
    .line 24
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p0, Landroid/view/View;

    .line 27
    .line 28
    invoke-static {p0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->q0(Ll/bnl0$g;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic S3(Ll/q260;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zm80;->U3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T3(Ll/a260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zm80;->P3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public V3(Ll/q260;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1}, Ll/zm80;->O3(Ll/q260;)Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-interface {v1, v2, v3}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 24
    .line 25
    iput-object v1, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 26
    .line 27
    iget-object v2, p0, Ll/xzs;->e:Ll/dum;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->n0(Ll/dum;)Ll/i6t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v2, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->j0(Ll/i6t;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->setOperationPlace(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->o0(Ll/q260;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 52
    .line 53
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->i0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ll/q260;->c()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    iput-boolean p1, p0, Ll/zm80;->k:Z

    .line 68
    .line 69
    :cond_1
    invoke-virtual {p0}, Ll/zm80;->W3()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public W3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->p0()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/ym80;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/ym80;-><init>(Ll/zm80;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/zm80;->j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 12
    .line 13
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, Ll/zm80;->j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final X3(Ll/q260;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/q260;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/zm80;->N3(Ll/q260;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/zm80;->Y3()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/zm80;->V3(Ll/q260;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final Y3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zm80;->l:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/zm80;->k:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/zm80;->l:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/q260;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/zm80;->V3(Ll/q260;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->destroy()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/zm80;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p0, Ll/zm80;->l:Ljava/util/LinkedList;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->boostStart()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/um80;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/um80;-><init>(Ll/zm80;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->boostStartEnd()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/vm80;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/vm80;-><init>(Ll/zm80;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/wm80;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/wm80;-><init>(Ll/zm80;)V

    .line 71
    .line 72
    .line 73
    const-class v1, Ll/a260;

    .line 74
    .line 75
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
