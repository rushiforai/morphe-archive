.class public final Lvc8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:J

.field public final e:Ljava/lang/String;

.field public final f:D

.field public final g:I

.field public final h:Ljava/lang/String;

.field public final i:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;DILjava/lang/String;I)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvc8;->a:Ljava/lang/String;

    iput-object p2, p0, Lvc8;->b:Ljava/lang/String;

    iput-object p3, p0, Lvc8;->c:Ljava/lang/String;

    iput-wide p4, p0, Lvc8;->d:J

    iput-object p6, p0, Lvc8;->e:Ljava/lang/String;

    iput-wide p7, p0, Lvc8;->f:D

    iput p9, p0, Lvc8;->g:I

    iput-object p10, p0, Lvc8;->h:Ljava/lang/String;

    iput p11, p0, Lvc8;->i:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lvc8;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lvc8;

    iget-object v1, p0, Lvc8;->a:Ljava/lang/String;

    iget-object v3, p1, Lvc8;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lvc8;->b:Ljava/lang/String;

    iget-object v3, p1, Lvc8;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lvc8;->c:Ljava/lang/String;

    iget-object v3, p1, Lvc8;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-wide v3, p0, Lvc8;->d:J

    iget-wide v5, p1, Lvc8;->d:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_36

    return v2

    :cond_36
    iget-object v1, p0, Lvc8;->e:Ljava/lang/String;

    iget-object v3, p1, Lvc8;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_41

    return v2

    :cond_41
    iget-wide v3, p0, Lvc8;->f:D

    iget-wide v5, p1, Lvc8;->f:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_4c

    return v2

    :cond_4c
    iget v1, p0, Lvc8;->g:I

    iget v3, p1, Lvc8;->g:I

    if-eq v1, v3, :cond_53

    return v2

    :cond_53
    iget-object v1, p0, Lvc8;->h:Ljava/lang/String;

    iget-object v3, p1, Lvc8;->h:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5e

    return v2

    :cond_5e
    iget p0, p0, Lvc8;->i:I

    iget p1, p1, Lvc8;->i:I

    if-eq p0, p1, :cond_65

    return v2

    :cond_65
    return v0
.end method

.method public final hashCode()I
    .registers 6

    iget-object v0, p0, Lvc8;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lvc8;->b:Ljava/lang/String;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lvc8;->c:Ljava/lang/String;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-wide v3, p0, Lvc8;->d:J

    invoke-static {v0, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object v3, p0, Lvc8;->e:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-wide v3, p0, Lvc8;->f:D

    invoke-static {v3, v4}, Ljava/lang/Double;->hashCode(D)I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget v0, p0, Lvc8;->g:I

    invoke-static {v0, v3, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v3, p0, Lvc8;->h:Ljava/lang/String;

    if-eqz v3, :cond_44

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_44
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget p0, p0, Lvc8;->i:I

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
