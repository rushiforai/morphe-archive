.class public final Ljp3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lkotlin/jvm/functions/Function0;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Ljp3;->a:B

    .line 476
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 477
    iput-object p1, p0, Ljp3;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lr22;Lwth;Leq6;Ldw;Lc37;Lc37;Lc37;Lb49;Ldw;Lb49;Lxm5;Lqo3;Lnv6;Lqo3;Lqo3;)V
    .registers 50

    move-object/from16 v2, p0

    move-object/from16 v0, p1

    move-object/from16 v6, p4

    const/4 v1, 0x0

    iput-byte v1, v2, Ljp3;->a:B

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v0, v2, Ljp3;->b:Ljava/lang/Object;

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object v3

    sget-object v4, Lbb7;->a:Lcv6;

    sget-object v4, Ls6d;->a:Ld7a;

    iget-object v4, v4, Ld7a;->e:Ld7a;

    invoke-static {v3, v4}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v3

    invoke-static {v3}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object v3

    iput-object v3, v2, Ljp3;->c:Ljava/lang/Object;

    move-object/from16 v4, p2

    iget-object v5, v4, Lwth;->b:Ljava/lang/Object;

    check-cast v5, Lrlh;

    move-object/from16 v7, p3

    iget-object v8, v7, Leq6;->a:Ljava/lang/Object;

    check-cast v8, Lrlh;

    iget-object v9, v6, Ldw;->b:Lrlh;

    move-object/from16 v10, p5

    iget-object v11, v10, Lc37;->b:Ljava/lang/Object;

    move-object/from16 v17, v11

    check-cast v17, Lnak;

    move-object/from16 v11, p6

    iget-object v12, v11, Lc37;->b:Ljava/lang/Object;

    move-object/from16 v18, v12

    check-cast v18, Lnak;

    move-object/from16 v12, p7

    iget-object v13, v12, Lc37;->b:Ljava/lang/Object;

    move-object/from16 v19, v13

    check-cast v19, Lnak;

    move-object/from16 v13, p8

    iget-object v14, v13, Lb49;->b:Lrlh;

    move-object/from16 v15, p9

    iget-object v0, v15, Ldw;->b:Lrlh;

    move-object/from16 v20, v0

    move/from16 v16, v1

    move-object/from16 v1, p10

    iget-object v0, v1, Lb49;->b:Lrlh;

    move-object/from16 v21, v0

    move-object/from16 v0, p11

    iget-object v1, v0, Lxm5;->a:Ljava/lang/Object;

    check-cast v1, Lrlh;

    invoke-interface/range {p12 .. p12}, Lqo3;->m()Llak;

    move-result-object v22

    move-object/from16 v0, p13

    move-object/from16 v23, v1

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Lrlh;

    invoke-interface/range {p14 .. p14}, Lqo3;->m()Llak;

    move-result-object v24

    invoke-interface/range {p15 .. p15}, Lqo3;->m()Llak;

    move-result-object v25

    const/16 v0, 0xe

    new-array v0, v0, [Lf99;

    aput-object v5, v0, v16

    const/16 v16, 0x1

    aput-object v8, v0, v16

    const/16 v16, 0x2

    aput-object v9, v0, v16

    const/4 v9, 0x3

    aput-object v17, v0, v9

    const/4 v9, 0x4

    aput-object v18, v0, v9

    const/4 v9, 0x5

    aput-object v19, v0, v9

    const/4 v9, 0x6

    aput-object v14, v0, v9

    const/4 v9, 0x7

    aput-object v20, v0, v9

    const/16 v9, 0x8

    aput-object v21, v0, v9

    const/16 v9, 0x9

    aput-object v23, v0, v9

    const/16 v9, 0xa

    aput-object v22, v0, v9

    const/16 v9, 0xb

    aput-object v1, v0, v9

    const/16 v9, 0xc

    aput-object v24, v0, v9

    const/16 v9, 0xd

    aput-object v25, v0, v9

    move-object v9, v1

    move-object v1, v0

    new-instance v0, Lip3;

    move-object/from16 v16, p15

    move-object/from16 v26, v3

    move-object v3, v4

    move-object/from16 v27, v5

    move-object v5, v7

    move-object/from16 v28, v8

    move-object/from16 v33, v9

    move-object v7, v10

    move-object v8, v11

    move-object v9, v12

    move-object v10, v13

    move-object/from16 v29, v14

    move-object v11, v15

    move-object/from16 v30, v20

    move-object/from16 v31, v21

    move-object/from16 v32, v23

    move-object/from16 v4, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    move-object/from16 v15, p14

    invoke-direct/range {v0 .. v16}, Lip3;-><init>([Lf99;Ljp3;Lwth;Lb49;Leq6;Ldw;Lc37;Lc37;Lc37;Lb49;Ldw;Lxm5;Lqo3;Lnv6;Lqo3;Lqo3;)V

    new-instance v1, Lf9k;

    const-wide/16 v3, 0x0

    invoke-direct {v1, v3, v4}, Lf9k;-><init>(J)V

    new-instance v3, Lrsg;

    move-object/from16 v5, v27

    iget-object v4, v5, Lrlh;->a:Lnak;

    invoke-virtual {v4}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lq8l;

    iget-object v4, v4, Lq8l;->a:Lp8l;

    move-object/from16 v5, v31

    iget-object v7, v5, Lrlh;->a:Lnak;

    invoke-virtual {v7}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    move-object/from16 v8, v28

    iget-object v9, v8, Lrlh;->a:Lnak;

    invoke-virtual {v9}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-direct {v3, v4, v7, v9}, Lrsg;-><init>(Lp8l;ZZ)V

    move-object/from16 v4, p1

    invoke-virtual {v4, v3}, Lr22;->d(Lrsg;)Lno3;

    move-result-object v3

    iget-object v4, v8, Lrlh;->a:Lnak;

    invoke-virtual {v4}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iget-object v6, v6, Ldw;->b:Lrlh;

    iget-object v6, v6, Lrlh;->a:Lnak;

    invoke-virtual {v6}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual/range {v17 .. v17}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-virtual/range {v18 .. v18}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-virtual/range {v19 .. v19}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    move-object/from16 v10, v29

    iget-object v10, v10, Lrlh;->a:Lnak;

    invoke-virtual {v10}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    move-object/from16 v11, v30

    iget-object v11, v11, Lrlh;->a:Lnak;

    invoke-virtual {v11}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    iget-object v5, v5, Lrlh;->a:Lnak;

    invoke-virtual {v5}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object/from16 v12, v32

    iget-object v12, v12, Lrlh;->a:Lnak;

    invoke-virtual {v12}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    invoke-interface/range {p12 .. p12}, Lqo3;->m()Llak;

    move-result-object v13

    invoke-interface {v13}, Llak;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    move-object/from16 v14, v33

    iget-object v14, v14, Lrlh;->a:Lnak;

    invoke-virtual {v14}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Boolean;

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    invoke-interface/range {p14 .. p14}, Lqo3;->m()Llak;

    move-result-object v15

    invoke-interface {v15}, Llak;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Boolean;

    invoke-virtual {v15}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    invoke-interface/range {p15 .. p15}, Lqo3;->m()Llak;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Llak;->getValue()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Boolean;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v16

    move-object/from16 p1, v3

    move/from16 p2, v4

    move/from16 p9, v5

    move/from16 p3, v6

    move/from16 p4, v7

    move/from16 p5, v8

    move/from16 p6, v9

    move/from16 p7, v10

    move/from16 p8, v11

    move/from16 p10, v12

    move/from16 p11, v13

    move/from16 p12, v14

    move/from16 p13, v15

    move/from16 p14, v16

    invoke-static/range {p1 .. p14}, Lfsp;->l(Lno3;ZZZZZZZZZZZZZ)Lkp3;

    move-result-object v3

    move-object/from16 v4, v26

    invoke-static {v0, v4, v1, v3}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object v0

    iput-object v0, v2, Ljp3;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lyqa;Ltcc;Ldl5;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ljp3;->a:B

    .line 478
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljp3;->b:Ljava/lang/Object;

    iput-object p3, p0, Ljp3;->c:Ljava/lang/Object;

    iput-object p1, p0, Ljp3;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/fragment/app/Fragment;Lxtb;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Ljp3;->c:Ljava/lang/Object;

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->a:Lqcc;

    if-eq v1, v2, :cond_38

    iget-object v1, p0, Ljp3;->d:Ljava/lang/Object;

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-nez v1, :cond_21

    iput-object p1, p0, Ljp3;->d:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    :cond_21
    check-cast v0, Lqdc;

    iget-object p1, v0, Lqdc;->i:Lqcc;

    sget-object v0, Lqcc;->b:Lqcc;

    invoke-virtual {p1, v0}, Lqcc;->d(Lqcc;)Z

    move-result p1

    if-eqz p1, :cond_38

    iget-object p1, p0, Ljp3;->b:Ljava/lang/Object;

    check-cast p1, Lkotlin/jvm/functions/Function0;

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Ljp3;->c:Ljava/lang/Object;

    return-object p1

    :cond_38
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-interface {p2}, Lhtb;->getName()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is only available during the Fragment view\'s lifecycle."

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final b(Lcom/opera/android/BrowserActivity;Lrt3;)V
    .registers 5

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    iget-object p0, p0, Ljp3;->d:Ljava/lang/Object;

    check-cast p0, Lrlh;

    invoke-static {p0}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object p0

    new-instance v0, Lbo3;

    const/4 v1, 0x3

    invoke-direct {v0, p2, v1}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lpb;

    const/16 v1, 0x18

    invoke-direct {p2, v0, v1}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, p2}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 4

    iget-byte v0, p0, Ljp3;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_42

    iput-object v1, p0, Ljp3;->c:Ljava/lang/Object;

    iget-object p1, p0, Ljp3;->d:Ljava/lang/Object;

    check-cast p1, Landroidx/fragment/app/Fragment;

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    :cond_19
    iput-object v1, p0, Ljp3;->d:Ljava/lang/Object;

    return-void

    :pswitch_1c
    iget-object p1, p0, Ljp3;->b:Ljava/lang/Object;

    check-cast p1, Ltcc;

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Ljp3;->d:Ljava/lang/Object;

    check-cast p1, Lyqa;

    iget-object p1, p1, Lyqa;->b:Ljava/lang/Object;

    check-cast p1, Li7f;

    iget-object p0, p0, Ljp3;->c:Ljava/lang/Object;

    check-cast p0, Ldl5;

    invoke-virtual {p1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    return-void

    :pswitch_33
    iget-object v0, p0, Ljp3;->c:Ljava/lang/Object;

    check-cast v0, La64;

    invoke-static {v0, v1}, Lsgb;->k(Lnx5;Ljava/util/concurrent/CancellationException;)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_33
        :pswitch_1c
    .end packed-switch
.end method
