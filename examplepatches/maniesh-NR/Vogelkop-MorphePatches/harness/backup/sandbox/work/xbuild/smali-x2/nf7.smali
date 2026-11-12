.class public final Lnf7;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Lx77;

.field public final k:Lre7;

.field public final l:Lbf7;

.field public final m:Lg1j;

.field public final n:Ljv0;


# direct methods
.method public constructor <init>(Lre7;Lx77;Lg1j;Ljv0;)V
    .registers 7

    invoke-direct {p0}, Lo73;-><init>()V

    new-instance v0, Lbf7;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lbf7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lnf7;->l:Lbf7;

    iput-object p1, p0, Lnf7;->k:Lre7;

    iput-object p2, p0, Lnf7;->j:Lx77;

    iput-object p3, p0, Lnf7;->m:Lg1j;

    iput-object p4, p0, Lnf7;->n:Ljv0;

    return-void
.end method

.method public static q(ILandroid/view/Menu;)V
    .registers 2

    invoke-interface {p1, p0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 12

    const p2, 0x7f100015

    invoke-virtual {p1, p2}, Lr9i;->L(I)V

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    iget-object p2, p0, Lnf7;->l:Lbf7;

    iget-object v0, p0, Lnf7;->k:Lre7;

    iget-object v1, v0, Lre7;->u:Lh7f;

    invoke-virtual {v1, p2}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p2, v0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->getUrl()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lwqm;->r(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {v0}, Lre7;->k()Z

    move-result v1

    const/4 v2, 0x0

    const v3, 0x7f0a0312

    const v4, 0x7f0a0317

    if-eqz v1, :cond_34

    invoke-static {v0}, Lrf7;->g(Lre7;)Lo29;

    move-result-object v1

    invoke-virtual {v1}, Lo29;->d()Z

    move-result v1

    if-nez v1, :cond_3e

    :cond_34
    invoke-static {v4, p1}, Lnf7;->q(ILandroid/view/Menu;)V

    invoke-virtual {p1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_3e
    const v1, 0x7f0a031a

    if-eqz p2, :cond_50

    const p2, 0x7f0a0314

    invoke-static {p2, p1}, Lnf7;->q(ILandroid/view/Menu;)V

    invoke-virtual {p1, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    invoke-interface {p2, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_50
    invoke-virtual {v0}, Lre7;->k()Z

    move-result p2

    const v5, 0x7f0a0316

    const v6, 0x7f0a0318

    if-nez p2, :cond_77

    invoke-static {v6, p1}, Lnf7;->q(ILandroid/view/Menu;)V

    invoke-virtual {p1, v5}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    invoke-interface {p2, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const p2, 0x7f0a0319

    invoke-virtual {p1, p2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    invoke-interface {p2, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-virtual {p1, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    invoke-interface {p2, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_77
    const p2, 0x7f0a0323

    iget-object v7, p0, Lnf7;->m:Lg1j;

    if-eqz v7, :cond_8a

    invoke-virtual {v0}, Lre7;->k()Z

    move-result v8

    if-eqz v8, :cond_8a

    invoke-interface {v7}, Lg1j;->isEnabled()Z

    move-result v7

    if-nez v7, :cond_8d

    :cond_8a
    invoke-static {p2, p1}, Lnf7;->q(ILandroid/view/Menu;)V

    :cond_8d
    iget-object p0, p0, Lnf7;->n:Ljv0;

    if-eqz p0, :cond_a3

    invoke-virtual {v0}, Lre7;->k()Z

    move-result v7

    if-eqz v7, :cond_a3

    invoke-interface {p0}, Ljv0;->v()Z

    move-result p0

    if-eqz p0, :cond_a3

    invoke-static {v0}, Ljg7;->a(Lre7;)Lu92;

    move-result-object p0

    if-nez p0, :cond_a9

    :cond_a3
    const p0, 0x7f0a0313

    invoke-static {p0, p1}, Lnf7;->q(ILandroid/view/Menu;)V

    :cond_a9
    invoke-virtual {v0}, Lre7;->n()Z

    move-result p0

    if-eqz p0, :cond_d5

    invoke-static {v4, p1}, Lnf7;->q(ILandroid/view/Menu;)V

    invoke-virtual {p1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-virtual {p1, v5}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-virtual {p1, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-virtual {p1, v6}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-virtual {p1, p2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_d5
    return-void
.end method

.method public final onDismiss()V
    .registers 3

    invoke-super {p0}, Lo73;->onDismiss()V

    iget-object v0, p0, Lnf7;->k:Lre7;

    iget-object v1, p0, Lnf7;->l:Lbf7;

    invoke-virtual {v0, v1}, Lre7;->t(Lqe7;)V

    iget-object p0, p0, Lnf7;->j:Lx77;

    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 10

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0316

    iget-object v4, p0, Lnf7;->k:Lre7;

    iget-object v2, p0, Lnf7;->j:Lx77;

    const/4 v6, 0x1

    if-ne v0, v1, :cond_35

    iget-object p0, v2, Lx77;->d:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, Ljg7;

    iget-object p0, v3, Ljg7;->i:Lorm;

    invoke-virtual {v4}, Lre7;->c()Lnc0;

    move-result-object p1

    check-cast p0, Lx5f;

    sget-object v0, Loc0;->g:Loc0;

    invoke-virtual {p0, v0, p1}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object p0, v3, Ljg7;->a:Lwg7;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    new-instance v2, Lgg7;

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lgg7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    new-instance p0, Lhg7;

    invoke-direct {p0, v3, v5, v6}, Lhg7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    invoke-static {v5, v4, v2, p0}, Ljg7;->b(Landroid/content/Context;Lre7;Ljava/lang/Runnable;Lue7;)V

    return v6

    :cond_35
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0314

    if-ne v0, v1, :cond_63

    iget-object p0, v4, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->getUrl()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v2, Lx77;->d:Ljava/lang/Object;

    check-cast p1, Ljg7;

    iget-object v0, p1, Ljg7;->i:Lorm;

    iget-object v1, v2, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Lre7;

    invoke-virtual {v1}, Lre7;->c()Lnc0;

    move-result-object v1

    check-cast v0, Lx5f;

    sget-object v2, Loc0;->h:Loc0;

    invoke-virtual {v0, v2, v1}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object p1, p1, Ljg7;->a:Lwg7;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p0}, Llcp;->m(Landroid/content/Context;Ljava/lang/String;)V

    return v6

    :cond_63
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a031a

    if-ne v0, v1, :cond_93

    iget-object p0, v2, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljg7;

    iget-object p1, p0, Ljg7;->i:Lorm;

    invoke-virtual {v4}, Lre7;->c()Lnc0;

    move-result-object v0

    check-cast p1, Lx5f;

    sget-object v1, Loc0;->i:Loc0;

    invoke-virtual {p1, v1, v0}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object p1, p0, Ljg7;->a:Lwg7;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lgl6;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v4, p1, v1}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lig7;

    invoke-direct {v1, p0}, Lig7;-><init>(Ljg7;)V

    invoke-static {p1, v4, v0, v1}, Ljg7;->b(Landroid/content/Context;Lre7;Ljava/lang/Runnable;Lue7;)V

    return v6

    :cond_93
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0318

    const/4 v3, 0x0

    if-ne v0, v1, :cond_ba

    iget-object p0, v2, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljg7;

    iget-object p1, p0, Ljg7;->i:Lorm;

    iget-object v0, v2, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Lre7;

    invoke-virtual {v0}, Lre7;->c()Lnc0;

    move-result-object v1

    check-cast p1, Lx5f;

    sget-object v2, Loc0;->d:Loc0;

    invoke-virtual {p1, v2, v1}, Lx5f;->O(Loc0;Lnc0;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1, v3}, Ljg7;->g(Ljava/util/List;Z)V

    return v6

    :cond_ba
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0319

    const/16 v5, 0x8

    if-ne v0, v1, :cond_fd

    iget-object p0, v2, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljg7;

    iget-object p1, p0, Ljg7;->i:Lorm;

    iget-object v0, v2, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Lre7;

    invoke-virtual {v0}, Lre7;->c()Lnc0;

    move-result-object v1

    check-cast p1, Lx5f;

    sget-object v2, Loc0;->l:Loc0;

    invoke-virtual {p1, v2, v1}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object p1, p0, Ljg7;->a:Lwg7;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    if-eqz p1, :cond_267

    new-instance v1, Lbg7;

    new-instance v2, La32;

    invoke-direct {v2, p0, p1, v0, v5}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v0, v2}, Lbg7;-><init>(Lre7;La32;)V

    const-string p0, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v1, p1}, Lr22;->b(Ljjm;Lijm;)V

    return v6

    :cond_fd
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0315

    if-ne v0, v1, :cond_123

    iget-object p0, v2, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljg7;

    iget-object p1, p0, Ljg7;->i:Lorm;

    iget-object v0, v2, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Lre7;

    invoke-virtual {v0}, Lre7;->c()Lnc0;

    move-result-object v1

    check-cast p1, Lx5f;

    sget-object v2, Loc0;->f:Loc0;

    invoke-virtual {p1, v2, v1}, Lx5f;->O(Loc0;Lnc0;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1, v6}, Ljg7;->g(Ljava/util/List;Z)V

    return v6

    :cond_123
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0323

    if-ne v0, v1, :cond_132

    iget-object p0, p0, Lnf7;->m:Lg1j;

    invoke-interface {p0, v4}, Lg1j;->t(Lre7;)V

    return v6

    :cond_132
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a0317

    if-ne p0, v0, :cond_1b5

    iget-object p0, v2, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljg7;

    iget-object p0, p0, Ljg7;->i:Lorm;

    iget-object p1, v2, Lx77;->b:Ljava/lang/Object;

    check-cast p1, Lre7;

    invoke-virtual {p1}, Lre7;->c()Lnc0;

    move-result-object v0

    check-cast p0, Lx5f;

    sget-object v1, Loc0;->j:Loc0;

    invoke-virtual {p0, v1, v0}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object p0, v2, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object p0

    new-instance v0, Legd;

    invoke-direct {v0, p1}, Legd;-><init>(Lre7;)V

    filled-new-array {v0}, [Legd;

    move-result-object p1

    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v1, v0, Lgk9;->b:Lgig;

    invoke-interface {v1}, Lgig;->getShuffleModeEnabled()Z

    move-result v1

    if-eqz v1, :cond_1ab

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move v2, v3

    :goto_17d
    invoke-virtual {v0}, Lgk9;->p()I

    move-result v4

    if-ge v2, v4, :cond_18d

    invoke-virtual {v0, v2}, Lgk9;->Q(I)Lqjd;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_17d

    :cond_18d
    invoke-static {v0}, Lw7d;->C(Lgig;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0}, Lgk9;->getShuffleModeEnabled()Z

    move-result v4

    if-eqz v4, :cond_1ab

    new-instance v4, Levc;

    invoke-direct {v4, v1, v2}, Levc;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-static {v4, v6}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v1

    new-instance v2, Lqie;

    invoke-direct {v2, p0, v5}, Lqie;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lj87;->a(Lsic;)V

    invoke-virtual {v0, v3}, Lgk9;->setShuffleModeEnabled(Z)V

    :cond_1ab
    new-instance v0, Lkjg;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lkjg;-><init>(Ltjg;B)V

    invoke-virtual {p0, p1, v0}, Ltjg;->e([Legd;Lk37;)V

    return v6

    :cond_1b5
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a0312

    if-ne p0, v0, :cond_237

    iget-object p0, v2, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljg7;

    iget-object p0, p0, Ljg7;->i:Lorm;

    iget-object p1, v2, Lx77;->b:Ljava/lang/Object;

    check-cast p1, Lre7;

    invoke-virtual {p1}, Lre7;->c()Lnc0;

    move-result-object v0

    check-cast p0, Lx5f;

    sget-object v1, Loc0;->k:Loc0;

    invoke-virtual {p0, v1, v0}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object p0, v2, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object p0

    new-instance v0, Legd;

    invoke-direct {v0, p1}, Legd;-><init>(Lre7;)V

    filled-new-array {v0}, [Legd;

    move-result-object p1

    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v1, v0, Lgk9;->b:Lgig;

    invoke-interface {v1}, Lgig;->getShuffleModeEnabled()Z

    move-result v1

    if-eqz v1, :cond_22e

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move v2, v3

    :goto_200
    invoke-virtual {v0}, Lgk9;->p()I

    move-result v4

    if-ge v2, v4, :cond_210

    invoke-virtual {v0, v2}, Lgk9;->Q(I)Lqjd;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_200

    :cond_210
    invoke-static {v0}, Lw7d;->C(Lgig;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0}, Lgk9;->getShuffleModeEnabled()Z

    move-result v4

    if-eqz v4, :cond_22e

    new-instance v4, Levc;

    invoke-direct {v4, v1, v2}, Levc;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-static {v4, v6}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v1

    new-instance v2, Lqie;

    invoke-direct {v2, p0, v5}, Lqie;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lj87;->a(Lsic;)V

    invoke-virtual {v0, v3}, Lgk9;->setShuffleModeEnabled(Z)V

    :cond_22e
    new-instance v0, Lkjg;

    invoke-direct {v0, p0, v3}, Lkjg;-><init>(Ltjg;B)V

    invoke-virtual {p0, p1, v0}, Ltjg;->e([Legd;Lk37;)V

    return v6

    :cond_237
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const p1, 0x7f0a0313

    if-ne p0, p1, :cond_268

    iget-object p0, v2, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljg7;

    invoke-static {v4}, Ljg7;->a(Lre7;)Lu92;

    move-result-object p1

    if-eqz p1, :cond_267

    iget-object v0, p0, Ljg7;->i:Lorm;

    invoke-virtual {v4}, Lre7;->c()Lnc0;

    move-result-object v1

    check-cast v0, Lx5f;

    sget-object v2, Loc0;->m:Loc0;

    invoke-virtual {v0, v2, v1}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object v0, p0, Ljg7;->a:Lwg7;

    invoke-virtual {v0}, Lryl;->g0()V

    iget-object p0, p0, Ljg7;->h:Ljv0;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    sget-object v0, Lx92;->b:Lx92;

    invoke-interface {p0, p1, v0}, Ljv0;->j(Ljava/util/List;Lx92;)V

    :cond_267
    return v6

    :cond_268
    return v3
.end method
