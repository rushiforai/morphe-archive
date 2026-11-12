.class public final Lych;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:Li06;

.field public static final synthetic j:[Lxtb;

.field public static final k:Lcrb;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lnx5;

.field public final c:Lwjh;

.field public final d:Lwzg;

.field public final e:Lp1;

.field public final f:Lk6e;

.field public final g:Lwub;

.field public final h:Lke6;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lf6h;

    const-string v1, "prefs"

    const-string v2, "getPrefs(Landroid/content/Context;)Landroidx/datastore/core/DataStore;"

    const-class v3, Lych;

    invoke-direct {v0, v3, v1, v2}, Le6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    sput-object v1, Lych;->j:[Lxtb;

    new-instance v0, Li06;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Li06;-><init>(B)V

    sput-object v0, Lych;->i:Li06;

    new-instance v0, Lu4h;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lu4h;-><init>(B)V

    sget-object v1, Lrpb;->d:Lqpb;

    invoke-static {v1, v0}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    sput-object v0, Lych;->k:Lcrb;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lnx5;Lwjh;Lwzg;Lp1;Lk6e;Lwub;Lplh;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lych;->a:Landroid/content/Context;

    iput-object p2, p0, Lych;->b:Lnx5;

    iput-object p3, p0, Lych;->c:Lwjh;

    iput-object p4, p0, Lych;->d:Lwzg;

    iput-object p5, p0, Lych;->e:Lp1;

    iput-object p6, p0, Lych;->f:Lk6e;

    iput-object p7, p0, Lych;->g:Lwub;

    sget-object p1, Lrbe;->w:Lrbe;

    iget-object p2, p3, Lwjh;->d:Ljava/lang/Object;

    check-cast p2, Ljg8;

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object p3

    invoke-static {p2, p3}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p2

    invoke-static {p2}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p2

    const-string p3, "pse"

    invoke-static {p3, p1, p2}, Luup;->n(Ljava/lang/String;Lu2j;La64;)Lke6;

    move-result-object p1

    iput-object p1, p0, Lych;->h:Lke6;

    sget-object p1, Lcak;->d:Lavj;

    new-instance p1, Lq2g;

    const/16 p2, 0x12

    invoke-direct {p1, p0, p8, p2}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/16 p0, 0x8

    invoke-static {p0, p1}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(Lxri;Lmt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p2, Lxch;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lxch;

    iget v1, v0, Lxch;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lxch;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lxch;

    invoke-direct {v0, p0, p2}, Lxch;-><init>(Lych;Lmt5;)V

    :goto_18
    iget-object p2, v0, Lxch;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lxch;->y:I

    iget-object v3, p0, Lych;->c:Lwjh;

    const/4 v4, 0x4

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x3

    const/4 v8, 0x0

    if-eqz v2, :cond_57

    if-eq v2, v6, :cond_4c

    if-eq v2, v5, :cond_41

    if-eq v2, v7, :cond_3a

    if-ne v2, v4, :cond_34

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_e9

    :cond_34
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v8

    :cond_3a
    iget-object p1, v0, Lxch;->t:Lxri;

    :try_start_3c
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_3f} :catch_cf

    goto/16 :goto_cf

    :cond_41
    iget-object p1, v0, Lxch;->v:Ljava/lang/String;

    iget-object v2, v0, Lxch;->u:Lqd6;

    iget-object v5, v0, Lxch;->t:Lxri;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_b0

    :cond_4c
    iget-object p1, v0, Lxch;->u:Lqd6;

    iget-object v2, v0, Lxch;->t:Lxri;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object v11, v2

    move-object v2, p1

    move-object p1, v11

    goto :goto_8f

    :cond_57
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lxri;->b()I

    move-result p2

    if-nez p2, :cond_63

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_63
    sget-object p2, Lych;->j:[Lxtb;

    const/4 v2, 0x0

    aget-object p2, p2, v2

    iget-object p2, p0, Lych;->h:Lke6;

    iget-object v2, p0, Lych;->a:Landroid/content/Context;

    invoke-virtual {p2, v2}, Lke6;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqd6;

    invoke-interface {p2}, Lqd6;->getData()Lf99;

    move-result-object v2

    new-instance v9, Lra6;

    invoke-direct {v9, v7, v8, v4}, Lra6;-><init>(ILmt5;B)V

    new-instance v10, Lx99;

    invoke-direct {v10, v2, v9, v6}, Lx99;-><init>(Lf99;Lcr9;B)V

    iput-object p1, v0, Lxch;->t:Lxri;

    iput-object p2, v0, Lxch;->u:Lqd6;

    iput v6, v0, Lxch;->y:I

    invoke-static {v10, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_e8

    move-object v11, v2

    move-object v2, p2

    move-object p2, v11

    :goto_8f
    check-cast p2, Lwch;

    iget-object p2, p2, Lwch;->a:Ljava/lang/String;

    iget-object v6, v3, Lwjh;->c:Ljava/lang/Object;

    check-cast v6, Lcv6;

    new-instance v9, Lbz1;

    const/16 v10, 0x1a

    invoke-direct {v9, v10, v8, p1}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lxch;->t:Lxri;

    iput-object v2, v0, Lxch;->u:Lqd6;

    iput-object p2, v0, Lxch;->v:Ljava/lang/String;

    iput v5, v0, Lxch;->y:I

    invoke-static {v6, v9, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v1, :cond_e8

    move-object v11, v5

    move-object v5, p1

    move-object p1, p2

    move-object p2, v11

    :goto_b0
    check-cast p2, Ljava/lang/String;

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_bb

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_bb
    :try_start_bb
    new-instance p1, Leo6;

    invoke-direct {p1, p2, v8, v4}, Leo6;-><init>(Ljava/lang/String;Lmt5;B)V

    iput-object v5, v0, Lxch;->t:Lxri;

    iput-object v8, v0, Lxch;->u:Lqd6;

    iput-object v8, v0, Lxch;->v:Ljava/lang/String;

    iput v7, v0, Lxch;->y:I

    invoke-interface {v2, p1, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1
    :try_end_cc
    .catch Ljava/io/IOException; {:try_start_bb .. :try_end_cc} :catch_ce

    if-eq p1, v1, :cond_e8

    :catch_ce
    move-object p1, v5

    :catch_cf
    :goto_cf
    iget-object p2, v3, Lwjh;->d:Ljava/lang/Object;

    check-cast p2, Ljg8;

    new-instance v2, Lfb9;

    const/16 v3, 0x16

    invoke-direct {v2, p1, p0, v8, v3}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object v8, v0, Lxch;->t:Lxri;

    iput-object v8, v0, Lxch;->u:Lqd6;

    iput-object v8, v0, Lxch;->v:Ljava/lang/String;

    iput v4, v0, Lxch;->y:I

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_e9

    :cond_e8
    return-object v1

    :cond_e9
    :goto_e9
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
