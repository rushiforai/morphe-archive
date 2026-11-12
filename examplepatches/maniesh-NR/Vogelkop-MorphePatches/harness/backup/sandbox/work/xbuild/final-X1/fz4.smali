.class public final Lfz4;
.super Lrtn;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;Lu78;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lfz4;->c:B

    .line 9
    invoke-direct {p0, p1}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    .line 10
    iput-object p2, p0, Lfz4;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lfz4;->c:B

    iput-object p1, p0, Lfz4;->d:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    return-void
.end method


# virtual methods
.method public final didChangeThemeColor()V
    .registers 3

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_28

    return-void

    :pswitch_6
    iget-object v0, p0, Lptn;->a:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->T()I

    move-result v0

    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_16
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1, v0}, Liz4;->k(I)V

    goto :goto_16

    :cond_26
    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final didFinishNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 6

    iget-byte v0, p0, Lfz4;->c:B

    iget-object v1, p0, Lfz4;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_112

    const/4 v0, 0x0

    if-eqz p1, :cond_d

    iget-boolean p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    goto :goto_e

    :cond_d
    move p0, v0

    :goto_e
    move-object v2, v1

    check-cast v2, Lu78;

    if-eqz p0, :cond_59

    iget p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->k:I

    iget v1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->m:I

    iget-object p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->l:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, -0x17b

    if-eq p0, v3, :cond_3e

    const/16 v1, -0x76

    if-eq p0, v1, :cond_38

    const/16 v1, -0x6a

    if-eq p0, v1, :cond_38

    const/16 v1, -0xf

    if-eq p0, v1, :cond_38

    const/4 v1, -0x7

    if-eq p0, v1, :cond_38

    packed-switch p0, :pswitch_data_118

    new-instance v1, Ly88;

    invoke-direct {v1, p0, p1}, Ly88;-><init>(ILjava/lang/String;)V

    goto :goto_46

    :cond_38
    :pswitch_38
    new-instance v1, Lw88;

    invoke-direct {v1, p0, p1}, Lw88;-><init>(ILjava/lang/String;)V

    goto :goto_46

    :cond_3e
    new-instance p0, Ly88;

    const-string p1, "HTTP Error"

    invoke-direct {p0, v1, p1}, Ly88;-><init>(ILjava/lang/String;)V

    move-object v1, p0

    :goto_46
    iget-object p0, v2, Lu78;->k:Lnak;

    :cond_48
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Lz88;

    invoke-virtual {p0, p1, v1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_48

    invoke-virtual {v2, v0}, Lu78;->i(Z)V

    goto :goto_81

    :cond_59
    iget-object v3, v2, Lu78;->k:Lnak;

    :cond_5b
    invoke-virtual {v3}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object p1, p0

    check-cast p1, Lz88;

    sget-object p1, Lx88;->a:Lx88;

    invoke-virtual {v3, p0, p1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5b

    iget-object p0, v2, Lu78;->h:Lnak;

    :cond_6c
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1, v1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6c

    invoke-virtual {v2, v0}, Lu78;->i(Z)V

    :goto_81
    return-void

    :pswitch_82
    check-cast v1, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-nez v0, :cond_90

    iget-object v2, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->P:Lyqa;

    iget-object v3, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    iput-object v3, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->P:Lyqa;

    iput-object v2, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    :cond_90
    if-eqz v0, :cond_9f

    iget-object v0, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iget-boolean v2, v0, Lnp1;->b:Z

    if-nez v2, :cond_9f

    iget-object v0, v0, Lnp1;->d:Ljava/lang/Object;

    check-cast v0, Lr4h;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lr4h;->b:Z

    :cond_9f
    iget-boolean v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-eqz v0, :cond_fa

    iget v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->k:I

    const/16 v2, -0xa

    if-ne v0, v2, :cond_fa

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lr9n;->X(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_fa

    iget-object v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    iget-boolean v2, v0, Lorg/chromium/url/GURL;->b:Z

    if-eqz v2, :cond_fa

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v2

    const-string v3, "file"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_cf

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v2

    const-string v3, "opera-offline"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_fa

    :cond_cf
    iget-object v2, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->I:Ljava/util/HashSet;

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_fa

    new-instance v0, Liu2;

    const/16 v2, 0xb

    invoke-direct {v0, p0, v2}, Liu2;-><init>(Ljava/lang/Object;B)V

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt p0, v2, :cond_ee

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Liu2;->run(Ljava/lang/Object;)V

    goto :goto_fa

    :cond_ee
    iget-object p0, v1, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    new-instance v2, Ldz4;

    invoke-direct {v2, v1, v0}, Ldz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/api/Callback;)V

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v0, v2}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    :cond_fa
    :goto_fa
    iget-object p0, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_100
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_110

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, v1, p1}, Liz4;->l(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_100

    :cond_110
    return-void

    nop

    :pswitch_data_112
    .packed-switch 0x0
        :pswitch_82
    .end packed-switch

    :pswitch_data_118
    .packed-switch -0x68
        :pswitch_38
        :pswitch_38
        :pswitch_38
        :pswitch_38
        :pswitch_38
    .end packed-switch
.end method

.method public final didFirstVisuallyNonEmptyPaint()V
    .registers 3

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_10
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1, p0}, Liz4;->m(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_10

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final didStartLoading(Lorg/chromium/url/GURL;)V
    .registers 2

    iget-byte p1, p0, Lfz4;->c:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    invoke-virtual {p0}, Lnp1;->d()V

    return-void

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final didStartNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 5

    iget-byte v0, p0, Lfz4;->c:B

    const/4 v1, 0x1

    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_7c

    check-cast p0, Lu78;

    invoke-virtual {p0, v1}, Lu78;->i(Z)V

    iget-object p1, p0, Lu78;->n:Lrlh;

    iget-object p1, p1, Lrlh;->a:Lnak;

    invoke-virtual {p1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Li78;

    iget-object p1, p1, Li78;->b:Lm78;

    instance-of p1, p1, Lk78;

    if-nez p1, :cond_2e

    iget-object p0, p0, Lu78;->k:Lnak;

    :cond_1f
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lz88;

    sget-object v0, Lx88;->a:Lx88;

    invoke-virtual {p0, p1, v0}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1f

    :cond_2e
    return-void

    :pswitch_2f
    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v0, :cond_57

    sget-object v0, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    iput-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->P:Lyqa;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    invoke-virtual {v0}, Lnp1;->d()V

    sget-object v0, Lcom/opera/android/browser/chromium/ChromiumContent;->W:Lfr;

    iget v2, v0, Lfr;->c:I

    add-int/2addr v2, v1

    iput v2, v0, Lfr;->c:I

    invoke-static {v2}, Lfr;->k(I)I

    move-result v1

    iget v0, v0, Lfr;->b:I

    xor-int/2addr v1, v0

    invoke-static {v1}, Lfr;->k(I)I

    move-result v0

    iput v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->l:I

    :cond_57
    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->M:Lt59;

    const-wide/16 v1, 0x0

    iput-wide v1, v0, Lt59;->b:J

    iput-wide v1, v0, Lt59;->a:J

    invoke-virtual {v0}, Lt59;->g()V

    invoke-virtual {v0}, Lt59;->h()V

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_6b
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7b

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1, p0, p1}, Liz4;->o(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_6b

    :cond_7b
    return-void

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method

.method public final didStopLoading(Lorg/chromium/url/GURL;Z)V
    .registers 3

    iget-byte p1, p0, Lfz4;->c:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    invoke-virtual {p0}, Lnp1;->e()V

    return-void

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final h()V
    .registers 4

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_34

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-static {v0}, LJ/N;->MMzOlmu8(Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p0

    invoke-virtual {p0}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object p0

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Llb4;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Llb4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final hasEffectivelyFullscreenVideoChange(Z)V
    .registers 4

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_10
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1, p0, p1}, Liz4;->u(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    goto :goto_10

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final loadProgressChanged(F)V
    .registers 6

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    float-to-double v2, p1

    mul-double/2addr v2, v0

    double-to-int p1, v2

    iget-boolean v0, p0, Lnp1;->b:Z

    if-nez v0, :cond_34

    iget-object p0, p0, Lnp1;->d:Ljava/lang/Object;

    check-cast p0, Lr4h;

    iget v0, p0, Lr4h;->d:I

    iget v1, p0, Lr4h;->c:I

    sub-int v1, p1, v1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/2addr v1, v0

    iput v1, p0, Lr4h;->d:I

    iput p1, p0, Lr4h;->c:I

    const/16 v0, 0x50

    if-lt p1, v0, :cond_34

    const/16 p1, 0x64

    iput p1, p0, Lr4h;->c:I

    invoke-virtual {p0}, Lr4h;->a()V

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final mediaSessionCreated(Lorg/chromium/content_public/browser/MediaSession;)V
    .registers 3

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1}, Liz4;->e(Lorg/chromium/content_public/browser/MediaSession;)V

    goto :goto_10

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final mediaStartedPlaying(IZZ)V
    .registers 4

    iget-byte p1, p0, Lfz4;->c:B

    packed-switch p1, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_20

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Liz4;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_10

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final mediaStoppedPlaying(I)V
    .registers 2

    iget-byte p1, p0, Lfz4;->c:B

    packed-switch p1, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_20

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Liz4;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_10

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onVisibilityChanged(I)V
    .registers 3

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_24

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-nez p1, :cond_22

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_12
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p0}, Liz4;->L(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_12

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final primaryMainFrameRenderProcessGone(I)V
    .registers 3

    iget-byte p1, p0, Lfz4;->c:B

    packed-switch p1, :pswitch_data_3e

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->s:Z

    if-nez p1, :cond_3d

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p1, p0}, Ljz4;->n(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result p1

    if-nez p1, :cond_3d

    iget-boolean p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->q:Z

    if-eqz p1, :cond_1d

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->s:Z

    :cond_1d
    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    if-nez p1, :cond_27

    const/4 p1, 0x0

    const-string v0, ""

    invoke-virtual {p0, v0, p1, v0, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->onLanguageDetermined(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    :cond_27
    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_2d
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3d

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p0}, Liz4;->z(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_2d

    :cond_3d
    return-void

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final viewportFitChanged(I)V
    .registers 3

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_28

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->E:I

    if-eq v0, p1, :cond_26

    iput p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->E:I

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_16
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_26

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Liz4;

    invoke-virtual {p1}, Liz4;->G()V

    goto :goto_16

    :cond_26
    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final virtualKeyboardModeChanged(I)V
    .registers 3

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1}, Liz4;->K(I)V

    goto :goto_10

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final webContentsDestroyed()V
    .registers 5

    iget-byte v0, p0, Lfz4;->c:B

    packed-switch v0, :pswitch_data_20

    invoke-super {p0}, Lrtn;->webContentsDestroyed()V

    return-void

    :pswitch_9
    iget-object v0, p0, Lfz4;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    iget v2, v0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    const/4 v3, 0x0

    invoke-virtual {v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v3, v0}, Lcom/opera/android/media/MediaCaptureNotificationService;->b(Ldx3;IILjava/lang/String;)V

    invoke-super {p0}, Lrtn;->webContentsDestroyed()V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
