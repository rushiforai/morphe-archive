.class public final Likn;
.super Lv0g;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:F

.field public final c:F


# direct methods
.method public constructor <init>(IFF)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Likn;->a:I

    iput p2, p0, Likn;->b:F

    iput p3, p0, Likn;->c:F

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Likn;

    if-eqz v0, :cond_22

    check-cast p1, Likn;

    iget v0, p0, Likn;->a:I

    iget v1, p1, Likn;->a:I

    if-ne v0, v1, :cond_22

    iget v0, p0, Likn;->b:F

    iget v1, p1, Likn;->b:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_22

    iget p0, p0, Likn;->c:F

    iget p1, p1, Likn;->c:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-nez p0, :cond_22

    const/4 p0, 0x1

    return p0

    :cond_22
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Likn;->a:I

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Likn;->b:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget p0, p0, Likn;->c:F

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
