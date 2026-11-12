.class public final synthetic Lr6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt6g;


# direct methods
.method public synthetic constructor <init>(Lt6g;B)V
    .registers 3

    iput-byte p2, p0, Lr6g;->a:B

    iput-object p1, p0, Lr6g;->b:Lt6g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lr6g;->a:B

    iget-object v0, v0, Lr6g;->b:Lt6g;

    packed-switch v1, :pswitch_data_cc

    move-object/from16 v3, p1

    check-cast v3, Ljava/util/List;

    iget-object v1, v0, Lt6g;->s:Ltsd;

    iget-object v2, v0, Lt6g;->e:Lzg7;

    invoke-virtual {v0}, Lt6g;->f()Z

    move-result v11

    iget-object v4, v0, Lt6g;->c:Lyu2;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/16 v7, 0x1e

    if-lt v4, v7, :cond_2c

    if-eqz v11, :cond_2c

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_2c

    move v9, v6

    goto :goto_2d

    :cond_2c
    move v9, v5

    :goto_2d
    const/4 v13, 0x0

    if-eqz v11, :cond_57

    iget-object v8, v0, Lt6g;->p:Lkze;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lipf;

    sget-object v10, Lepf;->a:Lepf;

    invoke-static {v8, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_57

    sget-object v10, Lgpf;->a:Lgpf;

    invoke-static {v8, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4a

    move v12, v6

    goto :goto_58

    :cond_4a
    instance-of v10, v8, Lcpf;

    if-nez v10, :cond_57

    instance-of v8, v8, Lfpf;

    if-nez v8, :cond_57

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_b9

    :cond_57
    move v12, v5

    :goto_58
    invoke-virtual {v2}, Loy;->e()Z

    move-result v8

    if-eqz v8, :cond_61

    sget-object v8, Lu3g;->e:Lu3g;

    goto :goto_74

    :cond_61
    iget-object v8, v0, Lt6g;->r:Lkze;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_72

    sget-object v8, Lu3g;->f:Lu3g;

    goto :goto_74

    :cond_72
    sget-object v8, Lu3g;->d:Lu3g;

    :goto_74
    if-lt v4, v7, :cond_79

    invoke-interface {v3}, Ljava/util/List;->size()I

    :cond_79
    new-instance v5, Lr5g;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    move v14, v6

    invoke-virtual {v0}, Lt6g;->g()Z

    move-result v6

    iget-object v15, v0, Lt6g;->h:Ldb;

    iget-object v10, v0, Lt6g;->i:Lzwk;

    sget-boolean v16, Lxgh;->a:Z

    if-nez v16, :cond_93

    invoke-static {v15, v10}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v10

    if-eqz v10, :cond_93

    move v10, v14

    goto :goto_94

    :cond_93
    const/4 v10, 0x0

    :goto_94
    if-lt v4, v7, :cond_a0

    if-nez v9, :cond_a0

    invoke-virtual {v2}, Loy;->e()Z

    move-result v2

    if-nez v2, :cond_a0

    move v2, v14

    goto :goto_a1

    :cond_a0
    const/4 v2, 0x0

    :goto_a1
    move-object v4, v3

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    xor-int/2addr v4, v14

    move v7, v10

    move v10, v4

    move-object v4, v8

    move v8, v2

    new-instance v2, Lp6g;

    invoke-direct/range {v2 .. v12}, Lp6g;-><init>(Ljava/util/List;Lu3g;Lr5g;ZZZZZZZ)V

    invoke-virtual {v1, v2}, Ltsd;->r(Ljava/lang/Object;)V

    iput-object v13, v0, Lt6g;->n:Loml;

    sget-object v13, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_b9
    return-object v13

    :pswitch_ba
    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_c2

    sget-object v1, Ll08;->a:Ll08;

    :cond_c2
    check-cast v1, Ljava/lang/Iterable;

    iget-object v0, v0, Lt6g;->o:Ljk;

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_cc
    .packed-switch 0x0
        :pswitch_ba
    .end packed-switch
.end method
