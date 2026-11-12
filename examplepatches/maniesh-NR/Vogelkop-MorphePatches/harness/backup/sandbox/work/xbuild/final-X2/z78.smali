.class public final Lz78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf99;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lplh;


# direct methods
.method public synthetic constructor <init>(Lplh;B)V
    .registers 3

    iput-byte p2, p0, Lz78;->a:B

    iput-object p1, p0, Lz78;->b:Lplh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final collect(Ll99;Lmt5;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lz78;->a:B

    const/16 v1, 0x9

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/high16 v4, -0x80000000

    const/4 v5, 0x1

    iget-object v6, p0, Lz78;->b:Lplh;

    packed-switch v0, :pswitch_data_264

    instance-of v0, p2, Lton;

    if-eqz v0, :cond_20

    move-object v0, p2

    check-cast v0, Lton;

    iget v7, v0, Lton;->u:I

    and-int v8, v7, v4

    if-eqz v8, :cond_20

    sub-int/2addr v7, v4

    iput v7, v0, Lton;->u:I

    goto :goto_25

    :cond_20
    new-instance v0, Lton;

    invoke-direct {v0, p0, p2}, Lton;-><init>(Lz78;Lmt5;)V

    :goto_25
    iget-object p0, v0, Lton;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lton;->u:I

    if-eqz v4, :cond_39

    if-ne v4, v5, :cond_35

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_47

    :cond_35
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_47

    :cond_39
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v5, v0, Lton;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_47
    return-object v2

    :pswitch_48
    instance-of v0, p2, Lvvi;

    if-eqz v0, :cond_59

    move-object v0, p2

    check-cast v0, Lvvi;

    iget v1, v0, Lvvi;->u:I

    and-int v7, v1, v4

    if-eqz v7, :cond_59

    sub-int/2addr v1, v4

    iput v1, v0, Lvvi;->u:I

    goto :goto_5e

    :cond_59
    new-instance v0, Lvvi;

    invoke-direct {v0, p0, p2}, Lvvi;-><init>(Lz78;Lmt5;)V

    :goto_5e
    iget-object p0, v0, Lvvi;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lvvi;->u:I

    if-eqz v1, :cond_72

    if-ne v1, v5, :cond_6e

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_81

    :cond_6e
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_81

    :cond_72
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    const/4 v1, 0x6

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v5, v0, Lvvi;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_81
    return-object v2

    :pswitch_82
    new-instance p0, Lref;

    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lref;-><init>(Ll99;B)V

    invoke-virtual {v6, p0, p2}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    :pswitch_8e
    instance-of v0, p2, Ln7d;

    if-eqz v0, :cond_9f

    move-object v0, p2

    check-cast v0, Ln7d;

    iget v1, v0, Ln7d;->u:I

    and-int v7, v1, v4

    if-eqz v7, :cond_9f

    sub-int/2addr v1, v4

    iput v1, v0, Ln7d;->u:I

    goto :goto_a4

    :cond_9f
    new-instance v0, Ln7d;

    invoke-direct {v0, p0, p2}, Ln7d;-><init>(Lz78;Lmt5;)V

    :goto_a4
    iget-object p0, v0, Ln7d;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Ln7d;->u:I

    if-eqz v1, :cond_b8

    if-ne v1, v5, :cond_b4

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_c8

    :cond_b4
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_c8

    :cond_b8
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0x1a

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Ln7d;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_c8
    return-object v2

    :pswitch_c9
    instance-of v0, p2, Lvnc;

    if-eqz v0, :cond_da

    move-object v0, p2

    check-cast v0, Lvnc;

    iget v1, v0, Lvnc;->u:I

    and-int v7, v1, v4

    if-eqz v7, :cond_da

    sub-int/2addr v1, v4

    iput v1, v0, Lvnc;->u:I

    goto :goto_df

    :cond_da
    new-instance v0, Lvnc;

    invoke-direct {v0, p0, p2}, Lvnc;-><init>(Lz78;Lmt5;)V

    :goto_df
    iget-object p0, v0, Lvnc;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lvnc;->u:I

    if-eqz v1, :cond_f3

    if-ne v1, v5, :cond_ef

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_103

    :cond_ef
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_103

    :cond_f3
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0x13

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Lvnc;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_103
    return-object v2

    :pswitch_104
    instance-of v0, p2, Ltnc;

    if-eqz v0, :cond_115

    move-object v0, p2

    check-cast v0, Ltnc;

    iget v1, v0, Ltnc;->u:I

    and-int v7, v1, v4

    if-eqz v7, :cond_115

    sub-int/2addr v1, v4

    iput v1, v0, Ltnc;->u:I

    goto :goto_11a

    :cond_115
    new-instance v0, Ltnc;

    invoke-direct {v0, p0, p2}, Ltnc;-><init>(Lz78;Lmt5;)V

    :goto_11a
    iget-object p0, v0, Ltnc;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Ltnc;->u:I

    if-eqz v1, :cond_12e

    if-ne v1, v5, :cond_12a

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_13e

    :cond_12a
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_13e

    :cond_12e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0x12

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Ltnc;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_13e
    return-object v2

    :pswitch_13f
    instance-of v0, p2, Lep9;

    if-eqz v0, :cond_150

    move-object v0, p2

    check-cast v0, Lep9;

    iget v1, v0, Lep9;->u:I

    and-int v7, v1, v4

    if-eqz v7, :cond_150

    sub-int/2addr v1, v4

    iput v1, v0, Lep9;->u:I

    goto :goto_155

    :cond_150
    new-instance v0, Lep9;

    invoke-direct {v0, p0, p2}, Lep9;-><init>(Lz78;Lmt5;)V

    :goto_155
    iget-object p0, v0, Lep9;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lep9;->u:I

    if-eqz v1, :cond_169

    if-ne v1, v5, :cond_165

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_179

    :cond_165
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_179

    :cond_169
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0xe

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Lep9;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_179
    return-object v2

    :pswitch_17a
    instance-of v0, p2, Lcp9;

    if-eqz v0, :cond_18b

    move-object v0, p2

    check-cast v0, Lcp9;

    iget v1, v0, Lcp9;->u:I

    and-int v7, v1, v4

    if-eqz v7, :cond_18b

    sub-int/2addr v1, v4

    iput v1, v0, Lcp9;->u:I

    goto :goto_190

    :cond_18b
    new-instance v0, Lcp9;

    invoke-direct {v0, p0, p2}, Lcp9;-><init>(Lz78;Lmt5;)V

    :goto_190
    iget-object p0, v0, Lcp9;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lcp9;->u:I

    if-eqz v1, :cond_1a4

    if-ne v1, v5, :cond_1a0

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1b4

    :cond_1a0
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1b4

    :cond_1a4
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0xd

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Lcp9;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_1b4
    return-object v2

    :pswitch_1b5
    instance-of v0, p2, Lc88;

    if-eqz v0, :cond_1c6

    move-object v0, p2

    check-cast v0, Lc88;

    iget v7, v0, Lc88;->u:I

    and-int v8, v7, v4

    if-eqz v8, :cond_1c6

    sub-int/2addr v7, v4

    iput v7, v0, Lc88;->u:I

    goto :goto_1cb

    :cond_1c6
    new-instance v0, Lc88;

    invoke-direct {v0, p0, p2}, Lc88;-><init>(Lz78;Lmt5;)V

    :goto_1cb
    iget-object p0, v0, Lc88;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lc88;->u:I

    if-eqz v4, :cond_1df

    if-ne v4, v5, :cond_1db

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1ed

    :cond_1db
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1ed

    :cond_1df
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Lc88;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_1ed
    return-object v2

    :pswitch_1ee
    instance-of v0, p2, La88;

    if-eqz v0, :cond_1ff

    move-object v0, p2

    check-cast v0, La88;

    iget v1, v0, La88;->u:I

    and-int v7, v1, v4

    if-eqz v7, :cond_1ff

    sub-int/2addr v1, v4

    iput v1, v0, La88;->u:I

    goto :goto_204

    :cond_1ff
    new-instance v0, La88;

    invoke-direct {v0, p0, p2}, La88;-><init>(Lz78;Lmt5;)V

    :goto_204
    iget-object p0, v0, La88;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, La88;->u:I

    if-eqz v1, :cond_218

    if-ne v1, v5, :cond_214

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_228

    :cond_214
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_228

    :cond_218
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0x8

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, La88;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_228
    return-object v2

    :pswitch_229
    instance-of v0, p2, Lx78;

    if-eqz v0, :cond_23a

    move-object v0, p2

    check-cast v0, Lx78;

    iget v1, v0, Lx78;->u:I

    and-int v7, v1, v4

    if-eqz v7, :cond_23a

    sub-int/2addr v1, v4

    iput v1, v0, Lx78;->u:I

    goto :goto_23f

    :cond_23a
    new-instance v0, Lx78;

    invoke-direct {v0, p0, p2}, Lx78;-><init>(Lz78;Lmt5;)V

    :goto_23f
    iget-object p0, v0, Lx78;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lx78;->u:I

    if-eqz v1, :cond_253

    if-ne v1, v5, :cond_24f

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_262

    :cond_24f
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_262

    :cond_253
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/4 v1, 0x7

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Lx78;->u:I

    invoke-virtual {v6, p0, v0}, Lplh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v2, p2

    :goto_262
    return-object v2

    nop

    :pswitch_data_264
    .packed-switch 0x0
        :pswitch_229
        :pswitch_1ee
        :pswitch_1b5
        :pswitch_17a
        :pswitch_13f
        :pswitch_104
        :pswitch_c9
        :pswitch_8e
        :pswitch_82
        :pswitch_48
    .end packed-switch
.end method
