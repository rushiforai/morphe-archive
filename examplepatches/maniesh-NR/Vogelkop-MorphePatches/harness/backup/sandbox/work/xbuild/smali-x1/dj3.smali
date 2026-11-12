.class public final Ldj3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lsj3;

.field public final c:Ljava/lang/String;

.field public final d:J

.field public final e:J

.field public final f:I

.field public final g:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lsj3;Ljava/lang/String;JJIZ)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldj3;->a:Ljava/lang/String;

    iput-object p2, p0, Ldj3;->b:Lsj3;

    iput-object p3, p0, Ldj3;->c:Ljava/lang/String;

    iput-wide p4, p0, Ldj3;->d:J

    iput-wide p6, p0, Ldj3;->e:J

    iput p8, p0, Ldj3;->f:I

    iput-boolean p9, p0, Ldj3;->g:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ldj3;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ldj3;

    iget-object v1, p0, Ldj3;->a:Ljava/lang/String;

    iget-object v3, p1, Ldj3;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ldj3;->b:Lsj3;

    iget-object v3, p1, Ldj3;->b:Lsj3;

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Ldj3;->c:Ljava/lang/String;

    iget-object v3, p1, Ldj3;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-wide v3, p0, Ldj3;->d:J

    iget-wide v5, p1, Ldj3;->d:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_32

    return v2

    :cond_32
    iget-wide v3, p0, Ldj3;->e:J

    iget-wide v5, p1, Ldj3;->e:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_3b

    return v2

    :cond_3b
    iget v1, p0, Ldj3;->f:I

    iget v3, p1, Ldj3;->f:I

    if-eq v1, v3, :cond_42

    return v2

    :cond_42
    iget-boolean p0, p0, Ldj3;->g:Z

    iget-boolean p1, p1, Ldj3;->g:Z

    if-eq p0, p1, :cond_49

    return v2

    :cond_49
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Ldj3;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ldj3;->b:Lsj3;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ldj3;->c:Ljava/lang/String;

    invoke-static {v2, v1, v0}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-wide v2, p0, Ldj3;->d:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v2, p0, Ldj3;->e:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget v2, p0, Ldj3;->f:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean p0, p0, Ldj3;->g:Z

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
