.class public final Lkt5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lesk;

.field public final b:Lj4c;

.field public final c:Lghf;

.field public final d:J

.field public final e:Lnx5;

.field public final f:Lnak;

.field public final g:Lzyk;

.field public final h:Ldx5;

.field public i:Ld3k;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lesk;Lesk;Lj4c;Lghf;JLnx5;Ljg8;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lkt5;->a:Lesk;

    iput-object p4, p0, Lkt5;->b:Lj4c;

    iput-object p5, p0, Lkt5;->c:Lghf;

    iput-wide p6, p0, Lkt5;->d:J

    iput-object p8, p0, Lkt5;->e:Lnx5;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Lkt5;->f:Lnak;

    invoke-static {p1}, La26;->j(Lnak;)Lrlh;

    new-instance p1, Ld8e;

    const/16 p3, 0x1b

    invoke-direct {p1, p2, p3}, Ld8e;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lkt5;->g:Lzyk;

    const/4 p1, 0x1

    const/4 p2, 0x0

    invoke-virtual {p9, p1, p2}, Ldx5;->K(ILjava/lang/String;)Ldx5;

    move-result-object p1

    iput-object p1, p0, Lkt5;->h:Ldx5;

    new-instance p1, Lagb;

    const/16 p3, 0x11

    invoke-direct {p1, p3, p2, p0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {p8, p2, p2, p1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 18

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    instance-of v2, v0, Lnth;

    if-eqz v2, :cond_18

    move-object v2, v0

    check-cast v2, Lnth;

    iget v3, v2, Lnth;->x:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_18

    sub-int/2addr v3, v4

    iput v3, v2, Lnth;->x:I

    :goto_16
    move-object v6, v2

    goto :goto_1e

    :cond_18
    new-instance v2, Lnth;

    invoke-direct {v2, v1, v0}, Lnth;-><init>(Lkt5;Lnt5;)V

    goto :goto_16

    :goto_1e
    iget-object v0, v6, Lnth;->v:Ljava/lang/Object;

    sget-object v7, Lpx5;->a:Lpx5;

    iget v2, v6, Lnth;->x:I

    const/4 v4, 0x0

    const/4 v8, 0x1

    if-eqz v2, :cond_39

    if-ne v2, v8, :cond_32

    iget-object v2, v6, Lnth;->u:Lpqh;

    iget-object v3, v6, Lnth;->t:Lpqh;

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6c

    :cond_32
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    :cond_39
    invoke-static {v0}, Lsko;->f(Ljava/lang/Object;)Lpqh;

    move-result-object v2

    new-instance v9, Ljth;

    new-instance v14, Lorb;

    invoke-direct {v14}, Lorb;-><init>()V

    const-string v10, ""

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v9 .. v14}, Ljth;-><init>(Ljava/lang/String;JLjava/lang/Long;Lorb;)V

    iput-object v9, v2, Lpqh;->a:Ljava/lang/Object;

    new-instance v3, Lpqh;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lc71;

    const/16 v5, 0xc

    invoke-direct/range {v0 .. v5}, Lc71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object v2, v6, Lnth;->t:Lpqh;

    iput-object v3, v6, Lnth;->u:Lpqh;

    iput v8, v6, Lnth;->x:I

    iget-object v5, v1, Lkt5;->h:Ldx5;

    invoke-static {v5, v0, v6}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v7, :cond_69

    return-object v7

    :cond_69
    move-object v15, v3

    move-object v3, v2

    move-object v2, v15

    :goto_6c
    iget-object v0, v1, Lkt5;->a:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v5, v3, Lpqh;->a:Ljava/lang/Object;

    check-cast v5, Ljth;

    iget-object v5, v5, Ljth;->a:Ljava/lang/String;

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-object v3, v3, Lpqh;->a:Ljava/lang/Object;

    check-cast v3, Ljth;

    iget-wide v9, v3, Ljth;->b:J

    iget-object v3, v3, Ljth;->c:Ljava/lang/Long;

    if-eqz v3, :cond_91

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    goto :goto_97

    :cond_91
    iget-wide v11, v1, Lkt5;->d:J

    invoke-static {v11, v12}, Lpn7;->f(J)J

    move-result-wide v11

    :goto_97
    add-long/2addr v9, v11

    cmp-long v3, v6, v9

    if-gez v3, :cond_9d

    const/4 v8, 0x0

    :cond_9d
    if-eqz v5, :cond_ab

    iget-object v2, v2, Lpqh;->a:Ljava/lang/Object;

    if-eqz v2, :cond_ab

    iget-object v3, v1, Lkt5;->f:Lnak;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v4, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_ab
    if-eqz v5, :cond_af

    if-eqz v8, :cond_b2

    :cond_af
    invoke-virtual {v1, v0}, Lkt5;->c(Ljava/lang/String;)V

    :cond_b2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method

.method public final b(Lorb;)Ljava/lang/Object;
    .registers 13

    new-instance p0, Lu9d;

    invoke-direct {p0}, Lu9d;-><init>()V

    iget-object v0, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_56

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v2

    invoke-virtual {p1, v1}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v3

    iget-object v4, v3, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x0

    :goto_26
    if-ge v5, v4, :cond_4e

    invoke-virtual {v3, v5}, Lvpb;->c(I)Lorb;

    move-result-object v6

    new-instance v7, Ljt5;

    const-string v8, "path_regex"

    invoke-virtual {v6, v8}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lkotlin/text/Regex;

    invoke-direct {v9, v8}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const-string v8, "prompt_name"

    invoke-virtual {v6, v8}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v10, "prompt"

    invoke-virtual {v6, v10}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v9, v8, v6}, Ljt5;-><init>(Lkotlin/text/Regex;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Lehc;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    :cond_4e
    invoke-static {v2}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    :cond_56
    invoke-virtual {p0}, Lu9d;->g()Lu9d;

    move-result-object p0

    return-object p0
.end method

.method public final c(Ljava/lang/String;)V
    .registers 11

    iget-object v0, p0, Lkt5;->i:Ld3k;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lxob;->isActive()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_c

    return-void

    :cond_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    new-instance v2, Lgg6;

    const/4 v7, 0x0

    const/4 v8, 0x2

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v2 .. v8}, Lgg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;JLmt5;B)V

    const/4 p0, 0x3

    iget-object p1, v3, Lkt5;->e:Lnx5;

    const/4 v0, 0x0

    invoke-static {p1, v0, v0, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p0

    iput-object p0, v3, Lkt5;->i:Ld3k;

    return-void
.end method

.method public final d(Ljth;)Lorb;
    .registers 5

    new-instance p0, Lorb;

    invoke-direct {p0}, Lorb;-><init>()V

    const-string v0, "language"

    iget-object v1, p1, Ljth;->a:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timestamp"

    iget-wide v1, p1, Ljth;->b:J

    invoke-virtual {p0, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    iget-object v0, p1, Ljth;->c:Ljava/lang/Long;

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    const-string v2, "max-age"

    invoke-virtual {p0, v0, v1, v2}, Lorb;->o(JLjava/lang/String;)V

    :cond_20
    const-string v0, "prompts"

    iget-object p1, p1, Ljth;->d:Lorb;

    invoke-virtual {p0, p1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method
