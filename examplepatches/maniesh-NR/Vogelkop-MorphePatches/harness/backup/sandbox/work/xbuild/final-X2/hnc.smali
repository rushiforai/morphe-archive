.class public final Lhnc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static s:Z


# instance fields
.field public final a:Lnx5;

.field public final b:Lumi;

.field public final c:Lii;

.field public final d:Lode;

.field public final e:Lt1;

.field public final f:Ljava/util/HashMap;

.field public final g:Ljava/util/HashMap;

.field public final h:Lanc;

.field public final i:Lga6;

.field public final j:Lgnc;

.field public final k:Lh42;

.field public final l:Ljze;

.field public m:Lpr;

.field public n:Lewn;

.field public o:Lq65;

.field public final p:Lq65;

.field public final q:Lq65;

.field public r:Z


# direct methods
.method public constructor <init>(Lnx5;Lumi;Lii;Lode;Lnff;Lkw3;Lt1;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhnc;->a:Lnx5;

    iput-object p2, p0, Lhnc;->b:Lumi;

    iput-object p3, p0, Lhnc;->c:Lii;

    iput-object p4, p0, Lhnc;->d:Lode;

    iput-object p7, p0, Lhnc;->e:Lt1;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lhnc;->f:Ljava/util/HashMap;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lhnc;->g:Ljava/util/HashMap;

    new-instance p1, Lanc;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lanc;-><init>(Lhnc;B)V

    iput-object p1, p0, Lhnc;->h:Lanc;

    new-instance p1, Lga6;

    const/16 p3, 0x18

    invoke-direct {p1, p0, p3}, Lga6;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lhnc;->i:Lga6;

    new-instance p1, Lgnc;

    invoke-direct {p1, p0}, Lgnc;-><init>(Lhnc;)V

    iput-object p1, p0, Lhnc;->j:Lgnc;

    new-instance p1, Lh42;

    invoke-direct {p1}, Lh42;-><init>()V

    iput-object p1, p0, Lhnc;->k:Lh42;

    new-instance p3, Ljze;

    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p3, p4}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lhnc;->l:Ljze;

    new-instance p4, Lbnc;

    invoke-direct {p4, p0, p2}, Lbnc;-><init>(Lhnc;B)V

    new-instance p2, Lq65;

    const/4 p6, 0x4

    invoke-direct {p2, p4, p6}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lhnc;->p:Lq65;

    new-instance p2, Lbnc;

    const/4 p4, 0x1

    invoke-direct {p2, p0, p4}, Lbnc;-><init>(Lhnc;B)V

    new-instance p7, Lq65;

    invoke-direct {p7, p2, p6}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object p7, p0, Lhnc;->q:Lq65;

    new-instance p2, Lanc;

    invoke-direct {p2, p0, p4}, Lanc;-><init>(Lhnc;B)V

    new-instance p4, Lug;

    const/16 p6, 0x1a

    invoke-direct {p4, p2, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p5, p4}, Lh42;->s(Lekc;Lf7f;)V

    new-instance p2, Lanc;

    const/4 p4, 0x2

    invoke-direct {p2, p0, p4}, Lanc;-><init>(Lhnc;B)V

    new-instance p0, Lug;

    invoke-direct {p0, p2, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object p2, p3, Ljze;->l:Lh42;

    invoke-virtual {p2, p1, p0}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 6

    iget-object v0, p0, Lhnc;->p:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object v0, p0, Lhnc;->q:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    const/4 v0, 0x0

    iput-object v0, p0, Lhnc;->m:Lpr;

    iput-object v0, p0, Lhnc;->n:Lewn;

    if-eqz p1, :cond_2c

    iget-boolean p1, p0, Lhnc;->r:Z

    if-eqz p1, :cond_2c

    new-instance p1, Lbnc;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lbnc;-><init>(Lhnc;B)V

    new-instance v0, Lq65;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Lq65;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v1, 0x1

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    iget-object v3, p0, Lhnc;->b:Lumi;

    invoke-virtual {v0, v3, v1, v2, p1}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    iput-object v0, p0, Lhnc;->o:Lq65;

    :cond_2c
    return-void
.end method

.method public final b()V
    .registers 9

    iget-object v0, p0, Lhnc;->m:Lpr;

    if-nez v0, :cond_fc

    iget-object v0, p0, Lhnc;->g:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_fc

    iget-object v1, p0, Lhnc;->o:Lq65;

    if-nez v1, :cond_fc

    iget-object v1, p0, Lhnc;->d:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltpc;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_27

    new-instance v0, Lr62;

    new-instance v2, Lcnc;

    invoke-direct {v2, p0, v3}, Lcnc;-><init>(Lhnc;B)V

    invoke-direct {v0, v1, v2, v4}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-void

    :cond_27
    iget-object v2, p0, Lhnc;->k:Lh42;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/Uri;

    if-nez v5, :cond_3c

    new-instance v0, Lr62;

    new-instance v1, Lcnc;

    invoke-direct {v1, p0, v4}, Lcnc;-><init>(Lhnc;B)V

    invoke-direct {v0, v2, v1, v4}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-void

    :cond_3c
    new-instance v2, Lewn;

    iget-object v6, p0, Lhnc;->c:Lii;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lt9f;

    iget-object v7, p0, Lhnc;->b:Lumi;

    invoke-direct {v2, v7, v5, v6}, Lewn;-><init>(Lumi;Landroid/net/Uri;Lt9f;)V

    iput-object v2, p0, Lhnc;->n:Lewn;

    new-instance v5, Lpr;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    new-instance v6, Landroid/util/SparseArray;

    invoke-direct {v6, v4}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v6, v5, Lpr;->d:Ljava/lang/Object;

    iput v4, v5, Lpr;->a:I

    iput-object v2, v5, Lpr;->b:Ljava/lang/Object;

    iget-object v4, p0, Lhnc;->i:Lga6;

    iput-object v4, v5, Lpr;->c:Ljava/lang/Object;

    new-instance v4, Lt9i;

    invoke-direct {v4, v5, v3}, Lt9i;-><init>(Lpr;B)V

    invoke-virtual {v2, v4}, Lewn;->h(Lcom/opera/api/Callback;)V

    iput-object v5, p0, Lhnc;->m:Lpr;

    const-wide/16 v2, 0x14

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v6, p0, Lhnc;->p:Lq65;

    invoke-virtual {v6, v7, v2, v3, v4}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    const-string v4, "name"

    const-string v6, "ofa"

    invoke-static {v4, v6}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v4

    iget-object v6, p0, Lhnc;->e:Lt1;

    invoke-virtual {v6}, Lt1;->get()Ljava/lang/Object;

    move-result-object v6

    const-string v7, "version"

    invoke-virtual {v4, v6, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "instance"

    const-string v7, "beta"

    invoke-virtual {v4, v7, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "product"

    invoke-virtual {v3, v4, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    const-string v6, "user_agent"

    invoke-static {}, Lcqp;->i0()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "browser"

    invoke-virtual {v3, v4, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "client"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    const-string v3, "hello"

    const/4 v4, 0x0

    invoke-virtual {v5, v3, v2, v4}, Lpr;->e(Ljava/lang/String;Ljava/util/List;Lv9i;)V

    new-instance v2, Lug;

    const/16 v3, 0x1a

    iget-object p0, p0, Lhnc;->h:Lanc;

    invoke-direct {v2, p0, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v2}, Lekc;->k(Lf7f;)V

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_d3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_fc

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldnc;

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    const-string v2, "envelope_type"

    iget-object v3, v0, Ldnc;->a:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "id"

    iget-wide v6, v0, Ldnc;->b:J

    invoke-virtual {v1, v6, v7, v2}, Lorb;->o(JLjava/lang/String;)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const-string v1, "observe"

    invoke-virtual {v5, v1, v0, v4}, Lpr;->e(Ljava/lang/String;Ljava/util/List;Lv9i;)V

    goto :goto_d3

    :cond_fc
    return-void
.end method
