.class public final Ltza;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:Landroid/graphics/Bitmap$CompressFormat;


# instance fields
.field public final a:Lqie;

.field public final b:Lnza;

.field public final c:Landroid/net/Uri;

.field public final d:Landroid/graphics/Bitmap$CompressFormat;

.field public final e:I

.field public final f:Ljava/util/Map;

.field public final g:Lpjn;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_9

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->WEBP_LOSSY:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_b

    :cond_9
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    :goto_b
    sput-object v0, Ltza;->h:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method public constructor <init>(Lqie;Lnza;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;ILjava/util/Map;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltza;->a:Lqie;

    iput-object p2, p0, Ltza;->b:Lnza;

    iput-object p3, p0, Ltza;->c:Landroid/net/Uri;

    iput-object p4, p0, Ltza;->d:Landroid/graphics/Bitmap$CompressFormat;

    iput p5, p0, Ltza;->e:I

    iput-object p6, p0, Ltza;->f:Ljava/util/Map;

    new-instance p2, Lpjn;

    const/4 p3, 0x1

    invoke-direct {p2, p1, p3}, Lpjn;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Ltza;->g:Lpjn;

    return-void
.end method

.method public static b(Ltza;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;ILjava/util/LinkedHashMap;I)Ltza;
    .registers 13

    iget-object v1, p0, Ltza;->a:Lqie;

    iget-object v2, p0, Ltza;->b:Lnza;

    and-int/lit8 v0, p5, 0x4

    if-eqz v0, :cond_a

    iget-object p1, p0, Ltza;->c:Landroid/net/Uri;

    :cond_a
    move-object v3, p1

    and-int/lit8 p1, p5, 0x20

    if-eqz p1, :cond_11

    iget-object p2, p0, Ltza;->d:Landroid/graphics/Bitmap$CompressFormat;

    :cond_11
    move-object v4, p2

    and-int/lit8 p1, p5, 0x40

    if-eqz p1, :cond_18

    iget p3, p0, Ltza;->e:I

    :cond_18
    move v5, p3

    and-int/lit16 p5, p5, 0x80

    if-eqz p5, :cond_1f

    iget-object p4, p0, Ltza;->f:Ljava/util/Map;

    :cond_1f
    move-object v6, p4

    new-instance v0, Ltza;

    invoke-direct/range {v0 .. v6}, Ltza;-><init>(Lqie;Lnza;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;ILjava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lnt5;)Ljava/lang/Object;
    .registers 13

    iget-object v0, p0, Ltza;->b:Lnza;

    iget-object v0, v0, Lnza;->a:Landroid/graphics/Bitmap;

    instance-of v1, p2, Lqza;

    if-eqz v1, :cond_17

    move-object v1, p2

    check-cast v1, Lqza;

    iget v2, v1, Lqza;->z:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lqza;->z:I

    goto :goto_1c

    :cond_17
    new-instance v1, Lqza;

    invoke-direct {v1, p0, p2}, Lqza;-><init>(Ltza;Lnt5;)V

    :goto_1c
    iget-object p2, v1, Lqza;->x:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lqza;->z:I

    iget-object v4, p0, Ltza;->c:Landroid/net/Uri;

    iget-object v5, p0, Ltza;->g:Lpjn;

    iget-object v6, p0, Ltza;->f:Ljava/util/Map;

    const/4 v7, 0x0

    packed-switch v3, :pswitch_data_112

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :pswitch_32
    iget-boolean p0, v1, Lqza;->w:Z

    iget-object p1, v1, Lqza;->v:Ljava/util/Map;

    check-cast p1, Ljava/util/Map;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_10b

    :pswitch_3d
    iget-object p0, v1, Lqza;->v:Ljava/util/Map;

    check-cast p0, Ljava/util/Map;

    iget-object p1, v1, Lqza;->u:Landroid/graphics/Bitmap;

    iget-object v3, v1, Lqza;->t:Landroid/content/Context;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_e7

    :pswitch_4a
    iget-object p1, v1, Lqza;->u:Landroid/graphics/Bitmap;

    iget-object v3, v1, Lqza;->t:Landroid/content/Context;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_cd

    :pswitch_53
    iget-boolean p0, v1, Lqza;->w:Z

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9a

    :pswitch_59
    iget-object p1, v1, Lqza;->t:Landroid/content/Context;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_85

    :pswitch_5f
    iget-object p1, v1, Lqza;->t:Landroid/content/Context;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a7

    :pswitch_65
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Ltza;->d:Landroid/graphics/Bitmap$CompressFormat;

    if-nez p2, :cond_9f

    iget p2, p0, Ltza;->e:I

    const/16 v3, 0x64

    if-ne p2, v3, :cond_9f

    sget-object p2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-static {p2, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_9f

    iput-object p1, v1, Lqza;->t:Landroid/content/Context;

    const/4 p2, 0x2

    iput p2, v1, Lqza;->z:I

    invoke-virtual {p0, p1, v1}, Ltza;->d(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v2, :cond_109

    :goto_85
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_9a

    iput-object v7, v1, Lqza;->t:Landroid/content/Context;

    iput-boolean p0, v1, Lqza;->w:Z

    const/4 p2, 0x3

    iput p2, v1, Lqza;->z:I

    invoke-virtual {v5, v4, p1, v6, v1}, Lpjn;->o(Landroid/net/Uri;Landroid/content/Context;Ljava/util/Map;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v2, :cond_109

    :cond_9a
    :goto_9a
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_9f
    iput-object p1, v1, Lqza;->t:Landroid/content/Context;

    const/4 p2, 0x1

    iput p2, v1, Lqza;->z:I

    if-eq v0, v2, :cond_109

    move-object p2, v0

    :goto_a7
    check-cast p2, Landroid/graphics/Bitmap;

    if-nez p2, :cond_ae

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_ae
    iput-object p1, v1, Lqza;->t:Landroid/content/Context;

    iput-object p2, v1, Lqza;->u:Landroid/graphics/Bitmap;

    const/4 v3, 0x4

    iput v3, v1, Lqza;->z:I

    sget-object v3, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-static {v3, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c3

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    goto :goto_c7

    :cond_c3
    invoke-virtual {v5, v3, p1, v1}, Lpjn;->j(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object v3

    :goto_c7
    if-eq v3, v2, :cond_109

    move-object v9, v3

    move-object v3, p1

    move-object p1, p2

    move-object p2, v9

    :goto_cd
    check-cast p2, Ljava/util/Map;

    invoke-interface {p2, v6}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    iput-object v3, v1, Lqza;->t:Landroid/content/Context;

    iput-object p1, v1, Lqza;->u:Landroid/graphics/Bitmap;

    move-object v6, p2

    check-cast v6, Ljava/util/Map;

    iput-object v6, v1, Lqza;->v:Ljava/util/Map;

    const/4 v6, 0x5

    iput v6, v1, Lqza;->z:I

    invoke-virtual {p0, v3, p1, v1}, Ltza;->c(Landroid/content/Context;Landroid/graphics/Bitmap;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v2, :cond_109

    move-object v9, p2

    move-object p2, p0

    move-object p0, v9

    :goto_e7
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f6

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_f6
    if-eqz p2, :cond_10c

    iput-object v7, v1, Lqza;->t:Landroid/content/Context;

    iput-object v7, v1, Lqza;->u:Landroid/graphics/Bitmap;

    iput-object v7, v1, Lqza;->v:Ljava/util/Map;

    iput-boolean p2, v1, Lqza;->w:Z

    const/4 p1, 0x6

    iput p1, v1, Lqza;->z:I

    invoke-virtual {v5, v4, v3, p0, v1}, Lpjn;->o(Landroid/net/Uri;Landroid/content/Context;Ljava/util/Map;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_10a

    :cond_109
    return-object v2

    :cond_10a
    move p0, p2

    :goto_10b
    move p2, p0

    :cond_10c
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_112
    .packed-switch 0x0
        :pswitch_65
        :pswitch_5f
        :pswitch_59
        :pswitch_53
        :pswitch_4a
        :pswitch_3d
        :pswitch_32
    .end packed-switch
.end method

.method public final c(Landroid/content/Context;Landroid/graphics/Bitmap;Lnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p3, Lrza;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lrza;

    iget v1, v0, Lrza;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lrza;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lrza;

    invoke-direct {v0, p0, p3}, Lrza;-><init>(Ltza;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lrza;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lrza;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    :try_start_23
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_26} :catch_5c

    goto :goto_55

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_31
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    iget-object p1, p0, Ltza;->a:Lqie;

    iget-object p1, p1, Lqie;->b:Ljava/lang/Object;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    new-instance p3, Ljg8;

    invoke-direct {p3, p1}, Ljg8;-><init>(Ljava/util/concurrent/Executor;)V

    new-instance v4, Lc71;

    const/16 v9, 0x8

    const/4 v8, 0x0

    move-object v6, p0

    move-object v7, p2

    invoke-direct/range {v4 .. v9}, Lc71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v3, v0, Lrza;->v:I

    invoke-static {p3, v4, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_55

    return-object v1

    :cond_55
    :goto_55
    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_5b} :catch_5c

    goto :goto_5d

    :catch_5c
    const/4 p0, 0x0

    :goto_5d
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final d(Landroid/content/Context;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lsza;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lsza;

    iget v1, v0, Lsza;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lsza;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lsza;

    invoke-direct {v0, p0, p2}, Lsza;-><init>(Ltza;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lsza;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lsza;->v:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_28

    :try_start_24
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_27} :catch_65

    goto :goto_5e

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    iget-object v2, p0, Ltza;->c:Landroid/net/Uri;

    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3e

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_3e
    :try_start_3e
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object p2, p0, Ltza;->a:Lqie;

    iget-object p2, p2, Lqie;->b:Ljava/lang/Object;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p2

    new-instance v2, Ljg8;

    invoke-direct {v2, p2}, Ljg8;-><init>(Ljava/util/concurrent/Executor;)V

    new-instance p2, Lfb9;

    const/4 v5, 0x4

    invoke-direct {p2, p1, p0, v4, v5}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v3, v0, Lsza;->v:I

    invoke-static {v2, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_5e

    return-object v1

    :cond_5e
    :goto_5e
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_64} :catch_65

    goto :goto_66

    :catch_65
    const/4 p0, 0x0

    :goto_66
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3e

    instance-of v0, p1, Ltza;

    if-eqz v0, :cond_3c

    check-cast p1, Ltza;

    iget-object v0, p0, Ltza;->a:Lqie;

    iget-object v1, p1, Ltza;->a:Lqie;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Ltza;->b:Lnza;

    iget-object v1, p1, Ltza;->b:Lnza;

    invoke-virtual {v0, v1}, Lnza;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Ltza;->c:Landroid/net/Uri;

    iget-object v1, p1, Ltza;->c:Landroid/net/Uri;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Ltza;->d:Landroid/graphics/Bitmap$CompressFormat;

    iget-object v1, p1, Ltza;->d:Landroid/graphics/Bitmap$CompressFormat;

    if-ne v0, v1, :cond_3c

    iget v0, p0, Ltza;->e:I

    iget v1, p1, Ltza;->e:I

    if-ne v0, v1, :cond_3c

    iget-object p0, p0, Ltza;->f:Ljava/util/Map;

    iget-object p1, p1, Ltza;->f:Ljava/util/Map;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3e

    :cond_3c
    const/4 p0, 0x0

    return p0

    :cond_3e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ltza;->a:Lqie;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ltza;->b:Lnza;

    invoke-virtual {v2}, Lnza;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ltza;->c:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/lit16 v0, v0, 0x3c1

    add-int/lit16 v0, v0, 0x4d5

    mul-int/2addr v0, v1

    iget-object v2, p0, Ltza;->d:Landroid/graphics/Bitmap$CompressFormat;

    if-nez v2, :cond_23

    const/4 v2, 0x0

    goto :goto_27

    :cond_23
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_27
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v2, p0, Ltza;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Ltza;->f:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
