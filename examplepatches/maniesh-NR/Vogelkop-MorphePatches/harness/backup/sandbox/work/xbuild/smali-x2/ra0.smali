.class public final Lra0;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    sget-object v0, Lef0;->e:Lef0;

    move-object v1, v0

    move-object v2, v0

    move-object v3, v0

    move-object v4, v0

    move-object v5, v0

    move-object v6, v0

    move-object v7, v0

    move-object v8, v0

    move-object v9, v0

    move-object v10, v0

    move-object v11, v0

    move-object v12, v0

    move-object v13, v0

    move-object v14, v0

    filled-new-array/range {v0 .. v14}, [Lef0;

    move-result-object v0

    sput-object v0, Lra0;->f:[Lef0;

    new-instance v1, Ldf0;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v1, v3, v0, v2}, Ldf0;-><init>(ILjava/lang/Object;B)V

    sget-object v2, Ldf0;->d:Ldf0;

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    move-object v8, v2

    move-object v9, v2

    move-object v10, v2

    move-object v11, v2

    move-object v12, v2

    move-object v13, v2

    move-object v14, v2

    move-object v15, v2

    filled-new-array/range {v1 .. v15}, [Ldf0;

    move-result-object v0

    sput-object v0, Lra0;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lra0;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lra0;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 6

    check-cast p1, Lra0;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    if-eqz v1, :cond_13

    if-eqz v2, :cond_14

    :cond_13
    move-object v1, v2

    :cond_14
    if-eqz v1, :cond_1a

    const/4 v2, -0x1

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1a
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lo70;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lo70;

    invoke-static {v1, v2}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lo70;

    if-eqz v1, :cond_32

    invoke-virtual {p0, v0, v0, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_32
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Li90;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Li90;

    invoke-static {v2, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v2

    check-cast v2, Li90;

    if-eqz v2, :cond_4a

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4a
    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-static {v2, v3}, Ljf0;->j(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_60

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_60
    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v2, :cond_71

    if-eqz v3, :cond_72

    :cond_71
    move-object v2, v3

    :cond_72
    if-eqz v2, :cond_77

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_77
    const/4 v1, 0x5

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v2, :cond_88

    if-eqz v3, :cond_89

    :cond_88
    move-object v2, v3

    :cond_89
    if-eqz v2, :cond_8e

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8e
    const/4 v1, 0x6

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgh0;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgh0;

    invoke-static {v2, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v2

    check-cast v2, Lgh0;

    if-eqz v2, :cond_a6

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a6
    const/4 v1, 0x7

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lca0;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lca0;

    if-eqz v2, :cond_b7

    if-eqz v3, :cond_b8

    :cond_b7
    move-object v2, v3

    :cond_b8
    if-eqz v2, :cond_bd

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_bd
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v2, :cond_cf

    if-eqz v3, :cond_d0

    :cond_cf
    move-object v2, v3

    :cond_d0
    if-eqz v2, :cond_d5

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d5
    const/16 v1, 0x9

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v2, :cond_e7

    if-eqz v3, :cond_e8

    :cond_e7
    move-object v2, v3

    :cond_e8
    if-eqz v2, :cond_ed

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ed
    const/16 v1, 0xa

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v2, :cond_ff

    if-eqz v3, :cond_100

    :cond_ff
    move-object v2, v3

    :cond_100
    if-eqz v2, :cond_105

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_105
    const/16 v1, 0xb

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpo0;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpo0;

    invoke-static {v2, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v2

    check-cast v2, Lpo0;

    if-eqz v2, :cond_11e

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_11e
    const/16 v1, 0xc

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgp0;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgp0;

    invoke-static {v2, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v2

    check-cast v2, Lgp0;

    if-eqz v2, :cond_137

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_137
    const/16 v1, 0xd

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v2, :cond_149

    if-eqz v3, :cond_14a

    :cond_149
    move-object v2, v3

    :cond_14a
    if-eqz v2, :cond_14f

    invoke-virtual {p0, v1, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_14f
    const/16 v1, 0xe

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqb0;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqb0;

    invoke-static {p1, v2}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object p1

    check-cast p1, Lqb0;

    if-eqz p1, :cond_168

    invoke-virtual {p0, v1, v0, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_168
    return-object p0
.end method

.method public final x(Lzpa;)Lqb0;
    .registers 6

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqb0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lqb0;

    const/16 v1, 0x98b

    const/4 v2, 0x7

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqb0;

    return-object p0
.end method

.method public final y(ILjava/lang/String;)V
    .registers 6

    const/4 v0, 0x4

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_36

    const/4 v0, 0x5

    if-eq p1, v0, :cond_2f

    const/16 v0, 0xd

    if-eq p1, v0, :cond_28

    packed-switch p1, :pswitch_data_3e

    invoke-virtual {p0, p1, v2, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :pswitch_13
    if-eqz p2, :cond_16

    move v1, v2

    :cond_16
    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :pswitch_1a
    if-eqz p2, :cond_1d

    move v1, v2

    :cond_1d
    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :pswitch_21
    if-eqz p2, :cond_24

    move v1, v2

    :cond_24
    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_28
    if-eqz p2, :cond_2b

    move v1, v2

    :cond_2b
    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_2f
    if-eqz p2, :cond_32

    move v1, v2

    :cond_32
    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_36
    if-eqz p2, :cond_39

    move v1, v2

    :cond_39
    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    nop

    :pswitch_data_3e
    .packed-switch 0x8
        :pswitch_21
        :pswitch_1a
        :pswitch_13
    .end packed-switch
.end method
