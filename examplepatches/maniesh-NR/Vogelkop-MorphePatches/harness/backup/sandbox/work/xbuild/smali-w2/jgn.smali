.class public final Ljgn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:I

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(IZZII)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Ljgn;->a:Z

    iput-boolean p3, p0, Ljgn;->b:Z

    iput p1, p0, Ljgn;->c:I

    iput p4, p0, Ljgn;->d:I

    iput p5, p0, Ljgn;->e:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Ljgn;

    if-eqz v0, :cond_26

    check-cast p1, Ljgn;

    iget-boolean v0, p0, Ljgn;->a:Z

    iget-boolean v1, p1, Ljgn;->a:Z

    if-ne v0, v1, :cond_26

    iget-boolean v0, p0, Ljgn;->b:Z

    iget-boolean v1, p1, Ljgn;->b:Z

    if-ne v0, v1, :cond_26

    iget v0, p0, Ljgn;->c:I

    iget v1, p1, Ljgn;->c:I

    if-ne v0, v1, :cond_26

    iget v0, p0, Ljgn;->d:I

    iget v1, p1, Ljgn;->d:I

    if-ne v0, v1, :cond_26

    iget p0, p0, Ljgn;->e:I

    iget p1, p1, Ljgn;->e:I

    if-eq p0, p1, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Ljgn;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Ljgn;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget v2, p0, Ljgn;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ljgn;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Ljgn;->e:I

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
