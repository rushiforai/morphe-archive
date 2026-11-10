.class public final Ld0/a;
.super Lc0/a;
.source "SourceFile"


# virtual methods
.method public final a()Ljava/util/Random;
    .locals 2

    invoke-static {}, Ljava/util/concurrent/ThreadLocalRandom;->current()Ljava/util/concurrent/ThreadLocalRandom;

    move-result-object v0

    const-string v1, "current()"

    invoke-static {v0, v1}, Lb0/c;->d(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
