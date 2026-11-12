.class public final Lc78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf99;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrlh;


# direct methods
.method public synthetic constructor <init>(Lrlh;B)V
    .registers 3

    iput-byte p2, p0, Lc78;->a:B

    iput-object p1, p0, Lc78;->b:Lrlh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final collect(Ll99;Lmt5;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lc78;->a:B

    const/16 v1, 0x11

    iget-object v2, p0, Lc78;->b:Lrlh;

    const/4 v3, 0x0

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    const/high16 v5, -0x80000000

    const/4 v6, 0x1

    packed-switch v0, :pswitch_data_1e2

    instance-of v0, p2, Li7o;

    if-eqz v0, :cond_20

    move-object v0, p2

    check-cast v0, Li7o;

    iget v1, v0, Li7o;->u:I

    and-int v7, v1, v5

    if-eqz v7, :cond_20

    sub-int/2addr v1, v5

    iput v1, v0, Li7o;->u:I

    goto :goto_25

    :cond_20
    new-instance v0, Li7o;

    invoke-direct {v0, p0, p2}, Li7o;-><init>(Lc78;Lmt5;)V

    :goto_25
    iget-object p0, v0, Li7o;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Li7o;->u:I

    if-eqz v1, :cond_39

    if-ne v1, v6, :cond_35

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_49

    :cond_35
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_49

    :cond_39
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    const/16 v1, 0x14

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v6, v0, Li7o;->u:I

    invoke-virtual {v2, p0, v0}, Lrlh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, p2

    :goto_49
    return-object v3

    :pswitch_4a
    instance-of v0, p2, Lu6o;

    if-eqz v0, :cond_5b

    move-object v0, p2

    check-cast v0, Lu6o;

    iget v1, v0, Lu6o;->u:I

    and-int v7, v1, v5

    if-eqz v7, :cond_5b

    sub-int/2addr v1, v5

    iput v1, v0, Lu6o;->u:I

    goto :goto_60

    :cond_5b
    new-instance v0, Lu6o;

    invoke-direct {v0, p0, p2}, Lu6o;-><init>(Lc78;Lmt5;)V

    :goto_60
    iget-object p0, v0, Lu6o;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lu6o;->u:I

    if-eqz v1, :cond_74

    if-ne v1, v6, :cond_70

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_84

    :cond_70
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_84

    :cond_74
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    const/16 v1, 0x13

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v6, v0, Lu6o;->u:I

    invoke-virtual {v2, p0, v0}, Lrlh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, p2

    :goto_84
    return-object v3

    :pswitch_85
    instance-of v0, p2, Lm6o;

    if-eqz v0, :cond_96

    move-object v0, p2

    check-cast v0, Lm6o;

    iget v1, v0, Lm6o;->u:I

    and-int v7, v1, v5

    if-eqz v7, :cond_96

    sub-int/2addr v1, v5

    iput v1, v0, Lm6o;->u:I

    goto :goto_9b

    :cond_96
    new-instance v0, Lm6o;

    invoke-direct {v0, p0, p2}, Lm6o;-><init>(Lc78;Lmt5;)V

    :goto_9b
    iget-object p0, v0, Lm6o;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lm6o;->u:I

    if-eqz v1, :cond_af

    if-ne v1, v6, :cond_ab

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_bf

    :cond_ab
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_bf

    :cond_af
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    const/16 v1, 0x12

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v6, v0, Lm6o;->u:I

    invoke-virtual {v2, p0, v0}, Lrlh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, p2

    :goto_bf
    return-object v3

    :pswitch_c0
    instance-of v0, p2, Lf6o;

    if-eqz v0, :cond_d1

    move-object v0, p2

    check-cast v0, Lf6o;

    iget v7, v0, Lf6o;->u:I

    and-int v8, v7, v5

    if-eqz v8, :cond_d1

    sub-int/2addr v7, v5

    iput v7, v0, Lf6o;->u:I

    goto :goto_d6

    :cond_d1
    new-instance v0, Lf6o;

    invoke-direct {v0, p0, p2}, Lf6o;-><init>(Lc78;Lmt5;)V

    :goto_d6
    iget-object p0, v0, Lf6o;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v5, v0, Lf6o;->u:I

    if-eqz v5, :cond_ea

    if-ne v5, v6, :cond_e6

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_f8

    :cond_e6
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_f8

    :cond_ea
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v6, v0, Lf6o;->u:I

    invoke-virtual {v2, p0, v0}, Lrlh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, p2

    :goto_f8
    return-object v3

    :pswitch_f9
    instance-of v0, p2, Lp6d;

    if-eqz v0, :cond_10a

    move-object v0, p2

    check-cast v0, Lp6d;

    iget v1, v0, Lp6d;->u:I

    and-int v7, v1, v5

    if-eqz v7, :cond_10a

    sub-int/2addr v1, v5

    iput v1, v0, Lp6d;->u:I

    goto :goto_10f

    :cond_10a
    new-instance v0, Lp6d;

    invoke-direct {v0, p0, p2}, Lp6d;-><init>(Lc78;Lmt5;)V

    :goto_10f
    iget-object p0, v0, Lp6d;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lp6d;->u:I

    if-eqz v1, :cond_123

    if-ne v1, v6, :cond_11f

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_133

    :cond_11f
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_133

    :cond_123
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0x19

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v6, v0, Lp6d;->u:I

    invoke-virtual {v2, p0, v0}, Lrlh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, p2

    :goto_133
    return-object v3

    :pswitch_134
    instance-of v0, p2, Ll6d;

    if-eqz v0, :cond_145

    move-object v0, p2

    check-cast v0, Ll6d;

    iget v1, v0, Ll6d;->u:I

    and-int v7, v1, v5

    if-eqz v7, :cond_145

    sub-int/2addr v1, v5

    iput v1, v0, Ll6d;->u:I

    goto :goto_14a

    :cond_145
    new-instance v0, Ll6d;

    invoke-direct {v0, p0, p2}, Ll6d;-><init>(Lc78;Lmt5;)V

    :goto_14a
    iget-object p0, v0, Ll6d;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Ll6d;->u:I

    if-eqz v1, :cond_15e

    if-ne v1, v6, :cond_15a

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_16e

    :cond_15a
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_16e

    :cond_15e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0x18

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v6, v0, Ll6d;->u:I

    invoke-virtual {v2, p0, v0}, Lrlh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, p2

    :goto_16e
    return-object v3

    :pswitch_16f
    instance-of v0, p2, Llbc;

    if-eqz v0, :cond_180

    move-object v0, p2

    check-cast v0, Llbc;

    iget v7, v0, Llbc;->u:I

    and-int v8, v7, v5

    if-eqz v8, :cond_180

    sub-int/2addr v7, v5

    iput v7, v0, Llbc;->u:I

    goto :goto_185

    :cond_180
    new-instance v0, Llbc;

    invoke-direct {v0, p0, p2}, Llbc;-><init>(Lc78;Lmt5;)V

    :goto_185
    iget-object p0, v0, Llbc;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v5, v0, Llbc;->u:I

    if-eqz v5, :cond_199

    if-ne v5, v6, :cond_195

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1a7

    :cond_195
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1a7

    :cond_199
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v6, v0, Llbc;->u:I

    invoke-virtual {v2, p0, v0}, Lrlh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, p2

    :goto_1a7
    return-object v3

    :pswitch_1a8
    instance-of v0, p2, La78;

    if-eqz v0, :cond_1b9

    move-object v0, p2

    check-cast v0, La78;

    iget v1, v0, La78;->u:I

    and-int v7, v1, v5

    if-eqz v7, :cond_1b9

    sub-int/2addr v1, v5

    iput v1, v0, La78;->u:I

    goto :goto_1be

    :cond_1b9
    new-instance v0, La78;

    invoke-direct {v0, p0, p2}, La78;-><init>(Lc78;Lmt5;)V

    :goto_1be
    iget-object p0, v0, La78;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, La78;->u:I

    if-eqz v1, :cond_1d2

    if-ne v1, v6, :cond_1ce

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1e1

    :cond_1ce
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1e1

    :cond_1d2
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/4 v1, 0x6

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v6, v0, La78;->u:I

    invoke-virtual {v2, p0, v0}, Lrlh;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-object v3, p2

    :goto_1e1
    return-object v3

    :pswitch_data_1e2
    .packed-switch 0x0
        :pswitch_1a8
        :pswitch_16f
        :pswitch_134
        :pswitch_f9
        :pswitch_c0
        :pswitch_85
        :pswitch_4a
    .end packed-switch
.end method
