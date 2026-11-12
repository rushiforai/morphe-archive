.class public final Lri5;
.super Lta6;
.source "SourceFile"


# instance fields
.field public d:J


# virtual methods
.method public final c()Z
    .registers 5

    iget-wide v0, p0, Lri5;->d:J

    const-wide/16 v2, 0x1

    cmp-long p0, v0, v2

    if-gez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method
