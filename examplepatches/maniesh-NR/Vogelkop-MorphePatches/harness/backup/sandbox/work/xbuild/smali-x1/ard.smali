.class public final Lard;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public b:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public c:Lepd;

.field public d:Levn;

.field public e:Landroid/graphics/Bitmap;

.field public f:Landroid/graphics/Bitmap;

.field public g:Landroid/graphics/Bitmap;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Lzqd;

.field public final k:I

.field public l:Likd;

.field public m:Ljava/lang/String;

.field public n:Lorg/chromium/services/media_session/MediaMetadata;

.field public o:Lorg/chromium/services/media_session/MediaMetadata;

.field public final p:Lac1;

.field public q:Ljava/util/HashSet;

.field public r:Lorg/chromium/services/media_session/MediaPosition;

.field public s:Loml;

.field public t:I

.field public final u:Lk03;

.field public final v:Lwub;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lumi;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x80000000

    iput v0, p0, Lard;->k:I

    iput v0, p0, Lard;->t:I

    new-instance v0, Lk03;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v1, -0x1

    iput-wide v1, v0, Lk03;->a:J

    iput-wide v1, v0, Lk03;->b:J

    iput-object v0, p0, Lard;->u:Lk03;

    new-instance v0, Lwub;

    invoke-direct {v0, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lard;->v:Lwub;

    new-instance v0, Lty3;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lty3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    sget-object p1, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->c0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lepd;

    iput-object p1, p0, Lard;->c:Lepd;

    sget-object p1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->q1:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Levn;

    iput-object p1, p0, Lard;->d:Levn;

    iget-object p1, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    new-instance p1, Lac1;

    invoke-static {}, Lorg/chromium/base/SysUtils;->b()Z

    move-result v0

    if-eqz v0, :cond_5f

    const/16 v0, 0x100

    goto :goto_61

    :cond_5f
    const/16 v0, 0x200

    :goto_61
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput v0, p1, Lac1;->a:I

    const/4 v0, -0x1

    iput v0, p1, Lac1;->b:I

    const/4 v1, 0x0

    iput-object v1, p1, Lac1;->d:Ljava/lang/Object;

    iput-object p1, p0, Lard;->p:Lac1;

    iget-object v2, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v2

    iput-object v2, p1, Lac1;->c:Ljava/lang/Object;

    iput v0, p1, Lac1;->b:I

    iput-object v1, p1, Lac1;->d:Ljava/lang/Object;

    invoke-static {v2}, LJ/N;->Mtun$qW8(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/chromium/content/browser/MediaSessionImpl;

    iget-object v0, p0, Lard;->j:Lzqd;

    if-eqz v0, :cond_88

    iget-object v0, v0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    if-eq p1, v0, :cond_97

    :cond_88
    invoke-virtual {p0}, Lard;->a()V

    if-eqz p1, :cond_94

    new-instance v0, Lzqd;

    invoke-direct {v0, p0, p1, p1}, Lzqd;-><init>(Lard;Lorg/chromium/content_public/browser/MediaSession;Lorg/chromium/content_public/browser/MediaSession;)V

    iput-object v0, p0, Lard;->j:Lzqd;

    :cond_94
    invoke-virtual {p0}, Lard;->f()V

    :cond_97
    iget-object p1, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p1

    if-eqz p1, :cond_a5

    invoke-virtual {p1}, Landroid/app/Activity;->getVolumeControlStream()I

    move-result p1

    iput p1, p0, Lard;->k:I

    :cond_a5
    iput-object p2, p0, Lard;->a:Lumi;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lard;->j:Lzqd;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget v0, p0, Lard;->t:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_14

    sget-object v2, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    iget-object v2, v2, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->a:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->remove(I)V

    iput v1, p0, Lard;->t:I

    :cond_14
    iget-object v0, p0, Lard;->j:Lzqd;

    iget-object v0, v0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    if-eqz v0, :cond_25

    iget-object v1, p0, Lard;->c:Lepd;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v2}, Lepd;->a(Lorg/chromium/content_public/browser/MediaSession;ZZ)V

    iget-object v1, p0, Lard;->d:Levn;

    invoke-virtual {v1, v0}, Lsc;->n(Ljava/lang/Object;)V

    :cond_25
    iget-object v0, p0, Lard;->j:Lzqd;

    iget-object v1, v0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    const/4 v2, 0x0

    if-eqz v1, :cond_31

    invoke-virtual {v1, v0}, Lorg/chromium/content_public/browser/MediaSession;->c(Lzqd;)V

    iput-object v2, v0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    :cond_31
    iput-object v2, p0, Lard;->j:Lzqd;

    iput-object v2, p0, Lard;->q:Ljava/util/HashSet;

    return-void
.end method

.method public final b()Lorg/chromium/services/media_session/MediaMetadata;
    .registers 5

    iget-object v0, p0, Lard;->m:Ljava/lang/String;

    iget-object v1, p0, Lard;->n:Lorg/chromium/services/media_session/MediaMetadata;

    if-eqz v1, :cond_16

    iget-object v1, v1, Lorg/chromium/services/media_session/MediaMetadata;->a:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    iget-object v2, p0, Lard;->n:Lorg/chromium/services/media_session/MediaMetadata;

    if-nez v1, :cond_11

    return-object v2

    :cond_11
    iget-object v1, v2, Lorg/chromium/services/media_session/MediaMetadata;->b:Ljava/lang/String;

    iget-object v2, v2, Lorg/chromium/services/media_session/MediaMetadata;->c:Ljava/lang/String;

    goto :goto_19

    :cond_16
    const-string v1, ""

    move-object v2, v1

    :goto_19
    iget-object v3, p0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    if-eqz v3, :cond_3c

    iget-object v3, v3, Lorg/chromium/services/media_session/MediaMetadata;->a:Ljava/lang/String;

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3c

    iget-object v3, p0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    iget-object v3, v3, Lorg/chromium/services/media_session/MediaMetadata;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3c

    iget-object v3, p0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    iget-object v3, v3, Lorg/chromium/services/media_session/MediaMetadata;->c:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3c

    iget-object p0, p0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    return-object p0

    :cond_3c
    new-instance p0, Lorg/chromium/services/media_session/MediaMetadata;

    invoke-direct {p0, v0, v1, v2}, Lorg/chromium/services/media_session/MediaMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lard;->s:Loml;

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Loml;->cancel(Z)Z

    iput-object v1, p0, Lard;->s:Loml;

    :cond_10
    invoke-virtual {p0}, Lard;->d()V

    iput-object v1, p0, Lard;->l:Likd;

    return-void
.end method

.method public final d()V
    .registers 9

    iget-object v0, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v0, v0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    const v1, 0x7f0a060f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Llkd;->a:Landroid/util/SparseArray;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v3

    sget-object v4, Llkd;->b:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_24

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_25

    :cond_24
    move v3, v1

    :goto_25
    sget-object v5, Llkd;->a:Landroid/util/SparseArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lhkd;

    if-eqz v6, :cond_66

    iget-object v7, v6, Lhkd;->g:Ljkd;

    if-eqz v7, :cond_3c

    iget v7, v7, Ljkd;->e:I

    if-ne v7, v0, :cond_66

    if-ne v0, v7, :cond_3c

    invoke-virtual {v6}, Lhkd;->b()V

    :cond_3c
    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->remove(I)V

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Llkd;->c:Landroid/util/SparseIntArray;

    const/high16 v2, -0x80000000

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->get(II)I

    move-result v2

    invoke-virtual {v5, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lhkd;

    if-eq v3, v2, :cond_60

    if-eqz v4, :cond_60

    iget-boolean v2, v4, Lhkd;->i:Z

    if-nez v2, :cond_66

    :cond_60
    invoke-virtual {v0, v1}, Landroid/util/SparseIntArray;->delete(I)V

    invoke-static {v1, v3}, Llkd;->c(II)Z

    :cond_66
    iget-object v0, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    if-eqz v0, :cond_73

    iget p0, p0, Lard;->k:I

    invoke-virtual {v0, p0}, Landroid/app/Activity;->setVolumeControlStream(I)V

    :cond_73
    return-void
.end method

.method public final e()Z
    .registers 1

    iget-object p0, p0, Lard;->l:Likd;

    if-nez p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final f()V
    .registers 5

    iget-object v0, p0, Lard;->j:Lzqd;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v0, v0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    iget v1, p0, Lard;->t:I

    if-ne v0, v1, :cond_d

    :cond_c
    return-void

    :cond_d
    const/high16 v2, -0x80000000

    if-eq v1, v2, :cond_1a

    sget-object v3, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    iget-object v3, v3, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->a:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->remove(I)V

    iput v2, p0, Lard;->t:I

    :cond_1a
    iput v0, p0, Lard;->t:I

    sget-object v1, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    new-instance v2, Ly0a;

    const/16 v3, 0x14

    invoke-direct {v2, p0, v3}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v1, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->a:Landroid/util/SparseArray;

    invoke-virtual {p0, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public final g()V
    .registers 3

    iget-object v0, p0, Lard;->s:Loml;

    if-eqz v0, :cond_b

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lard;->s:Loml;

    :cond_b
    iget-object p0, p0, Lard;->l:Likd;

    invoke-virtual {p0}, Likd;->a()Ljkd;

    move-result-object p0

    invoke-static {p0}, Lf03;->h0(Ljkd;)V

    return-void
.end method

.method public final h()V
    .registers 3

    iget-object v0, p0, Lard;->e:Landroid/graphics/Bitmap;

    if-nez v0, :cond_6

    iget-object v0, p0, Lard;->f:Landroid/graphics/Bitmap;

    :cond_6
    iget-object v1, p0, Lard;->g:Landroid/graphics/Bitmap;

    if-eq v1, v0, :cond_12

    iput-object v0, p0, Lard;->g:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lard;->e()Z

    move-result v0

    if-eqz v0, :cond_13

    :cond_12
    return-void

    :cond_13
    iget-object v0, p0, Lard;->l:Likd;

    iget-object v1, p0, Lard;->g:Landroid/graphics/Bitmap;

    iput-object v1, v0, Likd;->g:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lard;->e:Landroid/graphics/Bitmap;

    iput-object v1, v0, Likd;->h:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lard;->g()V

    return-void
.end method

.method public final i()V
    .registers 3

    invoke-virtual {p0}, Lard;->e()Z

    move-result v0

    if-nez v0, :cond_12

    invoke-virtual {p0}, Lard;->b()Lorg/chromium/services/media_session/MediaMetadata;

    move-result-object v0

    iget-object v1, p0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    invoke-virtual {v1, v0}, Lorg/chromium/services/media_session/MediaMetadata;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    :cond_12
    return-void

    :cond_13
    iput-object v0, p0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    iget-object v1, p0, Lard;->l:Likd;

    iput-object v0, v1, Likd;->a:Lorg/chromium/services/media_session/MediaMetadata;

    invoke-virtual {p0}, Lard;->g()V

    return-void
.end method
