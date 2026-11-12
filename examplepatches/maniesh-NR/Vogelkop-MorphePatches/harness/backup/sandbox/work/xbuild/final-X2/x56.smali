.class public final Lx56;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 51

    sget-object v1, Lef0;->e:Lef0;

    sget-object v2, Lef0;->b:Lef0;

    move-object v3, v1

    move-object v4, v1

    move-object v5, v1

    move-object v6, v1

    move-object v7, v1

    move-object v8, v2

    move-object v9, v1

    move-object v10, v1

    move-object v11, v1

    move-object v12, v1

    move-object v13, v1

    move-object v14, v1

    move-object v15, v1

    move-object/from16 v16, v2

    move-object/from16 v17, v2

    move-object/from16 v18, v1

    move-object/from16 v19, v1

    move-object/from16 v20, v1

    move-object/from16 v21, v2

    move-object/from16 v22, v1

    move-object/from16 v23, v2

    move-object/from16 v24, v2

    move-object/from16 v25, v2

    move-object/from16 v26, v2

    move-object/from16 v27, v2

    move-object/from16 v28, v2

    move-object/from16 v29, v2

    move-object/from16 v30, v1

    move-object/from16 v31, v2

    move-object/from16 v32, v2

    move-object/from16 v33, v2

    move-object/from16 v34, v1

    move-object/from16 v35, v2

    move-object/from16 v36, v1

    move-object/from16 v37, v1

    move-object/from16 v38, v2

    move-object/from16 v39, v2

    move-object/from16 v40, v1

    move-object/from16 v41, v1

    move-object/from16 v42, v1

    move-object/from16 v43, v1

    move-object/from16 v44, v1

    move-object/from16 v45, v1

    move-object/from16 v46, v1

    move-object/from16 v47, v2

    move-object/from16 v48, v1

    move-object/from16 v49, v1

    move-object/from16 v50, v1

    filled-new-array/range {v1 .. v50}, [Lef0;

    move-result-object v0

    sput-object v0, Lx56;->f:[Lef0;

    sget-object v1, Ldf0;->d:Ldf0;

    new-instance v3, Ldf0;

    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v2

    const/4 v4, -0x1

    invoke-direct {v3, v4, v0, v2}, Ldf0;-><init>(ILjava/lang/Object;B)V

    new-instance v2, Ldf0;

    invoke-static {v0}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v5

    invoke-direct {v2, v4, v0, v5}, Ldf0;-><init>(ILjava/lang/Object;B)V

    new-instance v5, Ldf0;

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v7

    invoke-direct {v5, v4, v6, v7}, Ldf0;-><init>(ILjava/lang/Object;B)V

    new-instance v9, Ldf0;

    invoke-static {v0}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v6

    invoke-direct {v9, v4, v0, v6}, Ldf0;-><init>(ILjava/lang/Object;B)V

    move-object v4, v2

    move-object v2, v1

    move-object v6, v1

    move-object v7, v1

    move-object v8, v1

    move-object v10, v1

    move-object v11, v1

    move-object v12, v1

    move-object v13, v1

    move-object v14, v1

    move-object v15, v1

    move-object/from16 v16, v1

    move-object/from16 v17, v1

    move-object/from16 v18, v1

    move-object/from16 v19, v1

    move-object/from16 v20, v1

    move-object/from16 v21, v1

    move-object/from16 v22, v1

    move-object/from16 v23, v1

    move-object/from16 v24, v1

    move-object/from16 v25, v1

    move-object/from16 v26, v1

    move-object/from16 v27, v1

    move-object/from16 v28, v1

    move-object/from16 v29, v1

    move-object/from16 v30, v1

    move-object/from16 v31, v1

    move-object/from16 v32, v1

    move-object/from16 v33, v1

    move-object/from16 v34, v1

    move-object/from16 v35, v1

    move-object/from16 v36, v1

    move-object/from16 v37, v1

    move-object/from16 v38, v1

    move-object/from16 v39, v1

    move-object/from16 v40, v1

    move-object/from16 v41, v1

    move-object/from16 v42, v1

    move-object/from16 v43, v1

    move-object/from16 v44, v1

    move-object/from16 v45, v1

    move-object/from16 v46, v1

    move-object/from16 v47, v1

    move-object/from16 v48, v1

    move-object/from16 v49, v1

    move-object/from16 v50, v1

    filled-new-array/range {v1 .. v50}, [Ldf0;

    move-result-object v0

    sput-object v0, Lx56;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final A(Lzpa;)Luc0;
    .registers 6

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luc0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Luc0;

    const/16 v1, 0x98b

    const/16 v2, 0xc

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Luc0;

    return-object p0
.end method

.method public final B(Lzpa;)Lqd0;
    .registers 6

    const/16 v0, 0x21

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqd0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lqd0;

    const/16 v1, 0x98b

    const/16 v2, 0x49

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqd0;

    return-object p0
.end method

.method public final C(Lzpa;)Lde0;
    .registers 6

    const/16 v0, 0x2a

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lde0;

    const/16 v1, 0x98b

    const/4 v2, 0x4

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lde0;

    return-object p0
.end method

.method public final D(Lzpa;)Ltf0;
    .registers 6

    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltf0;

    if-eqz v1, :cond_a

    return-object v1

    :cond_a
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ltf0;

    const/16 v1, 0x98b

    const/16 v2, 0xc

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltf0;

    return-object p0
.end method

.method public final E(Lzpa;)Lfi0;
    .registers 6

    const/16 v0, 0x1f

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfi0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lfi0;

    const/16 v1, 0x98b

    const/16 v2, 0x30

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfi0;

    return-object p0
.end method

.method public final F(Lzpa;)Lb66;
    .registers 6

    const/16 v0, 0x1b

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb66;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lb66;

    const/16 v1, 0x98b

    const/16 v2, 0x59

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb66;

    return-object p0
.end method

.method public final G(Lzpa;)Lok0;
    .registers 6

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lok0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lok0;

    const/16 v1, 0x98b

    const/4 v2, 0x3

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lok0;

    return-object p0
.end method

.method public final H(Lzpa;)Lhm0;
    .registers 6

    const/16 v0, 0x1a

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhm0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lhm0;

    const/16 v1, 0x98b

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhm0;

    return-object p0
.end method

.method public final I(Lzpa;)Lin0;
    .registers 6

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lin0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lin0;

    const/16 v1, 0x98b

    const/16 v2, 0x37

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lin0;

    return-object p0
.end method

.method public final J(Lzpa;)Lsn0;
    .registers 6

    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsn0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lsn0;

    const/16 v1, 0x98b

    const/16 v2, 0xe

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsn0;

    return-object p0
.end method

.method public final K(Lzpa;)Luo0;
    .registers 6

    const/16 v0, 0x26

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luo0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Luo0;

    const/16 v1, 0x98b

    const/4 v2, 0x6

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Luo0;

    return-object p0
.end method

.method public final L(Lzpa;)Lrr0;
    .registers 6

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrr0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lrr0;

    const/16 v1, 0x98b

    const/16 v2, 0x19

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrr0;

    return-object p0
.end method

.method public final M(Lzpa;)Lls0;
    .registers 6

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lls0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lls0;

    const/16 v1, 0x98b

    const/16 v2, 0x9

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lls0;

    return-object p0
.end method

.method public final N(Lzpa;)Lzs0;
    .registers 6

    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzs0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lzs0;

    const/16 v1, 0x98b

    const/16 v2, 0xf

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzs0;

    return-object p0
.end method

.method public final O(Lzpa;)Le66;
    .registers 6

    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le66;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Le66;

    const/16 v1, 0x98b

    const/16 v2, 0x1f

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le66;

    return-object p0
.end method

.method public final P()Ljava/util/Map;
    .registers 2

    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_f

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final Q()Ljava/util/Map;
    .registers 2

    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_f

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final R()Ljava/util/Map;
    .registers 2

    const/16 v0, 0x1c

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_f

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final S()Ljava/util/Map;
    .registers 2

    const/16 v0, 0x1d

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_f

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final T()Lif0;
    .registers 4

    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_16

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_16

    new-instance v2, Lif0;

    invoke-direct {v2, p0, v0, v1}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    return-object v2

    :cond_16
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, p0, v0, v1}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    return-object v2
.end method

.method public final U()Lif0;
    .registers 4

    const/16 v0, 0x1c

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_16

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_16

    new-instance v2, Lif0;

    invoke-direct {v2, p0, v0, v1}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    return-object v2

    :cond_16
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, p0, v0, v1}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    return-object v2
.end method

.method public final V(ILjava/lang/String;)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_28

    const/4 v2, 0x7

    if-eq p1, v2, :cond_21

    const/16 v2, 0x20

    if-eq p1, v2, :cond_1a

    const/16 v2, 0x22

    if-eq p1, v2, :cond_13

    invoke-virtual {p0, p1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_13
    if-eqz p2, :cond_16

    move v0, v1

    :cond_16
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_1a
    if-eqz p2, :cond_1d

    move v0, v1

    :cond_1d
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_21
    if-eqz p2, :cond_24

    move v0, v1

    :cond_24
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void

    :cond_28
    if-eqz p2, :cond_2b

    move v0, v1

    :cond_2b
    invoke-virtual {p0, p1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method

.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lx56;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lx56;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 7

    check-cast p1, Lx56;

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

    check-cast v0, Lhk0;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhk0;

    invoke-static {v0, v1}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v0

    check-cast v0, Lhk0;

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

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    if-eqz v1, :cond_6b

    if-eqz v4, :cond_6c

    :cond_6b
    move-object v1, v4

    :cond_6c
    if-eqz v1, :cond_71

    invoke-virtual {p0, v0, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_71
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lra0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lra0;

    invoke-static {v1, v4}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lra0;

    if-eqz v1, :cond_89

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_89
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltf0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ltf0;

    invoke-static {v1, v4}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Ltf0;

    if-eqz v1, :cond_a1

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a1
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v1, :cond_b2

    if-eqz v4, :cond_b3

    :cond_b2
    move-object v1, v4

    :cond_b3
    if-eqz v1, :cond_b8

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b8
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    if-eqz v1, :cond_ca

    if-eqz v4, :cond_cb

    :cond_ca
    move-object v1, v4

    :cond_cb
    if-eqz v1, :cond_d0

    invoke-virtual {p0, v0, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d0
    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v1, :cond_e3

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_e3
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v1, :cond_f5

    if-eqz v3, :cond_f6

    :cond_f5
    move-object v1, v3

    :cond_f6
    if-eqz v1, :cond_fb

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_fb
    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v1, :cond_10d

    if-eqz v3, :cond_10e

    :cond_10d
    move-object v1, v3

    :cond_10e
    if-eqz v1, :cond_113

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_113
    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    if-eqz v1, :cond_125

    if-eqz v3, :cond_126

    :cond_125
    move-object v1, v3

    :cond_126
    if-eqz v1, :cond_12b

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_12b
    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lin0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lin0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lin0;

    if-eqz v1, :cond_144

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_144
    const/16 v0, 0xe

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrr0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrr0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lrr0;

    if-eqz v1, :cond_15d

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_15d
    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsn0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lsn0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lsn0;

    if-eqz v1, :cond_176

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_176
    const/16 v0, 0x10

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luc0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Luc0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Luc0;

    if-eqz v1, :cond_18f

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_18f
    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lls0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lls0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lls0;

    if-eqz v1, :cond_1a8

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1a8
    const/16 v0, 0x12

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzu0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzu0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lzu0;

    if-eqz v1, :cond_1c1

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1c1
    const/16 v0, 0x13

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz56;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lz56;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lz56;

    if-eqz v1, :cond_1da

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1da
    const/16 v0, 0x14

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lok0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lok0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lok0;

    if-eqz v1, :cond_1f3

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1f3
    const/16 v0, 0x15

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyl0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lyl0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lyl0;

    if-eqz v1, :cond_20c

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_20c
    const/16 v0, 0x16

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc66;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc66;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lc66;

    if-eqz v1, :cond_225

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_225
    const/16 v0, 0x17

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-static {v1, v3}, Ljf0;->g(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_23c

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_23c
    const/16 v0, 0x18

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-static {v1, v3}, Ljf0;->g(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_253

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_253
    const/16 v0, 0x19

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-static {v1, v3}, Ljf0;->g(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_26a

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_26a
    const/16 v0, 0x1a

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhm0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lhm0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lhm0;

    if-eqz v1, :cond_283

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_283
    const/16 v0, 0x1b

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb66;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb66;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lb66;

    if-eqz v1, :cond_29c

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_29c
    const/16 v0, 0x1c

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-static {v1, v3}, Ljf0;->l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_2b3

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2b3
    const/16 v0, 0x1d

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-static {v1, v3}, Ljf0;->l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_2ca

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2ca
    const/16 v0, 0x1e

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ls70;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ls70;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Ls70;

    if-eqz v1, :cond_2e3

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2e3
    const/16 v0, 0x1f

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfi0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfi0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lfi0;

    if-eqz v1, :cond_2fc

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2fc
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v1, :cond_30e

    if-eqz v3, :cond_30f

    :cond_30e
    move-object v1, v3

    :cond_30f
    if-eqz v1, :cond_314

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_314
    const/16 v0, 0x21

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqd0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqd0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lqd0;

    if-eqz v1, :cond_32d

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_32d
    const/16 v0, 0x22

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v1, :cond_33f

    if-eqz v3, :cond_340

    :cond_33f
    move-object v1, v3

    :cond_340
    if-eqz v1, :cond_345

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_345
    const/16 v0, 0x23

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq56;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lq56;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lq56;

    if-eqz v1, :cond_35e

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_35e
    const/16 v0, 0x24

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsl0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lsl0;

    if-eqz v1, :cond_370

    if-eqz v3, :cond_371

    :cond_370
    move-object v1, v3

    :cond_371
    if-eqz v1, :cond_376

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_376
    const/16 v0, 0x25

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-static {v1, v3}, Ljf0;->l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_38d

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_38d
    const/16 v0, 0x26

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luo0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Luo0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Luo0;

    if-eqz v1, :cond_3a6

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3a6
    const/16 v0, 0x27

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v1, :cond_3b8

    if-eqz v3, :cond_3b9

    :cond_3b8
    move-object v1, v3

    :cond_3b9
    if-eqz v1, :cond_3be

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3be
    const/16 v0, 0x28

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lea0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lea0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lea0;

    if-eqz v1, :cond_3d7

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3d7
    const/16 v0, 0x29

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxt0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lxt0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lxt0;

    if-eqz v1, :cond_3f0

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3f0
    const/16 v0, 0x2a

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lde0;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lde0;

    if-eqz v1, :cond_409

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_409
    const/16 v0, 0x2b

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le66;

    const/16 v1, 0x2b

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le66;

    invoke-static {v0, v1}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v0

    check-cast v0, Le66;

    if-eqz v0, :cond_426

    const/16 v1, 0x2b

    invoke-virtual {p0, v1, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_426
    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzs0;

    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzs0;

    invoke-static {v0, v1}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v0

    check-cast v0, Lzs0;

    if-eqz v0, :cond_443

    const/16 v1, 0x2c

    invoke-virtual {p0, v1, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_443
    const/16 v0, 0x2d

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lws0;

    const/16 v1, 0x2d

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lws0;

    invoke-static {v0, v1}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v0

    check-cast v0, Lws0;

    if-eqz v0, :cond_460

    const/16 v1, 0x2d

    invoke-virtual {p0, v1, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_460
    const/16 v0, 0x2e

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-static {v0, v1}, Ljf0;->l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_47b

    const/16 v1, 0x2e

    invoke-virtual {p0, v1, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_47b
    const/16 v0, 0x2f

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-static {v0, v1}, Ljf0;->l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_496

    const/16 v1, 0x2f

    invoke-virtual {p0, v1, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_496
    const/16 v0, 0x30

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmd0;

    const/16 v1, 0x30

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmd0;

    invoke-static {v0, v1}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v0

    check-cast v0, Lmd0;

    if-eqz v0, :cond_4b3

    const/16 v1, 0x30

    invoke-virtual {p0, v1, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4b3
    const/16 v0, 0x31

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ls56;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ls56;

    invoke-static {p1, v0}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object p1

    check-cast p1, Ls56;

    if-eqz p1, :cond_4ce

    const/16 v0, 0x31

    invoke-virtual {p0, v0, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4ce
    return-object p0
.end method

.method public final x(Lzpa;)Lea0;
    .registers 6

    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lea0;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lea0;

    const/16 v1, 0x98b

    const/16 v2, 0xc

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lea0;

    return-object p0
.end method

.method public final y(Lzpa;)Lra0;
    .registers 6

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lra0;

    if-eqz v1, :cond_a

    return-object v1

    :cond_a
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lra0;

    const/16 v1, 0x98b

    const/16 v2, 0xf

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lra0;

    return-object p0
.end method

.method public final z(Lzpa;)Lq56;
    .registers 6

    const/16 v0, 0x23

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq56;

    if-eqz v1, :cond_b

    return-object v1

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lq56;

    const/16 v1, 0x98b

    const/16 v2, 0x22

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq56;

    return-object p0
.end method
