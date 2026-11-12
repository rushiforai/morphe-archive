.class public final Lfvl;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lfvl;


# instance fields
.field public final a:I

.field public final b:F


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lfvl;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lfvl;-><init>(IF)V

    sput-object v0, Lfvl;->c:Lfvl;

    return-void
.end method

.method public constructor <init>(IF)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lfvl;->a:I

    iput p2, p0, Lfvl;->b:F

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget v0, p0, Lfvl;->a:I

    if-lez v0, :cond_d

    iget p0, p0, Lfvl;->b:F

    const/4 v0, 0x0

    cmpl-float p0, p0, v0

    if-lez p0, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lfvl;

    if-eqz v0, :cond_18

    check-cast p1, Lfvl;

    iget v0, p0, Lfvl;->a:I

    iget v1, p1, Lfvl;->a:I

    if-ne v0, v1, :cond_18

    iget p0, p0, Lfvl;->b:F

    iget p1, p1, Lfvl;->b:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lfvl;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lfvl;->b:F

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
