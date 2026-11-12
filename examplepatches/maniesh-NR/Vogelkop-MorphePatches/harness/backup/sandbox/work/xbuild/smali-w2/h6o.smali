.class public final Lh6o;
.super Lz5k;
.source "SourceFile"


# instance fields
.field public final f:Lkotlin/jvm/functions/Function0;

.field public g:Ljava/lang/Object;

.field public h:Lsjm;

.field public final synthetic i:B

.field public final j:Lw6o;

.field public final k:Landroidx/recyclerview/widget/RecyclerView;

.field public final l:Ltsd;

.field public final m:Lagm;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lijc;ILf99;Lddc;Lkotlin/jvm/functions/Function0;)V
    .registers 13

    .line 202
    sget-object v3, Le6k;->n:Le6k;

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    .line 203
    invoke-direct/range {v0 .. v5}, Lz5k;-><init>(Ljava/lang/Class;Lijc;Le6k;IB)V

    .line 204
    iput-object p6, v0, Lh6o;->f:Lkotlin/jvm/functions/Function0;

    .line 205
    sget-object p0, Lsjm;->b:Lqjm;

    iput-object p0, v0, Lh6o;->h:Lsjm;

    .line 206
    new-instance p0, Lhkm;

    const/4 p1, 0x6

    const/4 p2, 0x0

    invoke-direct {p0, p4, v0, p2, p1}, Lhkm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p1, 0x3

    .line 207
    invoke-static {p5, p2, p2, p0, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public constructor <init>(Lw6o;Lijc;Landroidx/recyclerview/widget/RecyclerView;Ltsd;Ltsd;Lddc;B)V
    .registers 21

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move/from16 v1, p7

    iput-byte v1, p0, Lh6o;->i:B

    packed-switch v1, :pswitch_data_ca

    iget-object v1, p1, Lw6o;->j:Lrlh;

    new-instance v3, Lc78;

    const/4 v4, 0x4

    invoke-direct {v3, v1, v4}, Lc78;-><init>(Lrlh;B)V

    invoke-static {v3}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v12

    new-instance v1, Lcfn;

    const/4 v7, 0x0

    const/16 v8, 0xf

    const/4 v2, 0x0

    const-class v4, Lw6o;

    const-string v5, "onAspectIncludedOnStartPage"

    const-string v6, "onAspectIncludedOnStartPage$app()V"

    move-object v3, p1

    invoke-direct/range {v1 .. v8}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    const-class v2, Li6o;

    const v3, 0x7f0d0496

    move-object v0, p0

    move-object/from16 v5, p6

    move-object v6, v1

    move-object v1, v2

    move-object v4, v12

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lh6o;-><init>(Ljava/lang/Class;Lijc;ILf99;Lddc;Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lh6o;->j:Lw6o;

    iput-object v9, p0, Lh6o;->k:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v10, p0, Lh6o;->l:Ltsd;

    new-instance v0, Lagm;

    new-instance v1, Leek;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v11, v2}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object v0, p0, Lh6o;->m:Lagm;

    return-void

    :pswitch_4d
    iget-object v0, p1, Lw6o;->j:Lrlh;

    new-instance v1, Lc78;

    const/4 v2, 0x7

    invoke-direct {v1, v0, v2}, Lc78;-><init>(Lrlh;B)V

    invoke-static {v1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v12

    new-instance v0, Lcfn;

    const/4 v6, 0x0

    const/16 v7, 0x11

    const/4 v1, 0x0

    const-class v3, Lw6o;

    const-string v4, "onAspectIncludedOnStartPage"

    const-string v5, "onAspectIncludedOnStartPage$app()V"

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    const-class v1, Lk7o;

    const v3, 0x7f0d049b

    move-object v2, p2

    move-object/from16 v5, p6

    move-object v6, v0

    move-object v4, v12

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lh6o;-><init>(Ljava/lang/Class;Lijc;ILf99;Lddc;Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lh6o;->j:Lw6o;

    iput-object v9, p0, Lh6o;->k:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v10, p0, Lh6o;->l:Ltsd;

    new-instance v0, Lagm;

    new-instance v1, Lj6o;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v11, v2}, Lj6o;-><init>(Lh6o;Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object v0, p0, Lh6o;->m:Lagm;

    return-void

    :pswitch_8b
    iget-object v0, p1, Lw6o;->j:Lrlh;

    new-instance v1, Lc78;

    const/4 v2, 0x5

    invoke-direct {v1, v0, v2}, Lc78;-><init>(Lrlh;B)V

    invoke-static {v1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v12

    new-instance v0, Lcfn;

    const/4 v6, 0x0

    const/16 v7, 0x10

    const/4 v1, 0x0

    const-class v3, Lw6o;

    const-string v4, "onAspectIncludedOnStartPage"

    const-string v5, "onAspectIncludedOnStartPage$app()V"

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    const-class v1, Lo6o;

    const v3, 0x7f0d0499

    move-object v2, p2

    move-object/from16 v5, p6

    move-object v6, v0

    move-object v4, v12

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lh6o;-><init>(Ljava/lang/Class;Lijc;ILf99;Lddc;Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lh6o;->j:Lw6o;

    iput-object v9, p0, Lh6o;->k:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v10, p0, Lh6o;->l:Ltsd;

    new-instance v1, Lagm;

    new-instance v2, Leek;

    const/16 v3, 0x1d

    invoke-direct {v2, p0, v11, v3}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v2}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object v1, p0, Lh6o;->m:Lagm;

    return-void

    :pswitch_data_ca
    .packed-switch 0x1
        :pswitch_8b
        :pswitch_4d
    .end packed-switch
.end method


# virtual methods
.method public final C()Lagm;
    .registers 2

    iget-byte v0, p0, Lh6o;->i:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Lh6o;->m:Lagm;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lh6o;->m:Lagm;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lh6o;->m:Lagm;

    return-object p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public final b(Lsjm;)V
    .registers 3

    iget-object v0, p0, Lh6o;->h:Lsjm;

    invoke-virtual {v0}, Lsjm;->a()Z

    move-result v0

    iput-object p1, p0, Lh6o;->h:Lsjm;

    if-nez v0, :cond_15

    invoke-virtual {p1}, Lsjm;->a()Z

    move-result p1

    if-eqz p1, :cond_15

    iget-object p0, p0, Lh6o;->f:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_15
    return-void
.end method

.method public final t()Lja2;
    .registers 7

    iget-object v0, p0, Lh6o;->g:Ljava/lang/Object;

    if-eqz v0, :cond_4c

    iget-byte v1, p0, Lh6o;->i:B

    packed-switch v1, :pswitch_data_54

    check-cast v0, Lrk4;

    new-instance v1, Lk7o;

    iget-object v2, v0, Lrk4;->a:Ljava/util/Set;

    new-instance v3, Loyj;

    const/16 v4, 0x8

    invoke-direct {v3, p0, v0, v4}, Loyj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lj6o;

    const/4 v5, 0x2

    invoke-direct {v4, p0, v0, v5}, Lj6o;-><init>(Lh6o;Ljava/lang/Object;B)V

    invoke-direct {v1, v2, v3, v4}, Lk7o;-><init>(Ljava/util/Set;Loyj;Lj6o;)V

    goto :goto_4b

    :pswitch_20
    check-cast v0, Lqk4;

    new-instance v1, Lo6o;

    iget-object v2, v0, Lqk4;->a:Lr7o;

    new-instance v3, Lgil;

    const/16 v4, 0x19

    invoke-direct {v3, p0, v0, v4}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lj6o;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v0, v5}, Lj6o;-><init>(Lh6o;Ljava/lang/Object;B)V

    invoke-direct {v1, v2, v3, v4}, Lo6o;-><init>(Lr7o;Lgil;Lj6o;)V

    goto :goto_4b

    :pswitch_37
    check-cast v0, Lpk4;

    new-instance v1, Li6o;

    new-instance v2, Loyj;

    const/4 v3, 0x7

    invoke-direct {v2, p0, v0, v3}, Loyj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Leek;

    const/16 v4, 0x1c

    invoke-direct {v3, p0, v0, v4}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v2, v3}, Li6o;-><init>(Loyj;Leek;)V

    :goto_4b
    return-object v1

    :cond_4c
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_37
        :pswitch_20
    .end packed-switch
.end method

.method public final y(Lja2;)Z
    .registers 5

    iget-object v0, p0, Lh6o;->g:Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    iget-byte p0, p0, Lh6o;->i:B

    const/4 v2, 0x1

    packed-switch p0, :pswitch_data_28

    goto :goto_27

    :pswitch_d
    check-cast p1, Lk7o;

    check-cast v0, Lrk4;

    iget-object p0, p1, Lk7o;->g:Ljava/util/Set;

    iget-object p1, v0, Lrk4;->a:Ljava/util/Set;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 v1, p0, 0x1

    goto :goto_27

    :pswitch_1c
    check-cast p1, Lo6o;

    check-cast v0, Lqk4;

    iget-object p0, p1, Lo6o;->g:Lr7o;

    iget-object p1, v0, Lqk4;->a:Lr7o;

    if-eq p0, p1, :cond_27

    move v1, v2

    :cond_27
    :goto_27
    return v1

    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_d
    .end packed-switch
.end method

.method public final z()Z
    .registers 1

    iget-object p0, p0, Lh6o;->g:Ljava/lang/Object;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method
