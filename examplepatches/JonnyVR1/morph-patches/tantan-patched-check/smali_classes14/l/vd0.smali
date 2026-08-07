.class public Ll/vd0;
.super Ll/g1e;
.source "SourceFile"


# static fields
.field public static volatile n:Ll/vd0;


# instance fields
.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ll/ye0;

.field public l:Ll/ze0;

.field public m:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/agc0;->p:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/vd0;->j:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/vd0;->I()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic E(Ll/vd0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vd0;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/vd0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vd0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/vd0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vd0;->M(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static H(Lcom/p1/mobile/android/app/Act;)Ll/vd0;
    .locals 2

    .line 1
    sget-object v0, Ll/vd0;->n:Ll/vd0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/vd0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/vd0;->n:Ll/vd0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/vd0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/vd0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/vd0;->n:Ll/vd0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Ll/vd0;->n:Ll/vd0;

    .line 27
    .line 28
    return-object p0
.end method

.method private I()V
    .locals 3

    .line 1
    new-instance v0, Ll/ye0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vd0;->j:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/ye0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/s1e;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/vd0;->k:Ll/ye0;

    .line 9
    .line 10
    new-instance v0, Ll/ze0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/vd0;->j:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/ze0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/vd0;->l:Ll/ze0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/vd0;->k:Ll/ye0;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ll/ij2;->C(Ll/iam;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/vd0;->l:Ll/ze0;

    .line 25
    .line 26
    iget-object v1, p0, Ll/vd0;->j:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v0, v1, v2}, Ll/ze0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/vd0;->m:Landroid/view/View;

    .line 38
    .line 39
    return-void
.end method

.method private J()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vd0;->l:Ll/ze0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ze0;->b:Landroid/view/View;

    .line 4
    .line 5
    new-instance v1, Ll/sd0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/sd0;-><init>(Ll/vd0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/vd0;->l:Ll/ze0;

    .line 14
    .line 15
    iget-object v0, v0, Ll/ze0;->e:Lv/VImage;

    .line 16
    .line 17
    new-instance v1, Ll/td0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/td0;-><init>(Ll/vd0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/g1e;->x()V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/ud0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/ud0;-><init>(Ll/vd0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic M(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/vd0;->k:Ll/ye0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/ye0;->m0()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/vd0;->k:Ll/ye0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ye0;->W()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public final N()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x4000000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/high16 v1, -0x80000000

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/16 v0, 0x400

    .line 32
    .line 33
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public O()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vd0;->k:Ll/ye0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ye0;->Z()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/vd0;->m:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/vd0;->N()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/vd0;->J()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
