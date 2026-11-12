.class public Lash;
.super Ln82;
.source "SourceFile"


# instance fields
.field public final k:I

.field public final l:Ljava/lang/String;

.field public final m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lywh;Lqre;ILz05;Luy8;Z)V
    .registers 16

    if-gez p4, :cond_c

    const/4 v0, 0x1

    :goto_3
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p5

    move-object v5, p6

    move v7, p7

    move v6, v0

    move-object v0, p0

    goto :goto_e

    :cond_c
    const/4 v0, 0x0

    goto :goto_3

    :goto_e
    invoke-direct/range {v0 .. v7}, Ln82;-><init>(Landroid/content/Context;Lywh;Lqre;Lqtm;Luy8;ZZ)V

    iput p4, p0, Lash;->k:I

    iget-object v1, p5, Lz05;->i:Lbre;

    if-eqz v1, :cond_1a

    iget-object v1, v1, Lbre;->a:Ljava/lang/String;

    goto :goto_1b

    :cond_1a
    const/4 v1, 0x0

    :goto_1b
    iput-object v1, p0, Lash;->l:Ljava/lang/String;

    iget-boolean v1, p5, Lz05;->k:Z

    iput-boolean v1, p0, Lash;->m:Z

    return-void
.end method


# virtual methods
.method public Q(Landroid/net/Uri$Builder;)V
    .registers 4

    const-string v0, "exclude"

    const-string v1, "summary"

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {p0, p1}, Lash;->V(Landroid/net/Uri$Builder;)V

    const-string v0, "action"

    iget p0, p0, Lash;->k:I

    if-gez p0, :cond_16

    const-string p0, "refresh"

    invoke-virtual {p1, v0, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-void

    :cond_16
    const-string v1, "load_more"

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v0, "load_more_count"

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-void
.end method

.method public final T(Ld5o;Ljava/lang/String;)Ljava/util/List;
    .registers 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-object v2, p0, Ln82;->g:Ll45;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3, v0, v1}, Ll45;->R(Ld5o;Ljava/lang/String;J)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p1, Ld5o;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Ln82;->f:Luy8;

    invoke-virtual {v2, v0}, Luy8;->b(Ljava/util/List;)V

    iget-object p1, p1, Ld5o;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_26

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_26

    iput-object p1, v2, Luy8;->m:Ljava/util/Map;

    goto :goto_32

    :cond_26
    iget-object p1, v2, Luy8;->m:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_35

    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object p1, v2, Luy8;->m:Ljava/util/Map;

    :goto_32
    invoke-virtual {v2}, Luy8;->n()V

    :cond_35
    iget p0, p0, Lash;->k:I

    const/4 p1, 0x0

    if-gez p0, :cond_45

    new-instance p0, Lhy8;

    const-string v3, "refresh"

    invoke-direct {p0, v3, v1, p2, p1}, Loy8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {v2, p0}, Luy8;->c(Ldy8;)V

    return-object v0

    :cond_45
    new-instance p0, Lhy8;

    const-string v3, "load_more"

    invoke-direct {p0, v3, v1, p2, p1}, Loy8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {v2, p0}, Luy8;->c(Ldy8;)V

    return-object v0
.end method

.method public V(Landroid/net/Uri$Builder;)V
    .registers 5

    iget-object v0, p0, Ln82;->j:Lqre;

    iget-object v1, v0, Lqre;->b:Lyqe;

    iget-object v0, v0, Lqre;->b:Lyqe;

    iget-object v2, p0, Lash;->l:Ljava/lang/String;

    if-nez v1, :cond_1b

    const-string v0, "v1/news/main"

    invoke-virtual {p1, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-boolean p0, p0, Lash;->m:Z

    if-eqz p0, :cond_1a

    if-eqz v2, :cond_1a

    const-string p0, "ip_city"

    invoke-virtual {p1, p0, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_1a
    return-void

    :cond_1b
    const-string p0, "v1/news/category"

    invoke-virtual {p1, p0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Lyqe;->a()Z

    move-result p0

    if-eqz p0, :cond_2c

    invoke-virtual {p1, v2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-void

    :cond_2c
    iget-object p0, v0, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-void
.end method
