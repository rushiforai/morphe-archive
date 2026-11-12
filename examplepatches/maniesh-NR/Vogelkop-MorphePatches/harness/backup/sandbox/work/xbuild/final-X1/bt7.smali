.class public final Lbt7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Z

.field public final c:I

.field public final d:Lnil;

.field public final e:Z

.field public final f:I


# direct methods
.method public constructor <init>(IZILnil;ZI)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lbt7;->a:I

    iput-boolean p2, p0, Lbt7;->b:Z

    iput p3, p0, Lbt7;->c:I

    iput-object p4, p0, Lbt7;->d:Lnil;

    iput-boolean p5, p0, Lbt7;->e:Z

    iput p6, p0, Lbt7;->f:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lbt7;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lbt7;

    iget v1, p0, Lbt7;->a:I

    iget v3, p1, Lbt7;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-boolean v1, p0, Lbt7;->b:Z

    iget-boolean v3, p1, Lbt7;->b:Z

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget v1, p0, Lbt7;->c:I

    iget v3, p1, Lbt7;->c:I

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget-object v1, p0, Lbt7;->d:Lnil;

    iget-object v3, p1, Lbt7;->d:Lnil;

    if-eq v1, v3, :cond_28

    return v2

    :cond_28
    iget-boolean v1, p0, Lbt7;->e:Z

    iget-boolean v3, p1, Lbt7;->e:Z

    if-eq v1, v3, :cond_2f

    return v2

    :cond_2f
    iget p0, p0, Lbt7;->f:I

    iget p1, p1, Lbt7;->f:I

    if-eq p0, p1, :cond_36

    return v2

    :cond_36
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lbt7;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lbt7;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget v2, p0, Lbt7;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lbt7;->d:Lnil;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lbt7;->e:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget p0, p0, Lbt7;->f:I

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
