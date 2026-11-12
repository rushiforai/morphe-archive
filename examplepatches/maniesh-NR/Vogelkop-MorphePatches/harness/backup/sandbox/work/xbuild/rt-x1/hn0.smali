.class public final Lhn0;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    sget-object v0, Lef0;->e:Lef0;

    move-object v1, v0

    move-object v2, v0

    move-object v3, v0

    move-object v4, v0

    move-object v5, v0

    move-object v6, v0

    move-object v7, v0

    move-object v8, v0

    filled-new-array/range {v0 .. v8}, [Lef0;

    move-result-object v0

    sput-object v0, Lhn0;->f:[Lef0;

    sget-object v1, Ldf0;->d:Ldf0;

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v5, v1

    move-object v6, v1

    move-object v7, v1

    move-object v8, v1

    move-object v9, v1

    filled-new-array/range {v1 .. v9}, [Ldf0;

    move-result-object v0

    sput-object v0, Lhn0;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lhn0;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lhn0;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 6

    check-cast p1, Lhn0;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

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

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

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

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v1, :cond_41

    if-eqz v3, :cond_42

    :cond_41
    move-object v1, v3

    :cond_42
    if-eqz v1, :cond_47

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_47
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v1, :cond_58

    if-eqz v3, :cond_59

    :cond_58
    move-object v1, v3

    :cond_59
    if-eqz v1, :cond_5e

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5e
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v1, :cond_6f

    if-eqz v3, :cond_70

    :cond_6f
    move-object v1, v3

    :cond_70
    if-eqz v1, :cond_75

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_75
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v1, :cond_86

    if-eqz v3, :cond_87

    :cond_86
    move-object v1, v3

    :cond_87
    if-eqz v1, :cond_8c

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8c
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    if-eqz v1, :cond_9d

    if-eqz v3, :cond_9e

    :cond_9d
    move-object v1, v3

    :cond_9e
    if-eqz v1, :cond_a3

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a3
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v1, :cond_b4

    if-eqz v3, :cond_b5

    :cond_b4
    move-object v1, v3

    :cond_b5
    if-eqz v1, :cond_ba

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_ba
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz p1, :cond_cc

    if-eqz v1, :cond_cd

    :cond_cc
    move-object p1, v1

    :cond_cd
    if-eqz p1, :cond_d2

    invoke-virtual {p0, v0, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d2
    return-object p0
.end method

.method public final x(ILjava/lang/String;)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_3a

    if-eq p1, v1, :cond_33

    const/4 v2, 0x2

    if-eq p1, v2, :cond_2c

    const/4 v2, 0x3

    if-eq p1, v2, :cond_25

    const/4 v2, 0x5

    if-eq p1, v2, :cond_1e

    const/16 v2, 0x8

    if-eq p1, v2, :cond_17

    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_17
    if-eqz p2, :cond_1a

    move v0, v1

    :cond_1a
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_1e
    if-eqz p2, :cond_21

    move v0, v1

    :cond_21
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_25
    if-eqz p2, :cond_28

    move v0, v1

    :cond_28
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_2c
    if-eqz p2, :cond_2f

    move v0, v1

    :cond_2f
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_33
    if-eqz p2, :cond_36

    move v0, v1

    :cond_36
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_3a
    if-eqz p2, :cond_3d

    move v0, v1

    :cond_3d
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method
