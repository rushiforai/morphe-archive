.class public final Lgvl;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lgvl;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:F


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lgvl;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v1, v1}, Lgvl;-><init>(IFII)V

    sput-object v0, Lgvl;->e:Lgvl;

    return-void
.end method

.method public constructor <init>(IFII)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lgvl;->a:I

    iput p3, p0, Lgvl;->b:I

    iput p4, p0, Lgvl;->c:I

    iput p2, p0, Lgvl;->d:F

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget v0, p0, Lgvl;->a:I

    if-gtz v0, :cond_15

    iget v0, p0, Lgvl;->b:I

    if-gtz v0, :cond_c

    iget v0, p0, Lgvl;->c:I

    if-lez v0, :cond_13

    :cond_c
    iget p0, p0, Lgvl;->d:F

    const/4 v0, 0x0

    cmpl-float p0, p0, v0

    if-gtz p0, :cond_15

    :cond_13
    const/4 p0, 0x0

    return p0

    :cond_15
    const/4 p0, 0x1

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lgvl;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lgvl;

    iget v1, p0, Lgvl;->a:I

    iget v3, p1, Lgvl;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lgvl;->b:I

    iget v3, p1, Lgvl;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget v1, p0, Lgvl;->c:I

    iget v3, p1, Lgvl;->c:I

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget p0, p0, Lgvl;->d:F

    iget p1, p1, Lgvl;->d:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_2c

    return v2

    :cond_2c
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lgvl;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lgvl;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lgvl;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lgvl;->d:F

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
