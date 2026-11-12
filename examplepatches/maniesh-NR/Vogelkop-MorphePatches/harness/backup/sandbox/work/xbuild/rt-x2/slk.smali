.class public final Lslk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lm59;

.field public final b:Ltmk;

.field public final c:Lpy9;

.field public final d:Lode;

.field public final e:Lzkk;

.field public final f:Lnv1;

.field public final g:Lnx5;

.field public final h:Lode;

.field public final i:Lkze;

.field public final j:Li7f;

.field public k:Ld3k;

.field public l:Z


# direct methods
.method public constructor <init>(Lm59;Ltmk;Lpy9;Lxbf;Lode;Lzkk;Lnv1;Lnx5;)V
    .registers 21

    move-object v8, p3

    move-object/from16 v9, p5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lslk;->a:Lm59;

    iput-object p2, p0, Lslk;->b:Ltmk;

    iput-object v8, p0, Lslk;->c:Lpy9;

    iput-object v9, p0, Lslk;->d:Lode;

    move-object/from16 v1, p6

    iput-object v1, p0, Lslk;->e:Lzkk;

    move-object/from16 v1, p7

    iput-object v1, p0, Lslk;->f:Lnv1;

    move-object/from16 v1, p8

    iput-object v1, p0, Lslk;->g:Lnx5;

    move-object/from16 v1, p4

    iget-object v1, v1, Lxbf;->d:Ljava/lang/Object;

    check-cast v1, Lode;

    iput-object v1, p0, Lslk;->h:Lode;

    new-instance v3, Lkze;

    sget-object v4, Lwvg;->k:Lwvg;

    invoke-direct {v3, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lslk;->i:Lkze;

    new-instance v3, Li7f;

    invoke-direct {v3}, Li7f;-><init>()V

    iput-object v3, p0, Lslk;->j:Li7f;

    new-instance v3, Lqlk;

    const/4 v10, 0x0

    invoke-direct {v3, p0, v10}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iget-object v4, p1, Lm59;->d:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashSet;

    invoke-virtual {v4, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lm59;->i()V

    new-instance v0, Ln6k;

    const/16 v3, 0xb

    invoke-direct {v0, p0, v3}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lt7d;

    const/16 v11, 0x15

    invoke-direct {v3, v0, v11}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v3}, Lekc;->k(Lf7f;)V

    new-instance v0, Lldh;

    const/4 v6, 0x0

    const/16 v7, 0x1d

    const/4 v1, 0x1

    const-class v3, Lslk;

    const-string v4, "onPushRegistrationStateChanged"

    const-string v5, "onPushRegistrationStateChanged(Z)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lt7d;

    invoke-direct {v1, v0, v11}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v9, v1}, Lekc;->k(Lf7f;)V

    iget-object v0, p2, Ltmk;->g:Lkze;

    new-instance v1, Lrlk;

    invoke-direct {v1, p0, v10}, Lrlk;-><init>(Lslk;B)V

    invoke-static {v0, v1}, Lxf8;->h0(Lekc;Lf7f;)V

    iget-object v0, v8, Lpy9;->f:Lkze;

    new-instance v1, Lrlk;

    const/4 v3, 0x1

    invoke-direct {v1, p0, v3}, Lrlk;-><init>(Lslk;B)V

    invoke-static {v0, v1}, Lxf8;->h0(Lekc;Lf7f;)V

    invoke-virtual {p0}, Lslk;->c()V

    return-void
.end method


# virtual methods
.method public final a(Lh0d;Lp71;)Ljava/lang/Object;
    .registers 4

    sget-object v0, Lh0d;->c:Lh0d;

    if-eq p1, v0, :cond_7

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_7
    iget-object p1, p0, Lslk;->f:Lnv1;

    invoke-virtual {p1}, Lnv1;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_18

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_18
    iget-object p1, p0, Lslk;->b:Ltmk;

    iget-object p1, p1, Ltmk;->g:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwvg;

    invoke-virtual {p1}, Lwvg;->a()Z

    move-result v0

    if-nez v0, :cond_34

    iget p1, p1, Lwvg;->e:I

    const/4 v0, 0x5

    if-eq p1, v0, :cond_34

    iget-object p0, p0, Lslk;->c:Lpy9;

    invoke-virtual {p0, p2}, Lpy9;->c(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_34
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final b(Ljava/lang/Runnable;)V
    .registers 6

    if-eqz p1, :cond_7

    iget-object v0, p0, Lslk;->j:Li7f;

    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    :cond_7
    iget-object p1, p0, Lslk;->k:Ld3k;

    if-eqz p1, :cond_c

    return-void

    :cond_c
    sget-object p1, Lrx5;->b:Lrx5;

    new-instance v0, Lp71;

    const/16 v1, 0x18

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v1, 0x1

    iget-object v3, p0, Lslk;->g:Lnx5;

    invoke-static {v3, v2, p1, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    iput-object p1, p0, Lslk;->k:Ld3k;

    invoke-virtual {p1}, Lxob;->start()Z

    return-void
.end method

.method public final c()V
    .registers 9

    const/4 v0, 0x2

    new-array v1, v0, [Lwvg;

    iget-object v2, p0, Lslk;->b:Ltmk;

    iget-object v2, v2, Ltmk;->g:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lslk;->c:Lpy9;

    iget-object v2, v2, Lpy9;->f:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_23
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_38

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lwvg;

    iget v5, v5, Lwvg;->e:I

    if-eqz v5, :cond_39

    if-ne v5, v0, :cond_23

    goto :goto_39

    :cond_38
    move-object v3, v4

    :cond_39
    :goto_39
    check-cast v3, Lwvg;

    if-nez v3, :cond_90

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lwvg;

    invoke-virtual {v3}, Lwvg;->a()Z

    move-result v5

    if-nez v5, :cond_59

    iget v3, v3, Lwvg;->e:I

    const/4 v5, 0x5

    if-ne v3, v5, :cond_41

    :cond_59
    move-object v4, v2

    :cond_5a
    move-object v3, v4

    check-cast v3, Lwvg;

    if-nez v3, :cond_90

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_96

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8d

    move-object v2, v1

    check-cast v2, Lwvg;

    iget-wide v2, v2, Lwvg;->c:J

    :cond_78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lwvg;

    iget-wide v5, v5, Lwvg;->c:J

    cmp-long v7, v2, v5

    if-gez v7, :cond_87

    move-object v1, v4

    move-wide v2, v5

    :cond_87
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_78

    :cond_8d
    move-object v3, v1

    check-cast v3, Lwvg;

    :cond_90
    iget-object p0, p0, Lslk;->i:Lkze;

    invoke-static {p0, v3}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :cond_96
    invoke-static {}, Lt3p;->y()V

    return-void
.end method
