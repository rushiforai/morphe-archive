.class public final synthetic Lbg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lue5;


# direct methods
.method public synthetic constructor <init>(Lue5;B)V
    .registers 3

    iput-byte p2, p0, Lbg5;->a:B

    iput-object p1, p0, Lbg5;->b:Lue5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lue5;IB)V
    .registers 4

    .line 8
    iput-byte p3, p0, Lbg5;->a:B

    iput-object p1, p0, Lbg5;->b:Lue5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 114

    move-object/from16 v0, p0

    iget-byte v1, v0, Lbg5;->a:B

    const/4 v2, 0x6

    sget-object v3, Lm3c;->S:Lfza;

    const/4 v4, 0x7

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v8, v0, Lbg5;->b:Lue5;

    packed-switch v1, :pswitch_data_516

    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v5, :cond_22

    move v2, v6

    goto :goto_23

    :cond_22
    move v2, v7

    :goto_23
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_37

    :cond_34
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_37
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v1, 0x37

    invoke-static {v1}, Laoh;->m(I)I

    move-result v1

    invoke-static {v8, v0, v1}, Llej;->a(Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_51
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Laoh;->m(I)I

    move-result v1

    invoke-static {v8, v0, v1}, Lrof;->a(Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_66
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Laoh;->m(I)I

    move-result v1

    invoke-static {v8, v0, v1}, Lrof;->a(Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7b
    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v3, v2, 0x3

    if-eq v3, v5, :cond_8c

    move v7, v6

    :cond_8c
    and-int/2addr v2, v6

    move-object v12, v1

    check-cast v12, Lvt9;

    invoke-virtual {v12, v2, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_2dd

    new-instance v13, Lsa5;

    sget-object v1, Lpof;->a:Lunf;

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->j()J

    move-result-wide v14

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->r()J

    move-result-wide v16

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->D()J

    move-result-wide v18

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->I()J

    move-result-wide v20

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->p()J

    move-result-wide v22

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->i()J

    move-result-wide v24

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->a()J

    move-result-wide v26

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->x()J

    move-result-wide v28

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->n()J

    move-result-wide v30

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->l()J

    move-result-wide v32

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->u()J

    move-result-wide v34

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->B()J

    move-result-wide v36

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->N()J

    move-result-wide v38

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->O()J

    move-result-wide v40

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->t()J

    move-result-wide v42

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->k()J

    move-result-wide v44

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->f()J

    move-result-wide v46

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->m()J

    move-result-wide v48

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->w()J

    move-result-wide v50

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->R()J

    move-result-wide v52

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->A()J

    move-result-wide v54

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->q()J

    move-result-wide v56

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->K()J

    move-result-wide v58

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->F()J

    move-result-wide v60

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->Q()J

    move-result-wide v62

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->S()J

    move-result-wide v64

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->M()J

    move-result-wide v66

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->P()J

    move-result-wide v68

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->H()J

    move-result-wide v70

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->v()J

    move-result-wide v72

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->G()J

    move-result-wide v74

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->L()J

    move-result-wide v76

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->z()J

    move-result-wide v78

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->C()J

    move-result-wide v80

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->E()J

    move-result-wide v82

    invoke-static {v12}, Lpof;->a(Lih5;)Lakf;

    move-result-object v1

    iget-object v1, v1, Lakf;->a:Ls7;

    invoke-interface {v1}, Ls7;->J()J

    move-result-wide v84

    sget-wide v86, Lu95;->g:J

    move-wide/from16 v88, v86

    move-wide/from16 v90, v86

    move-wide/from16 v92, v86

    move-wide/from16 v94, v86

    move-wide/from16 v96, v86

    move-wide/from16 v98, v86

    move-wide/from16 v100, v86

    move-wide/from16 v102, v86

    move-wide/from16 v104, v86

    move-wide/from16 v106, v86

    move-wide/from16 v108, v86

    invoke-direct/range {v13 .. v109}, Lsa5;-><init>(JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ)V

    new-instance v1, Lacj;

    sget-object v2, Lpof;->a:Lunf;

    iget-object v3, v2, Lunf;->a:Lu8i;

    move-object v4, v3

    iget-object v3, v2, Lunf;->b:Lu8i;

    move-object v5, v4

    iget-object v4, v2, Lunf;->c:Lu8i;

    move-object v6, v5

    iget-object v5, v2, Lunf;->d:Lu8i;

    iget-object v2, v2, Lunf;->f:Lu8i;

    move-object/from16 v110, v6

    move-object v6, v2

    move-object/from16 v2, v110

    invoke-direct/range {v1 .. v6}, Lacj;-><init>(Lu8i;Lu8i;Lu8i;Lu8i;Lu8i;)V

    new-instance v14, Lwam;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v2

    iget-object v15, v2, Lapf;->a:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v2

    iget-object v2, v2, Lapf;->b:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v3

    iget-object v3, v3, Lapf;->c:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v4

    iget-object v4, v4, Lapf;->d:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v5

    iget-object v5, v5, Lapf;->e:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v6

    iget-object v6, v6, Lapf;->f:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v7

    iget-object v7, v7, Lapf;->g:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v8

    iget-object v8, v8, Lapf;->h:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v9

    iget-object v9, v9, Lapf;->i:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v10

    iget-object v10, v10, Lapf;->j:Likl;

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v11

    iget-object v11, v11, Lapf;->k:Likl;

    move-object/from16 p1, v1

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v1

    iget-object v1, v1, Lapf;->l:Likl;

    move-object/from16 v26, v1

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v1

    iget-object v1, v1, Lapf;->m:Likl;

    move-object/from16 v27, v1

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v1

    iget-object v1, v1, Lapf;->n:Likl;

    move-object/from16 v28, v1

    invoke-static {v12}, Lpof;->b(Lih5;)Lapf;

    move-result-object v1

    iget-object v1, v1, Lapf;->o:Likl;

    move-object/from16 v30, v15

    move-object/from16 v31, v2

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v35, v6

    move-object/from16 v36, v7

    move-object/from16 v37, v8

    move-object/from16 v38, v9

    move-object/from16 v39, v10

    move-object/from16 v40, v11

    move-object/from16 v41, v26

    move-object/from16 v42, v27

    move-object/from16 v43, v28

    move-object/from16 v44, v1

    move-object/from16 v29, v1

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move-object/from16 v20, v6

    move-object/from16 v21, v7

    move-object/from16 v22, v8

    move-object/from16 v23, v9

    move-object/from16 v24, v10

    move-object/from16 v25, v11

    invoke-direct/range {v14 .. v44}, Lwam;-><init>(Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;)V

    move-object v8, v13

    const/4 v13, 0x0

    move-object v10, v14

    const/4 v14, 0x0

    iget-object v11, v0, Lbg5;->b:Lue5;

    move-object/from16 v9, p1

    invoke-static/range {v8 .. v14}, Lfed;->b(Lsa5;Lacj;Lwam;Lue5;Lih5;II)V

    goto :goto_2e0

    :cond_2dd
    invoke-virtual {v12}, Lvt9;->Q()V

    :goto_2e0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2e3
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v5, :cond_2f5

    move v2, v6

    goto :goto_2f6

    :cond_2f5
    move v2, v7

    :goto_2f6
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_34d

    sget-object v1, Lz7e;->b:Lz7e;

    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {v1, v2}, Lmpj;->l(Lc8e;F)Lc8e;

    move-result-object v1

    sget-object v2, Lrbe;->f:Ltd3;

    invoke-static {v2, v7}, Lnr3;->c(Ltd3;Z)Ltfd;

    move-result-object v2

    iget-wide v4, v0, Lvt9;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v0}, Lvt9;->l()Loag;

    move-result-object v5

    invoke-static {v0, v1}, Lqyn;->P(Lih5;Lc8e;)Lc8e;

    move-result-object v1

    sget-object v9, Lbh5;->To:Lujp;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lvt9;->a0()V

    iget-boolean v9, v0, Lvt9;->S:Z

    if-eqz v9, :cond_32b

    invoke-virtual {v0, v3}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_32e

    :cond_32b
    invoke-virtual {v0}, Lvt9;->j0()V

    :goto_32e
    sget-object v3, Lujp;->f:Lah5;

    invoke-static {v0, v2, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v2, Lujp;->e:Lah5;

    invoke-static {v0, v5, v2}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Lujp;->g:Lah5;

    invoke-static {v0, v2, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v0}, Ly4h;->m(Lih5;)V

    sget-object v2, Lujp;->d:Lah5;

    invoke-static {v0, v1, v2}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v7, v8, v0, v6}, Lo18;->r(ILue5;Lvt9;Z)V

    goto :goto_350

    :cond_34d
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_350
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_353
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v5, :cond_365

    move v2, v6

    goto :goto_366

    :cond_365
    move v2, v7

    :goto_366
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_377

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_37a

    :cond_377
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_37a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_37d
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v5, :cond_38f

    move v2, v6

    goto :goto_390

    :cond_38f
    move v2, v7

    :goto_390
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_3a1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3a4

    :cond_3a1
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_3a4
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a7
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v4, v1, 0x3

    if-eq v4, v5, :cond_3b9

    move v4, v6

    goto :goto_3ba

    :cond_3b9
    move v4, v7

    :goto_3ba
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v4}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_452

    const/4 v13, 0x0

    const/16 v14, 0xe

    sget-object v9, Lz7e;->b:Lz7e;

    const/high16 v10, 0x41800000    # 16.0f

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v9 .. v14}, La26;->b0(Lc8e;FFFFI)Lc8e;

    move-result-object v1

    sget-object v4, Lrbe;->b:Ltd3;

    invoke-static {v4, v7}, Lnr3;->c(Ltd3;Z)Ltfd;

    move-result-object v4

    iget-wide v9, v0, Lvt9;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v0}, Lvt9;->l()Loag;

    move-result-object v9

    invoke-static {v0, v1}, Lqyn;->P(Lih5;Lc8e;)Lc8e;

    move-result-object v1

    sget-object v10, Lbh5;->To:Lujp;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lvt9;->a0()V

    iget-boolean v10, v0, Lvt9;->S:Z

    if-eqz v10, :cond_3f4

    invoke-virtual {v0, v3}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_3f7

    :cond_3f4
    invoke-virtual {v0}, Lvt9;->j0()V

    :goto_3f7
    sget-object v3, Lujp;->f:Lah5;

    invoke-static {v0, v4, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v3, Lujp;->e:Lah5;

    invoke-static {v0, v9, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Lujp;->g:Lah5;

    invoke-static {v0, v3, v4}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v0}, Ly4h;->m(Lih5;)V

    sget-object v3, Lujp;->d:Lah5;

    invoke-static {v0, v1, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v1, Labm;->a:Lhp7;

    invoke-virtual {v0, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwam;

    sget-object v1, Lzam;->a:Lhp7;

    invoke-virtual {v0, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Likl;

    if-nez v1, :cond_436

    const v1, -0x29c59f44

    invoke-virtual {v0, v1}, Lvt9;->W(I)V

    sget-object v1, Lijl;->a:Lhp7;

    invoke-virtual {v0, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Likl;

    :goto_432
    invoke-virtual {v0, v7}, Lvt9;->p(Z)V

    goto :goto_43d

    :cond_436
    const v3, -0x29c5a514

    invoke-virtual {v0, v3}, Lvt9;->W(I)V

    goto :goto_432

    :goto_43d
    new-instance v3, Lbg5;

    invoke-direct {v3, v8, v2}, Lbg5;-><init>(Lue5;B)V

    const v2, -0x4b8f7f0e

    invoke-static {v2, v3, v0}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v2

    const/16 v3, 0x30

    invoke-static {v1, v2, v0, v3}, Lijl;->a(Likl;Lue5;Lih5;I)V

    invoke-virtual {v0, v6}, Lvt9;->p(Z)V

    goto :goto_455

    :cond_452
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_455
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_458
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Laoh;->m(I)I

    move-result v1

    invoke-static {v8, v0, v1}, Lmkh;->b(Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_46d
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v5, :cond_47f

    move v2, v6

    goto :goto_480

    :cond_47f
    move v2, v7

    :goto_480
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_491

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_494

    :cond_491
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_494
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_497
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v5, :cond_4a8

    move v7, v6

    :cond_4a8
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_4bb

    sget-object v1, Lwd9;->a:Lwd9;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v0, v2}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4be

    :cond_4bb
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_4be
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4c1
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v5, :cond_4d3

    move v2, v6

    goto :goto_4d4

    :cond_4d3
    move v2, v7

    :goto_4d4
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_4e5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4e8

    :cond_4e5
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_4e8
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4eb
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v5, :cond_4fd

    move v2, v6

    goto :goto_4fe

    :cond_4fd
    move v2, v7

    :goto_4fe
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_50f

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_512

    :cond_50f
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_512
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_516
    .packed-switch 0x0
        :pswitch_4eb
        :pswitch_4c1
        :pswitch_497
        :pswitch_46d
        :pswitch_458
        :pswitch_3a7
        :pswitch_37d
        :pswitch_353
        :pswitch_2e3
        :pswitch_7b
        :pswitch_66
        :pswitch_51
        :pswitch_3a
    .end packed-switch
.end method
