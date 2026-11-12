.class public final Lu56;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 12

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

    filled-new-array/range {v0 .. v10}, [Lef0;

    move-result-object v0

    sput-object v0, Lu56;->f:[Lef0;

    sget-object v1, Ldf0;->d:Ldf0;

    new-instance v3, Ldf0;

    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v2

    const/4 v4, -0x1

    invoke-direct {v3, v4, v0, v2}, Ldf0;-><init>(ILjava/lang/Object;B)V

    move v2, v4

    new-instance v4, Ldf0;

    invoke-static {v0}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v5

    invoke-direct {v4, v2, v0, v5}, Ldf0;-><init>(ILjava/lang/Object;B)V

    new-instance v7, Ldf0;

    invoke-static {v0}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v5

    invoke-direct {v7, v2, v0, v5}, Ldf0;-><init>(ILjava/lang/Object;B)V

    move-object v2, v1

    move-object v5, v1

    move-object v6, v1

    move-object v8, v1

    move-object v9, v1

    move-object v10, v1

    move-object v11, v1

    filled-new-array/range {v1 .. v11}, [Ldf0;

    move-result-object v0

    sput-object v0, Lu56;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lu56;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lu56;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 7

    check-cast p1, Lu56;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-nez v1, :cond_12

    move-object v1, v2

    :cond_12
    const/4 v2, 0x1

    if-eqz v1, :cond_18

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_18
    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lek0;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lek0;

    invoke-static {v0, v1}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v0

    check-cast v0, Lek0;

    if-eqz v0, :cond_2f

    invoke-virtual {p0, v2, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2f
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-nez v1, :cond_3f

    move-object v1, v3

    :cond_3f
    const/4 v3, -0x1

    if-eqz v1, :cond_45

    invoke-virtual {p0, v0, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_45
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    if-eqz v4, :cond_55

    move-object v1, v4

    :cond_55
    if-eqz v1, :cond_5a

    invoke-virtual {p0, v0, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5a
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    if-eqz v1, :cond_6b

    if-eqz v4, :cond_6c

    :cond_6b
    move-object v1, v4

    :cond_6c
    if-eqz v1, :cond_71

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_71
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    if-eqz v1, :cond_82

    if-eqz v4, :cond_83

    :cond_82
    move-object v1, v4

    :cond_83
    if-eqz v1, :cond_88

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_88
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    if-eqz v1, :cond_99

    if-eqz v4, :cond_9a

    :cond_99
    move-object v1, v4

    :cond_9a
    if-eqz v1, :cond_9f

    invoke-virtual {p0, v0, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_9f
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v1, :cond_b1

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b1
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v1, :cond_c3

    if-eqz v3, :cond_c4

    :cond_c3
    move-object v1, v3

    :cond_c4
    if-eqz v1, :cond_c9

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c9
    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqf0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqf0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lqf0;

    if-eqz v1, :cond_e2

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_e2
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-static {p1, v1}, Ljf0;->l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_f9

    invoke-virtual {p0, v0, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_f9
    return-object p0
.end method

.method public final x(ILjava/lang/String;)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_13

    const/16 v2, 0x8

    if-eq p1, v2, :cond_c

    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_c
    if-eqz p2, :cond_f

    move v0, v1

    :cond_f
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_13
    if-eqz p2, :cond_16

    move v0, v1

    :cond_16
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method
