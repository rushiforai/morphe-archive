.class public final Ledn;
.super Lcej;
.source "SourceFile"

# interfaces
.implements Lddn;


# instance fields
.field public final a:I

.field public final b:Ltvk;


# direct methods
.method public constructor <init>(ILtvk;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ledn;->a:I

    iput-object p2, p0, Ledn;->b:Ltvk;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget p0, p0, Ledn;->a:I

    return p0
.end method

.method public final cancel()V
    .registers 2

    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v0}, Lcej;->finish(Lhjm;)V

    return-void
.end method

.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 24

    new-instance v0, Lqf;

    invoke-interface/range {p1 .. p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v2

    new-instance v3, Lrxh;

    const v4, 0x7f1413f4

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    new-instance v6, Lkw0;

    invoke-direct {v6, v1}, Lkw0;-><init>(Landroid/content/Context;)V

    new-instance v4, Lrxh;

    const v5, 0x7f140b48

    invoke-direct {v4, v5}, Lrxh;-><init>(I)V

    new-instance v5, Lrxh;

    const v7, 0x7f141372

    invoke-direct {v5, v7}, Lrxh;-><init>(I)V

    new-instance v7, Lzu5;

    const/16 v8, 0x9

    move-object/from16 v9, p2

    invoke-direct {v7, v2, v9, v8}, Lzu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v5}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v2

    const/4 v14, 0x0

    if-nez v2, :cond_41

    move-object v5, v14

    move-object v7, v5

    :cond_41
    move-object/from16 v2, p0

    iget v2, v2, Ledn;->a:I

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    const/4 v8, 0x2

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eq v2, v9, :cond_ea

    if-eq v2, v8, :cond_e1

    const/4 v11, 0x3

    if-eq v2, v11, :cond_d0

    const/4 v11, 0x4

    if-eq v2, v11, :cond_60

    move-object v13, v4

    move-object v15, v5

    move-object/from16 v16, v7

    move/from16 v17, v10

    move-object v11, v14

    :goto_5d
    move-object v10, v3

    goto/16 :goto_f3

    :cond_60
    new-instance v2, Lrxh;

    const v3, 0x7f1401b7

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    invoke-static {v1}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object v3

    iget-object v5, v3, Lgom;->a:Llom;

    sget-object v7, Llom;->a:Llom;

    if-ne v5, v7, :cond_8a

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v1

    new-instance v3, Lsxh;

    const v4, 0x7f14132d

    invoke-direct {v3, v4, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v1, Lrxh;

    const v4, 0x7f140bbb

    invoke-direct {v1, v4}, Lrxh;-><init>(I)V

    move-object v5, v1

    move-object v4, v14

    move-object v7, v4

    goto :goto_bb

    :cond_8a
    :try_start_8a
    const-class v5, Lt5d;

    invoke-static {v1, v5}, Lq9n;->l(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Context;

    move-result-object v5

    check-cast v5, Lt5d;
    :try_end_92
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8a .. :try_end_92} :catch_93

    goto :goto_94

    :catch_93
    move-object v5, v14

    :goto_94
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v7

    new-instance v9, Lsxh;

    const v11, 0x7f141329

    invoke-direct {v9, v11, v7}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v7, Lrxh;

    const v11, 0x7f141328

    invoke-direct {v7, v11}, Lrxh;-><init>(I)V

    new-instance v11, Lzu5;

    const/16 v12, 0xa

    invoke-direct {v11, v5, v3, v12}, Lzu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v7}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v1

    if-nez v1, :cond_b7

    move-object v7, v14

    move-object v11, v7

    :cond_b7
    move-object v5, v7

    move-object v3, v9

    move v9, v10

    move-object v7, v11

    :goto_bb
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Lsxh;

    const v10, 0x7f141380

    invoke-direct {v2, v10, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    move-object v11, v2

    move-object v10, v3

    move-object v13, v4

    move-object v15, v5

    move-object/from16 v16, v7

    move/from16 v17, v9

    goto :goto_f3

    :cond_d0
    new-instance v2, Lrxh;

    const v1, 0x7f14137f

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    :goto_d8
    move-object v11, v2

    move-object v13, v4

    move-object v15, v5

    move-object/from16 v16, v7

    move/from16 v17, v10

    goto/16 :goto_5d

    :cond_e1
    new-instance v2, Lrxh;

    const v1, 0x7f14137e

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto :goto_d8

    :cond_ea
    new-instance v2, Lrxh;

    const v1, 0x7f14137d

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto :goto_d8

    :goto_f3
    new-instance v5, Lgua;

    move v1, v8

    const/4 v8, 0x0

    const/4 v12, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v5 .. v20}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    move-object/from16 v2, p1

    invoke-direct {v0, v2, v5, v1}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final onFinished(Lhjm;)V
    .registers 2

    iget-object p0, p0, Ledn;->b:Ltvk;

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lcdn;

    const/4 p1, 0x0

    iput-object p1, p0, Lcdn;->o:Lddn;

    return-void
.end method
