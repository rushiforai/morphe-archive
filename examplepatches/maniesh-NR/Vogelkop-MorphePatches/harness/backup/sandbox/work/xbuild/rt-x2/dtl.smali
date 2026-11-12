.class public final Ldtl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:Z


# direct methods
.method public constructor <init>()V
    .registers 9

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    .line 18
    invoke-direct/range {v0 .. v7}, Ldtl;-><init>(IIZIIII)V

    return-void
.end method

.method public constructor <init>(IIZIIII)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ldtl;->a:I

    iput p2, p0, Ldtl;->b:I

    iput p4, p0, Ldtl;->c:I

    iput p5, p0, Ldtl;->d:I

    iput p6, p0, Ldtl;->e:I

    iput p7, p0, Ldtl;->f:I

    iput-boolean p3, p0, Ldtl;->g:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ldtl;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ldtl;

    iget v1, p0, Ldtl;->a:I

    iget v3, p1, Ldtl;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Ldtl;->b:I

    iget v3, p1, Ldtl;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget v1, p0, Ldtl;->c:I

    iget v3, p1, Ldtl;->c:I

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget v1, p0, Ldtl;->d:I

    iget v3, p1, Ldtl;->d:I

    if-eq v1, v3, :cond_28

    return v2

    :cond_28
    iget v1, p0, Ldtl;->e:I

    iget v3, p1, Ldtl;->e:I

    if-eq v1, v3, :cond_2f

    return v2

    :cond_2f
    iget v1, p0, Ldtl;->f:I

    iget v3, p1, Ldtl;->f:I

    if-eq v1, v3, :cond_36

    return v2

    :cond_36
    iget-boolean p0, p0, Ldtl;->g:Z

    iget-boolean p1, p1, Ldtl;->g:Z

    if-ne p0, p1, :cond_3d

    return v0

    :cond_3d
    return v2
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Ldtl;->a:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Ldtl;->b:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Ldtl;->c:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Ldtl;->d:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Ldtl;->e:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Ldtl;->f:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Ldtl;->g:Z

    add-int/2addr v0, p0

    return v0
.end method
