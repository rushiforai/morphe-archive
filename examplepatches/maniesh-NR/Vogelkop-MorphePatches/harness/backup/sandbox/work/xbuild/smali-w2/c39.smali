.class public final synthetic Lc39;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    iput-byte p6, p0, Lc39;->a:B

    iput-object p1, p0, Lc39;->b:Ljava/lang/Object;

    iput-object p2, p0, Lc39;->c:Ljava/lang/Object;

    iput-object p3, p0, Lc39;->d:Ljava/lang/Object;

    iput-object p4, p0, Lc39;->e:Ljava/lang/Object;

    iput-object p5, p0, Lc39;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IB)V
    .registers 8

    .line 16
    iput-byte p7, p0, Lc39;->a:B

    iput-object p1, p0, Lc39;->b:Ljava/lang/Object;

    iput-object p2, p0, Lc39;->c:Ljava/lang/Object;

    iput-object p3, p0, Lc39;->d:Ljava/lang/Object;

    iput-object p4, p0, Lc39;->e:Ljava/lang/Object;

    iput-object p5, p0, Lc39;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Lc39;->a:B

    const/4 v2, 0x0

    sget-object v3, Lm3c;->S:Lfza;

    sget-object v4, Lhh5;->a:Lzpa;

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    iget-object v8, v0, Lc39;->e:Ljava/lang/Object;

    iget-object v9, v0, Lc39;->d:Ljava/lang/Object;

    iget-object v10, v0, Lc39;->f:Ljava/lang/Object;

    iget-object v11, v0, Lc39;->c:Ljava/lang/Object;

    iget-object v12, v0, Lc39;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_332

    move-object v13, v12

    check-cast v13, Lb3m;

    move-object v14, v11

    check-cast v14, Lw2m;

    move-object/from16 v17, v10

    check-cast v17, Lh49;

    move-object/from16 v18, p1

    check-cast v18, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v19

    iget-object v15, v0, Lc39;->d:Ljava/lang/Object;

    iget-object v0, v0, Lc39;->e:Ljava/lang/Object;

    move-object/from16 v16, v0

    invoke-static/range {v13 .. v19}, Lr9h;->k(Lb3m;Lw2m;Ljava/lang/Object;Ljava/lang/Object;Lh49;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3e
    move-object v1, v12

    check-cast v1, Lmsi;

    move-object v2, v11

    check-cast v2, Lkotlin/jvm/functions/Function0;

    move-object v3, v9

    check-cast v3, Lkotlin/jvm/functions/Function1;

    move-object v4, v8

    check-cast v4, Lkotlin/jvm/functions/Function0;

    move-object v5, v10

    check-cast v5, Lkotlin/jvm/functions/Function0;

    move-object/from16 v6, p1

    check-cast v6, Lih5;

    move-object/from16 v0, p2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v0, 0x9

    invoke-static {v0}, Laoh;->m(I)I

    move-result v7

    invoke-static/range {v1 .. v7}, Lr9h;->d(Lmsi;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_64
    check-cast v12, Lc8e;

    check-cast v11, Lafe;

    check-cast v9, Lue5;

    check-cast v8, Lfb3;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v5, :cond_80

    move v2, v7

    goto :goto_81

    :cond_80
    move v2, v6

    :goto_81
    and-int/2addr v1, v7

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_f1

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v4, :cond_9a

    new-instance v1, Lgb1;

    const/16 v2, 0xf

    invoke-direct {v1, v11, v2}, Lgb1;-><init>(Lafe;B)V

    invoke-virtual {v0, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_9a
    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v12, v1}, Lna2;->H(Lc8e;Lkotlin/jvm/functions/Function1;)Lc8e;

    move-result-object v1

    sget-object v2, Lrbe;->b:Ltd3;

    invoke-static {v2, v7}, Lnr3;->c(Ltd3;Z)Ltfd;

    move-result-object v2

    iget-wide v4, v0, Lvt9;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v0}, Lvt9;->l()Loag;

    move-result-object v5

    invoke-static {v0, v1}, Lqyn;->P(Lih5;Lc8e;)Lc8e;

    move-result-object v1

    sget-object v11, Lbh5;->To:Lujp;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lvt9;->a0()V

    iget-boolean v11, v0, Lvt9;->S:Z

    if-eqz v11, :cond_c4

    invoke-virtual {v0, v3}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_c7

    :cond_c4
    invoke-virtual {v0}, Lvt9;->j0()V

    :goto_c7
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

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x6

    invoke-virtual {v8, v10, v0, v1}, Lfb3;->b(Lkotlin/jvm/functions/Function0;Lih5;I)V

    invoke-virtual {v0, v7}, Lvt9;->p(Z)V

    goto :goto_f4

    :cond_f1
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_f4
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_f7
    move-object v1, v12

    check-cast v1, Lkotlin/jvm/functions/Function0;

    move-object v2, v11

    check-cast v2, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    move-object v3, v9

    check-cast v3, Lkotlin/jvm/functions/Function0;

    move-object v4, v8

    check-cast v4, Lkotlin/jvm/functions/Function0;

    move-object v5, v10

    check-cast v5, Lkotlin/jvm/functions/Function0;

    move-object/from16 v6, p1

    check-cast v6, Lih5;

    move-object/from16 v0, p2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static/range {v1 .. v7}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->c(Lkotlin/jvm/functions/Function0;Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lih5;I)Lkotlin/Unit;

    move-result-object v0

    return-object v0

    :pswitch_117
    check-cast v12, Lc8e;

    check-cast v11, Lafe;

    check-cast v9, Lue5;

    check-cast v8, Lxg5;

    check-cast v10, Lruj;

    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v13, v1, 0x3

    if-eq v13, v5, :cond_133

    move v5, v7

    goto :goto_134

    :cond_133
    move v5, v6

    :goto_134
    and-int/2addr v1, v7

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v5}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_23f

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v4, :cond_14d

    new-instance v1, Lgb1;

    const/16 v4, 0xe

    invoke-direct {v1, v11, v4}, Lgb1;-><init>(Lafe;B)V

    invoke-virtual {v0, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_14d
    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v12, v1}, Lna2;->H(Lc8e;Lkotlin/jvm/functions/Function1;)Lc8e;

    move-result-object v1

    sget-object v4, Lrbe;->b:Ltd3;

    invoke-static {v4, v6}, Lnr3;->c(Ltd3;Z)Ltfd;

    move-result-object v4

    iget-wide v12, v0, Lvt9;->T:J

    invoke-static {v12, v13}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v0}, Lvt9;->l()Loag;

    move-result-object v12

    invoke-static {v0, v1}, Lqyn;->P(Lih5;Lc8e;)Lc8e;

    move-result-object v1

    sget-object v13, Lbh5;->To:Lujp;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lvt9;->a0()V

    iget-boolean v13, v0, Lvt9;->S:Z

    if-eqz v13, :cond_177

    invoke-virtual {v0, v3}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_17a

    :cond_177
    invoke-virtual {v0}, Lvt9;->j0()V

    :goto_17a
    sget-object v3, Lujp;->f:Lah5;

    invoke-static {v0, v4, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v3, Lujp;->e:Lah5;

    invoke-static {v0, v12, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Lujp;->g:Lah5;

    invoke-static {v0, v3, v4}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v0}, Ly4h;->m(Lih5;)V

    sget-object v3, Lujp;->d:Lah5;

    invoke-static {v0, v1, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v8, Lxg5;->a:Llld;

    iget-object v1, v1, Llld;->b:Ljava/lang/Object;

    check-cast v1, Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laof;

    if-eqz v1, :cond_232

    const v3, -0x5511d8be

    invoke-virtual {v0, v3}, Lvt9;->W(I)V

    invoke-interface {v11}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvoh;

    iget-object v4, v10, Lruj;->d:Lcuj;

    const/4 v5, 0x0

    if-eqz v3, :cond_20b

    iget-object v9, v4, Lcuj;->a:Lruj;

    invoke-virtual {v9}, Lruj;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_20b

    new-instance v9, Ld82;

    invoke-direct {v9, v4, v7}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lo5f;

    const/16 v10, 0xc

    invoke-direct {v4, v3, v10}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-static {v9, v4}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v4

    new-instance v9, Lu39;

    invoke-direct {v9, v4}, Lu39;-><init>(Lv39;)V

    invoke-virtual {v9}, Lu39;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1fd

    invoke-virtual {v9}, Lu39;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lvoh;

    iget v2, v2, Lvoh;->b:F

    :goto_1e6
    invoke-virtual {v9}, Lu39;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f9

    invoke-virtual {v9}, Lu39;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvoh;

    iget v4, v4, Lvoh;->b:F

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    goto :goto_1e6

    :cond_1f9
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    :cond_1fd
    if-eqz v2, :cond_20b

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget v3, v3, Lvoh;->d:F

    sub-float/2addr v3, v2

    cmpg-float v2, v3, v5

    if-ltz v2, :cond_20b

    move v5, v3

    :cond_20b
    sget-object v2, Lmi5;->h:Lhp7;

    invoke-virtual {v0, v2}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ln27;

    invoke-interface {v2, v5}, Ln27;->k0(F)F

    move-result v13

    iget-object v2, v8, Lxg5;->a:Llld;

    sget-object v3, Lz7e;->b:Lz7e;

    sget-object v4, Lrbe;->i:Ltd3;

    sget-object v5, Las3;->a:Las3;

    invoke-virtual {v5, v3, v4}, Las3;->a(Lc8e;Ltd3;)Lc8e;

    move-result-object v9

    const/4 v12, 0x0

    const/4 v14, 0x7

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static/range {v9 .. v14}, La26;->b0(Lc8e;FFFFI)Lc8e;

    move-result-object v3

    invoke-static {v2, v1, v3, v0, v6}, Lic4;->b(Llld;Laof;Lc8e;Lih5;I)V

    invoke-virtual {v0, v6}, Lvt9;->p(Z)V

    goto :goto_23b

    :cond_232
    const v1, -0x5509dadd

    invoke-virtual {v0, v1}, Lvt9;->W(I)V

    invoke-virtual {v0, v6}, Lvt9;->p(Z)V

    :goto_23b
    invoke-virtual {v0, v7}, Lvt9;->p(Z)V

    goto :goto_242

    :cond_23f
    invoke-virtual {v0}, Lvt9;->Q()V

    :goto_242
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_245
    move-object v1, v12

    check-cast v1, Lg2e;

    move-object v2, v11

    check-cast v2, Ljk8;

    move-object v3, v9

    check-cast v3, Lkotlin/jvm/functions/Function1;

    move-object v4, v8

    check-cast v4, Lkotlin/jvm/functions/Function1;

    move-object v5, v10

    check-cast v5, Lc8e;

    move-object/from16 v6, p1

    check-cast v6, Lih5;

    move-object/from16 v0, p2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v7

    invoke-static/range {v1 .. v7}, Loup;->I(Lg2e;Ljk8;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_269
    move-object v1, v12

    check-cast v1, Lue5;

    move-object v2, v11

    check-cast v2, Lue5;

    move-object v3, v9

    check-cast v3, Lue5;

    move-object v4, v8

    check-cast v4, Lue5;

    move-object v5, v10

    check-cast v5, Lue5;

    move-object/from16 v6, p1

    check-cast v6, Lih5;

    move-object/from16 v0, p2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v0, 0x181

    invoke-static {v0}, Laoh;->m(I)I

    move-result v7

    invoke-static/range {v1 .. v7}, Lic4;->e(Lue5;Lue5;Lue5;Lue5;Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_28f
    check-cast v12, Ljava/util/ArrayList;

    check-cast v11, Lx77;

    check-cast v9, Lsq2;

    check-cast v8, Ljava/lang/String;

    check-cast v10, Ljava/util/LinkedHashMap;

    move-object/from16 v0, p1

    check-cast v0, Landroid/app/assist/AssistStructure$ViewNode;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/assist/AssistStructure$ViewNode;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_32f

    invoke-virtual {v0}, Landroid/app/assist/AssistStructure$ViewNode;->getVisibility()I

    move-result v3

    if-nez v3, :cond_32f

    invoke-virtual {v0}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillType()I

    move-result v3

    if-ne v3, v7, :cond_32f

    invoke-virtual {v0}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillId()Landroid/view/autofill/AutofillId;

    move-result-object v3

    sget-object v4, Lp09;->a:Lir5;

    invoke-virtual {v0}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillType()I

    move-result v13

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eq v13, v7, :cond_2d6

    if-eq v13, v5, :cond_2d3

    const/4 v4, 0x3

    if-eq v13, v4, :cond_2d0

    const/4 v4, 0x4

    if-eq v13, v4, :cond_2cd

    sget-object v4, Lp09;->b:Lk09;

    goto :goto_2d8

    :cond_2cd
    sget-object v4, Lp09;->d:Li09;

    goto :goto_2d8

    :cond_2d0
    sget-object v4, Lp09;->f:Lj09;

    goto :goto_2d8

    :cond_2d3
    sget-object v4, Lp09;->e:Lm09;

    goto :goto_2d8

    :cond_2d6
    sget-object v4, Lp09;->c:Ll09;

    :goto_2d8
    if-eqz v3, :cond_32c

    sget-object v5, Lp09;->b:Lk09;

    if-eq v4, v5, :cond_32c

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_32c

    iget-object v4, v11, Lx77;->b:Ljava/lang/Object;

    check-cast v4, Lrye;

    iget-object v4, v4, Lrye;->a:[Lqye;

    array-length v5, v4

    :goto_2eb
    if-ge v6, v5, :cond_2f9

    aget-object v7, v4, v6

    invoke-interface {v7, v0}, Lqye;->k(Landroid/app/assist/AssistStructure$ViewNode;)Lnf2;

    move-result-object v7

    if-nez v7, :cond_2f8

    add-int/lit8 v6, v6, 0x1

    goto :goto_2eb

    :cond_2f8
    move-object v2, v7

    :cond_2f9
    if-eqz v9, :cond_301

    new-instance v4, Lh2g;

    invoke-direct {v4, v1, v9}, Lh2g;-><init>(Ljava/lang/String;Lsq2;)V

    goto :goto_30e

    :cond_301
    if-eqz v1, :cond_309

    new-instance v4, Li2g;

    invoke-direct {v4, v1, v8}, Li2g;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_30e

    :cond_309
    new-instance v4, Lg2g;

    invoke-direct {v4, v8}, Lg2g;-><init>(Ljava/lang/String;)V

    :goto_30e
    invoke-virtual {v10, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_31c

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v10, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_31c
    check-cast v1, Ljava/util/List;

    new-instance v4, Lf39;

    invoke-direct {v4, v0, v2}, Lf39;-><init>(Landroid/app/assist/AssistStructure$ViewNode;Lnf2;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_331

    :cond_32c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_331

    :cond_32f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_331
    return-object v0

    :pswitch_data_332
    .packed-switch 0x0
        :pswitch_28f
        :pswitch_269
        :pswitch_245
        :pswitch_117
        :pswitch_f7
        :pswitch_64
        :pswitch_3e
    .end packed-switch
.end method
