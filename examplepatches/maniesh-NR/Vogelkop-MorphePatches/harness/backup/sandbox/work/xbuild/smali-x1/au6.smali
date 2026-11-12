.class public final Lau6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lgy6;

.field public final b:Lkz6;

.field public final c:Lw6j;

.field public final d:Loji;

.field public final e:Lyc1;


# direct methods
.method public constructor <init>(Lgy6;Lkz6;Lw6j;Lauj;Loji;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lau6;->a:Lgy6;

    iput-object p2, p0, Lau6;->b:Lkz6;

    iput-object p3, p0, Lau6;->c:Lw6j;

    iput-object p5, p0, Lau6;->d:Loji;

    iget-object p1, p2, Lkz6;->b:Lf99;

    new-instance p2, Lyc1;

    const/4 p3, 0x6

    invoke-direct {p2, p1, p3}, Lyc1;-><init>(Lf99;B)V

    iput-object p2, p0, Lau6;->e:Lyc1;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lcel;ZLn2f;Lnt5;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    instance-of v2, v1, Lzt6;

    if-eqz v2, :cond_18

    move-object v2, v1

    check-cast v2, Lzt6;

    iget v3, v2, Lzt6;->F:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_18

    sub-int/2addr v3, v4

    iput v3, v2, Lzt6;->F:I

    :goto_16
    move-object v13, v2

    goto :goto_1e

    :cond_18
    new-instance v2, Lzt6;

    invoke-direct {v2, v0, v1}, Lzt6;-><init>(Lau6;Lnt5;)V

    goto :goto_16

    :goto_1e
    iget-object v1, v13, Lzt6;->D:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v13, Lzt6;->F:I

    const/4 v14, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v15, 0x0

    if-eqz v3, :cond_86

    if-eq v3, v6, :cond_70

    if-eq v3, v5, :cond_4d

    if-eq v3, v4, :cond_46

    if-ne v3, v14, :cond_40

    iget-object v0, v13, Lzt6;->x:Ljava/lang/Object;

    check-cast v0, Lq0e;

    iget-object v2, v13, Lzt6;->w:Ljava/lang/Object;

    check-cast v2, Ldoe;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1af

    :cond_40
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v15

    :cond_46
    iget-boolean v3, v13, Lzt6;->C:Z

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_119

    :cond_4d
    iget-boolean v3, v13, Lzt6;->C:Z

    iget-object v5, v13, Lzt6;->B:Ljava/lang/String;

    iget-object v6, v13, Lzt6;->A:Ljava/lang/String;

    iget-object v7, v13, Lzt6;->z:Ljava/lang/String;

    iget-object v8, v13, Lzt6;->y:Ljava/lang/String;

    iget-object v9, v13, Lzt6;->x:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v10, v13, Lzt6;->w:Ljava/lang/Object;

    check-cast v10, Lgy6;

    iget-object v11, v13, Lzt6;->v:Ln2f;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v4, v10

    move v10, v3

    move-object v3, v4

    move-object v4, v8

    move-object v8, v5

    move-object v5, v4

    move-object v4, v7

    move-object v7, v6

    move-object v6, v4

    move-object v4, v9

    goto/16 :goto_f3

    :cond_70
    iget-boolean v3, v13, Lzt6;->C:Z

    iget-object v7, v13, Lzt6;->v:Ln2f;

    iget-object v8, v13, Lzt6;->u:Lcel;

    iget-object v9, v13, Lzt6;->t:Ljava/lang/String;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v16, v9

    move-object v9, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v8

    move v8, v3

    move-object/from16 v3, v16

    goto :goto_a3

    :cond_86
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v1, p1

    iput-object v1, v13, Lzt6;->t:Ljava/lang/String;

    move-object/from16 v3, p2

    iput-object v3, v13, Lzt6;->u:Lcel;

    move-object/from16 v7, p4

    iput-object v7, v13, Lzt6;->v:Ln2f;

    move/from16 v8, p3

    iput-boolean v8, v13, Lzt6;->C:Z

    iput v6, v13, Lzt6;->F:I

    iget-object v9, v0, Lau6;->d:Loji;

    invoke-virtual {v9, v13}, Loji;->C(Lnt5;)Ljava/lang/Object;

    move-result-object v9

    if-eq v9, v2, :cond_1ac

    :goto_a3
    check-cast v9, Lbum;

    sget-object v10, Lj2h;->a:[Lj2h;

    iget-object v10, v9, Lbum;->b:Ljava/lang/String;

    iget-object v9, v9, Lbum;->a:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_bb

    if-ne v3, v6, :cond_b7

    const-string v3, "fahrenheit"

    :goto_b5
    move-object v6, v3

    goto :goto_be

    :cond_b7
    invoke-static {}, Lh9o;->p()V

    return-object v15

    :cond_bb
    const-string v3, "celsius"

    goto :goto_b5

    :goto_be
    iput-object v15, v13, Lzt6;->t:Ljava/lang/String;

    iput-object v15, v13, Lzt6;->u:Lcel;

    iput-object v7, v13, Lzt6;->v:Ln2f;

    iget-object v3, v0, Lau6;->a:Lgy6;

    iput-object v3, v13, Lzt6;->w:Ljava/lang/Object;

    const-string v11, "OfABeta"

    iput-object v11, v13, Lzt6;->x:Ljava/lang/Object;

    iput-object v10, v13, Lzt6;->y:Ljava/lang/String;

    iput-object v9, v13, Lzt6;->z:Ljava/lang/String;

    iput-object v6, v13, Lzt6;->A:Ljava/lang/String;

    iput-object v1, v13, Lzt6;->B:Ljava/lang/String;

    iput-boolean v8, v13, Lzt6;->C:Z

    iput v5, v13, Lzt6;->F:I

    iget-object v5, v0, Lau6;->c:Lw6j;

    iget-object v12, v5, Lw6j;->c:Ljava/lang/Object;

    check-cast v12, Ljg8;

    new-instance v14, Lu6k;

    const/16 v4, 0x9

    invoke-direct {v14, v4, v15, v5}, Lu6k;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v12, v14, v13}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v2, :cond_1ac

    move-object v5, v10

    move v10, v8

    move-object v8, v1

    move-object v1, v4

    move-object v4, v11

    move-object v11, v7

    move-object v7, v6

    move-object v6, v9

    :goto_f3
    move-object v9, v1

    check-cast v9, Ljava/lang/String;

    iget-boolean v1, v11, Ln2f;->a:Z

    iget-boolean v12, v11, Ln2f;->b:Z

    iput-object v15, v13, Lzt6;->t:Ljava/lang/String;

    iput-object v15, v13, Lzt6;->u:Lcel;

    iput-object v15, v13, Lzt6;->v:Ln2f;

    iput-object v15, v13, Lzt6;->w:Ljava/lang/Object;

    iput-object v15, v13, Lzt6;->x:Ljava/lang/Object;

    iput-object v15, v13, Lzt6;->y:Ljava/lang/String;

    iput-object v15, v13, Lzt6;->z:Ljava/lang/String;

    iput-object v15, v13, Lzt6;->A:Ljava/lang/String;

    iput-object v15, v13, Lzt6;->B:Ljava/lang/String;

    iput-boolean v10, v13, Lzt6;->C:Z

    const/4 v11, 0x3

    iput v11, v13, Lzt6;->F:I

    move v11, v1

    invoke-virtual/range {v3 .. v13}, Lgy6;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLnt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v2, :cond_1ac

    move v3, v10

    :goto_119
    check-cast v1, Ldoe;

    invoke-static {}, Lq0e;->g()Lo0e;

    move-result-object v4

    iget-object v5, v1, Ldoe;->a:Ljava/lang/String;

    invoke-virtual {v4}, Lgv9$a;->copyOnWrite()V

    iget-object v6, v4, Lgv9$a;->instance:Lgv9;

    check-cast v6, Lq0e;

    invoke-virtual {v6, v5}, Lq0e;->j(Ljava/lang/String;)V

    iget-object v5, v1, Ldoe;->b:Ljava/lang/String;

    invoke-virtual {v4}, Lgv9$a;->copyOnWrite()V

    iget-object v6, v4, Lgv9$a;->instance:Lgv9;

    check-cast v6, Lq0e;

    invoke-virtual {v6, v5}, Lq0e;->h(Ljava/lang/String;)V

    iget-object v5, v1, Ldoe;->c:Ljava/lang/String;

    invoke-virtual {v4}, Lgv9$a;->copyOnWrite()V

    iget-object v6, v4, Lgv9$a;->instance:Lgv9;

    check-cast v6, Lq0e;

    invoke-virtual {v6, v5}, Lq0e;->i(Ljava/lang/String;)V

    iget-object v5, v1, Ldoe;->d:Lcpe;

    invoke-static {}, Lbel;->e()Lzdl;

    move-result-object v6

    iget-object v7, v5, Lcpe;->a:Lzoe;

    invoke-static {}, Lxdl;->d()Lvdl;

    move-result-object v8

    iget-wide v9, v7, Lzoe;->a:D

    invoke-virtual {v8, v9, v10}, Lvdl;->b(D)V

    invoke-virtual {v8}, Lgv9$a;->build()Lgv9;

    move-result-object v7

    check-cast v7, Lxdl;

    invoke-virtual {v6}, Lgv9$a;->copyOnWrite()V

    iget-object v8, v6, Lgv9$a;->instance:Lgv9;

    check-cast v8, Lbel;

    invoke-virtual {v8, v7}, Lbel;->g(Lxdl;)V

    iget-object v5, v5, Lcpe;->b:Lzoe;

    invoke-static {}, Lxdl;->d()Lvdl;

    move-result-object v7

    iget-wide v8, v5, Lzoe;->a:D

    invoke-virtual {v7, v8, v9}, Lvdl;->b(D)V

    invoke-virtual {v7}, Lgv9$a;->build()Lgv9;

    move-result-object v5

    check-cast v5, Lxdl;

    invoke-virtual {v6}, Lgv9$a;->copyOnWrite()V

    iget-object v7, v6, Lgv9$a;->instance:Lgv9;

    check-cast v7, Lbel;

    invoke-virtual {v7, v5}, Lbel;->f(Lxdl;)V

    invoke-virtual {v6}, Lgv9$a;->build()Lgv9;

    move-result-object v5

    check-cast v5, Lbel;

    invoke-virtual {v4}, Lgv9$a;->copyOnWrite()V

    iget-object v6, v4, Lgv9$a;->instance:Lgv9;

    check-cast v6, Lq0e;

    invoke-virtual {v6, v5}, Lq0e;->k(Lbel;)V

    invoke-virtual {v4}, Lgv9$a;->build()Lgv9;

    move-result-object v4

    check-cast v4, Lq0e;

    iput-object v15, v13, Lzt6;->t:Ljava/lang/String;

    iput-object v15, v13, Lzt6;->u:Lcel;

    iput-object v15, v13, Lzt6;->v:Ln2f;

    iput-object v1, v13, Lzt6;->w:Ljava/lang/Object;

    iput-object v4, v13, Lzt6;->x:Ljava/lang/Object;

    iput-boolean v3, v13, Lzt6;->C:Z

    const/4 v3, 0x4

    iput v3, v13, Lzt6;->F:I

    iget-object v0, v0, Lau6;->b:Lkz6;

    invoke-virtual {v0, v4, v13}, Lkz6;->j(Lq0e;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_1ad

    :cond_1ac
    return-object v2

    :cond_1ad
    move-object v2, v1

    move-object v0, v4

    :goto_1af
    new-instance v1, Liom;

    invoke-static {v0}, Lc26;->U(Lq0e;)Lp0e;

    move-result-object v0

    iget-object v2, v2, Ldoe;->e:Ljava/util/List;

    if-nez v2, :cond_1bb

    sget-object v2, Ll08;->a:Ll08;

    :cond_1bb
    invoke-direct {v1, v0, v2}, Liom;-><init>(Lp0e;Ljava/util/List;)V

    return-object v1
.end method
