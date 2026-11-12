.class public final Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfv;


# instance fields
.field public final a:Ldx3;

.field public final b:Lumi;

.field public final c:Lorg/chromium/content_public/browser/WebContents;

.field public d:Lbi;

.field public e:Landroid/net/Uri;

.field public f:Z

.field public g:Landroid/graphics/Bitmap;

.field public h:Z

.field public i:I

.field public j:I

.field public k:J

.field public l:J

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Liv;

.field public p:Z


# direct methods
.method public constructor <init>(Ldx3;Lumi;Lorg/chromium/content_public/browser/WebContents;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->i:I

    iput v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->j:I

    const-wide v0, 0x80000000L

    iput-wide v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->k:J

    iput-wide v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->l:J

    iput-object p1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->a:Ldx3;

    iput-object p2, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->b:Lumi;

    iput-object p3, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->c:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p0, p3}, LJ/N;->MpjW_y1N(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljv;)V
    .registers 20

    move-object/from16 v0, p0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->p:Z

    iget-object v7, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->g:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-nez v7, :cond_16

    new-instance v2, Liv;

    move-object/from16 v4, p1

    move-object/from16 v3, p2

    invoke-direct {v2, v0, v4, v3, v1}, Liv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v2, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->o:Liv;

    return-void

    :cond_16
    move-object/from16 v4, p1

    iget-object v2, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->d:Lbi;

    if-eqz v2, :cond_3a

    iget-object v5, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->e:Landroid/net/Uri;

    iget-boolean v6, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->f:Z

    iget-boolean v8, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->h:Z

    iget v9, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->i:I

    iget v10, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->j:I

    iget-wide v11, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->k:J

    iget-wide v13, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->l:J

    iget-object v15, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->m:Ljava/lang/String;

    iget-object v2, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->n:Ljava/lang/String;

    move-object/from16 v16, v2

    iget-object v2, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->a:Ldx3;

    iget-object v3, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->b:Lumi;

    invoke-static/range {v2 .. v16}, Lcom/opera/android/webapps/ShortcutHelper;->a(Ldx3;Lumi;Ljava/lang/String;Landroid/net/Uri;ZLandroid/graphics/Bitmap;ZIIJJLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Ljv;->run()V

    :cond_3a
    iget-object v2, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->c:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {v2}, LJ/N;->MJ7IP8TN(Ljava/lang/Object;)V

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->d:Lbi;

    iput-object v2, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->o:Liv;

    iput-boolean v1, v0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->p:Z

    return-void
.end method

.method public final b(Lbi;)V
    .registers 2

    iput-object p1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->d:Lbi;

    iget-object p0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->c:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p0}, LJ/N;->MWy63Wsi(Ljava/lang/Object;)V

    return-void
.end method

.method public final c()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->d:Lbi;

    iget-boolean v1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->p:Z

    if-nez v1, :cond_13

    iget-object v1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->c:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {v1}, LJ/N;->MJ7IP8TN(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->d:Lbi;

    iput-object v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->o:Liv;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->p:Z

    :cond_13
    return-void
.end method

.method public final d(Landroid/graphics/Bitmap;)V
    .registers 6

    new-instance v0, Lxj;

    const/4 v1, 0x4

    invoke-direct {v0, p0, p1, v1}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->b:Lumi;

    invoke-virtual {v1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v2, Lbi;

    const/16 v3, 0x9

    invoke-direct {v2, p0, v3}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnml;->b(Lnml;)V

    invoke-virtual {v0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final onFaviconFetched(Landroid/graphics/Bitmap;)V
    .registers 10
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_6

    invoke-virtual {p0, p1}, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->d(Landroid/graphics/Bitmap;)V

    return-void

    :cond_6
    new-instance v5, Lzy9;

    invoke-direct {v5, p0}, Lzy9;-><init>(Ljava/lang/Object;)V

    new-instance v0, Lghf;

    iget-object p1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->a:Ldx3;

    invoke-static {p1}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object v1

    iget-object v2, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->e:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f070a3c

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget-object v4, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->b:Lumi;

    const-wide/16 v6, 0xbb8

    invoke-direct/range {v0 .. v7}, Lghf;-><init>(Lpne;Ljava/lang/String;ILumi;Lbnj;J)V

    return-void
.end method

.method public final onInitialized(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZJJ)V
    .registers 12
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

    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p4

    iput-object p4, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->e:Landroid/net/Uri;

    iput-boolean p7, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->f:Z

    iput p6, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->i:I

    iput p5, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->j:I

    iput-wide p8, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->k:J

    iput-wide p10, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->l:J

    iput-object p2, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->m:Ljava/lang/String;

    iput-object p3, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->n:Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->d:Lbi;

    if-eqz p0, :cond_1b

    invoke-virtual {p0, p1}, Lbi;->l(Ljava/lang/String;)V

    :cond_1b
    return-void
.end method

.method public final onManifestIconFetched(Landroid/graphics/Bitmap;Z)V
    .registers 4
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    if-nez p1, :cond_7

    invoke-virtual {p0, v0}, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->d(Landroid/graphics/Bitmap;)V

    return-void

    :cond_7
    iput-object p1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->g:Landroid/graphics/Bitmap;

    iput-boolean p2, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->h:Z

    iget-object p1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->o:Liv;

    if-eqz p1, :cond_14

    invoke-virtual {p1}, Liv;->run()V

    iput-object v0, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->o:Liv;

    :cond_14
    return-void
.end method
