.class public final Le2f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lz1f;

.field public static final f:Lz1f;


# instance fields
.field public final a:Lnx5;

.field public final b:Ldx5;

.field public final c:Lgmc;

.field public final d:Lqs6;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lz1f;

    sget-object v1, Ly1f;->a:Ly1f;

    const/4 v2, 0x1

    const/4 v3, 0x3

    invoke-direct {v0, v1, v2, v3}, Lz1f;-><init>(Ly1f;II)V

    sput-object v0, Le2f;->e:Lz1f;

    new-instance v0, Lz1f;

    sget-object v1, Ly1f;->b:Ly1f;

    const/4 v2, 0x2

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Lz1f;-><init>(Ly1f;II)V

    sput-object v0, Le2f;->f:Lz1f;

    return-void
.end method

.method public constructor <init>(Lnx5;Ldx5;Lgmc;Lqs6;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le2f;->a:Lnx5;

    iput-object p2, p0, Le2f;->b:Ldx5;

    iput-object p3, p0, Le2f;->c:Lgmc;

    iput-object p4, p0, Le2f;->d:Lqs6;

    iget-object p2, p4, Lqs6;->d:Ligi;

    iget-object p2, p2, Ligi;->b:Ljava/lang/Object;

    check-cast p2, Lkze;

    invoke-static {p2}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p2

    iget-object p4, p4, Lqs6;->h:Lh42;

    invoke-static {p4}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p4

    iget-object p3, p3, Lgmc;->r:Lrlh;

    new-instance v0, Looc;

    const/4 v1, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Looc;-><init>(ILmt5;B)V

    invoke-static {p2, p4, p3, v0}, Lnb6;->l(Lf99;Lf99;Lf99;Ldr9;)Lcw;

    move-result-object p2

    new-instance p3, Lqmb;

    const/16 p4, 0xf

    invoke-direct {p3, p4, v3, p0}, Lqmb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p2, p1, p3}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    return-void
.end method


