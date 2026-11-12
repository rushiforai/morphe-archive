.class public final Lp62;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lole;

.field public final b:Lqyj;

.field public final c:Lg22;

.field public final d:Lg7m;

.field public final e:La52;

.field public final f:Lkotlin/jvm/functions/Function1;


# direct methods
.method public constructor <init>(Lole;Lqyj;Lg22;Lg7m;La52;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp62;->a:Lole;

    iput-object p2, p0, Lp62;->b:Lqyj;

    iput-object p3, p0, Lp62;->c:Lg22;

    iput-object p4, p0, Lp62;->d:Lg7m;

    iput-object p5, p0, Lp62;->e:La52;

    iput-object p6, p0, Lp62;->f:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final a(Lwyh;Lm62;)V
    .registers 9

    new-instance v2, Lpqh;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lt52;->k:Lt52;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0x16

    if-eqz v0, :cond_15

    new-instance p1, Ln9a;

    invoke-direct {p1, v1}, Ln9a;-><init>(B)V

    goto :goto_36

    :cond_15
    instance-of v0, p1, Ls52;

    if-nez v0, :cond_31

    instance-of v0, p1, Lv52;

    if-nez v0, :cond_31

    instance-of v0, p1, Lu52;

    if-eqz v0, :cond_2d

    check-cast p1, Lu52;

    iget-object p1, p1, Lu52;->k:Ljava/lang/String;

    iput-object p1, v2, Lpqh;->a:Ljava/lang/Object;

    new-instance p1, Lzpa;

    invoke-direct {p1, v1}, Lzpa;-><init>(B)V

    goto :goto_36

    :cond_2d
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_31
    new-instance p1, Ln9a;

    invoke-direct {p1, v1}, Ln9a;-><init>(B)V

    :goto_36
    iget-object v0, p0, Lp62;->e:La52;

    invoke-virtual {v0}, La52;->b()Lz42;

    move-result-object v4

    new-instance v0, Lws1;

    const/4 v5, 0x1

    move-object v3, p0

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v3, Lp62;->a:Lole;

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lqq8;

    new-instance p2, Lvpb;

    invoke-direct {p2}, Lvpb;-><init>()V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    invoke-interface {p1}, Lb42;->a()Lorb;

    move-result-object p1

    const-string v2, "spec"

    invoke-virtual {v1, p1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Lvpb;->a(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lqq8;->h()Ljava/lang/String;

    move-result-object p1

    const-string v1, "2.0"

    const-string v2, "method"

    const-string v3, "jsonrpc"

    const-string v4, "actions.v1.createNewChat"

    invoke-static {v3, v1, v2, v4}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v1

    const-string v2, "params"

    invoke-virtual {v1, p2, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "id"

    invoke-virtual {v1, p1, p2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Lt02;

    const/4 p2, 0x7

    invoke-direct {p1, v0, p2}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1, p1}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final b(JLkotlin/jvm/functions/Function1;)V
    .registers 10

    new-instance v0, Lo62;

    const/4 v1, 0x0

    invoke-direct {v0, p3, v1}, Lo62;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object p0, p0, Lp62;->a:Lole;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p3, Lvpb;

    invoke-direct {p3}, Lvpb;-><init>()V

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    invoke-virtual {p3, v2}, Lvpb;->a(Ljava/lang/Object;)V

    const-string v3, "id"

    invoke-virtual {v2, p1, p2, v3}, Lorb;->o(JLjava/lang/String;)V

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lqq8;

    invoke-virtual {p0}, Lqq8;->h()Ljava/lang/String;

    move-result-object p1

    const-string p2, "2.0"

    const-string v2, "method"

    const-string v4, "jsonrpc"

    const-string v5, "actions.v1.requestChatDump"

    invoke-static {v4, p2, v2, v5}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p2

    const-string v2, "params"

    invoke-virtual {p2, p3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2, p1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Ld42;

    invoke-direct {p1, v0, v1}, Ld42;-><init>(Lo62;B)V

    invoke-virtual {p0, p2, p1}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final c(JLjava/lang/String;Lz42;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    sget-object v2, Lw52;->a:[Lw52;

    iget-object v2, v1, Lz42;->a:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    iget-object v4, v0, Lp62;->d:Lg7m;

    const/4 v5, 0x0

    const/16 v6, 0xa

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-nez v3, :cond_41

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v9, v5

    :cond_1a
    if-ge v9, v3, :cond_41

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lh52;

    iget-object v10, v10, Lh52;->c:Lux1;

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    if-eqz v10, :cond_1a

    if-eq v10, v8, :cond_1a

    if-ne v10, v7, :cond_3d

    new-instance v3, Ls6h;

    sget-object v9, Lorn;->h:Lorn;

    sget-object v10, Ll08;->a:Ll08;

    invoke-direct {v3, v9, v10, v5}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v3, v4, Lg7m;->j:Ljava/lang/Object;

    goto/16 :goto_b3

    :cond_3d
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_41
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4a

    sget-object v3, Ld02;->a:Ld02;

    goto :goto_74

    :cond_4a
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_72

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v9, v5

    :cond_55
    if-ge v9, v3, :cond_72

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lh52;

    iget-object v10, v10, Lh52;->c:Lux1;

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    if-eqz v10, :cond_6f

    if-eq v10, v8, :cond_55

    if-eq v10, v7, :cond_6f

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_6f
    sget-object v3, Ld02;->b:Ld02;

    goto :goto_74

    :cond_72
    sget-object v3, Ld02;->c:Ld02;

    :goto_74
    new-instance v9, Ljava/util/ArrayList;

    invoke-static {v2, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v10

    move v11, v5

    :goto_82
    if-ge v11, v10, :cond_96

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Lh52;

    iget-object v12, v12, Lh52;->b:Lo29;

    if-nez v12, :cond_92

    sget-object v12, Lo29;->o:Lo29;

    :cond_92
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_82

    :cond_96
    new-instance v10, Ls6h;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_ac

    if-eq v3, v8, :cond_a9

    if-ne v3, v7, :cond_a5

    sget-object v3, Lorn;->g:Lorn;

    goto :goto_ae

    :cond_a5
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_a9
    sget-object v3, Lorn;->f:Lorn;

    goto :goto_ae

    :cond_ac
    sget-object v3, Lorn;->b:Lorn;

    :goto_ae
    invoke-direct {v10, v3, v9, v5}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v10, v4, Lg7m;->j:Ljava/lang/Object;

    :goto_b3
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v9, v5

    :cond_bd
    :goto_bd
    const-string v10, "application/vnd.opera.x-page-context"

    if-ge v9, v4, :cond_d6

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v9, v9, 0x1

    move-object v12, v11

    check-cast v12, Lh52;

    iget-object v12, v12, Lh52;->h:Ljava/lang/String;

    invoke-static {v12, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_bd

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_bd

    :cond_d6
    new-instance v4, Ljava/util/ArrayList;

    invoke-static {v3, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v4, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    move v11, v5

    :goto_e4
    if-ge v11, v9, :cond_f4

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Lh52;

    iget-object v12, v12, Lh52;->a:Ljava/lang/String;

    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e4

    :cond_f4
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    move v11, v5

    :cond_fe
    :goto_fe
    if-ge v11, v9, :cond_115

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    move-object v13, v12

    check-cast v13, Lh52;

    iget-object v13, v13, Lh52;->h:Ljava/lang/String;

    invoke-static {v13, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_fe

    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_fe

    :cond_115
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v3, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v9, v5

    :goto_123
    if-ge v9, v6, :cond_138

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lh52;

    new-instance v11, Li3l;

    iget-object v10, v10, Lh52;->g:Ljava/lang/String;

    invoke-direct {v11, v10}, Li3l;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_123

    :cond_138
    iget-object v3, v1, Lz42;->b:Lfz1;

    const/4 v6, 0x0

    if-eqz v3, :cond_160

    iget-object v9, v3, Lfz1;->b:Ljava/lang/String;

    const-string v10, ":\n\n"

    move-object/from16 v11, p3

    invoke-static {v11, v10, v9}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iget-object v3, v3, Lfz1;->d:Lez1;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_15c

    if-eq v3, v8, :cond_159

    if-ne v3, v7, :cond_155

    move-object v3, v6

    goto :goto_15e

    :cond_155
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_159
    sget-object v3, Lz32;->d:Lz32;

    goto :goto_15e

    :cond_15c
    sget-object v3, Lz32;->c:Lz32;

    :goto_15e
    move-object v11, v9

    goto :goto_163

    :cond_160
    move-object/from16 v11, p3

    move-object v3, v6

    :goto_163
    const v8, 0xfa00

    invoke-static {v8, v11}, Lu0h;->q(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-boolean v1, v1, Lz42;->c:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v9, Lt40;

    const/16 v10, 0x10

    invoke-direct {v9, v10}, Lt40;-><init>(B)V

    iget-object v0, v0, Lp62;->a:Lole;

    iget-object v0, v0, Lole;->a:Ljava/lang/Object;

    check-cast v0, Lqq8;

    new-instance v10, Lvpb;

    invoke-direct {v10}, Lvpb;-><init>()V

    new-instance v11, Lorb;

    invoke-direct {v11}, Lorb;-><init>()V

    invoke-virtual {v10, v11}, Lvpb;->a(Ljava/lang/Object;)V

    const-string v12, "id"

    move-wide/from16 v13, p1

    invoke-virtual {v11, v13, v14, v12}, Lorb;->o(JLjava/lang/String;)V

    const-string v13, "text"

    invoke-virtual {v11, v8, v13}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v8, Lvpb;

    invoke-direct {v8}, Lvpb;-><init>()V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v13

    move v14, v5

    :goto_1a0
    if-ge v14, v13, :cond_1ae

    invoke-virtual {v4, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v14, v14, 0x1

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v8, v15}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_1a0

    :cond_1ae
    const-string v4, "fileIds"

    invoke-virtual {v11, v8, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v4, Lvpb;

    invoke-direct {v4}, Lvpb;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    :goto_1bc
    if-ge v5, v8, :cond_1d7

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    add-int/lit8 v5, v5, 0x1

    check-cast v13, Li3l;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v14, Lorb;

    invoke-direct {v14}, Lorb;-><init>()V

    iget-object v13, v13, Li3l;->a:Ljava/lang/String;

    invoke-virtual {v14, v13, v12}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, v14}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_1bc

    :cond_1d7
    const-string v2, "tabs"

    invoke-virtual {v11, v4, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "thinkHarder"

    invoke-virtual {v11, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v3, :cond_1f0

    sget-object v1, Lz32;->b:Lz32;

    if-eq v3, v1, :cond_1ea

    iget-object v6, v3, Lz32;->a:Ljava/lang/String;

    goto :goto_1f0

    :cond_1ea
    const-string v0, "Undefined"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-void

    :cond_1f0
    :goto_1f0
    const-string v1, "mode"

    invoke-virtual {v11, v6, v1}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lqq8;->h()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2.0"

    const-string v3, "method"

    const-string v4, "jsonrpc"

    const-string v5, "actions.v1.submitText"

    invoke-static {v4, v2, v3, v5}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v2

    const-string v3, "params"

    invoke-virtual {v2, v10, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v1, v12}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lf32;

    invoke-direct {v1, v9, v7}, Lf32;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v1}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
