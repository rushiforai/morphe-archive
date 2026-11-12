.class public final Lxxj;
.super Lj7h;
.source "SourceFile"


# instance fields
.field public final b:Llxh;

.field public final c:I

.field public final d:I

.field public final e:Lixh;


# direct methods
.method public constructor <init>(Llxh;II)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxxj;->b:Llxh;

    iput p2, p0, Lxxj;->c:I

    iput p3, p0, Lxxj;->d:I

    new-instance p1, Lixh;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lixh;-><init>(F)V

    iput-object p1, p0, Lxxj;->e:Lixh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lxxj;

    if-eqz v0, :cond_1e

    check-cast p1, Lxxj;

    iget-object v0, p0, Lxxj;->b:Llxh;

    iget-object v1, p1, Lxxj;->b:Llxh;

    invoke-virtual {v0, v1}, Llxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget v0, p0, Lxxj;->c:I

    iget v1, p1, Lxxj;->c:I

    if-ne v0, v1, :cond_1e

    iget p0, p0, Lxxj;->d:I

    iget p1, p1, Lxxj;->d:I

    if-eq p0, p1, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final f()Lb8h;
    .registers 1

    iget-object p0, p0, Lxxj;->b:Llxh;

    return-object p0
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final h()Lixh;
    .registers 1

    iget-object p0, p0, Lxxj;->e:Lixh;

    return-object p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lxxj;->b:Llxh;

    iget v0, v0, Llxh;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lxxj;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lxxj;->d:I

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
