.class public final Lfyh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Luyg;

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(Luyg;II)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfyh;->a:Luyg;

    iput p2, p0, Lfyh;->b:I

    iput p3, p0, Lfyh;->c:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lfyh;

    if-eqz v0, :cond_1e

    check-cast p1, Lfyh;

    iget-object v0, p0, Lfyh;->a:Luyg;

    iget-object v1, p1, Lfyh;->a:Luyg;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget v0, p0, Lfyh;->b:I

    iget v1, p1, Lfyh;->b:I

    if-ne v0, v1, :cond_1e

    iget p0, p0, Lfyh;->c:I

    iget p1, p1, Lfyh;->c:I

    if-eq p0, p1, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lfyh;->a:Luyg;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lfyh;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lfyh;->c:I

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
