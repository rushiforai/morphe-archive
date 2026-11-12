.class public final Luyl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:I

.field public final c:Z

.field public final d:I


# direct methods
.method public constructor <init>(IIZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p3, p0, Luyl;->a:Z

    iput p1, p0, Luyl;->b:I

    iput-boolean p4, p0, Luyl;->c:Z

    iput p2, p0, Luyl;->d:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_22

    instance-of v0, p1, Luyl;

    if-eqz v0, :cond_20

    check-cast p1, Luyl;

    iget-boolean v0, p0, Luyl;->a:Z

    iget-boolean v1, p1, Luyl;->a:Z

    if-ne v0, v1, :cond_20

    iget v0, p0, Luyl;->b:I

    iget v1, p1, Luyl;->b:I

    if-ne v0, v1, :cond_20

    iget-boolean v0, p0, Luyl;->c:Z

    iget-boolean v1, p1, Luyl;->c:Z

    if-ne v0, v1, :cond_20

    iget p0, p0, Luyl;->d:I

    iget p1, p1, Luyl;->d:I

    if-eq p0, p1, :cond_22

    :cond_20
    const/4 p0, 0x0

    return p0

    :cond_22
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Luyl;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Luyl;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Luyl;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget p0, p0, Luyl;->d:I

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
