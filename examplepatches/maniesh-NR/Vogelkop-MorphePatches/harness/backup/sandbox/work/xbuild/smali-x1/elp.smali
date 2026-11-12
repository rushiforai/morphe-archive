.class public abstract Lelp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lftj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lftj;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lftj;-><init>(B)V

    sput-object v0, Lelp;->a:Lftj;

    return-void
.end method

.method public static final a(Landroid/content/Context;Ljava/io/File;IILnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p4, Lykp;

    if-eqz v0, :cond_14

    move-object v0, p4

    check-cast v0, Lykp;

    iget v1, v0, Lykp;->u:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lykp;->u:I

    :goto_12
    move-object v6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lykp;

    invoke-direct {v0, p4}, Lnt5;-><init>(Lmt5;)V

    goto :goto_12

    :goto_1a
    iget-object p4, v6, Lykp;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v6, Lykp;->u:I

    const/4 v2, 0x1

    if-eqz v1, :cond_30

    if-ne v1, v2, :cond_29

    :try_start_25
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_49

    goto :goto_44

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_33
    sget-object p4, Lt0i;->b:Lp0i;

    sget-object v1, Lelp;->a:Lftj;

    iput v2, v6, Lykp;->u:I

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v1 .. v6}, Lftj;->c(Landroid/content/Context;Ljava/io/File;IILnt5;)Ljava/lang/Object;

    move-result-object p4

    if-ne p4, v0, :cond_44

    return-object v0

    :cond_44
    :goto_44
    check-cast p4, Landroid/graphics/drawable/Drawable;

    sget-object p0, Lt0i;->b:Lp0i;
    :try_end_48
    .catchall {:try_start_33 .. :try_end_48} :catchall_49

    return-object p4

    :catchall_49
    move-exception v0

    move-object p0, v0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1
.end method

.method public static final b(Ljava/io/File;Lnt5;)Ljava/lang/Object;
    .registers 9

    const-string v0, "Can\'t decode image bounds: "

    instance-of v1, p1, Lzkp;

    if-eqz v1, :cond_15

    move-object v1, p1

    check-cast v1, Lzkp;

    iget v2, v1, Lzkp;->v:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Lzkp;->v:I

    goto :goto_1a

    :cond_15
    new-instance v1, Lzkp;

    invoke-direct {v1, p1}, Lnt5;-><init>(Lmt5;)V

    :goto_1a
    iget-object p1, v1, Lzkp;->u:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lzkp;->v:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_32

    if-ne v3, v5, :cond_2c

    iget-object p0, v1, Lzkp;->t:Ljava/io/File;

    :try_start_28
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_79

    goto :goto_4d

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_35
    sget-object p1, Lt0i;->b:Lp0i;

    iput-object p0, v1, Lzkp;->t:Ljava/io/File;

    iput v5, v1, Lzkp;->v:I

    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Lmr6;->b:Lmr6;

    new-instance v3, Leno;

    const/16 v6, 0xe

    invoke-direct {v3, v6, v4, p0}, Leno;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p1, v3, v1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v2, :cond_4d

    return-object v2

    :cond_4d
    :goto_4d
    move-object v1, p1

    check-cast v1, Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v2

    if-lez v2, :cond_5c

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    if-gtz v1, :cond_5d

    :cond_5c
    const/4 v5, 0x0

    :cond_5d
    if-eqz v5, :cond_60

    move-object v4, p1

    :cond_60
    check-cast v4, Landroid/util/Size;

    if-eqz v4, :cond_67

    sget-object p0, Lt0i;->b:Lp0i;

    return-object v4

    :cond_67
    new-instance p1, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_79
    .catchall {:try_start_35 .. :try_end_79} :catchall_79

    :catchall_79
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1
.end method

.method public static final c(Landroid/util/Size;II)Landroid/util/Size;
    .registers 6

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    mul-int v1, p1, p0

    mul-int v2, v0, p2

    if-lt v1, v2, :cond_20

    new-instance p0, Landroid/util/Size;

    add-int/2addr v1, v0

    add-int/lit8 v1, v1, -0x1

    div-int/2addr v1, v0

    invoke-direct {p0, p1, v1}, Landroid/util/Size;-><init>(II)V

    return-object p0

    :cond_20
    new-instance p1, Landroid/util/Size;

    add-int/2addr v2, p0

    add-int/lit8 v2, v2, -0x1

    div-int/2addr v2, p0

    invoke-direct {p1, v2, p2}, Landroid/util/Size;-><init>(II)V

    return-object p1
.end method
