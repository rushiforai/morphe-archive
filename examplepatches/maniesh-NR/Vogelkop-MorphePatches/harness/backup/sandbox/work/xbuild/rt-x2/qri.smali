.class public final Lqri;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:B

.field public final c:I

.field public final d:I

.field public final e:Z


# direct methods
.method public constructor <init>(IIIIZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lqri;->a:I

    iput-byte p2, p0, Lqri;->b:B

    iput p3, p0, Lqri;->c:I

    iput p4, p0, Lqri;->d:I

    iput-boolean p5, p0, Lqri;->e:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lqri;

    if-eqz v0, :cond_26

    check-cast p1, Lqri;

    iget v0, p0, Lqri;->a:I

    iget v1, p1, Lqri;->a:I

    if-ne v0, v1, :cond_26

    iget-byte v0, p0, Lqri;->b:B

    iget-byte v1, p1, Lqri;->b:B

    if-ne v0, v1, :cond_26

    iget v0, p0, Lqri;->c:I

    iget v1, p1, Lqri;->c:I

    if-ne v0, v1, :cond_26

    iget v0, p0, Lqri;->d:I

    iget v1, p1, Lqri;->d:I

    if-ne v0, v1, :cond_26

    iget-boolean p0, p0, Lqri;->e:Z

    iget-boolean p1, p1, Lqri;->e:Z

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

    iget v0, p0, Lqri;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-byte v2, p0, Lqri;->b:B

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lqri;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lqri;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean p0, p0, Lqri;->e:Z

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
