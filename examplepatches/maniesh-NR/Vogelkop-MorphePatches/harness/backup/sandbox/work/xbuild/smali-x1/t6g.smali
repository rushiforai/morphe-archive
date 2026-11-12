.class public final Lt6g;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lot2;

.field public final c:Lyu2;

.field public final d:Lx5g;

.field public final e:Lzg7;

.field public final f:Lru9;

.field public final g:Lcq5;

.field public final h:Ldb;

.field public final i:Lzwk;

.field public final j:Lhxk;

.field public final k:Lorm;

.field public final l:Lumi;

.field public m:Lsl6;

.field public n:Loml;

.field public final o:Ljk;

.field public final p:Lkze;

.field public q:Z

.field public final r:Lkze;

.field public final s:Ltsd;

.field public final t:Lfn3;

.field public final u:Lt77;


# direct methods
.method public constructor <init>(Lot2;Lyu2;Lx5g;Lzg7;Lru9;Lcq5;Lxb;Ldb;Lzwk;Lhxk;Lorm;Lumi;)V
    .registers 13

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lt6g;->b:Lot2;

    iput-object p2, p0, Lt6g;->c:Lyu2;

    iput-object p3, p0, Lt6g;->d:Lx5g;

    iput-object p4, p0, Lt6g;->e:Lzg7;

    iput-object p5, p0, Lt6g;->f:Lru9;

    iput-object p6, p0, Lt6g;->g:Lcq5;

    iput-object p8, p0, Lt6g;->h:Ldb;

    iput-object p9, p0, Lt6g;->i:Lzwk;

    iput-object p10, p0, Lt6g;->j:Lhxk;

    iput-object p11, p0, Lt6g;->k:Lorm;

    iput-object p12, p0, Lt6g;->l:Lumi;

    new-instance p1, Lsl6;

    sget-object p2, Lt8;->a:Landroid/content/Context;

    invoke-direct {p1, p2}, Lsl6;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lt6g;->m:Lsl6;

    new-instance p1, Ljk;

    invoke-direct {p1}, Ljk;-><init>()V

    iput-object p1, p0, Lt6g;->o:Ljk;

    iget-object p1, p7, Lxb;->d:Lkze;

    iput-object p1, p0, Lt6g;->p:Lkze;

    new-instance p1, Lkze;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lt6g;->r:Lkze;

    new-instance p2, Ltsd;

    sget-object p3, Lo6g;->h:Lo6g;

    invoke-direct {p2, p3}, Ltsd;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lt6g;->s:Ltsd;

    new-instance p3, Lfn3;

    const/4 p5, 0x1

    invoke-direct {p3, p0, p5}, Lfn3;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Lt6g;->t:Lfn3;

    new-instance p3, Lt77;

    const/16 p6, 0x8

    invoke-direct {p3, p0, p6}, Lt77;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Lt6g;->u:Lt77;

    iget-object p3, p4, Loy;->e:Ljava/lang/Object;

    check-cast p3, Lkze;

    iget-object p4, p4, Loy;->f:Ljava/lang/Object;

    check-cast p4, Lh42;

    const/4 p6, 0x3

    new-array p6, p6, [Lekc;

    const/4 p7, 0x0

    aput-object p3, p6, p7

    aput-object p4, p6, p5

    const/4 p3, 0x2

    aput-object p1, p6, p3

    invoke-static {p6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    move-object p3, p1

    check-cast p3, Ljava/lang/Iterable;

    new-instance p4, Ls4f;

    const/4 p5, 0x6

    invoke-direct {p4, p1, p0, p5}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_74
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_92

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    new-instance p3, Lnna;

    const/16 p5, 0x1c

    invoke-direct {p3, p4, p5}, Lnna;-><init>(Ljava/lang/Object;B)V

    new-instance p5, Lug;

    const/16 p6, 0x19

    invoke-direct {p5, p3, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p5}, Ltsd;->s(Lekc;Lf7f;)V

    goto :goto_74

    :cond_92
    return-void
.end method


# virtual methods
.method public final e()V
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Lt6g;->e:Lzg7;

    invoke-virtual {v1, v0}, Loy;->i(Lj1c;)V

    invoke-virtual {v1}, Lzg7;->m()V

    iget-object v0, p0, Lt6g;->i:Lzwk;

    iget-object v1, p0, Lt6g;->t:Lfn3;

    invoke-virtual {v0, v1}, Lzwk;->j(Lywk;)V

    iget-object v0, p0, Lt6g;->p:Lkze;

    iget-object v1, p0, Lt6g;->u:Lt77;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lt6g;->q:Z

    return-void
.end method

.method public final f()Z
    .registers 2

    iget-object v0, p0, Lt6g;->g:Lcq5;

    invoke-virtual {v0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8f;

    invoke-virtual {v0}, Lf8f;->g()Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, p0, Lt6g;->e:Lzg7;

    invoke-virtual {v0}, Loy;->e()Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, p0, Lt6g;->r:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object p0, p0, Lt6g;->m:Lsl6;

    invoke-virtual {p0}, Lsl6;->b()Z

    move-result p0

    if-nez p0, :cond_2e

    const/4 p0, 0x1

    return p0

    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 5

    iget-object v0, p0, Lt6g;->c:Lyu2;

    invoke-virtual {v0}, Lyu2;->b()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_5c

    invoke-virtual {v0}, Lyu2;->a()Z

    move-result v0

    if-nez v0, :cond_5c

    iget-object v0, p0, Lt6g;->e:Lzg7;

    invoke-virtual {v0}, Loy;->e()Z

    move-result v1

    if-nez v1, :cond_5c

    iget-object v1, p0, Lt6g;->r:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_5c

    sget-boolean v1, Lxgh;->a:Z

    if-nez v1, :cond_34

    iget-object v1, p0, Lt6g;->h:Ldb;

    iget-object v3, p0, Lt6g;->i:Lzwk;

    invoke-static {v1, v3}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v1

    if-eqz v1, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Lt6g;->f:Lru9;

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "has_dismissed_password_autofill_banner"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_5c

    iget-object p0, p0, Lt6g;->m:Lsl6;

    invoke-virtual {p0}, Lsl6;->b()Z

    move-result p0

    if-nez p0, :cond_5a

    iget-object p0, v0, Loy;->f:Ljava/lang/Object;

    check-cast p0, Lh42;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    if-eqz p0, :cond_5c

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_5c

    :cond_5a
    const/4 p0, 0x1

    return p0

    :cond_5c
    return v2
.end method

.method public final h()V
    .registers 5

    iget-object v0, p0, Lt6g;->n:Loml;

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    :cond_8
    iget-object v0, p0, Lt6g;->e:Lzg7;

    iget-object v0, v0, Loy;->f:Ljava/lang/Object;

    check-cast v0, Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    new-instance v2, Lrml;

    iget-object v3, p0, Lt6g;->l:Lumi;

    invoke-direct {v2, v0, v3}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lr6g;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lr6g;-><init>(Lt6g;B)V

    invoke-virtual {v2, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    new-instance v2, Lr6g;

    invoke-direct {v2, p0, v1}, Lr6g;-><init>(Lt6g;B)V

    invoke-virtual {v0, v2}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    move-result-object v0

    iput-object v0, p0, Lt6g;->n:Loml;

    return-void
.end method
