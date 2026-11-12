.class public final Lr3e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp3e;


# instance fields
.field public final a:Lcb7;


# direct methods
.method public constructor <init>(Lcb7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr3e;->a:Lcb7;

    return-void
.end method


# virtual methods
.method public final a([BLnt5;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    instance-of v3, v2, Lq3e;

    if-eqz v3, :cond_19

    move-object v3, v2

    check-cast v3, Lq3e;

    iget v4, v3, Lq3e;->w:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_19

    sub-int/2addr v4, v5

    iput v4, v3, Lq3e;->w:I

    goto :goto_1e

    :cond_19
    new-instance v3, Lq3e;

    invoke-direct {v3, v0, v2}, Lq3e;-><init>(Lr3e;Lnt5;)V

    :goto_1e
    iget-object v2, v3, Lq3e;->u:Ljava/lang/Object;

    sget-object v4, Lpx5;->a:Lpx5;

    iget v5, v3, Lq3e;->w:I

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v5, :cond_36

    if-ne v5, v7, :cond_30

    iget-object v0, v3, Lq3e;->t:[B

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_64

    :cond_30
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_36
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    array-length v2, v1

    shl-int/lit8 v2, v2, 0x3

    const/16 v5, 0x80

    if-gt v5, v2, :cond_11f

    const/16 v5, 0x101

    if-ge v2, v5, :cond_11f

    rem-int/lit8 v2, v2, 0x20

    if-nez v2, :cond_11f

    iput-object v1, v3, Lq3e;->t:[B

    iput v7, v3, Lq3e;->w:I

    iget-object v0, v0, Lr3e;->a:Lcb7;

    check-cast v0, Lkzd;

    iget-object v0, v0, Lkzd;->a:Lab7;

    invoke-interface {v0}, Lab7;->b()Ldx5;

    move-result-object v0

    new-instance v2, Lrz1;

    const/4 v5, 0x2

    invoke-direct {v2, v5, v6, v5}, Lrz1;-><init>(ILmt5;B)V

    invoke-static {v0, v2, v3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_63

    return-object v4

    :cond_63
    move-object v0, v1

    :goto_64
    check-cast v2, Ljava/util/List;

    array-length v1, v0

    shl-int/lit8 v1, v1, 0x3

    div-int/lit8 v3, v1, 0x20

    add-int/2addr v3, v1

    array-length v1, v0

    shl-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x20

    const/16 v4, 0x8

    rsub-int/lit8 v1, v1, 0x8

    const/16 v5, 0xff

    shl-int/2addr v5, v1

    int-to-byte v1, v5

    array-length v5, v0

    array-length v6, v0

    int-to-long v8, v6

    const-wide/16 v10, 0x0

    int-to-long v12, v5

    invoke-static/range {v8 .. v13}, Lqyn;->m(JJJ)V

    array-length v6, v0

    invoke-static {v5, v6}, Ly72;->a(II)V

    const/4 v6, 0x0

    invoke-static {v0, v6, v5}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v5

    const-string v8, "SHA-256"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    array-length v9, v5

    invoke-virtual {v8, v5, v6, v9}, Ljava/security/MessageDigest;->update([BII)V

    invoke-virtual {v8}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    array-length v8, v5

    invoke-static {v5, v8}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v5

    aget-byte v5, v5, v6

    and-int/2addr v5, v1

    int-to-byte v1, v5

    int-to-byte v1, v1

    array-length v5, v0

    shl-int/lit8 v5, v5, 0x3

    div-int/lit8 v8, v5, 0x20

    add-int v9, v5, v8

    new-array v10, v9, [Z

    array-length v11, v0

    move v12, v6

    :goto_ae
    if-ge v12, v11, :cond_ca

    move v13, v6

    :goto_b1
    if-ge v13, v4, :cond_c7

    aget-byte v14, v0, v12

    shl-int/lit8 v15, v12, 0x3

    add-int/2addr v15, v13

    rsub-int/lit8 v16, v13, 0x7

    ushr-int v14, v14, v16

    and-int/2addr v14, v7

    if-lez v14, :cond_c1

    move v14, v7

    goto :goto_c2

    :cond_c1
    move v14, v6

    :goto_c2
    aput-boolean v14, v10, v15

    add-int/lit8 v13, v13, 0x1

    goto :goto_b1

    :cond_c7
    add-int/lit8 v12, v12, 0x1

    goto :goto_ae

    :cond_ca
    move v0, v6

    :goto_cb
    if-ge v0, v8, :cond_de

    add-int v4, v5, v0

    rsub-int/lit8 v11, v0, 0x7

    ushr-int v11, v1, v11

    and-int/2addr v11, v7

    if-lez v11, :cond_d8

    move v11, v7

    goto :goto_d9

    :cond_d8
    move v11, v6

    :goto_d9
    aput-boolean v11, v10, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_cb

    :cond_de
    div-int/lit8 v3, v3, 0xb

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v6

    :goto_e6
    if-ge v1, v3, :cond_11a

    mul-int/lit8 v4, v1, 0xb

    add-int/lit8 v5, v4, 0xb

    invoke-static {v5, v9}, Ly72;->a(II)V

    invoke-static {v10, v4, v5}, Ljava/util/Arrays;->copyOfRange([ZII)[Z

    move-result-object v4

    array-length v5, v4

    move v8, v6

    move v11, v8

    :goto_f6
    if-ge v8, v5, :cond_105

    aget-boolean v12, v4, v8

    if-eqz v12, :cond_102

    array-length v12, v4

    sub-int/2addr v12, v8

    sub-int/2addr v12, v7

    shl-int v12, v7, v12

    add-int/2addr v11, v12

    :cond_102
    add-int/lit8 v8, v8, 0x1

    goto :goto_f6

    :cond_105
    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v3, -0x1

    if-ge v1, v4, :cond_117

    const-string v4, " "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_117
    add-int/lit8 v1, v1, 0x1

    goto :goto_e6

    :cond_11a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_11f
    const-string v0, "The allowed size of entropy is 128-256 bits of multiples of 32"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v6
.end method
