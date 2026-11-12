.class public final Lehj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lufj;


# static fields
.field public static final i:J

.field public static final j:Lesd;

.field public static final k:Lcrb;


# instance fields
.field public final a:Ldx5;

.field public final b:Ljg8;

.field public final c:Lzyk;

.field public final d:Lzyk;

.field public final e:Lzyk;

.field public final f:Lzyk;

.field public final g:Lzyk;

.field public final h:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x1e

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lehj;->i:J

    sget-object v0, Lesd;->e:Lkotlin/text/Regex;

    const-string v0, "application/json"

    invoke-static {v0}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v0

    sput-object v0, Lehj;->j:Lesd;

    new-instance v0, Lbli;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lbli;-><init>(B)V

    sget-object v1, Lrpb;->d:Lqpb;

    invoke-static {v1, v0}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    sput-object v0, Lehj;->k:Lcrb;

    return-void
.end method

.method public constructor <init>(Lii;Lt1;Lt1;Lkw3;Ldx5;Ljg8;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lehj;->a:Ldx5;

    iput-object p6, p0, Lehj;->b:Ljg8;

    new-instance p5, Lry1;

    const/4 p6, 0x1

    invoke-direct {p5, p1, p6}, Lry1;-><init>(Lii;B)V

    invoke-static {p5}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lehj;->c:Lzyk;

    new-instance p1, Lj3i;

    const/16 p5, 0x1a

    invoke-direct {p1, p2, p5}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lehj;->d:Lzyk;

    new-instance p1, Lj3i;

    const/16 p2, 0x1b

    invoke-direct {p1, p3, p2}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lehj;->e:Lzyk;

    new-instance p1, Lgzh;

    const/16 p2, 0x1c

    invoke-direct {p1, p2}, Lgzh;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lehj;->f:Lzyk;

    new-instance p1, Lgzh;

    const/16 p3, 0x1d

    invoke-direct {p1, p3}, Lgzh;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lehj;->g:Lzyk;

    new-instance p1, Lj3i;

    invoke-direct {p1, p4, p2}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lehj;->h:Lzyk;

    return-void
.end method

.method public static h(Lehj;Ljava/lang/String;)Lfvh;
    .registers 5

    iget-object v0, p0, Lehj;->d:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    new-instance v1, Lbli;

    const/16 v2, 0x12

    invoke-direct {v1, v2}, Lbli;-><init>(B)V

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2, v0, v1}, Lehj;->g(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lkotlin/jvm/functions/Function1;)Lfvh;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Li9c;JLesd;Lnt5;)Ljava/lang/Object;
    .registers 14

    const-string v0, "Unexpected response: "

    instance-of v1, p5, Lwgj;

    if-eqz v1, :cond_15

    move-object v1, p5

    check-cast v1, Lwgj;

    iget v2, v1, Lwgj;->v:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Lwgj;->v:I

    goto :goto_1a

    :cond_15
    new-instance v1, Lwgj;

    invoke-direct {v1, p0, p5}, Lwgj;-><init>(Lehj;Lnt5;)V

    :goto_1a
    iget-object p5, v1, Lwgj;->t:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lwgj;->v:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_34

    if-ne v3, v5, :cond_2e

    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p5, Lt0i;

    iget-object p0, p5, Lt0i;->a:Ljava/lang/Object;

    goto :goto_6e

    :cond_2e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_34
    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V

    const-string p5, "api/v2/files/upload_failure"

    invoke-static {p0, p5}, Lehj;->h(Lehj;Ljava/lang/String;)Lfvh;

    move-result-object p5

    sget-object v3, Lrvh;->Companion:Lqvh;

    sget-object v6, Lrpb;->d:Lqpb;

    new-instance v7, Logj;

    iget-object p4, p4, Lesd;->a:Ljava/lang/String;

    invoke-direct {v7, p4, p2, p3}, Logj;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Logj;->Companion:Lngj;

    invoke-virtual {p2}, Lngj;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v6, v7, p2}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p3, Lehj;->j:Lesd;

    invoke-static {p2, p3}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object p2

    const-string p3, "POST"

    invoke-virtual {p5, p3, p2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    iput v5, v1, Lwgj;->v:I

    invoke-virtual {p0, p5, p1, v4, v1}, Lehj;->i(Lfvh;Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_6e

    return-object v2

    :cond_6e
    :goto_6e
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_9a

    :try_start_74
    check-cast p0, Lsgj;

    iget p1, p0, Lsgj;->a:I

    const/16 p2, 0xca

    if-ne p1, p2, :cond_7f

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_7f
    new-instance p1, Llv0;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_91
    .catchall {:try_start_74 .. :try_end_91} :catchall_91

    :catchall_91
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1

    :cond_9a
    return-object p0
.end method

.method public final b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Ltgj;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Ltgj;

    iget v1, v0, Ltgj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ltgj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Ltgj;

    invoke-direct {v0, p0, p2}, Ltgj;-><init>(Lehj;Lnt5;)V

    :goto_18
    iget-object p2, v0, Ltgj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ltgj;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2b

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p1, p2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_5b

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Lehj;->e:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/net/Uri;

    new-instance v2, Lbli;

    const/16 v4, 0x13

    invoke-direct {v2, v4}, Lbli;-><init>(B)V

    const-string v4, "api/v1/chat_suggestions/for_client/ofa_chat/"

    invoke-virtual {p0, v4, p1, p2, v2}, Lehj;->g(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lkotlin/jvm/functions/Function1;)Lfvh;

    move-result-object p1

    invoke-virtual {p1}, Lfvh;->c()V

    new-instance p2, Lkvh;

    invoke-direct {p2, p1}, Lkvh;-><init>(Lfvh;)V

    iput v3, v0, Ltgj;->v:I

    invoke-virtual {p0, p2, v0}, Lehj;->k(Lkvh;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_5b

    return-object v1

    :cond_5b
    :goto_5b
    sget-object p2, Lt0i;->b:Lp0i;

    instance-of p2, p1, Lq0i;

    if-nez p2, :cond_8e

    :try_start_61
    check-cast p1, Lsgj;

    new-instance p2, Lnfj;

    sget-object v0, Lehj;->k:Lcrb;

    iget-object p1, p1, Lsgj;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lmfj;->Companion:Llfj;

    invoke-virtual {v1}, Llfj;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v0, p1, v1}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmfj;

    iget-object p0, p0, Lehj;->h:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-direct {p2, p1, p0}, Lnfj;-><init>(Lmfj;Ljava/lang/String;)V
    :try_end_85
    .catchall {:try_start_61 .. :try_end_85} :catchall_86

    return-object p2

    :catchall_86
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_8e
    return-object p1
.end method

.method public final c(Li9c;JLesd;Lnt5;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p5, Lvgj;

    if-eqz v0, :cond_13

    move-object v0, p5

    check-cast v0, Lvgj;

    iget v1, v0, Lvgj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lvgj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lvgj;

    invoke-direct {v0, p0, p5}, Lvgj;-><init>(Lehj;Lnt5;)V

    :goto_18
    iget-object p5, v0, Lvgj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lvgj;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p5, Lt0i;

    iget-object p0, p5, Lt0i;->a:Ljava/lang/Object;

    goto :goto_6c

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V

    const-string p5, "api/v2/files/upload"

    invoke-static {p0, p5}, Lehj;->h(Lehj;Ljava/lang/String;)Lfvh;

    move-result-object p5

    sget-object v2, Lrvh;->Companion:Lqvh;

    sget-object v5, Lrpb;->d:Lqpb;

    new-instance v6, Logj;

    iget-object p4, p4, Lesd;->a:Ljava/lang/String;

    invoke-direct {v6, p4, p2, p3}, Logj;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Logj;->Companion:Lngj;

    invoke-virtual {p2}, Lngj;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v5, v6, p2}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p3, Lehj;->j:Lesd;

    invoke-static {p2, p3}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object p2

    const-string p3, "POST"

    invoke-virtual {p5, p3, p2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    iput v4, v0, Lvgj;->v:I

    invoke-virtual {p0, p5, p1, v3, v0}, Lehj;->i(Lfvh;Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_6c

    return-object v1

    :cond_6c
    :goto_6c
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_93

    :try_start_72
    check-cast p0, Lsgj;

    sget-object p1, Lehj;->k:Lcrb;

    iget-object p0, p0, Lsgj;->b:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lbfj;->Companion:Lafj;

    invoke-virtual {p2}, Lafj;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p1, p0, p2}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbfj;
    :try_end_89
    .catchall {:try_start_72 .. :try_end_89} :catchall_8a

    return-object p0

    :catchall_8a
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1

    :cond_93
    return-object p0
.end method

.method public final d(Li9c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p6, Ldhj;

    if-eqz v0, :cond_13

    move-object v0, p6

    check-cast v0, Ldhj;

    iget v1, v0, Ldhj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ldhj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Ldhj;

    invoke-direct {v0, p0, p6}, Ldhj;-><init>(Lehj;Lnt5;)V

    :goto_18
    iget-object p6, v0, Ldhj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ldhj;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p6}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p6, Lt0i;

    iget-object p0, p6, Lt0i;->a:Ljava/lang/Object;

    goto :goto_6f

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p6}, Lybh;->y(Ljava/lang/Object;)V

    const-string p6, "api/v2/webpage/content"

    invoke-static {p0, p6}, Lehj;->h(Lehj;Ljava/lang/String;)Lfvh;

    move-result-object p6

    sget-object v2, Lrvh;->Companion:Lqvh;

    sget-object v5, Lrpb;->d:Lqpb;

    new-instance v6, Lrgj;

    new-instance v7, Ligj;

    invoke-direct {v7, p5}, Ligj;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, p2, p3, p4, v7}, Lrgj;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ligj;)V

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lrgj;->Companion:Lqgj;

    invoke-virtual {p2}, Lqgj;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v5, v6, p2}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p3, Lehj;->j:Lesd;

    invoke-static {p2, p3}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object p2

    const-string p3, "POST"

    invoke-virtual {p6, p3, p2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    iput v4, v0, Ldhj;->v:I

    invoke-virtual {p0, p6, p1, v3, v0}, Lehj;->i(Lfvh;Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_6f

    return-object v1

    :cond_6f
    :goto_6f
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_96

    :try_start_75
    check-cast p0, Lsgj;

    sget-object p1, Lehj;->k:Lcrb;

    iget-object p0, p0, Lsgj;->b:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lgfj;->Companion:Lffj;

    invoke-virtual {p2}, Lffj;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p1, p0, p2}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgfj;
    :try_end_8c
    .catchall {:try_start_75 .. :try_end_8c} :catchall_8d

    return-object p0

    :catchall_8d
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1

    :cond_96
    return-object p0
.end method

.method public final e(Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p3, Lugj;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lugj;

    iget v1, v0, Lugj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lugj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lugj;

    invoke-direct {v0, p0, p3}, Lugj;-><init>(Lehj;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lugj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lugj;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p3, Lt0i;

    iget-object p0, p3, Lt0i;->a:Ljava/lang/Object;

    goto :goto_53

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v2, "api/v2/files/"

    invoke-direct {p3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lehj;->h(Lehj;Ljava/lang/String;)Lfvh;

    move-result-object p2

    invoke-virtual {p2}, Lfvh;->c()V

    iput v4, v0, Lugj;->v:I

    invoke-virtual {p0, p2, p1, v3, v0}, Lehj;->i(Lfvh;Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_53

    return-object v1

    :cond_53
    :goto_53
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_7a

    :try_start_59
    check-cast p0, Lsgj;

    sget-object p1, Lehj;->k:Lcrb;

    iget-object p0, p0, Lsgj;->b:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lwej;->Companion:Lvej;

    invoke-virtual {p2}, Lvej;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p1, p0, p2}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwej;
    :try_end_70
    .catchall {:try_start_59 .. :try_end_70} :catchall_71

    return-object p0

    :catchall_71
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1

    :cond_7a
    return-object p0
.end method

.method public final f(Li9c;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lxgj;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lxgj;

    iget v1, v0, Lxgj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lxgj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lxgj;

    invoke-direct {v0, p0, p2}, Lxgj;-><init>(Lehj;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lxgj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lxgj;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_41

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lygj;

    invoke-direct {p2, p1, v3, v4}, Lygj;-><init>(Li9c;Lmt5;B)V

    iput v4, v0, Lxgj;->v:I

    iget-object p0, p0, Lehj;->a:Ldx5;

    invoke-static {p0, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_41

    return-object v1

    :cond_41
    :goto_41
    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lkotlin/jvm/functions/Function1;)Lfvh;
    .registers 8

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    invoke-virtual {p3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p3

    invoke-virtual {p3, p1}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-interface {p4, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri$Builder;

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lfvh;->h(Ljava/lang/String;)V

    sget-object p1, Lehj;->j:Lesd;

    iget-object p1, p1, Lesd;->a:Ljava/lang/String;

    const-string p3, "Accept"

    invoke-virtual {v0, p3, p1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lehj;->h:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    const-string p4, "Accept-Language"

    invoke-virtual {v0, p4, p3}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p3, p0, Lehj;->g:Lzyk;

    invoke-virtual {p3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/icu/text/TimeZoneFormat;

    iget-object p0, p0, Lehj;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/TimeZone;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Ljava/util/TimeZone;->getOffset(J)I

    move-result p0

    const/4 p4, 0x1

    invoke-virtual {p3, p0, p4, p4, p4}, Landroid/icu/text/TimeZoneFormat;->formatOffsetISO8601Basic(IZZZ)Ljava/lang/String;

    move-result-object p0

    const-string p3, "X-Opera-Timezone"

    invoke-virtual {v0, p3, p0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_69

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_69

    sget-object p0, Le74;->o:Le74;

    invoke-virtual {v0, p0}, Lfvh;->b(Le74;)V

    :cond_69
    return-object v0
.end method

.method public final i(Lfvh;Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 12

    const-string v0, "Bearer "

    instance-of v1, p4, Lzgj;

    if-eqz v1, :cond_15

    move-object v1, p4

    check-cast v1, Lzgj;

    iget v2, v1, Lzgj;->y:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Lzgj;->y:I

    goto :goto_1a

    :cond_15
    new-instance v1, Lzgj;

    invoke-direct {v1, p0, p4}, Lzgj;-><init>(Lehj;Lnt5;)V

    :goto_1a
    iget-object p4, v1, Lzgj;->w:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lzgj;->y:I

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v3, :cond_45

    if-eq v3, v5, :cond_37

    if-ne v3, v4, :cond_31

    :try_start_29
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p4, Lt0i;

    iget-object p0, p4, Lt0i;->a:Ljava/lang/Object;
    :try_end_30
    .catchall {:try_start_29 .. :try_end_30} :catchall_9c

    goto :goto_8c

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_37
    iget-object p3, v1, Lzgj;->v:Ljava/lang/String;

    iget-object p2, v1, Lzgj;->u:Li9c;

    iget-object p1, v1, Lzgj;->t:Lfvh;

    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p4, Lt0i;

    iget-object p4, p4, Lt0i;->a:Ljava/lang/Object;

    goto :goto_56

    :cond_45
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v1, Lzgj;->t:Lfvh;

    iput-object p2, v1, Lzgj;->u:Li9c;

    iput-object p3, v1, Lzgj;->v:Ljava/lang/String;

    iput v5, v1, Lzgj;->y:I

    invoke-virtual {p0, p2, v1}, Lehj;->f(Li9c;Lnt5;)Ljava/lang/Object;

    move-result-object p4

    if-eq p4, v2, :cond_8b

    :goto_56
    sget-object v3, Lt0i;->b:Lp0i;

    instance-of v3, p4, Lq0i;

    if-nez v3, :cond_a5

    :try_start_5c
    check-cast p4, Ljava/lang/String;

    invoke-static {p3, p4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_94

    const-string v3, "Authorization"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lkvh;

    invoke-direct {v0, p1}, Lkvh;-><init>(Lfvh;)V

    if-eqz p3, :cond_7d

    move-object p4, v6

    :cond_7d
    iput-object v6, v1, Lzgj;->t:Lfvh;

    iput-object v6, v1, Lzgj;->u:Li9c;

    iput-object v6, v1, Lzgj;->v:Ljava/lang/String;

    iput v4, v1, Lzgj;->y:I

    invoke-virtual {p0, v0, p2, p4, v1}, Lehj;->j(Lkvh;Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_8c

    :cond_8b
    return-object v2

    :cond_8c
    :goto_8c
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p0, Lsgj;

    sget-object p1, Lt0i;->b:Lp0i;

    return-object p0

    :cond_94
    new-instance p0, Llv0;

    const-string p1, "Authentication error"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_9c
    .catchall {:try_start_5c .. :try_end_9c} :catchall_9c

    :catchall_9c
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    return-object p1

    :cond_a5
    return-object p4
.end method

.method public final j(Lkvh;Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 16

    instance-of v0, p4, Lahj;

    if-eqz v0, :cond_13

    move-object v0, p4

    check-cast v0, Lahj;

    iget v1, v0, Lahj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lahj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lahj;

    invoke-direct {v0, p0, p4}, Lahj;-><init>(Lehj;Lnt5;)V

    :goto_18
    iget-object p4, v0, Lahj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lahj;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_48

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v4, Lr71;

    const/4 v9, 0x0

    const/16 v10, 0xc

    move-object v5, p0

    move-object v6, p1

    move-object v8, p2

    move-object v7, p3

    invoke-direct/range {v4 .. v10}, Lr71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v3, v0, Lahj;->v:I

    iget-object p0, v5, Lehj;->b:Ljg8;

    invoke-static {p0, v4, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p4

    if-ne p4, v1, :cond_48

    return-object v1

    :cond_48
    :goto_48
    check-cast p4, Lt0i;

    iget-object p0, p4, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public final k(Lkvh;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lchj;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lchj;

    iget v1, v0, Lchj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lchj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lchj;

    invoke-direct {v0, p0, p2}, Lchj;-><init>(Lehj;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lchj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lchj;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lmz9;

    const/16 v2, 0x18

    invoke-direct {p2, p0, p1, v3, v2}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lchj;->v:I

    iget-object p0, p0, Lehj;->b:Ljg8;

    invoke-static {p0, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method
