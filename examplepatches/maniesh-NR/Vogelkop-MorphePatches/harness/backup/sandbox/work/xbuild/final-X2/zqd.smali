.class public final Lzqd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lorg/chromium/content_public/browser/MediaSession;

.field public final synthetic b:Lorg/chromium/content_public/browser/MediaSession;

.field public final synthetic c:Lard;


# direct methods
.method public constructor <init>(Lard;Lorg/chromium/content_public/browser/MediaSession;Lorg/chromium/content_public/browser/MediaSession;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lzqd;->b:Lorg/chromium/content_public/browser/MediaSession;

    iput-object p1, p0, Lzqd;->c:Lard;

    iput-object p2, p0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    invoke-virtual {p2, p0}, Lorg/chromium/content_public/browser/MediaSession;->a(Lzqd;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .registers 18

    move-object/from16 v0, p0

    iget-object v0, v0, Lzqd;->c:Lard;

    iget-object v1, v0, Lard;->p:Lac1;

    iget-object v2, v1, Lac1;->c:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content_public/browser/WebContents;

    if-eqz v2, :cond_10b

    iput-object v0, v1, Lac1;->d:Ljava/lang/Object;

    const/4 v2, 0x0

    if-nez p1, :cond_14

    move-object v6, v2

    goto/16 :goto_d9

    :cond_14
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v6, v2

    const-wide/16 v7, 0x0

    :cond_1b
    :goto_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_d9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/chromium/services/media_session/MediaImage;

    if-nez v9, :cond_2d

    const-wide/16 v12, 0x0

    goto/16 :goto_d1

    :cond_2d
    iget-object v10, v9, Lorg/chromium/services/media_session/MediaImage;->c:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v11

    const-wide v12, 0x3fd999999999999aL    # 0.4

    if-nez v11, :cond_d1

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    const-wide/16 v14, 0x0

    :goto_40
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_55

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/graphics/Rect;

    invoke-virtual {v1, v11}, Lac1;->f(Landroid/graphics/Rect;)D

    move-result-wide v4

    invoke-static {v14, v15, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v14

    goto :goto_40

    :cond_55
    iget-object v4, v9, Lorg/chromium/services/media_session/MediaImage;->a:Lorg/chromium/url/GURL;

    iget-object v5, v9, Lorg/chromium/services/media_session/MediaImage;->b:Ljava/lang/String;

    invoke-virtual {v4}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/chromium/base/FileUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v10, "bmp"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_ce

    const-string v10, "image/bmp"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_ce

    const-string v10, "gif"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c8

    const-string v10, "image/gif"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c8

    const-string v10, "icon"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_d0

    const-string v10, "image/x-icon"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_d0

    const-string v10, "png"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c5

    const-string v10, "image/png"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c5

    const-string v10, "jpeg"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_bf

    const-string v10, "jpg"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_bf

    const-string v4, "image/jpeg"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_bf

    const-wide v12, 0x3fe3333333333333L    # 0.6

    goto :goto_d0

    :cond_bf
    const-wide v12, 0x3fe6666666666666L    # 0.7

    goto :goto_d0

    :cond_c5
    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    goto :goto_d0

    :cond_c8
    const-wide v12, 0x3fd3333333333333L    # 0.3

    goto :goto_d0

    :cond_ce
    const-wide/high16 v12, 0x3fe0000000000000L    # 0.5

    :cond_d0
    :goto_d0
    mul-double/2addr v12, v14

    :cond_d1
    :goto_d1
    cmpl-double v4, v12, v7

    if-lez v4, :cond_1b

    move-object v6, v9

    move-wide v7, v12

    goto/16 :goto_1b

    :cond_d9
    :goto_d9
    if-nez v6, :cond_f3

    iput-object v2, v1, Lac1;->e:Ljava/lang/Object;

    iget-object v3, v1, Lac1;->d:Ljava/lang/Object;

    check-cast v3, Lard;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Lipe;->r(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, v3, Lard;->e:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Lard;->h()V

    const/4 v3, -0x1

    iput v3, v1, Lac1;->b:I

    iput-object v2, v1, Lac1;->d:Ljava/lang/Object;

    goto :goto_10b

    :cond_f3
    iget-object v2, v6, Lorg/chromium/services/media_session/MediaImage;->a:Lorg/chromium/url/GURL;

    iget-object v3, v1, Lac1;->e:Ljava/lang/Object;

    check-cast v3, Lorg/chromium/url/GURL;

    invoke-virtual {v2, v3}, Lorg/chromium/url/GURL;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10b

    iput-object v2, v1, Lac1;->e:Ljava/lang/Object;

    iget-object v3, v1, Lac1;->c:Ljava/lang/Object;

    check-cast v3, Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v3, v2, v1}, Lorg/chromium/content_public/browser/WebContents;->P(Lorg/chromium/url/GURL;Lorg/chromium/content_public/browser/ImageDownloadCallback;)I

    move-result v2

    iput v2, v1, Lac1;->b:I

    :cond_10b
    :goto_10b
    invoke-virtual {v0}, Lard;->i()V

    return-void
.end method

.method public final b(ZZ)V
    .registers 15

    iget-object v0, p0, Lzqd;->c:Lard;

    iget-object v1, v0, Lard;->c:Lepd;

    iget-object v2, v0, Lard;->u:Lk03;

    xor-int/lit8 v3, p2, 0x1

    iget-object v4, p0, Lzqd;->b:Lorg/chromium/content_public/browser/MediaSession;

    const/4 v8, 0x0

    invoke-virtual {v1, v4, v3, v8}, Lepd;->a(Lorg/chromium/content_public/browser/MediaSession;ZZ)V

    iget-object v1, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v1, :cond_29

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    if-eqz v1, :cond_29

    iget-object v1, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    move-result v1

    if-eqz v1, :cond_29

    iget-object v1, v0, Lard;->d:Levn;

    invoke-virtual {v1, v4, v3}, Lsc;->k(Ljava/lang/Object;Z)V

    :cond_29
    const-wide/16 v3, -0x1

    const-wide/16 v5, 0x0

    if-eqz p1, :cond_40

    if-nez p2, :cond_40

    iget-wide v9, v2, Lk03;->a:J

    cmp-long v1, v9, v5

    if-gez v1, :cond_3d

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iput-wide v5, v2, Lk03;->a:J

    :cond_3d
    iput-wide v3, v2, Lk03;->b:J

    goto :goto_54

    :cond_40
    iget-wide v9, v2, Lk03;->a:J

    cmp-long v1, v9, v5

    if-ltz v1, :cond_54

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iget-wide v9, v2, Lk03;->a:J

    sub-long v9, v5, v9

    iput-wide v9, v2, Lk03;->c:J

    iput-wide v5, v2, Lk03;->b:J

    iput-wide v3, v2, Lk03;->a:J

    :cond_54
    :goto_54
    iget-object v1, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-nez p1, :cond_7e

    if-eqz v1, :cond_145

    iget-object p0, v0, Lard;->s:Loml;

    if-nez p0, :cond_145

    iget-object p0, v0, Lard;->a:Lumi;

    new-instance p1, Lyqd;

    const/4 p2, 0x0

    invoke-direct {p1, v0, p2}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p0, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance v1, Loml;

    invoke-direct {v1, p0}, Loml;-><init>(Lnml;)V

    iput-object v1, v0, Lard;->s:Loml;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x3e8

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    const/4 p0, 0x0

    iput-object p0, v0, Lard;->l:Likd;

    return-void

    :cond_7e
    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p1

    instance-of v1, p1, Lcom/opera/android/webapps/WebappActivity;

    if-eqz v1, :cond_8b

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    goto :goto_9f

    :cond_8b
    invoke-static {p1}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.opera.android.action.ACTIVATE_TAB"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    iget-object v2, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v2, v2, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    const-string v3, "tabId"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    :goto_9f
    iget-object v2, v0, Lard;->m:Ljava/lang/String;

    if-nez v2, :cond_c0

    iget-object v2, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->p()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u25b6"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_be

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    :cond_be
    iput-object v2, v0, Lard;->m:Ljava/lang/String;

    :cond_c0
    invoke-virtual {v0}, Lard;->b()Lorg/chromium/services/media_session/MediaMetadata;

    move-result-object v2

    iput-object v2, v0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    iget-object v3, v0, Lard;->e:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_cc

    move-object v4, v3

    goto :goto_ce

    :cond_cc
    iget-object v4, v0, Lard;->f:Landroid/graphics/Bitmap;

    :goto_ce
    iput-object v4, v0, Lard;->g:Landroid/graphics/Bitmap;

    new-instance v5, Likd;

    invoke-direct {v5}, Likd;-><init>()V

    iput-object v2, v5, Likd;->a:Lorg/chromium/services/media_session/MediaMetadata;

    iput-boolean p2, v5, Likd;->b:Z

    iget-object v2, v0, Lard;->h:Ljava/lang/String;

    iput-object v2, v5, Likd;->c:Ljava/lang/String;

    iget-object v2, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v6, v2, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    iput v6, v5, Likd;->d:I

    iget-boolean v2, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    iput-boolean v2, v5, Likd;->e:Z

    if-eqz p2, :cond_ed

    const p2, 0x7f080299

    goto :goto_f0

    :cond_ed
    const p2, 0x7f08029c

    :goto_f0
    iput p2, v5, Likd;->f:I

    iput-object v4, v5, Likd;->g:Landroid/graphics/Bitmap;

    iput-object v3, v5, Likd;->h:Landroid/graphics/Bitmap;

    const/4 p2, 0x5

    iput-byte p2, v5, Likd;->i:B

    iput-object v1, v5, Likd;->k:Landroid/content/Intent;

    const p2, 0x7f0a060f

    iput p2, v5, Likd;->j:I

    iget-object p2, v0, Lard;->v:Lwub;

    iput-object p2, v5, Likd;->l:Lkkd;

    iget-object p2, v0, Lard;->q:Ljava/util/HashSet;

    iput-object p2, v5, Likd;->m:Ljava/util/HashSet;

    iget-object p2, v0, Lard;->r:Lorg/chromium/services/media_session/MediaPosition;

    iput-object p2, v5, Likd;->n:Lorg/chromium/services/media_session/MediaPosition;

    iput-object v5, v0, Lard;->l:Likd;

    invoke-virtual {v0}, Lard;->g()V

    if-eqz p1, :cond_117

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Landroid/app/Activity;->setVolumeControlStream(I)V

    :cond_117
    iget-boolean p1, v0, Lard;->i:Z

    if-eqz p1, :cond_145

    iput-boolean v8, v0, Lard;->i:Z

    iget-object p1, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v6

    iget-object v7, v0, Lard;->h:Ljava/lang/String;

    iget-object p1, v0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    new-instance v11, Ly0a;

    const/16 p1, 0x15

    invoke-direct {v11, p0, p1}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-static {v9}, Lnr8;->e(Landroid/content/Context;)I

    move-result v10

    invoke-static {v6}, LJ/N;->M4P_efwZ(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_145

    new-instance v5, Lcom/opera/android/favorites/SpeedDialDataFetcher;

    invoke-direct/range {v5 .. v11}, Lcom/opera/android/favorites/SpeedDialDataFetcher;-><init>(Lorg/chromium/content_public/browser/WebContents;Ljava/lang/String;ILandroid/content/Context;ILcom/opera/api/Callback;)V

    :cond_145
    return-void
.end method
