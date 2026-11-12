.class public final Lap6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lii;


# direct methods
.method public constructor <init>(Lii;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lap6;->a:Lii;

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ZLnt5;)Ljava/lang/Enum;
    .registers 18

    move-object/from16 v0, p5

    instance-of v1, v0, Lzo6;

    if-eqz v1, :cond_15

    move-object v1, v0

    check-cast v1, Lzo6;

    iget v2, v1, Lzo6;->v:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Lzo6;->v:I

    goto :goto_1a

    :cond_15
    new-instance v1, Lzo6;

    invoke-direct {v1, p0, v0}, Lzo6;-><init>(Lap6;Lnt5;)V

    :goto_1a
    iget-object v0, v1, Lzo6;->t:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lzo6;->v:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_30

    if-ne v3, v4, :cond_2a

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9a

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_30
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lrma;

    const/4 v3, 0x4

    invoke-direct {v0, v3}, Lrma;-><init>(B)V

    invoke-virtual {v0, p1, v5}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v0}, Lrma;->d()Lhra;

    move-result-object p1

    invoke-virtual {p1}, Lhra;->g()Lrma;

    move-result-object v6

    const/4 p1, 0x0

    move v8, p1

    :cond_4a
    const-string v0, "/\\"

    const-string v7, "customer/eligible"

    const/16 v3, 0x11

    invoke-static {v7, v0, v8, v3}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v9

    if-ge v9, v3, :cond_58

    move v10, v4

    goto :goto_59

    :cond_58
    move v10, p1

    :goto_59
    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Lrma;->q(Ljava/lang/String;IIZZ)V

    add-int/lit8 v8, v9, 0x1

    if-le v8, v3, :cond_4a

    const-string p1, "countryCodeIso2"

    invoke-virtual {v6, p1, p2}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "deviceId"

    invoke-virtual {v6, p1, p3}, Lrma;->b(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6}, Lrma;->d()Lhra;

    move-result-object p1

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    iput-object p1, v0, Lfvh;->a:Lhra;

    invoke-virtual {v0}, Lfvh;->c()V

    if-nez p4, :cond_80

    sget-object p1, Le74;->o:Le74;

    invoke-virtual {v0, p1}, Lfvh;->b(Le74;)V

    :cond_80
    new-instance p1, Lkvh;

    invoke-direct {p1, v0}, Lkvh;-><init>(Lfvh;)V

    iget-object p0, p0, Lap6;->a:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    invoke-virtual {p0, p1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    iput v4, v1, Lzo6;->v:I

    invoke-static {p0, v1}, Lf03;->o(Lv84;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_9a

    return-object v2

    :cond_9a
    :goto_9a
    move-object p0, v0

    check-cast p0, Ljava/io/Closeable;

    :try_start_9d
    move-object p1, p0

    check-cast p1, Lpzh;

    iget v0, p1, Lpzh;->d:I

    const/16 v1, 0xc8

    if-eq v0, v1, :cond_b9

    const/16 v1, 0x199

    if-eq v0, v1, :cond_b6

    const/16 v1, 0x1a6

    if-ne v0, v1, :cond_b1

    sget-object p1, Lhx7;->c:Lhx7;

    goto :goto_bb

    :cond_b1
    invoke-static {p1}, Lphj;->x0(Lpzh;)Lmoa;

    move-result-object p1

    throw p1

    :cond_b6
    sget-object p1, Lhx7;->b:Lhx7;

    goto :goto_bb

    :cond_b9
    sget-object p1, Lhx7;->a:Lhx7;
    :try_end_bb
    .catchall {:try_start_9d .. :try_end_bb} :catchall_bf

    :goto_bb
    invoke-static {p0, v5}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object p1

    :catchall_bf
    move-exception v0

    move-object p1, v0

    :try_start_c1
    throw p1
    :try_end_c2
    .catchall {:try_start_c1 .. :try_end_c2} :catchall_c2

    :catchall_c2
    move-exception v0

    invoke-static {p0, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method
