.class public final Lh66;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    sget-object v0, Lef0;->b:Lef0;

    sget-object v13, Lef0;->e:Lef0;

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

    filled-new-array/range {v0 .. v13}, [Lef0;

    move-result-object v0

    sput-object v0, Lh66;->f:[Lef0;

    sget-object v1, Ldf0;->d:Ldf0;

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v5, v1

    move-object v6, v1

    move-object v7, v1

    move-object v8, v1

    move-object v9, v1

    move-object v10, v1

    move-object v11, v1

    move-object v12, v1

    move-object v13, v1

    move-object v14, v1

    filled-new-array/range {v1 .. v14}, [Ldf0;

    move-result-object v0

    sput-object v0, Lh66;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lh66;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lh66;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 9

    check-cast p1, Lh66;

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
    const/4 v2, 0x1

    if-eqz v1, :cond_1a

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1a
    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    if-eqz v0, :cond_2a

    if-eqz v1, :cond_2b

    :cond_2a
    move-object v0, v1

    :cond_2b
    if-eqz v0, :cond_30

    invoke-virtual {p0, v2, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_30
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    if-eqz v1, :cond_41

    if-eqz v3, :cond_42

    :cond_41
    move-object v1, v3

    :cond_42
    if-eqz v1, :cond_47

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_47
    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    if-eqz v3, :cond_58

    if-eqz v4, :cond_59

    :cond_58
    move-object v3, v4

    :cond_59
    if-eqz v3, :cond_5e

    invoke-virtual {p0, v1, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5e
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    if-eqz v4, :cond_6f

    if-eqz v5, :cond_70

    :cond_6f
    move-object v4, v5

    :cond_70
    if-eqz v4, :cond_75

    invoke-virtual {p0, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_75
    const/4 v3, 0x5

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    if-eqz v4, :cond_86

    if-eqz v5, :cond_87

    :cond_86
    move-object v4, v5

    :cond_87
    if-eqz v4, :cond_8c

    invoke-virtual {p0, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8c
    const/4 v3, 0x6

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    if-eqz v4, :cond_9d

    if-eqz v5, :cond_9e

    :cond_9d
    move-object v4, v5

    :cond_9e
    if-eqz v4, :cond_a3

    invoke-virtual {p0, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a3
    const/4 v3, 0x7

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    if-eqz v4, :cond_b4

    if-eqz v5, :cond_b5

    :cond_b4
    move-object v4, v5

    :cond_b5
    if-eqz v4, :cond_ba

    invoke-virtual {p0, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ba
    const/16 v3, 0x8

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    if-eqz v4, :cond_cc

    if-eqz v5, :cond_cd

    :cond_cc
    move-object v4, v5

    :cond_cd
    if-eqz v4, :cond_d2

    invoke-virtual {p0, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d2
    const/16 v3, 0x9

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Leu0;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Leu0;

    if-eqz v5, :cond_ef

    if-eqz v4, :cond_ee

    iget-byte v6, v5, Leu0;->a:B

    if-ne v6, v1, :cond_ee

    iget-byte v1, v4, Leu0;->a:B

    if-eq v1, v2, :cond_ef

    if-eq v1, v0, :cond_ef

    :cond_ee
    move-object v4, v5

    :cond_ef
    if-eqz v4, :cond_f4

    invoke-virtual {p0, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_f4
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    if-eqz v1, :cond_106

    if-eqz v3, :cond_107

    :cond_106
    move-object v1, v3

    :cond_107
    if-eqz v1, :cond_10c

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_10c
    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    if-eqz v1, :cond_11e

    if-eqz v3, :cond_11f

    :cond_11e
    move-object v1, v3

    :cond_11f
    if-eqz v1, :cond_124

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_124
    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhc0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lhc0;

    if-eqz v1, :cond_136

    if-eqz v3, :cond_137

    :cond_136
    move-object v1, v3

    :cond_137
    if-eqz v1, :cond_13c

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_13c
    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    if-eqz p1, :cond_14e

    if-eqz v1, :cond_14f

    :cond_14e
    move-object p1, v1

    :cond_14f
    if-eqz p1, :cond_154

    invoke-virtual {p0, v0, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_154
    return-object p0
.end method
