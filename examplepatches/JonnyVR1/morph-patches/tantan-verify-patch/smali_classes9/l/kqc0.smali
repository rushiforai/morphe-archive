.class public Ll/kqc0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:F

.field public static final b:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41800000    # 16.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    sput v0, Ll/kqc0;->a:F

    .line 9
    .line 10
    const/high16 v0, 0x41000000    # 8.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    sput v0, Ll/kqc0;->b:F

    .line 18
    .line 19
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

.method public static a(Landroid/view/View;Landroid/view/View;Z)Landroid/graphics/RectF;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    new-array v0, v0, [I

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    new-instance v3, Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    aget v5, v0, v4

    .line 31
    .line 32
    aget v4, v1, v4

    .line 33
    .line 34
    sub-int/2addr v5, v4

    .line 35
    const/4 v4, 0x1

    .line 36
    aget v0, v0, v4

    .line 37
    .line 38
    aget v1, v1, v4

    .line 39
    .line 40
    sub-int/2addr v0, v1

    .line 41
    add-int/2addr v2, v5

    .line 42
    add-int/2addr p1, v0

    .line 43
    int-to-float v1, v5

    .line 44
    int-to-float v4, v0

    .line 45
    int-to-float v2, v2

    .line 46
    int-to-float v5, p1

    .line 47
    invoke-virtual {v3, v1, v4, v2, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 48
    .line 49
    .line 50
    if-eqz p2, :cond_0

    .line 51
    .line 52
    sub-int p2, p0, v0

    .line 53
    .line 54
    sub-int/2addr p0, p1

    .line 55
    int-to-float p1, p2

    .line 56
    int-to-float p0, p0

    .line 57
    invoke-virtual {v3, v1, p1, v2, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-object v3
.end method