# virtual methods
.method public final a(Ljoc;Ly1f;JLnt5;)Ljava/lang/Object;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    instance-of v3, v2, La2f;

    if-eqz v3, :cond_19

    move-object v3, v2

    check-cast v3, La2f;

    iget v4, v3, La2f;->D:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_19

    sub-int/2addr v4, v5

    iput v4, v3, La2f;->D:I

    goto :goto_1e

    :cond_19
    new-instance v3, La2f;

    invoke-direct {v3, v0, v2}, La2f;-><init>(Le2f;Lnt5;)V

    :goto_1e
    iget-object v2, v3, La2f;->B:Ljava/lang/Object;

    sget-object v4, Lpx5;->a:Lpx5;

    iget v5, v3, La2f;->D:I

    const/4 v6, 0x3

    iget-object v9, v0, Le2f;->c:Lgmc;

    iget-object v15, v0, Le2f;->d:Lqs6;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x1

    packed-switch v5, :pswitch_data_228

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :pswitch_35
    iget v0, v3, La2f;->A:I

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move v1, v8

    move v6, v10

    goto/16 :goto_21e

    :pswitch_3e
    iget v0, v3, La2f;->z:I

    iget-boolean v1, v3, La2f;->y:Z

    iget-boolean v5, v3, La2f;->x:Z

    iget-wide v11, v3, La2f;->w:J

    iget-object v6, v3, La2f;->u:Ly1f;

    iget-object v13, v3, La2f;->t:Ljoc;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move/from16 v17, v8

    move v8, v1

    move/from16 v1, v17

    move/from16 v17, v10

    move-object v10, v2

    move-object v2, v7

    move-object v7, v6

    move/from16 v6, v17

    goto/16 :goto_1a6

    :pswitch_5b
    iget v0, v3, La2f;->z:I

    iget-boolean v1, v3, La2f;->y:Z

    iget-boolean v5, v3, La2f;->x:Z

    iget-wide v11, v3, La2f;->w:J

    iget-object v6, v3, La2f;->u:Ly1f;

    iget-object v13, v3, La2f;->t:Ljoc;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move/from16 v17, v8

    move v8, v1

    move/from16 v1, v17

    move/from16 v17, v10

    move-object v10, v2

    move-object v2, v7

    move-object v7, v6

    move/from16 v6, v17

    goto/16 :goto_1ce

    :pswitch_78
    iget v0, v3, La2f;->z:I

    iget-boolean v1, v3, La2f;->x:Z

    iget-wide v5, v3, La2f;->w:J

    iget-object v11, v3, La2f;->v:Lxlc;

    iget-object v12, v3, La2f;->u:Ly1f;

    iget-object v13, v3, La2f;->t:Ljoc;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move/from16 v16, v0

    move-object v0, v7

    move-object v2, v11

    move-object/from16 v17, v13

    move v13, v1

    move v1, v8

    move-wide/from16 v18, v5

    move v6, v10

    move-object v5, v12

    move-object/from16 v10, v17

    move-wide/from16 v11, v18

    goto/16 :goto_16c

    :pswitch_99
    iget-boolean v0, v3, La2f;->y:Z

    iget-boolean v1, v3, La2f;->x:Z

    iget-wide v11, v3, La2f;->w:J

    iget-object v5, v3, La2f;->u:Ly1f;

    iget-object v13, v3, La2f;->t:Ljoc;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v17, v13

    move v13, v1

    move-object/from16 v1, v17

    goto/16 :goto_11b

    :pswitch_ad
    iget-wide v0, v3, La2f;->w:J

    iget-object v5, v3, La2f;->u:Ly1f;

    iget-object v11, v3, La2f;->t:Ljoc;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_e5

    :pswitch_b7
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v15, Lqs6;->d:Ligi;

    iget-object v2, v2, Ligi;->b:Ljava/lang/Object;

    check-cast v2, Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_f1

    iget-object v2, v1, Ljoc;->b:Lapc;

    iput-object v1, v3, La2f;->t:Ljoc;

    move-object/from16 v5, p2

    iput-object v5, v3, La2f;->u:Ly1f;

    move-wide/from16 v11, p3

    iput-wide v11, v3, La2f;->w:J

    iput v10, v3, La2f;->D:I

    invoke-virtual {v0, v2, v3}, Le2f;->c(Lapc;Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v4, :cond_21c

    move-wide/from16 v17, v11

    move-object v11, v1

    move-wide/from16 v0, v17

    :goto_e5
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_fa

    move-object v13, v11

    move-wide v11, v0

    move v1, v10

    goto :goto_fd

    :cond_f1
    move-object/from16 v5, p2

    move-wide/from16 v11, p3

    move-wide/from16 v17, v11

    move-object v11, v1

    move-wide/from16 v0, v17

    :cond_fa
    move-object v13, v11

    move-wide v11, v0

    move v1, v8

    :goto_fd
    iput-object v13, v3, La2f;->t:Ljoc;

    iput-object v5, v3, La2f;->u:Ly1f;

    iput-wide v11, v3, La2f;->w:J

    iput-boolean v1, v3, La2f;->x:Z

    iput-boolean v8, v3, La2f;->y:Z

    const/4 v0, 0x2

    iput v0, v3, La2f;->D:I

    iget-object v0, v9, Lgmc;->c:Ldx5;

    new-instance v2, Lk54;

    invoke-direct {v2, v9, v13, v7, v6}, Lk54;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v2, v3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v4, :cond_21c

    move-object v0, v13

    move v13, v1

    move-object v1, v0

    move v0, v8

    :goto_11b
    check-cast v2, Lxlc;

    iget-object v14, v2, Lxlc;->a:Lsmc;

    move-object/from16 p5, v7

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    if-eqz v7, :cond_132

    if-ne v7, v10, :cond_12e

    sget-object v7, Lsmc;->b:Lsmc;

    if-ne v14, v7, :cond_138

    goto :goto_136

    :cond_12e
    invoke-static {}, Lh9o;->p()V

    return-object p5

    :cond_132
    sget-object v7, Lsmc;->a:Lsmc;

    if-ne v14, v7, :cond_138

    :goto_136
    move v7, v10

    goto :goto_139

    :cond_138
    move v7, v8

    :goto_139
    xor-int/lit8 v14, v7, 0x1

    if-nez v7, :cond_17c

    move v7, v8

    sget-object v8, Lsmc;->c:Lsmc;

    iput-object v1, v3, La2f;->t:Ljoc;

    iput-object v5, v3, La2f;->u:Ly1f;

    iput-object v2, v3, La2f;->v:Lxlc;

    iput-wide v11, v3, La2f;->w:J

    iput-boolean v13, v3, La2f;->x:Z

    iput-boolean v0, v3, La2f;->y:Z

    iput v14, v3, La2f;->z:I

    iput v6, v3, La2f;->D:I

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move v0, v7

    new-instance v7, Lbmc;

    move v6, v14

    const/4 v14, 0x0

    move/from16 v16, v6

    move v6, v10

    move-object v10, v1

    move v1, v0

    move-object/from16 v0, p5

    invoke-direct/range {v7 .. v14}, Lbmc;-><init>(Lsmc;Lgmc;Ljoc;JZLmt5;)V

    invoke-virtual {v9, v7, v3}, Lgmc;->a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object v7

    if-eq v7, v4, :cond_16a

    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_16a
    if-eq v7, v4, :cond_21c

    :goto_16c
    if-nez v13, :cond_174

    iget-boolean v2, v2, Lxlc;->b:Z

    if-nez v2, :cond_174

    move v8, v1

    goto :goto_175

    :cond_174
    move v8, v6

    :goto_175
    move-object v2, v0

    :goto_176
    move-object v7, v5

    move v5, v13

    move/from16 v0, v16

    move-object v13, v10

    goto :goto_185

    :cond_17c
    move-object/from16 v2, p5

    move v6, v10

    move/from16 v16, v14

    move-object v10, v1

    move v1, v8

    move v8, v0

    goto :goto_176

    :goto_185
    if-eqz v8, :cond_1d5

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    if-eqz v10, :cond_1b7

    if-ne v10, v6, :cond_1b3

    iput-object v13, v3, La2f;->t:Ljoc;

    iput-object v7, v3, La2f;->u:Ly1f;

    iput-object v2, v3, La2f;->v:Lxlc;

    iput-wide v11, v3, La2f;->w:J

    iput-boolean v5, v3, La2f;->x:Z

    iput-boolean v8, v3, La2f;->y:Z

    iput v0, v3, La2f;->z:I

    const/4 v10, 0x5

    iput v10, v3, La2f;->D:I

    invoke-virtual {v15, v13, v3}, Lqs6;->f(Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object v10

    if-eq v10, v4, :cond_21c

    :goto_1a6
    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    :goto_1ac
    move-object/from16 v17, v13

    move v13, v5

    move v5, v10

    move-object/from16 v10, v17

    goto :goto_1d8

    :cond_1b3
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_1b7
    iput-object v13, v3, La2f;->t:Ljoc;

    iput-object v7, v3, La2f;->u:Ly1f;

    iput-object v2, v3, La2f;->v:Lxlc;

    iput-wide v11, v3, La2f;->w:J

    iput-boolean v5, v3, La2f;->x:Z

    iput-boolean v8, v3, La2f;->y:Z

    iput v0, v3, La2f;->z:I

    const/4 v10, 0x4

    iput v10, v3, La2f;->D:I

    invoke-virtual {v15, v13, v3}, Lqs6;->e(Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object v10

    if-eq v10, v4, :cond_21c

    :goto_1ce
    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    goto :goto_1ac

    :cond_1d5
    move-object v10, v13

    move v13, v5

    move v5, v6

    :goto_1d8
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    if-eqz v7, :cond_1ee

    if-ne v7, v6, :cond_1ea

    if-nez v5, :cond_1e7

    if-eqz v13, :cond_1e7

    sget-object v7, Lsmc;->a:Lsmc;

    goto :goto_1f5

    :cond_1e7
    sget-object v7, Lsmc;->b:Lsmc;

    goto :goto_1f5

    :cond_1ea
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_1ee
    if-eqz v5, :cond_1f3

    sget-object v7, Lsmc;->a:Lsmc;

    goto :goto_1f5

    :cond_1f3
    sget-object v7, Lsmc;->b:Lsmc;

    :goto_1f5
    iput-object v2, v3, La2f;->t:Ljoc;

    iput-object v2, v3, La2f;->u:Ly1f;

    iput-object v2, v3, La2f;->v:Lxlc;

    iput-wide v11, v3, La2f;->w:J

    iput-boolean v13, v3, La2f;->x:Z

    iput-boolean v8, v3, La2f;->y:Z

    iput v0, v3, La2f;->z:I

    iput v5, v3, La2f;->A:I

    const/4 v0, 0x6

    iput v0, v3, La2f;->D:I

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v8, v7

    new-instance v7, Lbmc;

    const/4 v14, 0x0

    invoke-direct/range {v7 .. v14}, Lbmc;-><init>(Lsmc;Lgmc;Ljoc;JZLmt5;)V

    invoke-virtual {v9, v7, v3}, Lgmc;->a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v4, :cond_21a

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_21a
    if-ne v0, v4, :cond_21d

    :cond_21c
    return-object v4

    :cond_21d
    move v0, v5

    :goto_21e
    if-eqz v0, :cond_222

    move v8, v6

    goto :goto_223

    :cond_222
    move v8, v1

    :goto_223
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_data_228
    .packed-switch 0x0
        :pswitch_b7
        :pswitch_ad
        :pswitch_99
        :pswitch_78
        :pswitch_5b
        :pswitch_3e
        :pswitch_35
    .end packed-switch
.end method

.method public final b(Ljoc;Lnt5;)Ljava/lang/Enum;
    .registers 8

    instance-of v0, p2, Lb2f;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lb2f;

    iget v1, v0, Lb2f;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lb2f;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lb2f;

    invoke-direct {v0, p0, p2}, Lb2f;-><init>(Le2f;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lb2f;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lb2f;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_44

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput v4, v0, Lb2f;->v:I

    iget-object p0, p0, Le2f;->c:Lgmc;

    iget-object p2, p0, Lgmc;->c:Ldx5;

    new-instance v2, Lk54;

    const/4 v4, 0x3

    invoke-direct {v2, p0, p1, v3, v4}, Lk54;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    check-cast p2, Lxlc;

    iget-object p0, p2, Lxlc;->a:Lsmc;

    return-object p0
.end method

.method public final c(Lapc;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lc2f;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lc2f;

    iget v1, v0, Lc2f;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lc2f;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lc2f;

    invoke-direct {v0, p0, p2}, Lc2f;-><init>(Le2f;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lc2f;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lc2f;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p1, v0, Lc2f;->t:Lapc;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_42

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Le2f;->d:Lqs6;

    iget-object p0, p0, Lqs6;->h:Lh42;

    iput-object p1, v0, Lc2f;->t:Lapc;

    iput v3, v0, Lc2f;->w:I

    invoke-static {p0, v0}, Lxf8;->v(Lekc;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_42

    return-object v1

    :cond_42
    :goto_42
    check-cast p2, Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final d(Ljava/util/List;Lnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p2, Ld2f;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Ld2f;

    iget v1, v0, Ld2f;->z:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ld2f;->z:I

    goto :goto_18

    :cond_13
    new-instance v0, Ld2f;

    invoke-direct {v0, p0, p2}, Ld2f;-><init>(Le2f;Lnt5;)V

    :goto_18
    iget-object p2, v0, Ld2f;->x:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ld2f;->z:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_44

    if-eq v2, v4, :cond_36

    if-ne v2, v3, :cond_2f

    iget-object p0, v0, Ld2f;->t:Ljava/util/List;

    check-cast p0, Ljava/util/List;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_af

    :cond_2f
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_36
    iget-object p1, v0, Ld2f;->w:Ljava/lang/Object;

    iget-object v2, v0, Ld2f;->v:Ljava/util/Iterator;

    iget-object v5, v0, Ld2f;->u:Ljava/util/ArrayList;

    iget-object v6, v0, Ld2f;->t:Ljava/util/List;

    check-cast v6, Ljava/util/List;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_78

    :cond_44
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object p2, p1

    check-cast p2, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    move-object v6, p1

    move-object v5, v2

    move-object v2, p2

    :cond_56
    :goto_56
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_84

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    move-object p2, p1

    check-cast p2, Ljoc;

    move-object v7, v6

    check-cast v7, Ljava/util/List;

    iput-object v7, v0, Ld2f;->t:Ljava/util/List;

    iput-object v5, v0, Ld2f;->u:Ljava/util/ArrayList;

    iput-object v2, v0, Ld2f;->v:Ljava/util/Iterator;

    iput-object p1, v0, Ld2f;->w:Ljava/lang/Object;

    iput v4, v0, Ld2f;->z:I

    iget-object v7, p0, Le2f;->d:Lqs6;

    invoke-virtual {v7, p2, v0}, Lqs6;->e(Ljoc;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_ae

    :goto_78
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_56

    invoke-interface {v5, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_56

    :cond_84
    check-cast v5, Ljava/util/List;

    check-cast v5, Ljava/lang/Iterable;

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v7

    const/4 v9, 0x0

    iput-object v9, v0, Ld2f;->t:Ljava/util/List;

    iput-object v9, v0, Ld2f;->u:Ljava/util/ArrayList;

    iput-object v9, v0, Ld2f;->v:Ljava/util/Iterator;

    iput-object v9, v0, Ld2f;->w:Ljava/lang/Object;

    iput v3, v0, Ld2f;->z:I

    iget-object v8, p0, Le2f;->c:Lgmc;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Ldj2;

    const/4 v10, 0x5

    invoke-direct/range {v5 .. v10}, Ldj2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-virtual {v8, v5, v0}, Lgmc;->a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-eq p0, p1, :cond_ac

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_ac
    if-ne p0, v1, :cond_af

    :cond_ae
    return-object v1

    :cond_af
    :goto_af
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
