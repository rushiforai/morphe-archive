.class public final Lc4c;
.super Lp37;
.source "SourceFile"


# instance fields
.field public final i:Z

.field public final j:I

.field public final k:I

.field public final l:Z


# direct methods
.method public constructor <init>(ZIIZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lc4c;->i:Z

    iput p2, p0, Lc4c;->j:I

    iput p3, p0, Lc4c;->k:I

    iput-boolean p4, p0, Lc4c;->l:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_22

    instance-of v0, p1, Lc4c;

    if-eqz v0, :cond_20

    check-cast p1, Lc4c;

    iget-boolean v0, p0, Lc4c;->i:Z

    iget-boolean v1, p1, Lc4c;->i:Z

    if-ne v0, v1, :cond_20

    iget v0, p0, Lc4c;->j:I

    iget v1, p1, Lc4c;->j:I

    if-ne v0, v1, :cond_20

    iget v0, p0, Lc4c;->k:I

    iget v1, p1, Lc4c;->k:I

    if-ne v0, v1, :cond_20

    iget-boolean p0, p0, Lc4c;->l:Z

    iget-boolean p1, p1, Lc4c;->l:Z

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

    iget-boolean v0, p0, Lc4c;->i:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lc4c;->j:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lc4c;->k:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean p0, p0, Lc4c;->l:Z

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
