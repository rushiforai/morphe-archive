.class public final Lm6m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb59;

.field public final b:Lx5f;

.field public c:Ldpj;

.field public d:Lqq8;

.field public e:Lk6m;

.field public f:Z

.field public g:Z

.field public final h:Llg;

.field public final i:Lq6e;

.field public final j:Lcom/opera/android/settings/SettingsManager;

.field public final k:Lxnh;

.field public final l:Ll6m;

.field public final m:Ll6m;

.field public final n:Lj25;

.field public final o:Lkv1;

.field public p:I


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Llg;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "trending-topics"

    invoke-static {p1, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v0

    iput-object v0, p0, Lm6m;->a:Lb59;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iput-object v0, p0, Lm6m;->b:Lx5f;

    new-instance v0, Lj25;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lj25;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lm6m;->n:Lj25;

    new-instance v1, Lkv1;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lkv1;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lm6m;->o:Lkv1;

    iput-object p2, p0, Lm6m;->h:Llg;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object p2

    iput-object p2, p0, Lm6m;->i:Lq6e;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    iput-object v2, p0, Lm6m;->j:Lcom/opera/android/settings/SettingsManager;

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v3

    iput-object v3, p0, Lm6m;->k:Lxnh;

    invoke-static {p1}, Lbml;->u(Landroid/content/Context;)Lbml;

    move-result-object p1

    new-instance v4, Ll6m;

    invoke-direct {v4, p0, v3}, Ll6m;-><init>(Lm6m;Lno7;)V

    iput-object v4, p0, Lm6m;->l:Ll6m;

    new-instance v5, Ll6m;

    invoke-direct {v5, p0, p1}, Ll6m;-><init>(Lm6m;Lno7;)V

    iput-object v5, p0, Lm6m;->m:Ll6m;

    invoke-virtual {v3, v4}, Lno7;->g(Lmo7;)V

    invoke-virtual {p1, v5}, Lno7;->g(Lmo7;)V

    invoke-virtual {p2, v1}, Lq6e;->a(Lkri;)V

    invoke-virtual {v2, v0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 6

    iget-object v0, p0, Lm6m;->j:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_trending_searches"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lm6m;->i:Lq6e;

    invoke-virtual {v0}, Lq6e;->b()Leri;

    move-result-object v0

    invoke-static {v0}, Lgco;->a(Leri;)Z

    move-result v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lm6m;->l:Ll6m;

    iget-boolean v0, v0, Ll6m;->a:Z

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lm6m;->k:Lxnh;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwnh;

    const/16 v3, 0x40

    invoke-virtual {v0, v3}, Lwnh;->a(I)Z

    move-result v0

    if-eqz v0, :cond_2f

    move v1, v2

    :cond_2f
    iget v0, p0, Lm6m;->p:I

    const/4 v3, 0x0

    if-ne v1, v0, :cond_51

    if-eqz p1, :cond_72

    if-eqz v0, :cond_44

    invoke-static {v0}, Lvep;->A(I)I

    move-result p1

    if-nez p1, :cond_44

    new-instance v3, Ldpj;

    const/4 p1, 0x6

    invoke-direct {v3, p1}, Ldpj;-><init>(B)V

    :cond_44
    iput-object v3, p0, Lm6m;->c:Ldpj;

    iget-boolean p1, p0, Lm6m;->f:Z

    if-eqz p1, :cond_4e

    invoke-virtual {p0, v2}, Lm6m;->b(Z)V

    return-void

    :cond_4e
    iput-boolean v2, p0, Lm6m;->g:Z

    return-void

    :cond_51
    if-eqz v0, :cond_54

    move p1, v2

    :cond_54
    iput v1, p0, Lm6m;->p:I

    if-eqz v1, :cond_64

    invoke-static {v1}, Lvep;->A(I)I

    move-result v0

    if-nez v0, :cond_64

    new-instance v3, Ldpj;

    const/4 v0, 0x6

    invoke-direct {v3, v0}, Ldpj;-><init>(B)V

    :cond_64
    iput-object v3, p0, Lm6m;->c:Ldpj;

    iget-boolean v0, p0, Lm6m;->f:Z

    if-eqz v0, :cond_6e

    invoke-virtual {p0, p1}, Lm6m;->b(Z)V

    return-void

    :cond_6e
    if-eqz p1, :cond_72

    iput-boolean v2, p0, Lm6m;->g:Z

    :cond_72
    return-void
.end method

.method public final b(Z)V
    .registers 11

    const/4 v0, 0x1

    iput-boolean v0, p0, Lm6m;->f:Z

    iget-object v1, p0, Lm6m;->c:Ldpj;

    if-eqz v1, :cond_57

    iget-boolean v1, p0, Lm6m;->g:Z

    if-eqz v1, :cond_f

    const/4 p1, 0x0

    iput-boolean p1, p0, Lm6m;->g:Z

    move p1, v0

    :cond_f
    new-instance v0, Lk6m;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lm6m;->c:Ldpj;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lvsi;->b()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lk6m;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_58

    iget-object p1, p0, Lm6m;->e:Lk6m;

    invoke-virtual {v0, p1}, Lk6m;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_57

    iget-object p1, p0, Lm6m;->d:Lqq8;

    if-eqz p1, :cond_58

    iget-object p1, p1, Lqq8;->c:Ljava/lang/Object;

    check-cast p1, Lk6m;

    invoke-virtual {v0, p1}, Lk6m;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_58

    iget-object p1, p0, Lm6m;->d:Lqq8;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p1, Lqq8;->a:J

    cmp-long p1, v5, v3

    if-lez p1, :cond_58

    const-wide/32 v7, 0x5265c00

    add-long/2addr v3, v7

    cmp-long p1, v5, v3

    if-gtz p1, :cond_58

    :cond_57
    return-void

    :cond_58
    iput-object v0, p0, Lm6m;->e:Lk6m;

    iget-object p1, p0, Lm6m;->c:Ldpj;

    new-instance v3, Ln9h;

    const/16 v4, 0xa

    invoke-direct {v3, p0, v0, v4}, Ln9h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Landroid/net/Uri$Builder;

    invoke-direct {p0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v0, "https"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "www.google.com"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "complete/search"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "client"

    const-string v4, "opera-mobile"

    invoke-virtual {p0, v0, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "hl"

    invoke-virtual {p0, v0, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "gl"

    invoke-virtual {p0, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "q"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    sget-object v0, Lxne;->b:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v1, Lfvh;

    invoke-direct {v1}, Lfvh;-><init>()V

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lfvh;->h(Ljava/lang/String;)V

    sget-object p0, Le74;->o:Le74;

    invoke-virtual {v1, p0}, Lfvh;->b(Le74;)V

    new-instance p0, Lkvh;

    invoke-direct {p0, v1}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, p0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    new-instance v0, Lqsh;

    invoke-direct {v0, p1, v3}, Lqsh;-><init>(Ldpj;Ln9h;)V

    invoke-interface {p0, v0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method
