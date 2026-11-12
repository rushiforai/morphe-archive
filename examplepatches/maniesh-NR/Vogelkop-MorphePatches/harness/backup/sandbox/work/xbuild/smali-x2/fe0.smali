.class public final Lfe0;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 12

    sget-object v0, Lef0;->b:Lef0;

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

    filled-new-array/range {v0 .. v10}, [Lef0;

    move-result-object v0

    sput-object v0, Lfe0;->f:[Lef0;

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

    filled-new-array/range {v1 .. v11}, [Ldf0;

    move-result-object v0

    sput-object v0, Lfe0;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lfe0;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lfe0;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 6

    check-cast p1, Lfe0;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltc0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltc0;

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

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-static {v1, v3}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_46

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_46
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-static {v1, v3}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_5c

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5c
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-static {v1, v3}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_72

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_72
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-static {v1, v3}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_88

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_88
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-static {v1, v3}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_9e

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_9e
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v1, :cond_af

    if-eqz v3, :cond_b0

    :cond_af
    move-object v1, v3

    :cond_b0
    if-eqz v1, :cond_b5

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b5
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v1, :cond_c7

    if-eqz v3, :cond_c8

    :cond_c7
    move-object v1, v3

    :cond_c8
    if-eqz v1, :cond_cd

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_cd
    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-static {v1, v3}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_e4

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_e4
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnc0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnc0;

    if-eqz p1, :cond_f6

    if-eqz v1, :cond_f7

    :cond_f6
    move-object p1, v1

    :cond_f7
    if-eqz p1, :cond_fc

    invoke-virtual {p0, v0, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_fc
    return-object p0
.end method

.method public final x(ILjava/lang/String;)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1d

    const/4 v2, 0x7

    if-eq p1, v2, :cond_16

    const/16 v2, 0x8

    if-eq p1, v2, :cond_f

    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_f
    if-eqz p2, :cond_12

    move v0, v1

    :cond_12
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_16
    if-eqz p2, :cond_19

    move v0, v1

    :cond_19
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_1d
    if-eqz p2, :cond_20

    move v0, v1

    :cond_20
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method
