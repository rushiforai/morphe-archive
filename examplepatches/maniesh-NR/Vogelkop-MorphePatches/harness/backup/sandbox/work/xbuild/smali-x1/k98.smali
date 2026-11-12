.class public final Lk98;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public t:Ll98;

.field public u:Ljava/util/Iterator;

.field public v:Ljava/lang/String;

.field public w:Z

.field public synthetic x:Z

.field public synthetic y:Ljava/util/Map;

.field public final synthetic z:Ll98;


# direct methods
.method public constructor <init>(Ll98;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lk98;->z:Ll98;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Ljava/util/Map;

    check-cast p3, Lmt5;

    new-instance v0, Lk98;

    iget-object p0, p0, Lk98;->z:Ll98;

    invoke-direct {v0, p0, p3}, Lk98;-><init>(Ll98;Lmt5;)V

    iput-boolean p1, v0, Lk98;->x:Z

    check-cast p2, Ljava/util/Map;

    iput-object p2, v0, Lk98;->y:Ljava/util/Map;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lk98;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-boolean v0, p0, Lk98;->x:Z

    iget-object v1, p0, Lk98;->y:Ljava/util/Map;

    check-cast v1, Ljava/util/Map;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-boolean v3, p0, Lk98;->w:Z

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_20

    if-ne v3, v4, :cond_1a

    iget-object v1, p0, Lk98;->v:Ljava/lang/String;

    iget-object v3, p0, Lk98;->u:Ljava/util/Iterator;

    iget-object v6, p0, Lk98;->t:Ll98;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5e

    :cond_1a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_20
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz v0, :cond_dd

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iget-object v1, p0, Lk98;->z:Ll98;

    move-object v3, p1

    move-object v6, v1

    :cond_31
    :goto_31
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_dd

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld98;

    iget-object v7, v6, Ll98;->m:Lsm6;

    iput-object v5, p0, Lk98;->y:Ljava/util/Map;

    iput-object v6, p0, Lk98;->t:Ll98;

    iput-object v3, p0, Lk98;->u:Ljava/util/Iterator;

    iput-object v1, p0, Lk98;->v:Ljava/lang/String;

    iput-boolean v0, p0, Lk98;->x:Z

    iput-boolean v4, p0, Lk98;->w:Z

    invoke-virtual {v7, p1, p0}, Lsm6;->a(Ld98;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v2, :cond_5e

    return-object v2

    :cond_5e
    :goto_5e
    check-cast p1, Lpmi;

    sget-object v7, Lnmi;->a:Lnmi;

    invoke-static {p1, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_31

    instance-of v7, p1, Lomi;

    if-eqz v7, :cond_d9

    iget-object v7, v6, Ll98;->a:Lcom/opera/android/BrowserActivity;

    check-cast p1, Lomi;

    iget-wide v8, p1, Lomi;->a:J

    invoke-static {v7}, Lx4o;->c(Landroid/content/Context;)Lx4o;

    move-result-object p1

    const-string v7, "ESIMUPS:"

    invoke-static {v7, v1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v10, Ltn;

    const-class v11, Lcom/opera/android/esim/work/EsimUpsellWorker;

    invoke-direct {v10, v11}, Ltn;-><init>(Ljava/lang/Class;)V

    sget-object v11, Lpn7;->b:Lon7;

    sget-object v11, Lun7;->e:Lun7;

    invoke-static {v8, v9, v11}, Lpn7;->p(JLun7;)J

    move-result-wide v11

    invoke-static {v8, v9}, Lpn7;->h(J)I

    move-result v8

    int-to-long v8, v8

    invoke-static {v11, v12, v8, v9}, Ljava/time/Duration;->ofSeconds(JJ)Ljava/time/Duration;

    move-result-object v8

    iget-object v9, v10, Ltn;->c:Ljava/lang/Object;

    check-cast v9, Lh5o;

    invoke-virtual {v8}, Ljava/time/Duration;->toMillis()J

    move-result-wide v11

    iput-wide v11, v9, Lh5o;->g:J

    const-wide v8, 0x7fffffffffffffffL

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    sub-long/2addr v8, v11

    iget-object v11, v10, Ltn;->c:Ljava/lang/Object;

    check-cast v11, Lh5o;

    iget-wide v11, v11, Lh5o;->g:J

    cmp-long v8, v8, v11

    if-lez v8, :cond_d3

    new-instance v8, Ljava/util/LinkedHashMap;

    invoke-direct {v8}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v9, "plan_id"

    invoke-interface {v8, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lib6;

    invoke-direct {v1, v8}, Lib6;-><init>(Ljava/util/LinkedHashMap;)V

    invoke-static {v1}, Lcqp;->H0(Lib6;)[B

    iget-object v8, v10, Ltn;->c:Ljava/lang/Object;

    check-cast v8, Lh5o;

    iput-object v1, v8, Lh5o;->e:Lib6;

    invoke-virtual {v10}, Ltn;->j()Loff;

    move-result-object v1

    invoke-virtual {p1, v7, v1}, Lx4o;->b(Ljava/lang/String;Loff;)V

    goto/16 :goto_31

    :cond_d3
    const-string p0, "The given initial delay is too large and will cause an overflow!"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v5

    :cond_d9
    invoke-static {}, Lh9o;->p()V

    return-object v5

    :cond_dd
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
