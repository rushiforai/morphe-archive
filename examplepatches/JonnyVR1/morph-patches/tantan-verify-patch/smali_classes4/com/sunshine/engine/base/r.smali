.class public Lcom/sunshine/engine/base/r;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sunshine/engine/base/r$b;,
        Lcom/sunshine/engine/base/r$a;
    }
.end annotation


# static fields
.field public static final a:Landroid/graphics/Paint;

.field private static final b:Landroid/graphics/PaintFlagsDrawFilter;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/sunshine/engine/base/r;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    new-instance v1, Landroid/graphics/PaintFlagsDrawFilter;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x3

    .line 12
    invoke-direct {v1, v2, v3}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 13
    .line 14
    .line 15
    sput-object v1, Lcom/sunshine/engine/base/r;->b:Landroid/graphics/PaintFlagsDrawFilter;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V
    .locals 4

    .line 1
    iget v0, p3, Ll/cce;->d:F

    .line 2
    .line 3
    invoke-static {v0}, Ll/a2j0;->e(F)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p3, Ll/cce;->d:F

    .line 14
    .line 15
    iget-object v2, p3, Ll/cce;->e:Landroid/graphics/PointF;

    .line 16
    .line 17
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 18
    .line 19
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 20
    .line 21
    invoke-virtual {p0, v1, v3, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, p1, p2, p3}, Lcom/sunshine/engine/base/r;->c(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/sunshine/engine/base/r;->c(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static b(Landroid/graphics/Canvas;Lcom/sunshine/engine/base/r$a;FLcom/sunshine/engine/base/a;)V
    .locals 4

    .line 1
    iget-object v0, p3, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 2
    .line 3
    iget v0, v0, Ll/cce;->d:F

    .line 4
    .line 5
    invoke-static {v0}, Ll/a2j0;->e(F)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p3, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 16
    .line 17
    iget v2, v1, Ll/cce;->d:F

    .line 18
    .line 19
    iget-object v1, v1, Ll/cce;->e:Landroid/graphics/PointF;

    .line 20
    .line 21
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 22
    .line 23
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    invoke-virtual {p0, v2, v3, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0, p1, p2, p3}, Lcom/sunshine/engine/base/r;->d(Landroid/graphics/Canvas;Lcom/sunshine/engine/base/r$a;FLcom/sunshine/engine/base/a;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/sunshine/engine/base/r;->d(Landroid/graphics/Canvas;Lcom/sunshine/engine/base/r$a;FLcom/sunshine/engine/base/a;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private static c(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/sunshine/engine/base/r;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p3, Ll/cce;->f:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    iget-object p3, p3, Ll/cce;->c:Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 11
    .line 12
    .line 13
    const/16 p0, 0xff

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private static d(Landroid/graphics/Canvas;Lcom/sunshine/engine/base/r$a;FLcom/sunshine/engine/base/a;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/sunshine/engine/base/r$a;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object v1, p3, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 4
    .line 5
    iget v1, v1, Ll/cce;->f:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 8
    .line 9
    .line 10
    instance-of v0, p1, Lcom/sunshine/engine/base/r$b;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    check-cast p1, Lcom/sunshine/engine/base/r$b;

    .line 15
    .line 16
    iget-object v0, p3, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 17
    .line 18
    iget-object v0, v0, Ll/cce;->c:Landroid/graphics/RectF;

    .line 19
    .line 20
    iget p3, p3, Lcom/sunshine/engine/base/a;->g:F

    .line 21
    .line 22
    invoke-virtual {p1, p0, p2, v0, p3}, Lcom/sunshine/engine/base/r$b;->a(Landroid/graphics/Canvas;FLandroid/graphics/RectF;F)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static e(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/sunshine/engine/base/r;->b:Landroid/graphics/PaintFlagsDrawFilter;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
