.class public final Lkre;
.super Lsff;
.source "SourceFile"


# instance fields
.field public final j:Lx5f;

.field public final k:Lta7;

.field public l:J

.field public m:Z


# direct methods
.method public constructor <init>(Lz7;Lt9f;Lx5f;Lta7;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lsff;-><init>(Lz7;Lt9f;)V

    iput-object p3, p0, Lkre;->j:Lx5f;

    iput-object p4, p0, Lkre;->k:Lta7;

    return-void
.end method


# virtual methods
.method public final a(Lpzh;[B)V
    .registers 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lkre;->m:Z

    invoke-virtual {p0, p1, p2}, Lsff;->d(Lpzh;[B)V

    iget-boolean p1, p0, Lkre;->m:Z

    if-eqz p1, :cond_d

    invoke-virtual {p0, v0}, Lkre;->i(I)V

    :cond_d
    return-void
.end method

.method public final b(I)Z
    .registers 6

    invoke-super {p0, p1}, Lg3k;->b(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_e

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lkre;->l:J

    return v1

    :cond_e
    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    if-eqz p1, :cond_24

    const/4 v0, 0x3

    if-eq p1, v1, :cond_20

    const/4 v1, 0x2

    if-eq p1, v1, :cond_20

    if-eq p1, v0, :cond_20

    invoke-virtual {p0, v1}, Lkre;->i(I)V

    goto :goto_28

    :cond_20
    invoke-virtual {p0, v0}, Lkre;->i(I)V

    goto :goto_28

    :cond_24
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lkre;->i(I)V

    :goto_28
    const/4 p0, 0x0

    return p0
.end method

.method public final e(Lfvh;)V
    .registers 4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lkre;->l:J

    invoke-super {p0, p1}, Lsff;->e(Lfvh;)V

    return-void
.end method

.method public final h(Ljava/lang/String;Z)V
    .registers 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lkre;->m:Z

    invoke-super {p0, p1, p2}, Lsff;->h(Ljava/lang/String;Z)V

    return-void
.end method

.method public final i(I)V
    .registers 12

    iget-object v0, p0, Lkre;->j:Lx5f;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    const/4 v2, 0x1

    if-eq p1, v2, :cond_d

    iget-object v3, p0, Lsff;->i:Lz7;

    iget-boolean v3, v3, Lz7;->g:Z

    if-nez v3, :cond_158

    :cond_d
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lkre;->l:J

    sub-long/2addr v3, v5

    iget-object v5, p0, Lkre;->k:Lta7;

    if-eqz v5, :cond_158

    iget-object p0, p0, Lg3k;->b:Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v5}, Lta7;->r()Lyla;

    move-result-object v5

    if-eqz v5, :cond_158

    iget-object v5, v5, Lyla;->a:Ljava/net/URL;

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_158

    invoke-virtual {v5}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    const/4 v8, 0x0

    if-nez v7, :cond_5d

    invoke-virtual {v6, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_158

    const-string v7, "/"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_53

    const/4 v7, -0x1

    goto :goto_54

    :cond_53
    move v7, v8

    :goto_54
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v7

    invoke-virtual {v6, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    :cond_5d
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_158

    invoke-virtual {v6, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x2f

    if-ne v5, v7, :cond_158

    const-string v5, "v1/news/main"

    invoke-virtual {v6, v5, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_75

    const/4 v5, 0x0

    goto :goto_83

    :cond_75
    const-string v5, "v1/news/category"

    invoke-virtual {v6, v5, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_127

    const/16 v5, 0x11

    invoke-virtual {v6, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    :goto_83
    const-string v6, "action"

    invoke-virtual {p0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v6, "load_more"

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-string v7, "topnews"

    if-eqz v6, :cond_d9

    iget-boolean p0, v0, Lx5f;->h:Z

    if-eqz p0, :cond_158

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v1}, Lx56;->K(Lzpa;)Luo0;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-eqz v6, :cond_b3

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_b3

    new-instance v2, Lif0;

    invoke-direct {v2, v1, v8, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_c0

    :cond_b3
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v8, v2, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, v1, v8, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_c0
    if-nez v5, :cond_c3

    move-object v5, v7

    :cond_c3
    invoke-virtual {v2, v5}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lro0;

    if-nez v1, :cond_d2

    invoke-static {}, Lzpa;->I()Lro0;

    move-result-object v1

    invoke-virtual {v2, v5, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d2
    invoke-static {v1, p1, v3, v4}, Lp37;->V(Lro0;IJ)V

    invoke-virtual {v0, p0}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_d9
    const-string v6, "refresh"

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_158

    iget-boolean p0, v0, Lx5f;->h:Z

    if-eqz p0, :cond_158

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v1}, Lx56;->K(Lzpa;)Luo0;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-eqz v6, :cond_101

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_101

    new-instance v8, Lif0;

    invoke-direct {v8, v1, v2, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_10e

    :cond_101
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v2, v2, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v8, Lif0;

    invoke-direct {v8, v1, v2, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_10e
    if-nez v5, :cond_111

    move-object v5, v7

    :cond_111
    invoke-virtual {v8, v5}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lro0;

    if-nez v1, :cond_120

    invoke-static {}, Lzpa;->I()Lro0;

    move-result-object v1

    invoke-virtual {v8, v5, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_120
    invoke-static {v1, p1, v3, v4}, Lp37;->V(Lro0;IJ)V

    invoke-virtual {v0, p0}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_127
    const-string p0, "v1/related"

    invoke-virtual {v6, p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_158

    iget-boolean p0, v0, Lx5f;->h:Z

    if-eqz p0, :cond_158

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v1}, Lx56;->K(Lzpa;)Luo0;

    move-result-object v1

    const/4 v5, 0x2

    invoke-virtual {v1, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lro0;

    if-nez v6, :cond_152

    invoke-static {}, Lzpa;->I()Lro0;

    move-result-object v6

    invoke-virtual {v1, v5, v2, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lro0;

    :cond_152
    invoke-static {v6, p1, v3, v4}, Lp37;->V(Lro0;IJ)V

    invoke-virtual {v0, p0}, Lx5f;->U0(Lx56;)V

    :cond_158
    return-void
.end method
