.class public final Lap;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:D


# direct methods
.method public constructor <init>(IID)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lap;->a:I

    iput p2, p0, Lap;->b:I

    iput-wide p3, p0, Lap;->c:D

    return-void
.end method

.method public static a(D)Lap;
    .registers 5

    new-instance v0, Lap;

    const-wide/high16 v1, 0x4059000000000000L    # 100.0

    mul-double/2addr v1, p0

    double-to-int v1, v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0, p1}, Lap;-><init>(IID)V

    return-object v0
.end method

.method public static b(II)Lap;
    .registers 5

    new-instance v0, Lap;

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-direct {v0, p0, p1, v1, v2}, Lap;-><init>(IID)V

    return-object v0
.end method


# virtual methods
.method public final c()F
    .registers 5

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iget-wide v2, p0, Lap;->c:D

    cmpl-double v0, v2, v0

    if-nez v0, :cond_f

    iget p0, p0, Lap;->a:I

    int-to-float p0, p0

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p0, v0

    return p0

    :cond_f
    double-to-float p0, v2

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_1b

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lap;

    if-ne v1, v2, :cond_1b

    check-cast p1, Lap;

    iget v1, p1, Lap;->a:I

    iget v2, p0, Lap;->a:I

    if-ne v1, v2, :cond_1b

    iget p1, p1, Lap;->b:I

    iget p0, p0, Lap;->b:I

    if-ne p1, p0, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_1b
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lap;->a:I

    iget p0, p0, Lap;->b:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
