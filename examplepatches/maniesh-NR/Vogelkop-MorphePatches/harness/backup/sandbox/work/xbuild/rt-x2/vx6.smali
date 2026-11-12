.class public final Lvx6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic A:Lwx6;

.field public t:Lpfe;

.field public u:Lwx6;

.field public v:Lau6;

.field public w:Ljava/lang/String;

.field public x:Lcel;

.field public y:Z

.field public z:B


# direct methods
.method public constructor <init>(Lwx6;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lvx6;->A:Lwx6;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Lmt5;)Lmt5;
    .registers 3

    new-instance v0, Lvx6;

    iget-object p0, p0, Lvx6;->A:Lwx6;

    invoke-direct {v0, p0, p1}, Lvx6;-><init>(Lwx6;Lmt5;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lmt5;

    invoke-virtual {p0, p1}, Lvx6;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lvx6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lvx6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    sget-object v6, Lpx5;->a:Lpx5;

    iget-byte v0, p0, Lvx6;->z:B

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_172

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :pswitch_e
    iget-object v0, p0, Lvx6;->u:Lwx6;

    check-cast v0, Liom;

    iget-object v1, p0, Lvx6;->t:Lpfe;

    :try_start_14
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_17
    .catchall {:try_start_14 .. :try_end_17} :catchall_164

    goto/16 :goto_15e

    :pswitch_19
    iget-object v0, p0, Lvx6;->u:Lwx6;

    iget-object v1, p0, Lvx6;->t:Lpfe;

    :try_start_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_164

    move-object v8, v0

    move-object v0, p1

    goto/16 :goto_144

    :pswitch_24
    iget-boolean v0, p0, Lvx6;->y:Z

    iget-object v1, p0, Lvx6;->x:Lcel;

    iget-object v2, p0, Lvx6;->w:Ljava/lang/String;

    iget-object v3, p0, Lvx6;->v:Lau6;

    iget-object v4, p0, Lvx6;->u:Lwx6;

    iget-object v8, p0, Lvx6;->t:Lpfe;

    :try_start_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_33
    .catchall {:try_start_30 .. :try_end_33} :catchall_3e

    move-object v9, v3

    move v3, v0

    move-object v0, v9

    move-object v9, v2

    move-object v2, v1

    move-object v1, v9

    move-object v9, p1

    move-object v10, v8

    :goto_3b
    move-object v8, v4

    goto/16 :goto_12c

    :catchall_3e
    move-exception v0

    move-object v1, v8

    goto/16 :goto_16d

    :pswitch_42
    iget-object v0, p0, Lvx6;->x:Lcel;

    iget-object v1, p0, Lvx6;->w:Ljava/lang/String;

    iget-object v2, p0, Lvx6;->v:Lau6;

    iget-object v3, p0, Lvx6;->u:Lwx6;

    iget-object v4, p0, Lvx6;->t:Lpfe;

    :try_start_4c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_59

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    move-object v8, v3

    move-object v3, v2

    move-object v2, v4

    move-object v4, v8

    move-object v8, p1

    goto/16 :goto_100

    :catchall_59
    move-exception v0

    move-object v1, v4

    goto/16 :goto_16d

    :pswitch_5d
    iget-object v0, p0, Lvx6;->w:Ljava/lang/String;

    iget-object v1, p0, Lvx6;->v:Lau6;

    iget-object v2, p0, Lvx6;->u:Lwx6;

    iget-object v3, p0, Lvx6;->t:Lpfe;

    :try_start_65
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_68
    .catchall {:try_start_65 .. :try_end_68} :catchall_6e

    move-object v4, v3

    move-object v3, v2

    move-object v2, v4

    move-object v4, p1

    goto/16 :goto_df

    :catchall_6e
    move-exception v0

    move-object v1, v3

    goto/16 :goto_16d

    :pswitch_72
    iget-object v0, p0, Lvx6;->v:Lau6;

    iget-object v1, p0, Lvx6;->u:Lwx6;

    iget-object v2, p0, Lvx6;->t:Lpfe;

    :try_start_78
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_7b
    .catchall {:try_start_78 .. :try_end_7b} :catchall_16b

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    move-object v3, p1

    goto :goto_bb

    :pswitch_80
    iget-object v0, p0, Lvx6;->u:Lwx6;

    iget-object v1, p0, Lvx6;->t:Lpfe;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v2, v1

    move-object v1, v0

    goto :goto_9f

    :pswitch_8a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v0, Lwx6;->g:Lpfe;

    iput-object v0, p0, Lvx6;->t:Lpfe;

    iget-object v1, p0, Lvx6;->A:Lwx6;

    iput-object v1, p0, Lvx6;->u:Lwx6;

    const/4 v2, 0x1

    iput-byte v2, p0, Lvx6;->z:B

    invoke-virtual {v0, p0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v6, :cond_15d

    move-object v2, v0

    :goto_9f
    :try_start_9f
    iget-object v0, v1, Lwx6;->a:Lau6;

    iget-object v3, v1, Lwx6;->c:Lole;

    iget-object v3, v3, Lole;->a:Ljava/lang/Object;

    check-cast v3, Lft6;

    iget-object v3, v3, Lft6;->c:Lyc1;

    iput-object v2, p0, Lvx6;->t:Lpfe;

    iput-object v1, p0, Lvx6;->u:Lwx6;

    iput-object v0, p0, Lvx6;->v:Lau6;

    const/4 v4, 0x2

    iput-byte v4, p0, Lvx6;->z:B

    invoke-static {v3, p0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v6, :cond_15d

    move-object v11, v1

    move-object v1, v0

    move-object v0, v11

    :goto_bb
    check-cast v3, Lgxc;

    if-eqz v3, :cond_c2

    iget-object v3, v3, Lgxc;->a:Ljava/lang/String;

    goto :goto_c3

    :cond_c2
    move-object v3, v7

    :goto_c3
    iget-object v4, v0, Lwx6;->d:Lga6;

    iget-object v4, v4, Lga6;->b:Ljava/lang/Object;

    check-cast v4, Loz6;

    iget-object v4, v4, Loz6;->c:Lf99;

    iput-object v2, p0, Lvx6;->t:Lpfe;

    iput-object v0, p0, Lvx6;->u:Lwx6;

    iput-object v1, p0, Lvx6;->v:Lau6;

    iput-object v3, p0, Lvx6;->w:Ljava/lang/String;

    const/4 v8, 0x3

    iput-byte v8, p0, Lvx6;->z:B

    invoke-static {v4, p0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v6, :cond_15d

    move-object v11, v3

    move-object v3, v0

    move-object v0, v11

    :goto_df
    check-cast v4, Lcel;

    iget-object v8, v3, Lwx6;->e:Ld06;

    iget-object v8, v8, Ld06;->a:Ljava/lang/Object;

    check-cast v8, Loz6;

    iget-object v8, v8, Loz6;->d:Lf99;

    iput-object v2, p0, Lvx6;->t:Lpfe;

    iput-object v3, p0, Lvx6;->u:Lwx6;

    iput-object v1, p0, Lvx6;->v:Lau6;

    iput-object v0, p0, Lvx6;->w:Ljava/lang/String;

    iput-object v4, p0, Lvx6;->x:Lcel;

    const/4 v9, 0x4

    iput-byte v9, p0, Lvx6;->z:B

    invoke-static {v8, p0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v8

    if-eq v8, v6, :cond_15d

    move-object v11, v3

    move-object v3, v1

    move-object v1, v4

    move-object v4, v11

    :goto_100
    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    iget-object v9, v4, Lwx6;->f:Ld06;

    iget-object v9, v9, Ld06;->a:Ljava/lang/Object;

    check-cast v9, Lw7j;

    invoke-virtual {v9}, Lw7j;->m()Lf99;

    move-result-object v9

    iput-object v2, p0, Lvx6;->t:Lpfe;

    iput-object v4, p0, Lvx6;->u:Lwx6;

    iput-object v3, p0, Lvx6;->v:Lau6;

    iput-object v0, p0, Lvx6;->w:Ljava/lang/String;

    iput-object v1, p0, Lvx6;->x:Lcel;

    iput-boolean v8, p0, Lvx6;->y:Z

    const/4 v10, 0x5

    iput-byte v10, p0, Lvx6;->z:B

    invoke-static {v9, p0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v9
    :try_end_123
    .catchall {:try_start_9f .. :try_end_123} :catchall_16b

    if-eq v9, v6, :cond_15d

    move-object v10, v2

    move-object v2, v1

    move-object v1, v0

    move-object v0, v3

    move v3, v8

    goto/16 :goto_3b

    :goto_12c
    :try_start_12c
    move-object v4, v9

    check-cast v4, Ln2f;

    iput-object v10, p0, Lvx6;->t:Lpfe;

    iput-object v8, p0, Lvx6;->u:Lwx6;

    iput-object v7, p0, Lvx6;->v:Lau6;

    iput-object v7, p0, Lvx6;->w:Ljava/lang/String;

    iput-object v7, p0, Lvx6;->x:Lcel;

    const/4 v9, 0x6

    iput-byte v9, p0, Lvx6;->z:B

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Lau6;->a(Ljava/lang/String;Lcel;ZLn2f;Lnt5;)Ljava/lang/Object;

    move-result-object v0
    :try_end_141
    .catchall {:try_start_12c .. :try_end_141} :catchall_166

    if-eq v0, v6, :cond_15d

    move-object v1, v10

    :goto_144
    :try_start_144
    check-cast v0, Liom;

    iget-object v2, v8, Lwx6;->b:Lqp6;

    iget-object v0, v0, Liom;->b:Ljava/util/List;

    iput-object v1, p0, Lvx6;->t:Lpfe;

    iput-object v7, p0, Lvx6;->u:Lwx6;

    const/4 v3, 0x7

    iput-byte v3, p0, Lvx6;->z:B

    iget-object v2, v2, Lqp6;->a:Lkz6;

    invoke-virtual {v2, v0, p0}, Lkz6;->f(Ljava/util/List;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v6, :cond_15b

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_15b
    .catchall {:try_start_144 .. :try_end_15b} :catchall_164

    :cond_15b
    if-ne v0, v6, :cond_15e

    :cond_15d
    return-object v6

    :cond_15e
    :goto_15e
    invoke-virtual {v1, v7}, Lpfe;->l(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_164
    move-exception v0

    goto :goto_16d

    :catchall_166
    move-exception v0

    move-object v1, v10

    goto :goto_16d

    :goto_169
    move-object v1, v2

    goto :goto_16d

    :catchall_16b
    move-exception v0

    goto :goto_169

    :goto_16d
    invoke-virtual {v1, v7}, Lpfe;->l(Ljava/lang/Object;)V

    throw v0

    nop

    :pswitch_data_172
    .packed-switch 0x0
        :pswitch_8a
        :pswitch_80
        :pswitch_72
        :pswitch_5d
        :pswitch_42
        :pswitch_24
        :pswitch_19
        :pswitch_e
    .end packed-switch
.end method
