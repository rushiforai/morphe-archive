.class public final Lioc;
.super Ll53;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Landroid/view/View;

.field public final e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLandroid/view/View;Ljava/lang/Object;)V
    .registers 4

    .line 11
    iput-byte p1, p0, Lioc;->c:B

    iput-object p2, p0, Lioc;->d:Landroid/view/View;

    iput-object p3, p0, Lioc;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lgv8;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lioc;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lioc;->d:Landroid/view/View;

    iput-object p2, p0, Lioc;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Llz3;
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lioc;->c:B

    iget-object v2, v0, Lioc;->e:Ljava/lang/Object;

    const/high16 v3, 0x41000000    # 8.0f

    const/4 v4, 0x0

    packed-switch v1, :pswitch_data_11a

    check-cast v2, Lkdo;

    new-instance v1, Lrn9;

    iget-object v5, v2, Lkdo;->j:Lx5f;

    sget-object v6, Lmf0;->m:Lmf0;

    const/16 v7, 0x12

    invoke-direct {v1, v5, v6, v7}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-array v4, v4, [Ljava/lang/Object;

    new-instance v10, Lsxh;

    const v5, 0x7f1415ba

    invoke-direct {v10, v5, v4}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    iget-object v7, v0, Lioc;->d:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v3, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    new-instance v13, Loc;

    new-instance v0, Lrxh;

    const v3, 0x7f1415b9

    invoke-direct {v0, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lobn;

    const/16 v4, 0xc

    invoke-direct {v3, v1, v2, v4}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v13, v0, v3}, Loc;-><init>(Lrxh;Landroid/view/View$OnClickListener;)V

    new-instance v11, Lagm;

    const/16 v0, 0x8

    invoke-direct {v11, v2, v1, v7, v0}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Lqba;

    const v12, 0x7f0d0203

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v14, 0x0

    move-object/from16 v6, p1

    invoke-direct/range {v5 .. v14}, Lqba;-><init>(Landroid/view/ViewGroup;Landroid/view/View;IILsxh;Lrba;ILoc;Z)V

    new-instance v0, Lsba;

    invoke-direct {v0, v5}, Lsba;-><init>(Lqba;)V

    return-object v0

    :pswitch_5a
    new-array v1, v4, [Ljava/lang/Object;

    new-instance v11, Lsxh;

    const v2, 0x7f140029

    invoke-direct {v11, v2, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    iget-object v8, v0, Lioc;->d:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v3, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    new-instance v12, Lwzg;

    const/16 v1, 0xa

    invoke-direct {v12, v1, v0, v8, v4}, Lwzg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v6, Lqba;

    const v13, 0x7f0d0202

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v7, p1

    invoke-direct/range {v6 .. v15}, Lqba;-><init>(Landroid/view/ViewGroup;Landroid/view/View;IILsxh;Lrba;ILoc;Z)V

    new-instance v0, Lsba;

    invoke-direct {v0, v6}, Lsba;-><init>(Lqba;)V

    return-object v0

    :pswitch_88
    new-array v1, v4, [Ljava/lang/Object;

    new-instance v11, Lsxh;

    const v2, 0x7f14122f

    invoke-direct {v11, v2, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    iget-object v8, v0, Lioc;->d:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v3, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v9

    new-instance v12, Lrii;

    const/16 v1, 0xb

    invoke-direct {v12, v0, v1}, Lrii;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lqba;

    const v13, 0x7f0d0202

    const/4 v10, 0x3

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v7, p1

    invoke-direct/range {v6 .. v15}, Lqba;-><init>(Landroid/view/ViewGroup;Landroid/view/View;IILsxh;Lrba;ILoc;Z)V

    new-instance v0, Lsba;

    invoke-direct {v0, v6}, Lsba;-><init>(Lqba;)V

    return-object v0

    :pswitch_bd
    new-array v1, v4, [Ljava/lang/Object;

    new-instance v11, Lsxh;

    const v2, 0x7f140729

    invoke-direct {v11, v2, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    iget-object v8, v0, Lioc;->d:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v3, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    new-instance v12, Lf1p;

    invoke-direct {v12, v0, v8, v4}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v6, Lqba;

    const v13, 0x7f0d0202

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v7, p1

    invoke-direct/range {v6 .. v15}, Lqba;-><init>(Landroid/view/ViewGroup;Landroid/view/View;IILsxh;Lrba;ILoc;Z)V

    new-instance v0, Lsba;

    invoke-direct {v0, v6}, Lsba;-><init>(Lqba;)V

    return-object v0

    :pswitch_e9
    new-instance v1, Lexd;

    new-instance v4, Lixh;

    invoke-direct {v4, v3}, Lixh;-><init>(F)V

    iget-object v3, v0, Lioc;->d:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v4, v5}, Ly7h;->k(Landroid/content/Context;)I

    move-result v4

    new-instance v5, Ll11;

    const/16 v6, 0x30

    const/4 v7, 0x3

    invoke-direct {v5, v7, v4, v6, v3}, Ll11;-><init>(IIILandroid/view/View;)V

    check-cast v2, Lgv8;

    invoke-virtual {v2}, Lgv8;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    move-object/from16 v7, p1

    invoke-direct {v1, v7, v5, v2}, Lexd;-><init>(Landroid/view/ViewGroup;Ll11;Ljava/util/List;)V

    new-instance v2, Lvt5;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Lvt5;-><init>(Ll53;B)V

    invoke-virtual {v1, v2}, Llz3;->a(Lkz3;)V

    return-object v1

    nop

    :pswitch_data_11a
    .packed-switch 0x0
        :pswitch_e9
        :pswitch_bd
        :pswitch_88
        :pswitch_5a
    .end packed-switch
.end method
