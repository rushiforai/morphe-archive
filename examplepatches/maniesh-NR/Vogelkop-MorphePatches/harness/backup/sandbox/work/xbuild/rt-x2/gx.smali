.class public final Lgx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzw5;


# instance fields
.field public final a:Lzw5;

.field public final b:F


# direct methods
.method public constructor <init>(FLzw5;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :goto_3
    instance-of v0, p2, Lgx;

    if-eqz v0, :cond_12

    check-cast p2, Lgx;

    iget-object p2, p2, Lgx;->a:Lzw5;

    move-object v0, p2

    check-cast v0, Lgx;

    iget v0, v0, Lgx;->b:F

    add-float/2addr p1, v0

    goto :goto_3

    :cond_12
    iput-object p2, p0, Lgx;->a:Lzw5;

    iput p1, p0, Lgx;->b:F

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/RectF;)F
    .registers 3

    iget-object v0, p0, Lgx;->a:Lzw5;

    invoke-interface {v0, p1}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result p1

    iget p0, p0, Lgx;->b:F

    add-float/2addr p1, p0

    const/4 p0, 0x0

    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lgx;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lgx;

    iget-object v1, p0, Lgx;->a:Lzw5;

    iget-object v3, p1, Lgx;->a:Lzw5;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    iget p0, p0, Lgx;->b:F

    iget p1, p1, Lgx;->b:F

    cmpl-float p0, p0, p1

    if-nez p0, :cond_1f

    return v0

    :cond_1f
    return v2
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lgx;->b:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-object p0, p0, Lgx;->a:Lzw5;

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
