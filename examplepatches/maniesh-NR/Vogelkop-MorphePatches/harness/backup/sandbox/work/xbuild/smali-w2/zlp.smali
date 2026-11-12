.class public abstract Lzlp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Z


# direct methods
.method public static final a(Landroid/content/Context;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lqlp;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lqlp;

    iget v1, v0, Lqlp;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lqlp;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lqlp;

    invoke-direct {v0, p1}, Lnt5;-><init>(Lmt5;)V

    :goto_18
    iget-object p1, v0, Lqlp;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lqlp;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v4, :cond_2a

    iget-object p0, v0, Lqlp;->t:Lcom/android/installreferrer/api/InstallReferrerClient;

    :try_start_26
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_29
    .catchall {:try_start_26 .. :try_end_29} :catchall_88

    goto :goto_7d

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/android/installreferrer/api/InstallReferrerClient;->newBuilder(Landroid/content/Context;)Lcom/android/installreferrer/api/InstallReferrerClient$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/installreferrer/api/InstallReferrerClient$Builder;->build()Lcom/android/installreferrer/api/InstallReferrerClient;

    move-result-object p0

    :try_start_3b
    iput-object p0, v0, Lqlp;->t:Lcom/android/installreferrer/api/InstallReferrerClient;

    iput v4, v0, Lqlp;->v:I

    new-instance p1, Lnh4;

    invoke-static {v0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v0

    invoke-direct {p1, v4, v0}, Lnh4;-><init>(ILmt5;)V

    invoke-virtual {p1}, Lnh4;->s()V
    :try_end_4b
    .catchall {:try_start_3b .. :try_end_4b} :catchall_88

    :try_start_4b
    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Ld7h;

    const/16 v2, 0x10

    invoke-direct {v0, p1, p0, v2}, Ld7h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lcom/android/installreferrer/api/InstallReferrerClient;->startConnection(Lcom/android/installreferrer/api/InstallReferrerStateListener;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_59
    .catchall {:try_start_4b .. :try_end_59} :catchall_5a

    goto :goto_63

    :catchall_5a
    move-exception v0

    :try_start_5b
    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v2

    :goto_63
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_74

    invoke-virtual {p1}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lc0f;

    if-eqz v0, :cond_74

    invoke-virtual {p1, v3}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_74
    invoke-virtual {p1}, Lnh4;->q()Ljava/lang/Object;

    move-result-object p1

    sget-object v0, Lpx5;->a:Lpx5;

    if-ne p1, v1, :cond_7d

    return-object v1

    :cond_7d
    :goto_7d
    check-cast p1, Lcom/android/installreferrer/api/ReferrerDetails;
    :try_end_7f
    .catchall {:try_start_5b .. :try_end_7f} :catchall_88

    :try_start_7f
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0}, Lcom/android/installreferrer/api/InstallReferrerClient;->endConnection()V
    :try_end_84
    .catchall {:try_start_7f .. :try_end_84} :catchall_85

    goto :goto_87

    :catchall_85
    sget-object p0, Lt0i;->b:Lp0i;

    :goto_87
    return-object p1

    :catchall_88
    move-exception p1

    :try_start_89
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0}, Lcom/android/installreferrer/api/InstallReferrerClient;->endConnection()V
    :try_end_8e
    .catchall {:try_start_89 .. :try_end_8e} :catchall_8f

    goto :goto_91

    :catchall_8f
    sget-object p0, Lt0i;->b:Lp0i;

    :goto_91
    throw p1
.end method
