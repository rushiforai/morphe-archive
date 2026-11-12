.class public final Lts4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lsj3;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:J

.field public final f:Z


# direct methods
.method public constructor <init>(Lsj3;Ljava/lang/String;Ljava/lang/String;IJZ)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lts4;->a:Lsj3;

    iput-object p2, p0, Lts4;->b:Ljava/lang/String;

    iput-object p3, p0, Lts4;->c:Ljava/lang/String;

    iput p4, p0, Lts4;->d:I

    iput-wide p5, p0, Lts4;->e:J

    iput-boolean p7, p0, Lts4;->f:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lts4;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lts4;

    iget-object v1, p0, Lts4;->a:Lsj3;

    iget-object v3, p1, Lts4;->a:Lsj3;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lts4;->b:Ljava/lang/String;

    iget-object v3, p1, Lts4;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lts4;->c:Ljava/lang/String;

    iget-object v3, p1, Lts4;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget v1, p0, Lts4;->d:I

    iget v3, p1, Lts4;->d:I

    if-eq v1, v3, :cond_30

    return v2

    :cond_30
    iget-wide v3, p0, Lts4;->e:J

    iget-wide v5, p1, Lts4;->e:J

    invoke-static {v3, v4, v5, v6}, Lpn7;->e(JJ)Z

    move-result v1

    if-nez v1, :cond_3b

    return v2

    :cond_3b
    iget-boolean p0, p0, Lts4;->f:Z

    iget-boolean p1, p1, Lts4;->f:Z

    if-eq p0, p1, :cond_42

    return v2

    :cond_42
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lts4;->a:Lsj3;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lts4;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lts4;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Lts4;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    sget-object v2, Lpn7;->b:Lon7;

    iget-wide v2, p0, Lts4;->e:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-boolean p0, p0, Lts4;->f:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
