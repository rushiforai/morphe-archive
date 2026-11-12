.class public final Lvu6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf99;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxd6;


# direct methods
.method public synthetic constructor <init>(Lxd6;B)V
    .registers 3

    iput-byte p2, p0, Lvu6;->a:B

    iput-object p1, p0, Lvu6;->b:Lxd6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final collect(Ll99;Lmt5;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lvu6;->a:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/high16 v3, -0x80000000

    const/4 v4, 0x1

    iget-object v5, p0, Lvu6;->b:Lxd6;

    packed-switch v0, :pswitch_data_1e8

    new-instance p0, Lref;

    const/16 v0, 0x10

    invoke-direct {p0, p1, v0}, Lref;-><init>(Ll99;B)V

    invoke-virtual {v5, p0, p2}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-eq p0, p1, :cond_1e

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_1e
    return-object p0

    :pswitch_1f
    new-instance p0, Lref;

    const/16 v0, 0xf

    invoke-direct {p0, p1, v0}, Lref;-><init>(Ll99;B)V

    invoke-virtual {v5, p0, p2}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-eq p0, p1, :cond_30

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_30
    return-object p0

    :pswitch_31
    instance-of v0, p2, Lgun;

    if-eqz v0, :cond_42

    move-object v0, p2

    check-cast v0, Lgun;

    iget v6, v0, Lgun;->u:I

    and-int v7, v6, v3

    if-eqz v7, :cond_42

    sub-int/2addr v6, v3

    iput v6, v0, Lgun;->u:I

    goto :goto_47

    :cond_42
    new-instance v0, Lgun;

    invoke-direct {v0, p0, p2}, Lgun;-><init>(Lvu6;Lmt5;)V

    :goto_47
    iget-object p0, v0, Lgun;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v3, v0, Lgun;->u:I

    if-eqz v3, :cond_59

    if-ne v3, v4, :cond_55

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6d

    :cond_55
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_6f

    :cond_59
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    const/16 v1, 0xe

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v4, v0, Lgun;->u:I

    invoke-virtual {v5, p0, v0}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_6d

    move-object v1, p2

    goto :goto_6f

    :cond_6d
    :goto_6d
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_6f
    return-object v1

    :pswitch_70
    instance-of v0, p2, Leun;

    if-eqz v0, :cond_81

    move-object v0, p2

    check-cast v0, Leun;

    iget v6, v0, Leun;->u:I

    and-int v7, v6, v3

    if-eqz v7, :cond_81

    sub-int/2addr v6, v3

    iput v6, v0, Leun;->u:I

    goto :goto_86

    :cond_81
    new-instance v0, Leun;

    invoke-direct {v0, p0, p2}, Leun;-><init>(Lvu6;Lmt5;)V

    :goto_86
    iget-object p0, v0, Leun;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v3, v0, Leun;->u:I

    if-eqz v3, :cond_98

    if-ne v3, v4, :cond_94

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_ac

    :cond_94
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_ae

    :cond_98
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    const/16 v1, 0xd

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v4, v0, Leun;->u:I

    invoke-virtual {v5, p0, v0}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_ac

    move-object v1, p2

    goto :goto_ae

    :cond_ac
    :goto_ac
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_ae
    return-object v1

    :pswitch_af
    instance-of v0, p2, Lizl;

    if-eqz v0, :cond_c0

    move-object v0, p2

    check-cast v0, Lizl;

    iget v6, v0, Lizl;->u:I

    and-int v7, v6, v3

    if-eqz v7, :cond_c0

    sub-int/2addr v6, v3

    iput v6, v0, Lizl;->u:I

    goto :goto_c5

    :cond_c0
    new-instance v0, Lizl;

    invoke-direct {v0, p0, p2}, Lizl;-><init>(Lvu6;Lmt5;)V

    :goto_c5
    iget-object p0, v0, Lizl;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v3, v0, Lizl;->u:I

    if-eqz v3, :cond_d7

    if-ne v3, v4, :cond_d3

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_ea

    :cond_d3
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_ec

    :cond_d7
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    const/4 v1, 0x7

    invoke-direct {p0, p1, v1}, Lref;-><init>(Ll99;B)V

    iput v4, v0, Lizl;->u:I

    invoke-virtual {v5, p0, v0}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_ea

    move-object v1, p2

    goto :goto_ec

    :cond_ea
    :goto_ea
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_ec
    return-object v1

    :pswitch_ed
    instance-of v0, p2, Lvef;

    if-eqz v0, :cond_fe

    move-object v0, p2

    check-cast v0, Lvef;

    iget v6, v0, Lvef;->u:I

    and-int v7, v6, v3

    if-eqz v7, :cond_fe

    sub-int/2addr v6, v3

    iput v6, v0, Lvef;->u:I

    goto :goto_103

    :cond_fe
    new-instance v0, Lvef;

    invoke-direct {v0, p0, p2}, Lvef;-><init>(Lvu6;Lmt5;)V

    :goto_103
    iget-object p0, v0, Lvef;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v3, v0, Lvef;->u:I

    if-eqz v3, :cond_115

    if-ne v3, v4, :cond_111

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_127

    :cond_111
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_129

    :cond_115
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lref;

    invoke-direct {p0, p1, v4}, Lref;-><init>(Ll99;B)V

    iput v4, v0, Lvef;->u:I

    invoke-virtual {v5, p0, v0}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_127

    move-object v1, p2

    goto :goto_129

    :cond_127
    :goto_127
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_129
    return-object v1

    :pswitch_12a
    instance-of v0, p2, Lnef;

    if-eqz v0, :cond_13b

    move-object v0, p2

    check-cast v0, Lnef;

    iget v6, v0, Lnef;->u:I

    and-int v7, v6, v3

    if-eqz v7, :cond_13b

    sub-int/2addr v6, v3

    iput v6, v0, Lnef;->u:I

    goto :goto_140

    :cond_13b
    new-instance v0, Lnef;

    invoke-direct {v0, p0, p2}, Lnef;-><init>(Lvu6;Lmt5;)V

    :goto_140
    iget-object p0, v0, Lnef;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v3, v0, Lnef;->u:I

    if-eqz v3, :cond_152

    if-ne v3, v4, :cond_14e

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_166

    :cond_14e
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_168

    :cond_152
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lhz6;

    const/16 v1, 0x1d

    invoke-direct {p0, p1, v1}, Lhz6;-><init>(Ll99;B)V

    iput v4, v0, Lnef;->u:I

    invoke-virtual {v5, p0, v0}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_166

    move-object v1, p2

    goto :goto_168

    :cond_166
    :goto_166
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_168
    return-object v1

    :pswitch_169
    instance-of v0, p2, Lwu6;

    if-eqz v0, :cond_17a

    move-object v0, p2

    check-cast v0, Lwu6;

    iget v6, v0, Lwu6;->u:I

    and-int v7, v6, v3

    if-eqz v7, :cond_17a

    sub-int/2addr v6, v3

    iput v6, v0, Lwu6;->u:I

    goto :goto_17f

    :cond_17a
    new-instance v0, Lwu6;

    invoke-direct {v0, p0, p2}, Lwu6;-><init>(Lvu6;Lmt5;)V

    :goto_17f
    iget-object p0, v0, Lwu6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v3, v0, Lwu6;->u:I

    if-eqz v3, :cond_191

    if-ne v3, v4, :cond_18d

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1a5

    :cond_18d
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1a7

    :cond_191
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v1, 0x17

    invoke-direct {p0, p1, v1}, Lbw;-><init>(Ll99;B)V

    iput v4, v0, Lwu6;->u:I

    invoke-virtual {v5, p0, v0}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_1a5

    move-object v1, p2

    goto :goto_1a7

    :cond_1a5
    :goto_1a5
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1a7
    return-object v1

    :pswitch_1a8
    instance-of v0, p2, Ltu6;

    if-eqz v0, :cond_1b9

    move-object v0, p2

    check-cast v0, Ltu6;

    iget v6, v0, Ltu6;->u:I

    and-int v7, v6, v3

    if-eqz v7, :cond_1b9

    sub-int/2addr v6, v3

    iput v6, v0, Ltu6;->u:I

    goto :goto_1be

    :cond_1b9
    new-instance v0, Ltu6;

    invoke-direct {v0, p0, p2}, Ltu6;-><init>(Lvu6;Lmt5;)V

    :goto_1be
    iget-object p0, v0, Ltu6;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v3, v0, Ltu6;->u:I

    if-eqz v3, :cond_1d0

    if-ne v3, v4, :cond_1cc

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_1e4

    :cond_1cc
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1e6

    :cond_1d0
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lbw;

    const/16 v1, 0x16

    invoke-direct {p0, p1, v1}, Lbw;-><init>(Ll99;B)V

    iput v4, v0, Ltu6;->u:I

    invoke-virtual {v5, p0, v0}, Lxd6;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_1e4

    move-object v1, p2

    goto :goto_1e6

    :cond_1e4
    :goto_1e4
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1e6
    return-object v1

    nop

    :pswitch_data_1e8
    .packed-switch 0x0
        :pswitch_1a8
        :pswitch_169
        :pswitch_12a
        :pswitch_ed
        :pswitch_af
        :pswitch_70
        :pswitch_31
        :pswitch_1f
    .end packed-switch
.end method
