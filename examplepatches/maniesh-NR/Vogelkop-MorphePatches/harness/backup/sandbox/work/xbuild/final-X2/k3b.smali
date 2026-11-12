.class public final Lk3b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:B

.field public final b:J

.field public final c:Z

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(IJLjava/lang/String;I)V
    .registers 7

    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_6

    const-wide/16 p2, 0x0

    :cond_6
    and-int/lit8 v0, p5, 0x4

    if-eqz v0, :cond_c

    const/4 v0, 0x0

    goto :goto_d

    :cond_c
    const/4 v0, 0x1

    :goto_d
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_13

    const-string p4, ""

    :cond_13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lk3b;->a:B

    iput-wide p2, p0, Lk3b;->b:J

    iput-boolean v0, p0, Lk3b;->c:Z

    iput-object p4, p0, Lk3b;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lk3b;

    if-eqz v0, :cond_26

    check-cast p1, Lk3b;

    iget-byte v0, p0, Lk3b;->a:B

    iget-byte v1, p1, Lk3b;->a:B

    if-ne v0, v1, :cond_26

    iget-wide v0, p0, Lk3b;->b:J

    iget-wide v2, p1, Lk3b;->b:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_26

    iget-boolean v0, p0, Lk3b;->c:Z

    iget-boolean v1, p1, Lk3b;->c:Z

    if-ne v0, v1, :cond_26

    iget-object p0, p0, Lk3b;->d:Ljava/lang/String;

    iget-object p1, p1, Lk3b;->d:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-byte v0, p0, Lk3b;->a:B

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lk3b;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-boolean v2, p0, Lk3b;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lk3b;->d:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
