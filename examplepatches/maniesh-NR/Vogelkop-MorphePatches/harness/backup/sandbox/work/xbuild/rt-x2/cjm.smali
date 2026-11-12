.class public final Lcjm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Z


# direct methods
.method public constructor <init>(IZ)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcjm;->a:I

    iput-boolean p2, p0, Lcjm;->b:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcjm;

    if-eqz v1, :cond_16

    check-cast p1, Lcjm;

    iget v1, p0, Lcjm;->a:I

    iget v2, p1, Lcjm;->a:I

    if-ne v1, v2, :cond_16

    iget-boolean p0, p0, Lcjm;->b:Z

    iget-boolean p1, p1, Lcjm;->b:Z

    if-eq p0, p1, :cond_18

    :cond_16
    const/4 p0, 0x0

    return p0

    :cond_18
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lcjm;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lcjm;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x1003

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
