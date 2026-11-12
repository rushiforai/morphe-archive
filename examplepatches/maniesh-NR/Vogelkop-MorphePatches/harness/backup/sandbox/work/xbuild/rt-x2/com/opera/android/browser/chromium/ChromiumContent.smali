.class public final Lcom/opera/android/browser/chromium/ChromiumContent;
.super Lcom/opera/android/browser/WebContentsWrapper;
.source "SourceFile"


# static fields
.field public static final V:Lorg/chromium/url/GURL;

.field public static final W:Lfr;


# instance fields
.field public A:Lzg;

.field public B:I

.field public final C:Lh7f;

.field public D:I

.field public E:I

.field public F:Lx5f;

.field public G:Leej;

.field public final H:Lnp1;

.field public final I:Ljava/util/HashSet;

.field public J:Lxr5;

.field public K:Lpt3;

.field public L:Ld7h;

.field public final M:Lt59;

.field public N:Lgz4;

.field public O:I

.field public P:Lyqa;

.field public Q:Lyqa;

.field public R:Lvz5;

.field public S:Z

.field public T:Lorg/chromium/components/autofill/AutofillProvider;

.field public U:I

.field public l:I

.field public m:Lez4;

.field public n:J

.field public final o:Ljz4;

.field public p:Lcom/opera/android/browser/dialog/DialogDelegate;

.field public q:Z

.field public r:Z

.field public s:Z

.field public final t:Z

.field public final u:Z

.field public v:I

.field public w:Z

.field public x:Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;

.field public y:Lfz4;

