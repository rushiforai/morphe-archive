.class public final Lx4l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;J)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx4l;->a:Ljava/lang/String;

    iput-object p3, p0, Lx4l;->b:Ljava/lang/String;

    iput-wide p4, p0, Lx4l;->c:J

    iput p2, p0, Lx4l;->d:I

    return-void
.end method


# virtual methods
.method public final a()Landroid/net/Uri;
    .registers 4

    iget-object v0, p0, Lx4l;->b:Ljava/lang/String;

    if-eqz v0, :cond_2b

    invoke-static {v0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2b

    const-string v1, "/"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_18

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_18
    iget-object p0, p0, Lx4l;->a:Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_2b
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b()Z
    .registers 7

    sget-object v0, La5l;->l:Lgpk;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lx4l;->b:Ljava/lang/String;

    if-eqz v2, :cond_d

    sget-wide v2, La5l;->k:J

    goto :goto_1f

    :cond_d
    iget v2, p0, Lx4l;->d:I

    and-int/lit8 v3, v2, 0x1

    if-eqz v3, :cond_16

    sget-wide v2, La5l;->h:J

    goto :goto_1f

    :cond_16
    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_1d

    sget-wide v2, La5l;->i:J

    goto :goto_1f

    :cond_1d
    sget-wide v2, La5l;->j:J

    :goto_1f
    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    iget-wide v4, p0, Lx4l;->c:J

    add-long/2addr v2, v4

    cmp-long p0, v0, v2

    if-lez p0, :cond_2c

    const/4 p0, 0x1

    return p0

    :cond_2c
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lx4l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lx4l;

    iget-object v1, p0, Lx4l;->a:Ljava/lang/String;

    iget-object v3, p1, Lx4l;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lx4l;->b:Ljava/lang/String;

    iget-object v3, p1, Lx4l;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-wide v3, p0, Lx4l;->c:J

    iget-wide v5, p1, Lx4l;->c:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_2b

    return v2

    :cond_2b
    iget p0, p0, Lx4l;->d:I

    iget p1, p1, Lx4l;->d:I

    if-eq p0, p1, :cond_32

    return v2

    :cond_32
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lx4l;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lx4l;->b:Ljava/lang/String;

    if-nez v2, :cond_f

    const/4 v2, 0x0

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lx4l;->c:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget p0, p0, Lx4l;->d:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
