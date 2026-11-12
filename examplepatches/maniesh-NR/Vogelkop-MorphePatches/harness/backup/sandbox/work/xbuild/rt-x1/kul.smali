.class public final Lkul;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:J

.field public final b:Ldx5;

.field public final c:La64;

.field public final d:Lmul;

.field public final e:Li7f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lwjh;)V
    .registers 6

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-class v0, Lcom/opera/android/aiassistant/db/TopAiActivityDatabase;

    const-string v1, "ai_top_activity"

    invoke-static {p1, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p1

    invoke-virtual {p1}, Lu5i;->b()Ly5i;

    move-result-object p1

    check-cast p1, Lcom/opera/android/aiassistant/db/TopAiActivityDatabase;

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x1e

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    iget-object v2, p2, Lwjh;->b:Ljava/lang/Object;

    check-cast v2, Ld7a;

    iget-object p2, p2, Lwjh;->d:Ljava/lang/Object;

    check-cast p2, Ljg8;

    invoke-static {p2}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v0, p0, Lkul;->a:J

    iput-object v2, p0, Lkul;->b:Ldx5;

    iput-object p2, p0, Lkul;->c:La64;

    invoke-virtual {p1}, Lcom/opera/android/aiassistant/db/TopAiActivityDatabase;->x()Lmul;

    move-result-object p1

    iput-object p1, p0, Lkul;->d:Lmul;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lkul;->e:Li7f;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ldul;

    iget-object p0, p0, Lkul;->e:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ldul;

    iget-object p0, p0, Lkul;->e:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Landroid/net/Uri;Lnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p2, Leul;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Leul;

    iget v1, v0, Leul;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Leul;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Leul;

    invoke-direct {v0, p0, p2}, Leul;-><init>(Lkul;Lnt5;)V

    :goto_18
    iget-object p2, v0, Leul;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Leul;->w:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x0

    iget-object v6, p0, Lkul;->d:Lmul;

    const/4 v7, 0x1

    if-eqz v2, :cond_43

    if-eq v2, v7, :cond_3d

    if-eq v2, v4, :cond_37

    if-ne v2, v3, :cond_30

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9f

    :cond_30
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_37
    iget-wide p0, v0, Leul;->t:J

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_89

    :cond_3d
    iget-wide v8, v0, Leul;->t:J

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_69

    :cond_43
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    new-instance p2, Lih;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, v8, v9}, Lih;-><init>(Ljava/lang/String;J)V

    iput-wide v8, v0, Leul;->t:J

    iput v7, v0, Leul;->w:I

    iget-object p1, v6, Lmul;->a:Ly5i;

    new-instance v2, Lgil;

    const/4 v10, 0x4

    invoke-direct {v2, v6, p2, v10}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, p1, v5, v7, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_67

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_67
    if-eq p1, v1, :cond_9e

    :goto_69
    iget-wide p0, p0, Lkul;->a:J

    invoke-static {p0, p1}, Lpn7;->f(J)J

    move-result-wide p0

    sub-long p0, v8, p0

    iput-wide v8, v0, Leul;->t:J

    iput v4, v0, Leul;->w:I

    iget-object p2, v6, Lmul;->a:Ly5i;

    new-instance v2, Lx41;

    const/16 v4, 0x14

    invoke-direct {v2, p0, p1, v4}, Lx41;-><init>(JB)V

    invoke-static {v0, p2, v5, v7, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_86

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_86
    if-eq p0, v1, :cond_9e

    move-wide p0, v8

    :goto_89
    iput-wide p0, v0, Leul;->t:J

    iput v3, v0, Leul;->w:I

    iget-object p0, v6, Lmul;->a:Ly5i;

    new-instance p1, Lqjl;

    invoke-direct {p1, v3}, Lqjl;-><init>(B)V

    invoke-static {v0, p0, v5, v7, p1}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_9c

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_9c
    if-ne p0, v1, :cond_9f

    :cond_9e
    return-object v1

    :cond_9f
    :goto_9f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p1, Lgul;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lgul;

    iget v1, v0, Lgul;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lgul;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lgul;

    invoke-direct {v0, p0, p1}, Lgul;-><init>(Lkul;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lgul;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lgul;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lkul;->b:Ldx5;

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eqz v2, :cond_3f

    if-eq v2, v8, :cond_3b

    if-eq v2, v7, :cond_37

    if-ne v2, v6, :cond_31

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7a

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_37
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_68

    :cond_3b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_53

    :cond_3f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v8, v0, Lgul;->v:I

    new-instance p1, Ljul;

    invoke-direct {p1, p0, v4, v8}, Ljul;-><init>(Lkul;Lmt5;B)V

    invoke-static {v5, p1, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_51

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_51
    if-eq p1, v1, :cond_79

    :goto_53
    iput v7, v0, Lgul;->v:I

    iget-object p1, p0, Lkul;->d:Lmul;

    iget-object p1, p1, Lmul;->a:Ly5i;

    new-instance v2, Lqjl;

    invoke-direct {v2, v7}, Lqjl;-><init>(B)V

    invoke-static {v0, p1, v3, v8, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_66

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_66
    if-eq p1, v1, :cond_79

    :goto_68
    iput v6, v0, Lgul;->v:I

    new-instance p1, Ljul;

    invoke-direct {p1, p0, v4, v3}, Ljul;-><init>(Lkul;Lmt5;B)V

    invoke-static {v5, p1, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_77

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_77
    if-ne p0, v1, :cond_7a

    :cond_79
    return-object v1

    :cond_7a
    :goto_7a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final c(Landroid/net/Uri;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p2, Lhul;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lhul;

    iget v1, v0, Lhul;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lhul;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lhul;

    invoke-direct {v0, p0, p2}, Lhul;-><init>(Lkul;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lhul;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lhul;->w:I

    iget-object v3, p0, Lkul;->b:Ldx5;

    const/4 v4, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    if-eqz v2, :cond_42

    if-eq v2, v7, :cond_3c

    if-eq v2, v6, :cond_36

    if-ne v2, v5, :cond_30

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_8b

    :cond_30
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_36
    iget-object p1, v0, Lhul;->t:Landroid/net/Uri;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_76

    :cond_3c
    iget-object p1, v0, Lhul;->t:Landroid/net/Uri;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_58

    :cond_42
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lhul;->t:Landroid/net/Uri;

    iput v7, v0, Lhul;->w:I

    new-instance p2, Ljul;

    invoke-direct {p2, p0, v4, v7}, Ljul;-><init>(Lkul;Lmt5;B)V

    invoke-static {v3, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_56

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_56
    if-eq p2, v1, :cond_8a

    :goto_58
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p1, v0, Lhul;->t:Landroid/net/Uri;

    iput v6, v0, Lhul;->w:I

    iget-object v2, p0, Lkul;->d:Lmul;

    iget-object v2, v2, Lmul;->a:Ly5i;

    new-instance v6, Lu5f;

    const/16 v8, 0xe

    invoke-direct {v6, p2, v8}, Lu5f;-><init>(Ljava/lang/String;B)V

    const/4 p2, 0x0

    invoke-static {v0, v2, p2, v7, v6}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_74

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_74
    if-eq p2, v1, :cond_8a

    :goto_76
    iput-object v4, v0, Lhul;->t:Landroid/net/Uri;

    iput v5, v0, Lhul;->w:I

    new-instance p2, Lcek;

    const/4 v2, 0x5

    invoke-direct {p2, p0, p1, v4, v2}, Lcek;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v3, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_88

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_88
    if-ne p0, v1, :cond_8b

    :cond_8a
    return-object v1

    :cond_8b
    :goto_8b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final e(JILnt5;)Ljava/io/Serializable;
    .registers 11

    instance-of v0, p4, Liul;

    if-eqz v0, :cond_13

    move-object v0, p4

    check-cast v0, Liul;

    iget v1, v0, Liul;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Liul;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Liul;

    invoke-direct {v0, p0, p4}, Liul;-><init>(Lkul;Lnt5;)V

    :goto_18
    iget-object p4, v0, Liul;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Liul;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4d

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {p1, p2}, Lpn7;->f(J)J

    move-result-wide p1

    sub-long/2addr v4, p1

    iput v3, v0, Liul;->v:I

    iget-object p0, p0, Lkul;->d:Lmul;

    iget-object p0, p0, Lmul;->a:Ly5i;

    new-instance p1, Llul;

    invoke-direct {p1, v4, v5, p3}, Llul;-><init>(JI)V

    const/4 p2, 0x0

    invoke-static {v0, p0, v3, p2, p1}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p4

    if-ne p4, v1, :cond_4d

    return-object v1

    :cond_4d
    :goto_4d
    check-cast p4, Ljava/lang/Iterable;

    new-instance p0, Ljava/util/ArrayList;

    const/16 p1, 0xa

    invoke-static {p4, p1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p1

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_74

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lih;

    iget-object p2, p2, Lih;->a:Ljava/lang/String;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5e

    :cond_74
    return-object p0
.end method
