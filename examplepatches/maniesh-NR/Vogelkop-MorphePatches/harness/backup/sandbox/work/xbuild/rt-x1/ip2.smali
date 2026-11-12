.class public final Lip2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/CharSequence;

.field public b:Ljava/lang/CharSequence;

.field public c:I

.field public d:I


# direct methods
.method public static e(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    .registers 4

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-le p1, p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final a(Lip2;)V
    .registers 5

    iget-object v0, p1, Lip2;->a:Ljava/lang/CharSequence;

    iget-object v1, p1, Lip2;->b:Ljava/lang/CharSequence;

    iget v2, p1, Lip2;->c:I

    iget p1, p1, Lip2;->d:I

    invoke-virtual {p0, v2, p1, v0, v1}, Lip2;->f(IILjava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final b()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lip2;->b:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final c()Z
    .registers 1

    iget-object p0, p0, Lip2;->b:Ljava/lang/CharSequence;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final d()Z
    .registers 3

    iget v0, p0, Lip2;->c:I

    iget-object v1, p0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ne v0, v1, :cond_16

    iget v0, p0, Lip2;->d:I

    iget-object p0, p0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-ne v0, p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    instance-of v0, p1, Lip2;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    const/4 v0, 0x1

    if-ne p1, p0, :cond_a

    return v0

    :cond_a
    check-cast p1, Lip2;

    iget-object v2, p0, Lip2;->a:Ljava/lang/CharSequence;

    iget-object v3, p1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget-object v2, p0, Lip2;->b:Ljava/lang/CharSequence;

    iget-object v3, p1, Lip2;->b:Ljava/lang/CharSequence;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget v2, p0, Lip2;->c:I

    iget v3, p1, Lip2;->c:I

    if-ne v2, v3, :cond_2d

    iget p0, p0, Lip2;->d:I

    iget p1, p1, Lip2;->d:I

    if-ne p0, p1, :cond_2d

    return v0

    :cond_2d
    return v1
.end method

.method public final f(IILjava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 6

    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iput-object v0, p0, Lip2;->a:Ljava/lang/CharSequence;

    new-instance p3, Landroid/text/SpannableString;

    invoke-direct {p3, p4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iput-object p3, p0, Lip2;->b:Ljava/lang/CharSequence;

    iput p1, p0, Lip2;->c:I

    iput p2, p0, Lip2;->d:I

    return-void
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lip2;->b:Ljava/lang/CharSequence;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    add-int/2addr v1, v0

    iget v0, p0, Lip2;->c:I

    mul-int/lit8 v0, v0, 0x5

    add-int/2addr v0, v1

    iget p0, p0, Lip2;->d:I

    mul-int/lit8 p0, p0, 0x7

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
