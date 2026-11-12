.class public final Lqp3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lqp3;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:F


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lqp3;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v1, v2}, Lqp3;-><init>(IIF)V

    sput-object v0, Lqp3;->d:Lqp3;

    return-void
.end method

.method public constructor <init>(IIF)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lqp3;->a:I

    iput p2, p0, Lqp3;->b:I

    iput p3, p0, Lqp3;->c:F

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget v0, p0, Lqp3;->a:I

    if-gtz v0, :cond_8

    iget v0, p0, Lqp3;->b:I

    if-lez v0, :cond_11

    :cond_8
    iget p0, p0, Lqp3;->c:F

    const/4 v0, 0x0

    cmpl-float p0, p0, v0

    if-lez p0, :cond_11

    const/4 p0, 0x1

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lqp3;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lqp3;

    iget v1, p0, Lqp3;->a:I

    iget v3, p1, Lqp3;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lqp3;->b:I

    iget v3, p1, Lqp3;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget p0, p0, Lqp3;->c:F

    iget p1, p1, Lqp3;->c:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_25

    return v2

    :cond_25
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lqp3;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lqp3;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lqp3;->c:F

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
