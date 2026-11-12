.class public final Lnp6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Le84;

.field public final b:Ltd2;

.field public final c:Lpp6;

.field public final d:Lqfb;

.field public final e:J

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Landroid/graphics/Bitmap;

.field public final j:Ljava/util/ArrayList;

.field public k:I


# direct methods
.method public constructor <init>(Le84;Ltd2;Lpp6;Lqfb;Lhq8;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnp6;->a:Le84;

    iput-object p2, p0, Lnp6;->b:Ltd2;

    iput-object p3, p0, Lnp6;->c:Lpp6;

    iput-object p4, p0, Lnp6;->d:Lqfb;

    invoke-virtual {p5}, Lhq8;->e()J

    move-result-wide p1

    iput-wide p1, p0, Lnp6;->e:J

    sget-object p1, Lp6l;->a:Lp6l;

    invoke-virtual {p5, p1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnp6;->f:Ljava/lang/String;

    invoke-virtual {p5}, Lhq8;->c()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnp6;->g:Ljava/lang/String;

    invoke-virtual {p5}, Lhq8;->h()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnp6;->h:Ljava/lang/String;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnp6;->j:Ljava/util/ArrayList;

    const/4 p1, 0x2

    iput p1, p0, Lnp6;->k:I

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget v0, p0, Lnp6;->k:I

    if-nez v0, :cond_7d

    iget-object v0, p0, Lnp6;->d:Lqfb;

    iget-object v0, v0, Lqfb;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/favorites/e;

    new-instance v1, Lrh2;

    iget-wide v2, p0, Lnp6;->e:J

    invoke-direct {v1, v2, v3}, Lrh2;-><init>(J)V

    iget-object v0, v0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-static {v1, v0}, Lnr8;->g(Lmr8;Ltq8;)Lhq8;

    move-result-object v0

    iget-object v1, p0, Lnp6;->g:Ljava/lang/String;

    iget-object v2, p0, Lnp6;->a:Le84;

    if-nez v0, :cond_21

    invoke-virtual {v2, v1}, Le84;->b(Ljava/lang/String;)V

    return-void

    :cond_21
    iget-object v3, p0, Lnp6;->j:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3d

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_2e
    if-ge v5, v4, :cond_3d

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lop6;

    iget-boolean v6, v6, Lop6;->a:Z

    if-eqz v6, :cond_2e

    goto :goto_7d

    :cond_3d
    invoke-virtual {v2, v1}, Le84;->b(Ljava/lang/String;)V

    iget-object v1, p0, Lnp6;->h:Ljava/lang/String;

    iget-object p0, p0, Lnp6;->i:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5a

    if-nez p0, :cond_5a

    invoke-virtual {v0}, Lhq8;->h()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7d

    invoke-virtual {v0, v1}, Lhq8;->q(Ljava/lang/String;)V

    return-void

    :cond_5a
    if-eqz p0, :cond_7d

    sget-object v2, Lp6l;->a:Lp6l;

    invoke-virtual {v0, v2}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "https://"

    invoke-static {v2}, Lwqm;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object v2

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2}, LJ/N;->MwmLujL6(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lhq8;->e()J

    move-result-wide v0

    sget-object p0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    const/4 p0, 0x1

    invoke-static {v0, v1, p0}, LJ/N;->MzRSq0ia(JZ)V

    :cond_7d
    :goto_7d
    return-void
.end method

.method public final b(Z)V
    .registers 12

    iget-object v8, p0, Lnp6;->f:Ljava/lang/String;

    invoke-static {v8}, Lz7h;->l(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iget-object v0, p0, Lnp6;->h:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_32

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/16 v7, 0x1a

    const/4 v1, 0x1

    const-class v3, Lnp6;

    const-string v4, "onTitleFetched"

    const-string v5, "onTitleFetched(Lcom/opera/android/utilities/Either;)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object v1, p0, Lnp6;->b:Ltd2;

    iget-object v1, v1, Ltd2;->a:Lumi;

    sget-object v3, Lp6l;->a:Lp6l;

    new-instance v4, Lqe6;

    const/4 v2, 0x2

    invoke-direct {v4, v0, v2}, Lqe6;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lcom/opera/android/browser/b;

    const/4 v5, 0x0

    move-object v2, v9

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/browser/b;-><init>(Ltcl;Ljava/lang/String;Lp6l;Lzun;Z)V

    goto :goto_38

    :cond_32
    iget v0, p0, Lnp6;->k:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnp6;->k:I

    :goto_38
    if-nez p1, :cond_73

    sget-object v0, Lhk6;->e:La36;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v8}, La36;->p(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_73

    invoke-static {v8}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_73

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/16 v7, 0x1b

    const/4 v1, 0x1

    const-class v3, Lnp6;

    const-string v4, "onIconFetched"

    const-string v5, "onIconFetched(Lcom/opera/android/utilities/Either;)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object v1, p0, Lnp6;->c:Lpp6;

    iget-object v4, v1, Lpp6;->a:Landroid/content/Context;

    new-instance v6, Liu2;

    const/16 v1, 0x1a

    invoke-direct {v6, v0, v1}, Liu2;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;

    const/4 v1, 0x0

    invoke-static {v4}, Lnr8;->e(Landroid/content/Context;)I

    move-result v5

    const/4 v3, 0x2

    move-object v2, v9

    invoke-direct/range {v0 .. v6}, Lcom/opera/android/favorites/SpeedDialDataFetcher;-><init>(Lorg/chromium/content_public/browser/WebContents;Ljava/lang/String;ILandroid/content/Context;ILcom/opera/api/Callback;)V

    goto :goto_79

    :cond_73
    iget v0, p0, Lnp6;->k:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnp6;->k:I

    :goto_79
    invoke-virtual {p0}, Lnp6;->a()V

    return-void
.end method
