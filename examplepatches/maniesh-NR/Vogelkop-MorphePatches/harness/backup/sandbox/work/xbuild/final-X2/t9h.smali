.class public final Lt9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/CharSequence;


# instance fields
.field public final a:Lcsh;

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(Lcsh;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt9h;->a:Lcsh;

    const/16 v0, 0x1fff

    iput v0, p0, Lt9h;->c:I

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh1b;->u(I)La1b;

    move-result-object p1

    :goto_e
    invoke-virtual {p1}, Lq4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {p1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_e

    :cond_20
    iput v0, p0, Lt9h;->b:I

    return-void
.end method


# virtual methods
.method public final charAt(I)C
    .registers 4

    shr-int/lit8 v0, p1, 0xd

    iget-object v1, p0, Lt9h;->a:Lcsh;

    invoke-virtual {v1, v0}, Lcsh;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iget p0, p0, Lt9h;->c:I

    and-int/2addr p1, p0

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    return p0
.end method

.method public final length()I
    .registers 1

    iget p0, p0, Lt9h;->b:I

    return p0
.end method

.method public final subSequence(II)Ljava/lang/CharSequence;
    .registers 3

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lt9h;->b:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object p0, p0, Lt9h;->a:Lcsh;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lh1b;->u(I)La1b;

    move-result-object p0

    :goto_e
    invoke-virtual {p0}, Lq4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-virtual {p0}, Lq4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_e

    :cond_1e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
