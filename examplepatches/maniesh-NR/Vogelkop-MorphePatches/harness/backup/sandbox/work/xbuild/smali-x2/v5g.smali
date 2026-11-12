.class public final Lv5g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:I

.field public c:Ly2b;


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1c

    instance-of v0, p1, Lv5g;

    if-eqz v0, :cond_1a

    check-cast p1, Lv5g;

    iget-boolean v0, p0, Lv5g;->a:Z

    iget-boolean v1, p1, Lv5g;->a:Z

    if-ne v0, v1, :cond_1a

    iget v0, p0, Lv5g;->b:I

    iget v1, p1, Lv5g;->b:I

    if-ne v0, v1, :cond_1a

    iget-object p0, p0, Lv5g;->c:Ly2b;

    iget-object p1, p1, Lv5g;->c:Ly2b;

    if-eq p0, p1, :cond_1c

    :cond_1a
    const/4 p0, 0x0

    return p0

    :cond_1c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lv5g;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lv5g;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lv5g;->c:Ly2b;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
