.class public abstract Lrnf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lu36;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lu36;

    const v1, 0x3eb33333    # 0.35f

    const/high16 v2, 0x3f800000    # 1.0f

    const v3, 0x3f266666    # 0.65f

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lu36;-><init>(FFFF)V

    sput-object v0, Lrnf;->a:Lu36;

    return-void
.end method

.method public static final a(FLc8e;JJLih5;I)V
    .registers 26

    move/from16 v1, p0

    move-object/from16 v2, p1

    move-wide/from16 v3, p2

    move-wide/from16 v5, p4

    move/from16 v0, p7

    move-object/from16 v10, p6

    check-cast v10, Lvt9;

    const v7, -0x2750b541

    invoke-virtual {v10, v7}, Lvt9;->Y(I)Lvt9;

    and-int/lit8 v7, v0, 0x6

    const/4 v8, 0x2

    if-nez v7, :cond_24

    invoke-virtual {v10, v1}, Lvt9;->c(F)Z

    move-result v7

    if-eqz v7, :cond_21

    const/4 v7, 0x4

    goto :goto_22

    :cond_21
    move v7, v8

    :goto_22
    or-int/2addr v7, v0

    goto :goto_25

    :cond_24
    move v7, v0

    :goto_25
    and-int/lit8 v9, v0, 0x30

    if-nez v9, :cond_35

    invoke-virtual {v10, v2}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_32

    const/16 v9, 0x20

    goto :goto_34

    :cond_32
    const/16 v9, 0x10

    :goto_34
    or-int/2addr v7, v9

    :cond_35
    and-int/lit16 v9, v0, 0x180

    const/16 v13, 0x100

    if-nez v9, :cond_46

    invoke-virtual {v10, v3, v4}, Lvt9;->e(J)Z

    move-result v9

    if-eqz v9, :cond_43

    move v9, v13

    goto :goto_45

    :cond_43
    const/16 v9, 0x80

    :goto_45
    or-int/2addr v7, v9

    :cond_46
    and-int/lit16 v9, v0, 0xc00

    const/16 v14, 0x800

    if-nez v9, :cond_57

    invoke-virtual {v10, v5, v6}, Lvt9;->e(J)Z

    move-result v9

    if-eqz v9, :cond_54

    move v9, v14

    goto :goto_56

    :cond_54
    const/16 v9, 0x400

    :goto_56
    or-int/2addr v7, v9

    :cond_57
    move v15, v7

    and-int/lit16 v7, v15, 0x493

    const/16 v9, 0x492

    const/4 v11, 0x0

    const/16 v16, 0x1

    if-eq v7, v9, :cond_64

    move/from16 v7, v16

    goto :goto_65

    :cond_64
    move v7, v11

    :goto_65
    and-int/lit8 v9, v15, 0x1

    invoke-virtual {v10, v9, v7}, Lvt9;->N(IZ)Z

    move-result v7

    if-eqz v7, :cond_ff

    invoke-virtual {v10}, Lvt9;->S()V

    and-int/lit8 v7, v0, 0x1

    if-eqz v7, :cond_7d

    invoke-virtual {v10}, Lvt9;->x()Z

    move-result v7

    if-nez v7, :cond_7d

    invoke-virtual {v10}, Lvt9;->Q()V

    :cond_7d
    invoke-virtual {v10}, Lvt9;->q()V

    const/4 v7, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {v1, v7, v9}, Ldjh;->b(FFF)F

    move-result v7

    const/16 v9, 0x2bc

    sget-object v12, Lrnf;->a:Lu36;

    invoke-static {v9, v8, v12}, Lrm5;->X(IILvq7;)Le8m;

    move-result-object v8

    const/16 v11, 0xc30

    const/16 v12, 0x14

    const-string v9, "paging-progress-bar"

    invoke-static/range {v7 .. v12}, Lmd1;->b(FLh49;Ljava/lang/String;Lih5;II)Liak;

    move-result-object v9

    sget-object v7, Lmi5;->n:Lhp7;

    invoke-virtual {v10, v7}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v7

    sget-object v8, Ld2c;->b:Ld2c;

    if-ne v7, v8, :cond_a6

    move/from16 v11, v16

    goto :goto_a7

    :cond_a6
    const/4 v11, 0x0

    :goto_a7
    const/high16 v7, 0x42c00000    # 96.0f

    const/high16 v8, 0x40800000    # 4.0f

    invoke-static {v2, v7, v8}, Lmpj;->i(Lc8e;FF)Lc8e;

    move-result-object v12

    and-int/lit16 v7, v15, 0x380

    xor-int/lit16 v7, v7, 0x180

    if-le v7, v13, :cond_bb

    invoke-virtual {v10, v3, v4}, Lvt9;->e(J)Z

    move-result v7

    if-nez v7, :cond_bf

    :cond_bb
    and-int/lit16 v7, v15, 0x180

    if-ne v7, v13, :cond_c2

    :cond_bf
    move/from16 v7, v16

    goto :goto_c3

    :cond_c2
    const/4 v7, 0x0

    :goto_c3
    invoke-virtual {v10, v9}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v7, v8

    invoke-virtual {v10, v11}, Lvt9;->g(Z)Z

    move-result v8

    or-int/2addr v7, v8

    and-int/lit16 v8, v15, 0x1c00

    xor-int/lit16 v8, v8, 0xc00

    if-le v8, v14, :cond_d9

    invoke-virtual {v10, v5, v6}, Lvt9;->e(J)Z

    move-result v8

    if-nez v8, :cond_df

    :cond_d9
    and-int/lit16 v15, v15, 0xc00

    if-eq v15, v14, :cond_df

    const/16 v16, 0x0

    :cond_df
    or-int v7, v7, v16

    invoke-virtual {v10}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v8

    if-nez v7, :cond_eb

    sget-object v7, Lhh5;->a:Lzpa;

    if-ne v8, v7, :cond_f8

    :cond_eb
    new-instance v3, Lonf;

    move-wide v7, v5

    move v6, v11

    move-wide/from16 v4, p2

    invoke-direct/range {v3 .. v9}, Lonf;-><init>(JZJLiak;)V

    invoke-virtual {v10, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v8, v3

    :cond_f8
    check-cast v8, Lkotlin/jvm/functions/Function1;

    const/4 v9, 0x0

    invoke-static {v12, v8, v10, v9}, Loup;->H(Lc8e;Lkotlin/jvm/functions/Function1;Lih5;I)V

    goto :goto_102

    :cond_ff
    invoke-virtual {v10}, Lvt9;->Q()V

    :goto_102
    invoke-virtual {v10}, Lvt9;->r()Lznh;

    move-result-object v8

    if-eqz v8, :cond_115

    new-instance v0, Lpnf;

    move-wide/from16 v3, p2

    move-wide/from16 v5, p4

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, Lpnf;-><init>(FLc8e;JJI)V

    iput-object v0, v8, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_115
    return-void
.end method

.method public static final b(IILc8e;JJLih5;I)V
    .registers 21

    move-object/from16 v9, p7

    check-cast v9, Lvt9;

    const v0, 0x7a30db89

    invoke-virtual {v9, v0}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {v9, p0}, Lvt9;->d(I)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x4

    goto :goto_13

    :cond_12
    const/4 v0, 0x2

    :goto_13
    or-int v0, p8, v0

    invoke-virtual {v9, p1}, Lvt9;->d(I)Z

    move-result v3

    if-eqz v3, :cond_1e

    const/16 v3, 0x20

    goto :goto_20

    :cond_1e
    const/16 v3, 0x10

    :goto_20
    or-int/2addr v0, v3

    invoke-virtual {v9, p2}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a

    const/16 v4, 0x100

    goto :goto_2c

    :cond_2a
    const/16 v4, 0x80

    :goto_2c
    or-int/2addr v0, v4

    or-int/lit16 v0, v0, 0x2400

    and-int/lit16 v4, v0, 0x2493

    const/16 v5, 0x2492

    if-eq v4, v5, :cond_37

    const/4 v4, 0x1

    goto :goto_38

    :cond_37
    const/4 v4, 0x0

    :goto_38
    and-int/lit8 v5, v0, 0x1

    invoke-virtual {v9, v5, v4}, Lvt9;->N(IZ)Z

    move-result v4

    if-eqz v4, :cond_83

    invoke-virtual {v9}, Lvt9;->S()V

    and-int/lit8 v4, p8, 0x1

    const v5, -0xfc01

    if-eqz v4, :cond_58

    invoke-virtual {v9}, Lvt9;->x()Z

    move-result v4

    if-nez v4, :cond_58

    invoke-virtual {v9}, Lvt9;->Q()V

    and-int/2addr v0, v5

    move-wide v5, p3

    move-wide/from16 v7, p5

    goto :goto_71

    :cond_58
    sget-object v4, Lpof;->a:Lunf;

    invoke-static {v9}, Lpof;->a(Lih5;)Lakf;

    move-result-object v4

    iget-object v4, v4, Lakf;->a:Ls7;

    invoke-interface {v4}, Ls7;->C()J

    move-result-wide v6

    invoke-static {v9}, Lpof;->a(Lih5;)Lakf;

    move-result-object v4

    iget-object v4, v4, Lakf;->a:Ls7;

    invoke-interface {v4}, Ls7;->j()J

    move-result-wide v10

    and-int/2addr v0, v5

    move-wide v5, v6

    move-wide v7, v10

    :goto_71
    invoke-virtual {v9}, Lvt9;->q()V

    int-to-float v4, p0

    int-to-float v10, p1

    div-float/2addr v4, v10

    shr-int/lit8 v0, v0, 0x3

    and-int/lit16 v10, v0, 0x1ff0

    move v3, v4

    move-object v4, p2

    invoke-static/range {v3 .. v10}, Lrnf;->a(FLc8e;JJLih5;I)V

    move-wide v4, v5

    move-wide v6, v7

    goto :goto_89

    :cond_83
    invoke-virtual {v9}, Lvt9;->Q()V

    move-wide v4, p3

    move-wide/from16 v6, p5

    :goto_89
    invoke-virtual {v9}, Lvt9;->r()Lznh;

    move-result-object v9

    if-eqz v9, :cond_9b

    new-instance v0, Lqnf;

    move v1, p0

    move v2, p1

    move-object v3, p2

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lqnf;-><init>(IILc8e;JJI)V

    iput-object v0, v9, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_9b
    return-void
.end method