.field public z:Lard;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/chromium/url/GURL;

    const-string v1, "about:blank"

    invoke-direct {v0, v1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    new-instance v0, Lfr;

    invoke-direct {v0}, Lfr;-><init>()V

    sput-object v0, Lcom/opera/android/browser/chromium/ChromiumContent;->W:Lfr;

    return-void
.end method

.method public constructor <init>(Ljz4;Lqi;Lorg/chromium/content_public/browser/WebContents;ZZI)V
    .registers 9

    invoke-direct {p0, p2}, Lcom/opera/android/browser/WebContentsWrapper;-><init>(Lqi;)V

    sget-object p2, Lcom/opera/android/browser/chromium/ChromiumContent;->W:Lfr;

    iget v0, p2, Lfr;->c:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p2, Lfr;->c:I

    invoke-static {v0}, Lfr;->k(I)I

    move-result v0

    iget p2, p2, Lfr;->b:I

    xor-int/2addr v0, p2

    invoke-static {v0}, Lfr;->k(I)I

    move-result p2

    iput p2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->l:I

    iput-boolean v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->q:Z

    const/4 p2, -0x1

    iput p2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->v:I

    new-instance p2, Lh7f;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    iput v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->D:I

    const/4 p2, 0x0

    iput p2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->E:I

    new-instance v0, Lnp1;

    invoke-direct {v0, p0}, Lnp1;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->I:Ljava/util/HashSet;

    new-instance v0, Lt59;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lt59;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->M:Lt59;

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    iput-boolean p4, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    iput-boolean p5, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->u:Z

    if-eqz p4, :cond_49

    move p1, p2

    goto :goto_4b

    :cond_49
    const/16 p1, 0xd

    :goto_4b
    if-nez p5, :cond_4f

    const/16 p2, 0x12

    :cond_4f
    or-int/2addr p1, p2

    not-int p2, p6

    and-int/2addr p1, p2

    invoke-static {p0, p3, p1}, LJ/N;->MIJLdULo(Ljava/lang/Object;Ljava/lang/Object;I)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {p1, p2}, LJ/N;->M$rBGBlo(J)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 p3, 0x0

    cmp-long p0, p1, p3

    if-eqz p0, :cond_65

    return-void

    :cond_65
    const-string p0, "Failed to create a native instance."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static callRequestPageCaptureCallback(Lcom/opera/api/Callback;Ljava/lang/String;)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public static createInsecureSecurityInfo(I)Lcom/opera/android/browser/SecurityInfo;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    if-eqz p0, :cond_11

    const/4 v0, 0x2

    if-eq p0, v0, :cond_b

    new-instance p0, Lmwi;

    invoke-direct {p0}, Lmwi;-><init>()V

    return-object p0

    :cond_b
    new-instance p0, Liwi;

    invoke-direct {p0}, Liwi;-><init>()V

    return-object p0

    :cond_11
    new-instance p0, Lmwi;

    invoke-direct {p0}, Lmwi;-><init>()V

    return-object p0
.end method

.method public static createSSLError(IJJJ)Lcom/opera/android/browser/chromium/SSLError;
    .registers 16
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    packed-switch p0, :pswitch_data_1c

    :pswitch_3
    new-instance v0, Lcom/opera/android/browser/chromium/SSLError;

    const-wide/16 v4, -0x1

    const-wide/16 v6, -0x1

    const/16 v1, 0xb

    const-wide/16 v2, -0x1

    invoke-direct/range {v0 .. v7}, Lcom/opera/android/browser/chromium/SSLError;-><init>(IJJJ)V

    return-object v0

    :pswitch_11
    new-instance v1, Lcom/opera/android/browser/chromium/SSLError;

    move v2, p0

    move-wide v3, p1

    move-wide v5, p3

    move-wide v7, p5

    invoke-direct/range {v1 .. v8}, Lcom/opera/android/browser/chromium/SSLError;-><init>(IJJJ)V

    return-object v1

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_3
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
    .end packed-switch
.end method

.method public static createSecurityInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;Lcom/opera/android/browser/chromium/SSLError;[[BZLjava/lang/String;[[B)Lcom/opera/android/browser/SecurityInfo;
    .registers 27
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Lcom/opera/android/browser/chromium/SSLError;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # [[B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p11    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # [[B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const/4 v0, 0x1

    if-eq p0, v0, :cond_38

    const/4 v0, 0x3

    if-eq p0, v0, :cond_c

    new-instance p0, Lmwi;

    invoke-direct {p0}, Lmwi;-><init>()V

    return-object p0

    :cond_c
    if-nez p8, :cond_1d

    new-instance v0, Lcom/opera/android/browser/chromium/SSLError;

    const-wide/16 v4, -0x1

    const-wide/16 v6, -0x1

    const/16 v1, 0xb

    const-wide/16 v2, -0x1

    invoke-direct/range {v0 .. v7}, Lcom/opera/android/browser/chromium/SSLError;-><init>(IJJJ)V

    move-object v9, v0

    goto :goto_1f

    :cond_1d
    move-object/from16 v9, p8

    :goto_1f
    new-instance v1, Ljwi;

    move-object v2, p1

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p9

    move/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    invoke-direct/range {v1 .. v12}, Ljwi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;[[BLcom/opera/android/browser/chromium/SSLError;ZLjava/lang/String;[[B)V

    return-object v1

    :cond_38
    new-instance v2, Lkwi;

    move-object v3, p1

    move-object/from16 v10, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p9

    move/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v2 .. v13}, Lkwi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;[[BLjava/lang/String;ZLjava/lang/String;[[B)V

    return-object v2
.end method

.method public static onScreenshotFinished(Lcom/opera/api/Callback;Landroid/graphics/Bitmap;)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final A(I)V
    .registers 3

    iget v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->U:I

    if-eq v0, p1, :cond_1e

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_1e

    iput p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->U:I

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->r()Lorg/chromium/content/browser/RenderWidgetHostViewImpl;

    move-result-object p0

    if-eqz p0, :cond_1e

    invoke-virtual {p0}, Lorg/chromium/content/browser/RenderWidgetHostViewImpl;->a()V

    iget-wide p0, p0, Lorg/chromium/content/browser/RenderWidgetHostViewImpl;->a:J

    invoke-static {p0, p1}, LJ/N;->Myd8R_Wn(J)V

    :cond_1e
    return-void
.end method

.method public final B()V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->s:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1b

    iput-boolean v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->s:Z

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v2

    invoke-interface {v2}, Lorg/chromium/content_public/browser/NavigationController;->a()V

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/NavigationController;->u()V

    :cond_1b
    iget-boolean v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->q:Z

    if-nez v0, :cond_20

    return-void

    :cond_20
    iput-boolean v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->q:Z

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    const/4 v0, 0x2

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    return-void
.end method

.method public final a(Lxr5;)Lorg/chromium/ui/base/ViewAndroidDelegate;
    .registers 3

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    new-instance v0, Ljpf;

    invoke-direct {v0, p1}, Lorg/chromium/ui/base/ViewAndroidDelegate;-><init>(Lxr5;)V

    iput-object p0, v0, Ljpf;->h:Lcom/opera/android/browser/chromium/ChromiumContent;

    return-object v0
.end method

.method public final activeNavigationEntryChanged()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final buildReaderModeUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p0

    const v0, 0x7f140da0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lcom/opera/android/browser/UrlMangler$Builder;

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v2, "opera-distiller"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "readermode"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v1, "ext_url"

    invoke-virtual {p2, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, v2, p2}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Lcom/opera/android/browser/UrlMangler$Builder;->externalUrl(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {v0}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final didUpdateAudioMutingState(Z)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1}, Liz4;->d(Z)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final findReply(III)V
    .registers 5

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1, p2, p3}, Liz4;->t(III)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final focus()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->m:Lez4;

    invoke-interface {p0}, Lez4;->d()V

    return-void
.end method

.method public final getDialogDelegate()Lcom/opera/android/browser/dialog/DialogDelegate;
    .registers 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    return-object p0
.end method

.method public final getDisplayMode()I
    .registers 1

    iget p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->D:I

    if-nez p0, :cond_5

    const/4 p0, 0x1

    :cond_5
    return p0
.end method

.method public final getLimitAdTracking()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p0}, Ljz4;->D()Z

    move-result p0

    return p0
.end method

.method public final getPictureInPictureEnabled()Z
    .registers 1

    sget-object p0, Lt8;->a:Landroid/content/Context;

    invoke-static {p0}, Lrm5;->D(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public final k(Liz4;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final l()V
    .registers 9

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_9

    return-void

    :cond_9
    iget-boolean v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->z1()V

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->s()V

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-interface {v0, v1}, Lorg/chromium/content_public/browser/WebContents;->v1(I)V

    iput-boolean v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    :cond_21
    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v4

    :goto_27
    invoke-virtual {v4}, Lg7f;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_37

    invoke-virtual {v4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Liz4;

    invoke-virtual {v5, p0}, Liz4;->j(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_27

    :cond_37
    invoke-virtual {v0}, Lh7f;->clear()V

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->z:Lard;

    invoke-virtual {v0}, Lard;->a()V

    invoke-virtual {v0}, Lard;->c()V

    const/4 v4, 0x0

    iput-object v4, v0, Lard;->c:Lepd;

    iput-object v4, v0, Lard;->d:Levn;

    iput-object v4, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {v0, p0}, Ljz4;->o(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->T:Lorg/chromium/components/autofill/AutofillProvider;

    if-eqz v0, :cond_6d

    iget-object v5, v0, Lorg/chromium/components/autofill/AutofillProvider;->g:Luu2;

    if-eqz v5, :cond_59

    invoke-virtual {v5}, Luu2;->c()V

    :cond_59
    iget-wide v5, v0, Lorg/chromium/components/autofill/AutofillProvider;->f:J

    cmp-long v7, v5, v2

    if-eqz v7, :cond_64

    iput-wide v2, v0, Lorg/chromium/components/autofill/AutofillProvider;->f:J

    invoke-static {v5, v6}, LJ/N;->M5T72OHd(J)V

    :cond_64
    iget-object v0, v0, Lorg/chromium/components/autofill/AutofillProvider;->b:Lht2;

    if-eqz v0, :cond_6b

    invoke-virtual {v0}, Lht2;->b()V

    :cond_6b
    iput-object v4, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->T:Lorg/chromium/components/autofill/AutofillProvider;

    :cond_6d
    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->y:Lfz4;

    if-eqz v0, :cond_76

    invoke-virtual {v0, v4}, Lptn;->c(Lorg/chromium/content_public/browser/WebContents;)V

    iput-object v4, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->y:Lfz4;

    :cond_76
    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->N:Lgz4;

    if-eqz v0, :cond_87

    iget-object v5, v0, Lgz4;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v5, v5, Lcom/opera/android/browser/chromium/ChromiumContent;->M:Lt59;

    iget-object v5, v5, Lt59;->c:Ljava/lang/Object;

    check-cast v5, Li7f;

    invoke-virtual {v5, v0}, Li7f;->c(Ljava/lang/Object;)Z

    iput-object v4, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->N:Lgz4;

    :cond_87
    iput-boolean v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->s:Z

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iput-boolean v0, v1, Lnp1;->b:Z

    iget-object v0, v1, Lnp1;->d:Ljava/lang/Object;

    check-cast v0, Lr4h;

    invoke-virtual {v0}, Lr4h;->a()V

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->b()V

    iput-wide v2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    iput-object v4, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->x:Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;

    return-void
.end method

.method public final m()Lorg/chromium/url/GURL;
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Lzs9;->a:Lorg/chromium/url/GURL;

    return-object p0

    :cond_9
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->s()Lorg/chromium/url/GURL;

    move-result-object p0

    iget-boolean v0, p0, Lorg/chromium/url/GURL;->b:Z

    if-eqz v0, :cond_16

    return-object p0

    :cond_16
    sget-object p0, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iget-boolean v0, v0, Lnp1;->a:Z

    const/4 v1, 0x0

    if-nez v0, :cond_9

    move-object p0, v1

    goto :goto_22

    :cond_9
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/NavigationController;->m()Lorg/chromium/content_public/browser/NavigationEntry;

    move-result-object v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->m()Lorg/chromium/content_public/browser/NavigationEntry;

    move-result-object p0

    iget-object p0, p0, Lorg/chromium/content_public/browser/NavigationEntry;->a:Lorg/chromium/url/GURL;

    goto :goto_22

    :cond_1e
    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->m()Lorg/chromium/url/GURL;

    move-result-object p0

    :goto_22
    if-eqz p0, :cond_29

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_29
    return-object v1
.end method

.method public final navigationHistoryPruned(II)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Liz4;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final o()Lnwi;
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v0, v1}, LJ/N;->MbX9gHpF(J)I

    move-result p0

    sget-object v0, Lnwi;->a:Lnwi;

    if-eqz p0, :cond_1d

    const/4 v1, 0x1

    if-eq p0, v1, :cond_1a

    const/4 v1, 0x2

    if-eq p0, v1, :cond_17

    const/4 v1, 0x3

    if-eq p0, v1, :cond_14

    return-object v0

    :cond_14
    sget-object p0, Lnwi;->d:Lnwi;

    return-object p0

    :cond_17
    sget-object p0, Lnwi;->c:Lnwi;

    return-object p0

    :cond_1a
    sget-object p0, Lnwi;->b:Lnwi;

    return-object p0

    :cond_1d
    return-object v0
.end method

.method public final onAudioStateChanged(Z)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1}, Liz4;->g(Z)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final onElementClicked(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1, p2, p3, p4}, Liz4;->q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final onLanguageDetermined(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lyqa;

    invoke-direct {v0, p1, p3, p4, p2}, Lyqa;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->P:Lyqa;

    iput-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_11
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_21

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Liz4;

    invoke-virtual {p1, v0}, Liz4;->v(Lyqa;)V

    goto :goto_11

    :cond_21
    return-void
.end method

.method public final onPictureInPictureStateChanged(I)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1}, Liz4;->x(I)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final onReaderModeStateChanged(II)V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1, p2}, Liz4;->y(II)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final onRenderViewReady()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->q:Z

    if-nez v0, :cond_c

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    :cond_c
    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_12
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1, p0}, Liz4;->A(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_12

    :cond_22
    return-void
.end method

.method public final onTranslateRequestDone(III)V
    .registers 9

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->R:Lvz5;

    if-eqz p0, :cond_58

    iget-object p0, p0, Lvz5;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj5m;

    const/4 p3, 0x0

    const/4 v0, 0x7

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/4 v3, 0x3

    if-eq p2, v3, :cond_1b

    if-eq p2, v2, :cond_1b

    if-eq p2, v1, :cond_1b

    if-ne p2, v0, :cond_24

    :cond_1b
    iget-object v4, p0, Lj5m;->j:Ljava/lang/Runnable;

    if-eqz v4, :cond_24

    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    iput-object p3, p0, Lj5m;->j:Ljava/lang/Runnable;

    :cond_24
    iget v4, p0, Lj5m;->a:I

    if-ne v4, p1, :cond_58

    const/4 p1, 0x1

    if-eqz p2, :cond_51

    if-eq p2, p1, :cond_4b

    const/4 p1, 0x2

    if-eq p2, p1, :cond_45

    if-eq p2, v3, :cond_45

    if-eq p2, v1, :cond_3f

    const/4 p1, 0x6

    if-eq p2, p1, :cond_45

    if-ne p2, v0, :cond_56

    new-instance p3, La5m;

    invoke-direct {p3, v0}, La5m;-><init>(I)V

    goto :goto_56

    :cond_3f
    new-instance p3, Lb5m;

    invoke-direct {p3, p1}, Lb5m;-><init>(I)V

    goto :goto_56

    :cond_45
    new-instance p3, Lb5m;

    invoke-direct {p3, v1}, Lb5m;-><init>(I)V

    goto :goto_56

    :cond_4b
    new-instance p3, Lb5m;

    invoke-direct {p3, v2}, Lb5m;-><init>(I)V

    goto :goto_56

    :cond_51
    new-instance p3, Lb5m;

    invoke-direct {p3, p1}, Lb5m;-><init>(I)V

    :cond_56
    :goto_56
    if-nez p3, :cond_59

    :cond_58
    return-void

    :cond_59
    invoke-virtual {p0, p3}, Lj5m;->d(Ld5m;)V

    return-void
.end method

.method public final onUpdateBytesTransferred(JJ)V
    .registers 11

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->F:Lx5f;

    if-eqz v0, :cond_b

    const-string v5, "page_loads"

    move-wide v1, p1

    move-wide v3, p3

    invoke-virtual/range {v0 .. v5}, Lx5f;->J(JJLjava/lang/String;)V

    :cond_b
    return-void
.end method

.method public final onWebLanguageDetectionDetails(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0, p1, p2}, Liz4;->J(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final p()Ljava/lang/String;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    invoke-static {v0, v1}, LJ/N;->MdMAB$tA(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final q()Lvz5;
    .registers 5

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->R:Lvz5;

    if-nez v0, :cond_14

    new-instance v0, Lvz5;

    new-instance v1, Lcz4;

    invoke-direct {v1, p0}, Lcz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    sget-object v2, Lvml;->d:Lumi;

    iget-object v3, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->L:Ld7h;

    invoke-direct {v0, v1, v2, v3}, Lvz5;-><init>(Lcz4;Lumi;Ld7h;)V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->R:Lvz5;

    :cond_14
    return-object v0
.end method

.method public final r()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->m()Lorg/chromium/url/GURL;

    move-result-object p0

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->h()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final requestPermissionDialog(ILjava/lang/String;Lcom/opera/android/browser/chromium/PermissionDialogDelegate;)V
    .registers 5
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/opera/android/browser/chromium/PermissionDialogDelegate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-nez p0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lole;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p3, v0, Lole;->a:Ljava/lang/Object;

    invoke-interface {p0, p1, p2, v0}, Lcom/opera/android/browser/dialog/DialogDelegate;->h(ILjava/lang/String;Lole;)V

    return-void
.end method

.method public final resolvePartnerSuggestionUrl(Ljava/lang/String;J)V
    .registers 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->K:Lpt3;

    if-nez v0, :cond_c

    iget-wide p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-string v0, ""

    invoke-static {p0, p1, v0, p2, p3}, LJ/N;->MYhVVL5A(JLjava/lang/Object;J)V

    return-void

    :cond_c
    new-instance v1, Laz4;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p2, p3, v2}, Laz4;-><init>(Ljava/lang/Object;JB)V

    iget-object p0, v0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    sget p2, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object p0

    new-instance p2, Lwx;

    const/16 p3, 0x16

    invoke-direct {p2, p1, v1, p3}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lipk;->k:Lxbf;

    iget-object p3, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p3, Lh42;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_39

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll2g;

    invoke-virtual {p2, p0}, Lwx;->run(Ljava/lang/Object;)V

    return-void

    :cond_39
    new-instance v0, Lo2g;

    invoke-direct {v0, p0, p2, p1}, Lo2g;-><init>(Lxbf;Lwx;Ljava/lang/String;)V

    invoke-virtual {p3, v0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final s()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->q:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->q:Z

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    return-void
.end method

.method public final setPendingPrint(II)V
    .registers 11

    iget-object v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    invoke-static {v0}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    move-result-object v3

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v4

    if-nez v4, :cond_d

    return-void

    :cond_d
    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->q()Lvz5;

    move-result-object v0

    new-instance v1, Lbz4;

    move-object v5, p0

    move-object v2, p0

    move v6, p1

    move v7, p2

    invoke-direct/range {v1 .. v7}, Lbz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Llyg;Ldx3;Lcom/opera/android/browser/chromium/ChromiumContent;II)V

    iget-object p0, v0, Lvz5;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj5m;

    invoke-virtual {p0, v1}, Lj5m;->a(Ljava/lang/Runnable;)Lhh4;

    return-void
.end method

.method public final t(Lqy4;Lg1j;Lqp2;Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;Lype;Lx5f;Leej;Lpt3;Ld7h;Ljv0;)V
    .registers 24

    move-object/from16 v0, p4

    iget-wide v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v1, v2}, LJ/N;->MM5u3hgR(J)V

    move-object/from16 v1, p6

    iput-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->F:Lx5f;

    move-object/from16 v1, p7

    iput-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->G:Leej;

    if-eqz v0, :cond_14

    invoke-virtual {p0, v0}, Lcom/opera/android/browser/WebContentsWrapper;->j(Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;)V

    :cond_14
    new-instance v0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-direct {v0, p0, v2, v1}, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lype;Lqp2;)V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->x:Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;

    iget-wide v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v1, v2, v0}, LJ/N;->MyM9eIxb(JLjava/lang/Object;)V

    new-instance v0, Lqq6;

    new-instance v1, Lzy9;

    invoke-direct {v1, p0}, Lzy9;-><init>(Ljava/lang/Object;)V

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lqq6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lcom/opera/android/browser/WebContentsWrapper;->g(Lqq6;)V

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    const/4 v2, 0x0

    if-eqz v1, :cond_4e

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v1

    if-nez v1, :cond_4e

    iget-wide v5, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v5, v6}, LJ/N;->M8lncpsK(J)Z

    move-result v1

    goto :goto_4f

    :cond_4e
    move v1, v2

    :goto_4f
    iget-object v5, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    const/4 v6, 0x0

    if-nez v1, :cond_76

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->T:Lorg/chromium/components/autofill/AutofillProvider;

    if-eqz v1, :cond_73

    iget-object v7, v1, Lorg/chromium/components/autofill/AutofillProvider;->g:Luu2;

    if-eqz v7, :cond_5f

    invoke-virtual {v7}, Luu2;->c()V

    :cond_5f
    iget-wide v7, v1, Lorg/chromium/components/autofill/AutofillProvider;->f:J

    cmp-long v9, v7, v3

    if-eqz v9, :cond_6a

    iput-wide v3, v1, Lorg/chromium/components/autofill/AutofillProvider;->f:J

    invoke-static {v7, v8}, LJ/N;->M5T72OHd(J)V

    :cond_6a
    iget-object v1, v1, Lorg/chromium/components/autofill/AutofillProvider;->b:Lht2;

    if-eqz v1, :cond_71

    invoke-virtual {v1}, Lht2;->b()V

    :cond_71
    iput-object v6, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->T:Lorg/chromium/components/autofill/AutofillProvider;

    :cond_73
    const/16 v1, 0x8

    goto :goto_de

    :cond_76
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    iget-object v7, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->T:Lorg/chromium/components/autofill/AutofillProvider;

    if-eqz v7, :cond_a4

    iget-object v8, v7, Lorg/chromium/components/autofill/AutofillProvider;->d:Lorg/chromium/content_public/browser/WebContents;

    if-eq v1, v8, :cond_c4

    iget-object v8, v7, Lorg/chromium/components/autofill/AutofillProvider;->g:Luu2;

    if-eqz v8, :cond_89

    invoke-virtual {v8}, Luu2;->c()V

    :cond_89
    iget-object v8, v7, Lorg/chromium/components/autofill/AutofillProvider;->d:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v8, :cond_8f

    iput-object v6, v7, Lorg/chromium/components/autofill/AutofillProvider;->e:Ll45;

    :cond_8f
    iput-object v1, v7, Lorg/chromium/components/autofill/AutofillProvider;->d:Lorg/chromium/content_public/browser/WebContents;

    iget-wide v8, v7, Lorg/chromium/components/autofill/AutofillProvider;->f:J

    cmp-long v6, v8, v3

    if-eqz v6, :cond_9c

    iput-wide v3, v7, Lorg/chromium/components/autofill/AutofillProvider;->f:J

    invoke-static {v8, v9}, LJ/N;->M5T72OHd(J)V

    :cond_9c
    iget-object v3, v7, Lorg/chromium/components/autofill/AutofillProvider;->d:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v3, :cond_c4

    invoke-static {v7, v1}, LJ/N;->MP6qv$HX(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_c4

    :cond_a4
    iget-object v3, v5, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    new-instance v4, Lorg/chromium/components/autofill/AutofillProvider;

    iget-object v6, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/Context;

    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const v8, 0x7f1401b7

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v3, v6, v1, v7}, Lorg/chromium/components/autofill/AutofillProvider;-><init>(Ljava/lang/ref/WeakReference;Lxr5;Lorg/chromium/content_public/browser/WebContents;Ljava/lang/String;)V

    iput-object v4, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->T:Lorg/chromium/components/autofill/AutofillProvider;

    iget-wide v3, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v3, v4}, LJ/N;->M3aEETQK(J)V

    :cond_c4
    :goto_c4
    invoke-static {v1}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object v1

    if-eqz v1, :cond_dd

    new-instance v3, Lu59;

    const/16 v4, 0xf

    invoke-direct {v3, v4}, Lu59;-><init>(B)V

    new-instance v4, Lu59;

    iget-object v6, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->T:Lorg/chromium/components/autofill/AutofillProvider;

    const/4 v7, 0x2

    invoke-direct {v4, v6, v7}, Lu59;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v3, Lu59;->b:Ljava/lang/Object;

    iput-object v3, v1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->M:Ltyi;

    :cond_dd
    const/4 v1, 0x1

    :goto_de
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAutofill(I)V

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v7

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v0

    sget-object v12, Lwln;->d:Lwln;

    new-instance v6, Lns5;

    move-object v8, v0

    check-cast v8, Landroid/view/ViewGroup;

    move-object v9, p1

    move-object v10, p2

    move-object/from16 v11, p10

    invoke-direct/range {v6 .. v12}, Lns5;-><init>(Lorg/chromium/content_public/browser/WebContents;Landroid/view/ViewGroup;Ljs5;Lg1j;Ljv0;Lwln;)V

    new-instance p1, Lzg;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance p2, Lty3;

    const/4 v0, 0x4

    invoke-direct {p2, p1, v0}, Lty3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    iput-object v0, p1, Lzg;->b:Ljava/lang/Object;

    iput v2, p1, Lzg;->a:I

    invoke-virtual {p0, p2}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->A:Lzg;

    new-instance p1, Lard;

    sget-object p2, Lvml;->d:Lumi;

    invoke-direct {p1, p0, p2}, Lard;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lumi;)V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->z:Lard;

    move-object/from16 p1, p8

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->K:Lpt3;

    move-object/from16 p1, p9

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->L:Ld7h;

    new-instance p1, Lfz4;

    invoke-direct {p1, p0, p0}, Lfz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->y:Lfz4;

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p1, p0}, Ljz4;->A(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iget-object p1, v5, Lorg/chromium/ui/base/WindowAndroid;->d:Lfb7;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    iget v0, p1, Lfb7;->f:I

    iget p1, p1, Lfb7;->g:I

    invoke-interface {p2, v0, p1}, Lorg/chromium/content_public/browser/WebContents;->y0(II)V

    new-instance p1, Lgz4;

    invoke-direct {p1, p0}, Lgz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->N:Lgz4;

    return-void
.end method

.method public final u()Z
    .registers 4

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return v0

    :cond_8
    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->r()Lorg/chromium/content/browser/RenderWidgetHostViewImpl;

    move-result-object p0

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Lorg/chromium/content/browser/RenderWidgetHostViewImpl;->a()V

    iget-wide v1, p0, Lorg/chromium/content/browser/RenderWidgetHostViewImpl;->a:J

    invoke-static {v1, v2}, LJ/N;->MZn2HluM(J)Z

    move-result p0

    if-eqz p0, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_1b
    return v0
.end method

.method public final v(Llsc;)V
    .registers 4

    iget-object v0, p1, Lksc;->a:Ljava/lang/String;

    sget-object v1, Lwqm;->a:[Ljava/lang/String;

    if-eqz v0, :cond_f

    const-string v1, "javascript:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    return-void

    :cond_f
    const-string v1, "file://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1d

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_45

    :cond_1d
    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lr9n;->X(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_45

    new-instance v0, Lwx;

    const/16 v1, 0x1a

    invoke-direct {v0, p0, p1, v1}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt p1, v1, :cond_38

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lwx;->run(Ljava/lang/Object;)V

    return-void

    :cond_38
    new-instance p1, Ldz4;

    invoke-direct {p1, p0, v0}, Ldz4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/api/Callback;)V

    iget-object p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v0, p1}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    return-void

    :cond_45
    invoke-virtual {p0, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->w(Llsc;)V

    return-void
.end method

.method public final w(Llsc;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-wide v2, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_44

    move-wide v3, v2

    iget-object v2, v1, Lksc;->a:Ljava/lang/String;

    move-wide v4, v3

    iget-boolean v3, v1, Lksc;->c:Z

    move-wide v5, v4

    iget v4, v1, Lksc;->d:I

    iget-object v0, v1, Lksc;->e:Lcm;

    if-eqz v0, :cond_1e

    iget-object v7, v0, Lcm;->c:Ljava/lang/String;

    iget v0, v0, Lcm;->b:I

    goto :goto_20

    :cond_1e
    const/4 v7, 0x0

    const/4 v0, 0x0

    :goto_20
    invoke-virtual {v1}, Lksc;->a()Ljava/lang/String;

    move-result-object v8

    move-wide v9, v5

    move-object v5, v7

    move-object v7, v8

    iget-object v8, v1, Lksc;->i:Lorg/chromium/content_public/common/ResourceRequestBody;

    iget-boolean v13, v1, Lksc;->j:Z

    iget-boolean v14, v1, Lksc;->k:Z

    iget-boolean v15, v1, Llsc;->m:Z

    iget-boolean v6, v1, Llsc;->n:Z

    iget-boolean v11, v1, Lksc;->l:Z

    iget-object v1, v1, Llsc;->o:[B

    move-object/from16 v18, v1

    move/from16 v16, v6

    move v6, v0

    move-wide v0, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    move/from16 v17, v11

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v0 .. v18}, LJ/N;->M62NJvGd(JLjava/lang/Object;IILjava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZZZZZZLjava/lang/Object;)V

    :cond_44
    return-void
.end method

.method public final x(Z)V
    .registers 4

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object v0

    const-string v1, "external_url"

    invoke-static {v0, v1}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_23

    const/4 p1, 0x0

    sget-object v1, Llqm;->d:Llqm;

    invoke-static {v0, p1, v1}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object p1

    if-eqz p1, :cond_29

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->v(Llsc;)V

    return-void

    :cond_23
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    if-nez p0, :cond_2a

    :cond_29
    return-void

    :cond_2a
    if-eqz p1, :cond_30

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->p()V

    return-void

    :cond_30
    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->b()V

    return-void
.end method

.method public final y(Liz4;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final z(Z)V
    .registers 6

    const/4 v0, 0x1

    if-eqz p1, :cond_11

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Lorg/chromium/content_public/browser/WebContents;->v1(I)V

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->B()V

    iput-boolean v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    goto :goto_29

    :cond_11
    iget-boolean v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    if-eqz v1, :cond_29

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->z1()V

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->s()V

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lorg/chromium/content_public/browser/WebContents;->v1(I)V

    iput-boolean v2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    :cond_29
    :goto_29
    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {v1, p0, p1}, Ljz4;->u(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    if-eqz p1, :cond_7e

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->z:Lard;

    invoke-virtual {p1}, Lard;->e()Z

    move-result v1

    if-nez v1, :cond_68

    iget-object p1, p1, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget p1, p1, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    sget-object v1, Llkd;->a:Landroid/util/SparseArray;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0x7f0a060f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    sget-object v3, Llkd;->b:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    if-eqz v1, :cond_5b

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    :cond_5b
    sget-object v1, Llkd;->a:Landroid/util/SparseArray;

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhkd;

    if-eqz v1, :cond_68

    invoke-virtual {v1, p1}, Lhkd;->a(I)V

    :cond_68
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    sget-object p1, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->P:Lr1j;

    const-class p1, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;

    sget-object v1, Lmtn;->a:Ldvj;

    invoke-interface {p0, p1, v1}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object p0

    check-cast p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;

    iput-boolean v0, p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->B:Z

    iput-boolean v0, p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->C:Z

    iput-boolean v0, p0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->N:Z

    :cond_7e
    return-void
.end method
