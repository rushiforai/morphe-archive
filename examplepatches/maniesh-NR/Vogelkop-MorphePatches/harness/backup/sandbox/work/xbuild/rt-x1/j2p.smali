.class public final Lj2p;
.super Lf2p;
.source "SourceFile"


# instance fields
.field public final b:Ljkp;

.field public final synthetic c:La3p;


# direct methods
.method public constructor <init>(La3p;Landroid/content/Context;)V
    .registers 5

    iput-object p1, p0, Lj2p;->c:La3p;

    invoke-direct {p0, p2}, Lf2p;-><init>(Landroid/content/Context;)V

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p2

    iget-boolean v0, p1, La3p;->h:Z

    invoke-virtual {p2, v0}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    new-instance p2, Lj4k;

    const/4 v0, 0x2

    invoke-direct {p2, v0}, Lj4k;-><init>(B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object p2

    iget-boolean p2, p2, Lz8p;->r:Z

    if-eqz p2, :cond_2e

    new-instance p2, Ljkp;

    iget-object p1, p1, La3p;->g:Lp7p;

    const-wide/16 v0, 0x1f4

    invoke-direct {p2, p0, p1, v0, v1}, Ljkp;-><init>(Landroid/view/ViewGroup;Lp7p;J)V

    iput-object p2, p0, Lj2p;->b:Ljkp;

    :cond_2e
    return-void
.end method


# virtual methods
.method public final c(Z)V
    .registers 2

    iget-object p0, p0, Lj2p;->c:La3p;

    iget-object p0, p0, La3p;->c:Lbpo;

    invoke-interface {p0, p1}, Lbpo;->a(Z)V

    return-void
.end method

.method public final d()V
    .registers 1

    iget-object p0, p0, Lj2p;->c:La3p;

    iget-object p0, p0, La3p;->i:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_12

    const/4 v1, 0x1

    if-ne v0, v1, :cond_20

    iget-object v0, p0, Lj2p;->c:La3p;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, La3p;->f0:J

    goto :goto_20

    :cond_12
    iget-object v0, p0, Lj2p;->c:La3p;

    const-wide/16 v1, -0x1

    iput-wide v1, v0, La3p;->f0:J

    iget-object v0, p0, Lj2p;->c:La3p;

    iget-object v0, v0, La3p;->g0:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_20
    :goto_20
    iget-object v0, p0, Lj2p;->b:Ljkp;

    if-eqz v0, :cond_28

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, p1}, Ljkp;->b(Landroid/view/View;Ljava/lang/String;Landroid/view/MotionEvent;)V

    :cond_28
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onAttachedToWindow()V
    .registers 5

    invoke-super {p0}, Landroid/webkit/WebView;->onAttachedToWindow()V

    iget-object v0, p0, Lj2p;->c:La3p;

    iget-object v0, v0, La3p;->g:Lp7p;

    if-eqz v0, :cond_41

    invoke-static {p0}, Lxgh;->b(Landroid/view/ViewGroup;)Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_30

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_30

    invoke-virtual {v1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_30

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-static {v1}, Lxgh;->c(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_30

    sget-object p0, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 p0, 0x3ed

    :goto_2c
    invoke-virtual {v0, p0, v2}, Lp7p;->g(ILjava/lang/String;)V

    return-void

    :cond_30
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-static {p0}, Lxgh;->c(Landroid/view/View;)Z

    move-result p0

    if-nez p0, :cond_41

    sget-object p0, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 p0, 0x3ee

    goto :goto_2c

    :cond_41
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/webkit/WebView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p0, p1, Landroid/content/res/Configuration;->orientation:I

    sget-object p0, Lito;->a:[Lito;

    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 6

    const/4 v0, 0x4

    if-ne p1, v0, :cond_14

    iget-object v0, p0, Lj2p;->c:La3p;

    iget-object v1, v0, La3p;->v:Ln2p;

    sget-object v2, Ln2p;->d:Ln2p;

    if-eq v1, v2, :cond_f

    sget-object v2, Ln2p;->e:Ln2p;

    if-ne v1, v2, :cond_14

    :cond_f
    invoke-virtual {v0}, La3p;->t()V

    const/4 p0, 0x1

    return p0

    :cond_14
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public final onLayout(ZIIII)V
    .registers 9

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    iget-object p1, p0, Lj2p;->c:La3p;

    iget-object p2, p1, La3p;->B:Landroid/graphics/Rect;

    iget-object p3, p1, La3p;->C:Landroid/graphics/Rect;

    iget-boolean p4, p1, La3p;->k:Z

    iget-object p5, p1, La3p;->v:Ln2p;

    sget-object v0, Ln2p;->f:Ln2p;

    if-ne p5, v0, :cond_16

    if-eqz p4, :cond_16

    sget-object p0, Lito;->a:[Lito;

    return-void

    :cond_16
    iget-object v0, p1, La3p;->q:Lj2p;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p0, v0, :cond_1e

    move p0, v2

    goto :goto_1f

    :cond_1e
    move p0, v1

    :goto_1f
    invoke-static {p5}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object p5, Lito;->a:[Lito;

    if-eqz p0, :cond_75

    iget-boolean p0, p1, La3p;->J:Z

    if-eqz p0, :cond_2d

    iput-boolean v1, p1, La3p;->J:Z

    return-void

    :cond_2d
    iget-object p0, p1, La3p;->v:Ln2p;

    sget-object p5, Ln2p;->b:Ln2p;

    if-eq p0, p5, :cond_37

    sget-object p5, Ln2p;->c:Ln2p;

    if-ne p0, p5, :cond_3d

    :cond_37
    invoke-virtual {p1}, La3p;->o()V

    invoke-virtual {p1}, La3p;->m()V

    :cond_3d
    iget-boolean p0, p1, La3p;->M:Z

    if-nez p0, :cond_52

    invoke-virtual {p1, v2}, La3p;->i(Z)V

    if-eqz p4, :cond_52

    invoke-static {p3, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_52

    invoke-virtual {p3, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    invoke-virtual {p1}, La3p;->w()V

    :cond_52
    iget-boolean p0, p1, La3p;->K:Z

    if-eqz p0, :cond_75

    iput-boolean v1, p1, La3p;->K:Z

    if-eqz p4, :cond_60

    sget-object p0, Ln2p;->c:Ln2p;

    iput-object p0, p1, La3p;->v:Ln2p;

    iput-boolean v2, p1, La3p;->H:Z

    :cond_60
    iget-boolean p0, p1, La3p;->L:Z

    if-nez p0, :cond_67

    invoke-virtual {p1}, La3p;->r()V

    :cond_67
    if-eqz p4, :cond_75

    const-string p0, "mraid.fireReadyEvent();"

    invoke-virtual {p1, p0}, La3p;->g(Ljava/lang/String;)V

    iget-boolean p0, p1, La3p;->w:Z

    if-eqz p0, :cond_75

    invoke-virtual {p1}, La3p;->s()V

    :cond_75
    return-void
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onVisibilityChanged(Landroid/view/View;I)V

    sget-object p1, La3p;->h0:Ljava/util/Map;

    sget-object p1, Lito;->a:[Lito;

    iget-object p0, p0, Lj2p;->c:La3p;

    iget-boolean p1, p0, La3p;->k:Z

    if-eqz p1, :cond_10

    invoke-virtual {p0, p2}, La3p;->u(I)V

    :cond_10
    return-void
.end method

.method public final onWindowVisibilityChanged(I)V
    .registers 4

    invoke-super {p0, p1}, Landroid/webkit/WebView;->onWindowVisibilityChanged(I)V

    sget-object v0, La3p;->h0:Ljava/util/Map;

    sget-object v0, Lito;->a:[Lito;

    iget-object v0, p0, Lj2p;->c:La3p;

    iget-boolean v1, v0, La3p;->k:Z

    if-eqz v1, :cond_10

    invoke-virtual {v0, p1}, La3p;->u(I)V

    :cond_10
    if-eqz p1, :cond_25

    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object p1, v0, La3p;->v:Ln2p;

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object p1, v0, La3p;->v:Ln2p;

    sget-object v0, Ln2p;->d:Ln2p;

    if-ne p1, v0, :cond_21

    return-void

    :cond_21
    invoke-virtual {p0}, Landroid/webkit/WebView;->onPause()V

    return-void

    :cond_25
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p0}, Landroid/webkit/WebView;->onResume()V

    return-void
.end method
