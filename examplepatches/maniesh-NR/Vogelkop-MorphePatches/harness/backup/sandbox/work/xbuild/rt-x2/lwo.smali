.class public final Llwo;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public synthetic A:Ljava/lang/Object;

.field public final synthetic B:Landroid/content/Context;

.field public final synthetic C:Lwjo;

.field public final synthetic D:Lsm;

.field public final synthetic E:Leq;

.field public final synthetic F:Ljava/lang/String;

.field public final synthetic G:Ljava/lang/Boolean;

.field public final synthetic H:Ljava/lang/String;

.field public final synthetic I:Lako;

.field public t:Lwjo;

.field public u:Lsm;

.field public v:Leq;

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/Boolean;

.field public y:Ljava/lang/String;

.field public z:Z


# direct methods
.method public constructor <init>(Lsm;Leq;Lmt5;Lwjo;Lako;Landroid/content/Context;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    iput-object p6, p0, Llwo;->B:Landroid/content/Context;

    iput-object p4, p0, Llwo;->C:Lwjo;

    iput-object p1, p0, Llwo;->D:Lsm;

    iput-object p2, p0, Llwo;->E:Leq;

    iput-object p8, p0, Llwo;->F:Ljava/lang/String;

    iput-object p7, p0, Llwo;->G:Ljava/lang/Boolean;

    iput-object p9, p0, Llwo;->H:Ljava/lang/String;

    iput-object p5, p0, Llwo;->I:Lako;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 13

    new-instance v0, Llwo;

    iget-object v9, p0, Llwo;->H:Ljava/lang/String;

    iget-object v5, p0, Llwo;->I:Lako;

    iget-object v1, p0, Llwo;->D:Lsm;

    iget-object v2, p0, Llwo;->E:Leq;

    iget-object v4, p0, Llwo;->C:Lwjo;

    iget-object v6, p0, Llwo;->B:Landroid/content/Context;

    iget-object v7, p0, Llwo;->G:Ljava/lang/Boolean;

    iget-object v8, p0, Llwo;->F:Ljava/lang/String;

    move-object v3, p2

    invoke-direct/range {v0 .. v9}, Llwo;-><init>(Lsm;Leq;Lmt5;Lwjo;Lako;Landroid/content/Context;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, v0, Llwo;->A:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Llwo;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Llwo;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Llwo;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Llwo;->z:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_27

    if-ne v1, v3, :cond_21

    iget-object v0, p0, Llwo;->y:Ljava/lang/String;

    iget-object v1, p0, Llwo;->x:Ljava/lang/Boolean;

    iget-object v4, p0, Llwo;->w:Ljava/lang/String;

    iget-object v5, p0, Llwo;->v:Leq;

    iget-object v6, p0, Llwo;->u:Lsm;

    iget-object v7, p0, Llwo;->t:Lwjo;

    iget-object v8, p0, Llwo;->A:Ljava/lang/Object;

    check-cast v8, Landroid/content/Context;

    :try_start_1a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_b5

    move-object v13, v5

    move-object v5, v0

    move-object v0, v13

    goto :goto_5a

    :cond_21
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_27
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Llwo;->A:Ljava/lang/Object;

    check-cast p1, Lnx5;

    iget-object v8, p0, Llwo;->B:Landroid/content/Context;

    iget-object v7, p0, Llwo;->C:Lwjo;

    iget-object v6, p0, Llwo;->D:Lsm;

    iget-object v5, p0, Llwo;->E:Leq;

    iget-object v4, p0, Llwo;->F:Ljava/lang/String;

    iget-object v1, p0, Llwo;->G:Ljava/lang/Boolean;

    iget-object p1, p0, Llwo;->H:Ljava/lang/String;

    :try_start_3c
    sget-object v9, Lt0i;->b:Lp0i;

    sget-object v9, Loxo;->a:Loxo;

    iput-object v8, p0, Llwo;->A:Ljava/lang/Object;

    iput-object v7, p0, Llwo;->t:Lwjo;

    iput-object v6, p0, Llwo;->u:Lsm;

    iput-object v5, p0, Llwo;->v:Leq;

    iput-object v4, p0, Llwo;->w:Ljava/lang/String;

    iput-object v1, p0, Llwo;->x:Ljava/lang/Boolean;

    iput-object p1, p0, Llwo;->y:Ljava/lang/String;

    iput-boolean v3, p0, Llwo;->z:Z

    invoke-static {v8, p0}, Loxo;->e(Landroid/content/Context;Lkuk;)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v0, :cond_57

    return-object v0

    :cond_57
    move-object v0, v5

    move-object v5, p1

    move-object p1, v9

    :goto_5a
    check-cast p1, Ljzo;

    sget-object v9, Loxo;->a:Loxo;

    move-object v9, v7

    invoke-static {v8}, Loxo;->a(Landroid/content/Context;)Lhuo;

    move-result-object v7

    invoke-static {v8}, Loxo;->g(Landroid/content/Context;)Lhwo;

    move-result-object v11

    invoke-static {v9, v3}, Loxo;->b(Lwjo;I)Lmwo;

    move-result-object v10

    invoke-static {v8, v3}, Loxo;->c(Landroid/content/Context;Z)Lwwo;

    move-result-object v9

    invoke-static {v6, v0, v4, v1}, Loxo;->d(Lsm;Leq;Ljava/lang/String;Ljava/lang/Boolean;)Lj1p;

    move-result-object v0

    invoke-static {v8, v3}, Ljko;->a(Landroid/content/Context;Z)V

    sget-object v1, Ljko;->a:Ljava/util/TreeSet;

    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v1}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_81
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_93

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ltxo;

    iget-object v4, v4, Ltxo;->a:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_81

    :cond_93
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_9e

    move-object v1, v2

    :cond_9e
    if-eqz v1, :cond_a7

    new-instance v3, Lzvo;

    invoke-direct {v3, v1}, Lzvo;-><init>(Ljava/util/List;)V

    move-object v12, v3

    goto :goto_a8

    :cond_a7
    move-object v12, v2

    :goto_a8
    new-instance v4, Lrxo;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    move-object v8, p1

    invoke-direct/range {v4 .. v12}, Lrxo;-><init>(Ljava/lang/String;Ljava/util/List;Lhuo;Ljzo;Lwwo;Lmwo;Lhwo;Lzvo;)V

    sget-object p1, Lt0i;->b:Lp0i;
    :try_end_b4
    .catchall {:try_start_3c .. :try_end_b4} :catchall_b5

    goto :goto_be

    :catchall_b5
    move-exception v0

    move-object p1, v0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :goto_be
    iget-object p1, p0, Llwo;->I:Lako;

    instance-of v0, v4, Lq0i;

    if-nez v0, :cond_131

    move-object v0, v4

    check-cast v0, Lrxo;

    sget-object v1, Ldap;->a:Ldap;

    sget-object v1, Lynh;->g:Ljava/lang/String;

    if-nez v1, :cond_113

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v3, "https"

    invoke-virtual {v1, v3}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lynh;->c:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".s.adx.opera.com"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v3, "osdk"

    invoke-virtual {v1, v3}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v3, "v1"

    invoke-virtual {v1, v3}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    sget-object v3, Lynh;->c:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    sget-object v3, Lynh;->f:Ljava/lang/String;

    const-string v5, "ep"

    invoke-virtual {v1, v5, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lynh;->g:Ljava/lang/String;

    :cond_113
    sget-object v1, Lynh;->g:Ljava/lang/String;

    sget-object v3, Lrxo;->Companion:Ldwo;

    invoke-virtual {v3}, Ldwo;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-static {}, Lfcp;->d()Lrpb;

    move-result-object v5

    sget-object v6, Lgbp;->a:Lzyk;

    new-instance v6, Lnvh;

    const/4 v7, 0x2

    invoke-direct {v6, v5, v3, v0, v7}, Lnvh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lcno;

    const/16 v3, 0xb

    invoke-direct {v0, v6, v3}, Lcno;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v0, v2, p1}, Ldap;->c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Licp;)Lq8p;

    :cond_131
    iget-object p0, p0, Llwo;->I:Lako;

    invoke-static {v4}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_142

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Lako;->a(ILjava/lang/Object;)V

    :cond_142
    new-instance p0, Lt0i;

    invoke-direct {p0, v4}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p0
.end method
