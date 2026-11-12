.class public abstract Lg53;
.super Lrz4;
.source "SourceFile"


# instance fields
.field public O:Lf53;


# virtual methods
.method public F0()Landroid/net/Uri;
    .registers 2

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const/16 v0, 0xa

    invoke-static {v0}, Lvep;->h(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public G0()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f140075

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public H0()Landroid/view/View;
    .registers 2

    const v0, 0x7f0a006f

    invoke-virtual {p0, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a0bba

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public I0()V
    .registers 1

    return-void
.end method

.method public J0()V
    .registers 1

    return-void
.end method

.method public K0()V
    .registers 1

    return-void
.end method

.method public L0(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public final h0()Ljava/lang/String;
    .registers 1

    const-string p0, "android.intent.action.VIEW"

    return-object p0
.end method

.method public final k0()Landroid/net/Uri;
    .registers 1

    invoke-virtual {p0}, Lg53;->F0()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public final l0(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f080522

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final m0()Ljava/lang/CharSequence;
    .registers 1

    invoke-virtual {p0}, Lg53;->G0()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public onDestroy()V
    .registers 3

    iget-object v0, p0, Lg53;->O:Lf53;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lptn;->c(Lorg/chromium/content_public/browser/WebContents;)V

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->onDestroy()V

    return-void
.end method

.method public v0()V
    .registers 4

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->v0()V

    new-instance v0, Lf53;

    iget-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lf53;-><init>(Ljava/lang/Object;Lorg/chromium/content_public/browser/WebContents;B)V

    iput-object v0, p0, Lg53;->O:Lf53;

    invoke-virtual {p0}, Lg53;->H0()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lu7;

    const/16 v2, 0xe

    invoke-direct {v1, p0, v2}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    return-void
.end method
