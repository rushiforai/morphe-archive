.class public final Lqtg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lqtg;->a:I

    iput p2, p0, Lqtg;->b:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_16

    instance-of v0, p1, Lqtg;

    if-eqz v0, :cond_14

    check-cast p1, Lqtg;

    iget v0, p0, Lqtg;->a:I

    iget v1, p1, Lqtg;->a:I

    if-ne v0, v1, :cond_14

    iget p0, p0, Lqtg;->b:I

    iget p1, p1, Lqtg;->b:I

    if-eq p0, p1, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Lqtg;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const v1, -0x79209ddf

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lqtg;->b:I

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
