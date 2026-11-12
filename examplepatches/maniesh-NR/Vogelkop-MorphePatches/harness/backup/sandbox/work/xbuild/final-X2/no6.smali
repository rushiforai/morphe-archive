.class public final Lno6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf99;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx99;


# direct methods
.method public synthetic constructor <init>(Lx99;B)V
    .registers 3

    iput-byte p2, p0, Lno6;->a:B

    iput-object p1, p0, Lno6;->b:Lx99;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final collect(Ll99;Lmt5;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lno6;->a:B

    iget-object v1, p0, Lno6;->b:Lx99;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/high16 v4, -0x80000000

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_37c

    instance-of v0, p2, Liz6;

    if-eqz v0, :cond_1e

    move-object v0, p2

    check-cast v0, Liz6;

    iget v6, v0, Liz6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_1e

    sub-int/2addr v6, v4

    iput v6, v0, Liz6;->u:I

    goto :goto_23

    :cond_1e
    new-instance v0, Liz6;

    invoke-direct {v0, p0, p2}, Liz6;-><init>(Lno6;Lmt5;)V

    :goto_23
    iget-object p0, v0, Liz6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Liz6;->u:I

    if-eqz v4, :cond_35

    if-ne v4, v5, :cond_31

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_47

    :cond_31
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_49

    :cond_35
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    invoke-direct {p0, p1, v5}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Liz6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_47

    move-object v2, p2

    goto :goto_49

    :cond_47
    :goto_47
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_49
    return-object v2

    :pswitch_4a
    instance-of v0, p2, Lfz6;

    if-eqz v0, :cond_5b

    move-object v0, p2

    check-cast v0, Lfz6;

    iget v6, v0, Lfz6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_5b

    sub-int/2addr v6, v4

    iput v6, v0, Lfz6;->u:I

    goto :goto_60

    :cond_5b
    new-instance v0, Lfz6;

    invoke-direct {v0, p0, p2}, Lfz6;-><init>(Lno6;Lmt5;)V

    :goto_60
    iget-object p0, v0, Lfz6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lfz6;->u:I

    if-eqz v4, :cond_72

    if-ne v4, v5, :cond_6e

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_85

    :cond_6e
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_87

    :cond_72
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/4 v2, 0x0

    invoke-direct {p0, p1, v2}, Lhz6;-><init>(Ll99;B)V

    iput v5, v0, Lfz6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_85

    move-object v2, p2

    goto :goto_87

    :cond_85
    :goto_85
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_87
    return-object v2

    :pswitch_88
    instance-of v0, p2, Ldz6;

    if-eqz v0, :cond_99

    move-object v0, p2

    check-cast v0, Ldz6;

    iget v6, v0, Ldz6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_99

    sub-int/2addr v6, v4

    iput v6, v0, Ldz6;->u:I

    goto :goto_9e

    :cond_99
    new-instance v0, Ldz6;

    invoke-direct {v0, p0, p2}, Ldz6;-><init>(Lno6;Lmt5;)V

    :goto_9e
    iget-object p0, v0, Ldz6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Ldz6;->u:I

    if-eqz v4, :cond_b0

    if-ne v4, v5, :cond_ac

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_c4

    :cond_ac
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_c6

    :cond_b0
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0x1d

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Ldz6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_c4

    move-object v2, p2

    goto :goto_c6

    :cond_c4
    :goto_c4
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_c6
    return-object v2

    :pswitch_c7
    instance-of v0, p2, Lbz6;

    if-eqz v0, :cond_d8

    move-object v0, p2

    check-cast v0, Lbz6;

    iget v6, v0, Lbz6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_d8

    sub-int/2addr v6, v4

    iput v6, v0, Lbz6;->u:I

    goto :goto_dd

    :cond_d8
    new-instance v0, Lbz6;

    invoke-direct {v0, p0, p2}, Lbz6;-><init>(Lno6;Lmt5;)V

    :goto_dd
    iget-object p0, v0, Lbz6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lbz6;->u:I

    if-eqz v4, :cond_ef

    if-ne v4, v5, :cond_eb

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_103

    :cond_eb
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_105

    :cond_ef
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0x1c

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Lbz6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_103

    move-object v2, p2

    goto :goto_105

    :cond_103
    :goto_103
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_105
    return-object v2

    :pswitch_106
    instance-of v0, p2, Lzy6;

    if-eqz v0, :cond_117

    move-object v0, p2

    check-cast v0, Lzy6;

    iget v6, v0, Lzy6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_117

    sub-int/2addr v6, v4

    iput v6, v0, Lzy6;->u:I

    goto :goto_11c

    :cond_117
    new-instance v0, Lzy6;

    invoke-direct {v0, p0, p2}, Lzy6;-><init>(Lno6;Lmt5;)V

    :goto_11c
    iget-object p0, v0, Lzy6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lzy6;->u:I

    if-eqz v4, :cond_12e

    if-ne v4, v5, :cond_12a

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_142

    :cond_12a
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_144

    :cond_12e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0x1b

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Lzy6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_142

    move-object v2, p2

    goto :goto_144

    :cond_142
    :goto_142
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_144
    return-object v2

    :pswitch_145
    instance-of v0, p2, Lxy6;

    if-eqz v0, :cond_156

    move-object v0, p2

    check-cast v0, Lxy6;

    iget v6, v0, Lxy6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_156

    sub-int/2addr v6, v4

    iput v6, v0, Lxy6;->u:I

    goto :goto_15b

    :cond_156
    new-instance v0, Lxy6;

    invoke-direct {v0, p0, p2}, Lxy6;-><init>(Lno6;Lmt5;)V

    :goto_15b
    iget-object p0, v0, Lxy6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lxy6;->u:I

    if-eqz v4, :cond_16d

    if-ne v4, v5, :cond_169

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_181

    :cond_169
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_183

    :cond_16d
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0x1a

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Lxy6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_181

    move-object v2, p2

    goto :goto_183

    :cond_181
    :goto_181
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_183
    return-object v2

    :pswitch_184
    instance-of v0, p2, Lvy6;

    if-eqz v0, :cond_195

    move-object v0, p2

    check-cast v0, Lvy6;

    iget v6, v0, Lvy6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_195

    sub-int/2addr v6, v4

    iput v6, v0, Lvy6;->u:I

    goto :goto_19a

    :cond_195
    new-instance v0, Lvy6;

    invoke-direct {v0, p0, p2}, Lvy6;-><init>(Lno6;Lmt5;)V

    :goto_19a
    iget-object p0, v0, Lvy6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lvy6;->u:I

    if-eqz v4, :cond_1ac

    if-ne v4, v5, :cond_1a8

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1c0

    :cond_1a8
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1c2

    :cond_1ac
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0x19

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Lvy6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_1c0

    move-object v2, p2

    goto :goto_1c2

    :cond_1c0
    :goto_1c0
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1c2
    return-object v2

    :pswitch_1c3
    instance-of v0, p2, Lty6;

    if-eqz v0, :cond_1d4

    move-object v0, p2

    check-cast v0, Lty6;

    iget v6, v0, Lty6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_1d4

    sub-int/2addr v6, v4

    iput v6, v0, Lty6;->u:I

    goto :goto_1d9

    :cond_1d4
    new-instance v0, Lty6;

    invoke-direct {v0, p0, p2}, Lty6;-><init>(Lno6;Lmt5;)V

    :goto_1d9
    iget-object p0, v0, Lty6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lty6;->u:I

    if-eqz v4, :cond_1eb

    if-ne v4, v5, :cond_1e7

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1ff

    :cond_1e7
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_201

    :cond_1eb
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0x18

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Lty6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_1ff

    move-object v2, p2

    goto :goto_201

    :cond_1ff
    :goto_1ff
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_201
    return-object v2

    :pswitch_202
    instance-of v0, p2, Lwo6;

    if-eqz v0, :cond_213

    move-object v0, p2

    check-cast v0, Lwo6;

    iget v6, v0, Lwo6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_213

    sub-int/2addr v6, v4

    iput v6, v0, Lwo6;->u:I

    goto :goto_218

    :cond_213
    new-instance v0, Lwo6;

    invoke-direct {v0, p0, p2}, Lwo6;-><init>(Lno6;Lmt5;)V

    :goto_218
    iget-object p0, v0, Lwo6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lwo6;->u:I

    if-eqz v4, :cond_22a

    if-ne v4, v5, :cond_226

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_23e

    :cond_226
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_240

    :cond_22a
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0xc

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Lwo6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_23e

    move-object v2, p2

    goto :goto_240

    :cond_23e
    :goto_23e
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_240
    return-object v2

    :pswitch_241
    instance-of v0, p2, Luo6;

    if-eqz v0, :cond_252

    move-object v0, p2

    check-cast v0, Luo6;

    iget v6, v0, Luo6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_252

    sub-int/2addr v6, v4

    iput v6, v0, Luo6;->u:I

    goto :goto_257

    :cond_252
    new-instance v0, Luo6;

    invoke-direct {v0, p0, p2}, Luo6;-><init>(Lno6;Lmt5;)V

    :goto_257
    iget-object p0, v0, Luo6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Luo6;->u:I

    if-eqz v4, :cond_269

    if-ne v4, v5, :cond_265

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_27d

    :cond_265
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_27f

    :cond_269
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0xb

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Luo6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_27d

    move-object v2, p2

    goto :goto_27f

    :cond_27d
    :goto_27d
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_27f
    return-object v2

    :pswitch_280
    instance-of v0, p2, Lso6;

    if-eqz v0, :cond_291

    move-object v0, p2

    check-cast v0, Lso6;

    iget v6, v0, Lso6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_291

    sub-int/2addr v6, v4

    iput v6, v0, Lso6;->u:I

    goto :goto_296

    :cond_291
    new-instance v0, Lso6;

    invoke-direct {v0, p0, p2}, Lso6;-><init>(Lno6;Lmt5;)V

    :goto_296
    iget-object p0, v0, Lso6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lso6;->u:I

    if-eqz v4, :cond_2a8

    if-ne v4, v5, :cond_2a4

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2bc

    :cond_2a4
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2be

    :cond_2a8
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0xa

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Lso6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_2bc

    move-object v2, p2

    goto :goto_2be

    :cond_2bc
    :goto_2bc
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2be
    return-object v2

    :pswitch_2bf
    instance-of v0, p2, Lqo6;

    if-eqz v0, :cond_2d0

    move-object v0, p2

    check-cast v0, Lqo6;

    iget v6, v0, Lqo6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_2d0

    sub-int/2addr v6, v4

    iput v6, v0, Lqo6;->u:I

    goto :goto_2d5

    :cond_2d0
    new-instance v0, Lqo6;

    invoke-direct {v0, p0, p2}, Lqo6;-><init>(Lno6;Lmt5;)V

    :goto_2d5
    iget-object p0, v0, Lqo6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Lqo6;->u:I

    if-eqz v4, :cond_2e7

    if-ne v4, v5, :cond_2e3

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2fb

    :cond_2e3
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2fd

    :cond_2e7
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0x9

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Lqo6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_2fb

    move-object v2, p2

    goto :goto_2fd

    :cond_2fb
    :goto_2fb
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2fd
    return-object v2

    :pswitch_2fe
    instance-of v0, p2, Loo6;

    if-eqz v0, :cond_30f

    move-object v0, p2

    check-cast v0, Loo6;

    iget v6, v0, Loo6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_30f

    sub-int/2addr v6, v4

    iput v6, v0, Loo6;->u:I

    goto :goto_314

    :cond_30f
    new-instance v0, Loo6;

    invoke-direct {v0, p0, p2}, Loo6;-><init>(Lno6;Lmt5;)V

    :goto_314
    iget-object p0, v0, Loo6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Loo6;->u:I

    if-eqz v4, :cond_326

    if-ne v4, v5, :cond_322

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_33a

    :cond_322
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_33c

    :cond_326
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v2, 0x8

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Loo6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_33a

    move-object v2, p2

    goto :goto_33c

    :cond_33a
    :goto_33a
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_33c
    return-object v2

    :pswitch_33d
    instance-of v0, p2, Llo6;

    if-eqz v0, :cond_34e

    move-object v0, p2

    check-cast v0, Llo6;

    iget v6, v0, Llo6;->u:I

    and-int v7, v6, v4

    if-eqz v7, :cond_34e

    sub-int/2addr v6, v4

    iput v6, v0, Llo6;->u:I

    goto :goto_353

    :cond_34e
    new-instance v0, Llo6;

    invoke-direct {v0, p0, p2}, Llo6;-><init>(Lno6;Lmt5;)V

    :goto_353
    iget-object p0, v0, Llo6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v4, v0, Llo6;->u:I

    if-eqz v4, :cond_365

    if-ne v4, v5, :cond_361

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_378

    :cond_361
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_37a

    :cond_365
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/4 v2, 0x7

    invoke-direct {p0, p1, v2}, Lbw;-><init>(Ll99;B)V

    iput v5, v0, Llo6;->u:I

    invoke-virtual {v1, p0, v0}, Lx99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_378

    move-object v2, p2

    goto :goto_37a

    :cond_378
    :goto_378
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_37a
    return-object v2

    nop

    :pswitch_data_37c
    .packed-switch 0x0
        :pswitch_33d
        :pswitch_2fe
        :pswitch_2bf
        :pswitch_280
        :pswitch_241
        :pswitch_202
        :pswitch_1c3
        :pswitch_184
        :pswitch_145
        :pswitch_106
        :pswitch_c7
        :pswitch_88
        :pswitch_4a
    .end packed-switch
.end method
