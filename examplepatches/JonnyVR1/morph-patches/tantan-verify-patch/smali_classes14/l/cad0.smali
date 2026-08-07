.class public Ll/cad0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ll/jbt;

.field public c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cad0;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/cad0;Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cad0;->h(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic b(Ll/cad0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cad0;->g(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cad0;->b:Ll/jbt;

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
    iget-object p0, p0, Ll/cad0;->b:Ll/jbt;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final e(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/xec0;->F0:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 13
    .line 14
    iput-object v0, p0, Ll/cad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 15
    .line 16
    new-instance v0, Ll/jbt;

    .line 17
    .line 18
    iget-object v1, p0, Ll/cad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 19
    .line 20
    invoke-direct {v0, p1, v1}, Ll/jbt;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/cad0;->b:Ll/jbt;

    .line 24
    .line 25
    new-instance p1, Ll/bad0;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Ll/bad0;-><init>(Ll/cad0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final f(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public final synthetic g(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic h(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cad0;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/cad0;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p2, p0, Ll/cad0;->d:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Ll/cad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 15
    .line 16
    iget-object v1, p0, Ll/cad0;->a:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {v0, v1, p1, p2, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/cad0;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->g()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final j(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mbs;->d()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/z9d0;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/z9d0;-><init>(Ll/cad0;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/aad0;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/aad0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/cad0;->b:Ll/jbt;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/cad0;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/cad0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Ll/cad0;->b:Ll/jbt;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cad0;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/cad0;->j(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    iget-object v0, p0, Ll/cad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 35
    .line 36
    iget-object v1, p0, Ll/cad0;->a:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    iget-object v2, p0, Ll/cad0;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1, p1, v2, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/cad0;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
