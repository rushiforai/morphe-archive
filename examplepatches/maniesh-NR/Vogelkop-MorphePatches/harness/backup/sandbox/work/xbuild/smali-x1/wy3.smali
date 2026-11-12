.class public final Lwy3;
.super Lrtn;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/FullscreenWebActivity;Lcom/opera/android/browser/WebContentsWrapper;Landroid/view/ViewGroup;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lwy3;->c:B

    iput-object p1, p0, Lwy3;->e:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    iput-object p3, p0, Lwy3;->d:Ljava/lang/Object;

    iget-object p0, p1, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;Lu78;Landroid/net/Uri;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lwy3;->c:B

    .line 18
    invoke-direct {p0, p1}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    .line 19
    iput-object p2, p0, Lwy3;->d:Ljava/lang/Object;

    .line 20
    iput-object p3, p0, Lwy3;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lxy3;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lwy3;->c:B

    iput-object p1, p0, Lwy3;->d:Ljava/lang/Object;

    iput-object p2, p0, Lwy3;->e:Ljava/lang/Object;

    .line 17
    invoke-direct {p0, p1}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    return-void
.end method


# virtual methods
.method public final didFailLoad(ZILorg/chromium/url/GURL;I)V
    .registers 5

    iget-byte p1, p0, Lwy3;->c:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Lwy3;->e:Ljava/lang/Object;

    check-cast p0, Lxy3;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lxy3;->p(Z)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final didFinishNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 7

    iget-byte v0, p0, Lwy3;->c:B

    packed-switch v0, :pswitch_data_88

    return-void

    :pswitch_6
    iget-object v0, p0, Lwy3;->e:Ljava/lang/Object;

    check-cast v0, Lxy3;

    iget-object v1, v0, Ls62;->t:Lkze;

    iget-object v2, v0, Ls62;->s:Lode;

    iget-boolean v3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->i:Z

    if-nez v3, :cond_86

    iget-object p0, p0, Lwy3;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p0

    const/4 v3, 0x0

    if-eqz p0, :cond_21

    invoke-virtual {v0, v3}, Lxy3;->p(Z)V

    goto :goto_86

    :cond_21
    iget-object p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-static {p0}, Lz5i;->b0(Lorg/chromium/url/GURL;)Z

    move-result p0

    const/4 v4, 0x0

    if-eqz p0, :cond_4c

    iget-object p0, v0, Lxy3;->K:Ll62;

    if-nez p0, :cond_36

    iget-boolean p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->v:Z

    if-eqz p0, :cond_36

    iget-boolean p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez p0, :cond_86

    :cond_36
    invoke-virtual {v2, v4}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ls62;->h()V

    invoke-virtual {v0}, Ls62;->j()V

    invoke-virtual {v0}, Lxy3;->o()V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Lxy3;->p(Z)V

    goto :goto_86

    :cond_4c
    invoke-virtual {v2, v4}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0}, Lekc;->r(Ljava/lang/Object;)V

    iget-boolean p0, v0, Ls62;->E:Z

    if-eqz p0, :cond_6a

    iget-object p0, v0, Ls62;->d:Lp12;

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Lk73;

    if-eqz p0, :cond_65

    invoke-virtual {p0}, Lk73;->o()Z

    move-result p0

    goto :goto_66

    :cond_65
    move p0, v3

    :goto_66
    if-eqz p0, :cond_6a

    iput-boolean v3, v0, Ls62;->E:Z

    :cond_6a
    iget-boolean p0, v0, Ls62;->D:Z

    if-eqz p0, :cond_83

    iput-boolean v3, v0, Ls62;->D:Z

    iget-object p0, v0, Ls62;->y:Leyi;

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0, v0}, Lekc;->q(Lndc;)V

    iget-object p0, v0, Lxy3;->I:Likc;

    invoke-virtual {p0, v0}, Lekc;->q(Lndc;)V

    iget-object p0, v0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    :cond_83
    invoke-virtual {v0, v3}, Lxy3;->p(Z)V

    :cond_86
    :goto_86
    return-void

    nop

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final didFirstVisuallyNonEmptyPaint()V
    .registers 5

    iget-byte v0, p0, Lwy3;->c:B

    packed-switch v0, :pswitch_data_1c

    return-void

    :pswitch_6
    invoke-virtual {p0}, Lwy3;->g()V

    iget-object v0, p0, Lwy3;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/FullscreenWebActivity;

    iget-object v0, v0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    new-instance v1, Lld9;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lld9;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v2, 0x10

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    return-void

    :pswitch_data_1c
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final g()V
    .registers 3

    iget-byte v0, p0, Lwy3;->c:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0}, Lrtn;->g()V

    return-void

    :pswitch_9
    invoke-super {p0}, Lrtn;->g()V

    iget-object v0, p0, Lwy3;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/FullscreenWebActivity;

    iget-object v1, v0, Lcom/opera/android/FullscreenWebActivity;->y:Lwy3;

    if-ne v1, p0, :cond_17

    const/4 p0, 0x0

    iput-object p0, v0, Lcom/opera/android/FullscreenWebActivity;->y:Lwy3;

    :cond_17
    return-void

    :pswitch_data_18
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final navigationEntryCommitted(Lorg/chromium/content_public/browser/LoadCommittedDetails;)V
    .registers 3

    iget-byte p1, p0, Lwy3;->c:B

    packed-switch p1, :pswitch_data_1e

    return-void

    :pswitch_6
    iget-object p1, p0, Lwy3;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/FullscreenWebActivity;

    iget-object v0, p1, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_1c

    iget-object p0, p0, Lwy3;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    iget-object p1, p1, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    :cond_1c
    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final primaryMainFrameRenderProcessGone(I)V
    .registers 2

    iget-byte p1, p0, Lwy3;->c:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Lwy3;->e:Ljava/lang/Object;

    check-cast p0, Lxy3;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lxy3;->p(Z)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final titleWasSet(Ljava/lang/String;)V
    .registers 5

    iget-byte p1, p0, Lwy3;->c:B

    packed-switch p1, :pswitch_data_64

    return-void

    :pswitch_6
    iget-object p1, p0, Lrtn;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-boolean v0, p1, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    move-object p1, v1

    :cond_e
    if-eqz p1, :cond_3b

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    if-eqz p1, :cond_3b

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->p()Lorg/chromium/url/GURL;

    move-result-object v0

    iget-object v2, p0, Lwy3;->e:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v2}, LJ/N;->MstQ1QcZ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    move-object p1, v1

    :cond_2c
    if-eqz p1, :cond_3b

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->n()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3b

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3b

    move-object v1, p1

    :cond_3b
    iget-object p0, p0, Lwy3;->d:Ljava/lang/Object;

    check-cast p0, Lu78;

    if-nez v1, :cond_4a

    new-instance p1, Lrxh;

    const v0, 0x7f1406d0

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    goto :goto_4f

    :cond_4a
    new-instance p1, Lqxh;

    invoke-direct {p1, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :goto_4f
    iget-object p0, p0, Lu78;->i:Lnak;

    :cond_51
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lh78;

    const/4 v2, 0x6

    invoke-static {v1, p1, v2}, Lh78;->a(Lh78;Lpxh;I)Lh78;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_51

    return-void

    :pswitch_data_64
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final webContentsDestroyed()V
    .registers 2

    iget-byte v0, p0, Lwy3;->c:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0}, Lrtn;->webContentsDestroyed()V

    return-void

    :pswitch_9
    invoke-super {p0}, Lrtn;->webContentsDestroyed()V

    invoke-virtual {p0}, Lwy3;->g()V

    return-void

    :pswitch_data_10
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method
