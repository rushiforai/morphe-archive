.class public final synthetic Lfkn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:F

.field public final synthetic b:F

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(FFF)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lfkn;->a:F

    iput p2, p0, Lfkn;->b:F

    iput p3, p0, Lfkn;->c:F

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p1}, Ljkn;->b(Landroid/graphics/Bitmap;)Likn;

    move-result-object v0

    iget v1, p0, Lfkn;->a:F

    const/high16 v2, 0x42740000    # 61.0f

    mul-float/2addr v1, v2

    float-to-double v3, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v1, v3

    const/4 v3, 0x0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/16 v4, 0x3d

    if-eqz v1, :cond_25

    if-ge v1, v4, :cond_25

    invoke-static {p1, v3, v4, v1}, Ljkn;->a(Landroid/graphics/Bitmap;III)[Lhkn;

    move-result-object v5

    invoke-static {v5}, Ljkn;->c([Lhkn;)Likn;

    move-result-object v5

    goto :goto_26

    :cond_25
    move-object v5, v0

    :goto_26
    iget v6, p0, Lfkn;->b:F

    mul-float/2addr v6, v2

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    if-eqz v6, :cond_46

    if-ge v6, v4, :cond_46

    rsub-int/lit8 v7, v6, 0x3d

    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p1, v1, v4, v6}, Ljkn;->a(Landroid/graphics/Bitmap;III)[Lhkn;

    move-result-object v1

    invoke-static {v1}, Ljkn;->c([Lhkn;)Likn;

    move-result-object v1

    goto :goto_47

    :cond_46
    move-object v1, v0

    :goto_47
    iget p0, p0, Lfkn;->c:F

    mul-float/2addr p0, v2

    float-to-double v6, p0

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int p0, v6

    invoke-static {v3, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    if-eqz p0, :cond_63

    if-ge p0, v4, :cond_63

    rsub-int/lit8 v2, p0, 0x3d

    invoke-static {p1, v2, v4, p0}, Ljkn;->a(Landroid/graphics/Bitmap;III)[Lhkn;

    move-result-object p0

    invoke-static {p0}, Ljkn;->c([Lhkn;)Likn;

    move-result-object p0

    goto :goto_64

    :cond_63
    move-object p0, v0

    :goto_64
    new-instance p1, Lgkn;

    invoke-direct {p1, v5, v1, v0, p0}, Lgkn;-><init>(Likn;Likn;Likn;Likn;)V

    return-object p1
.end method
