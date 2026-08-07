.class public Ll/jde;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/h1e0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jde$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jde$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jde;->a:Ll/h1e0;

    .line 7
    .line 8
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

.method public static a(DDDLandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/Drawable;
    .locals 11

    .line 1
    const-wide v0, 0x408f400000000000L    # 1000.0

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    mul-double/2addr p0, v0

    .line 7
    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    double-to-int p0, p0

    .line 12
    add-int/lit16 p1, p0, 0x3e8

    .line 13
    .line 14
    new-array p1, p1, [I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    move v1, v0

    .line 18
    :goto_0
    const-wide v2, 0x406fe00000000000L    # 255.0

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    if-ge v1, p0, :cond_0

    .line 24
    .line 25
    mul-double/2addr v2, p2

    .line 26
    double-to-int v2, v2

    .line 27
    invoke-static {v2, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    aput v2, p1, v1

    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v1, v0

    .line 37
    :goto_1
    const/16 v4, 0x3e8

    .line 38
    .line 39
    if-ge v1, v4, :cond_1

    .line 40
    .line 41
    add-int v4, v1, p0

    .line 42
    .line 43
    int-to-double v5, v1

    .line 44
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 45
    .line 46
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 47
    .line 48
    .line 49
    move-result-wide v5

    .line 50
    sub-double v9, p4, p2

    .line 51
    .line 52
    mul-double/2addr v5, v9

    .line 53
    const-wide v9, 0x408f380000000000L    # 999.0

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 59
    .line 60
    .line 61
    move-result-wide v7

    .line 62
    div-double/2addr v5, v7

    .line 63
    add-double/2addr v5, p2

    .line 64
    mul-double/2addr v5, v2

    .line 65
    double-to-int v5, v5

    .line 66
    invoke-static {v5, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    aput v5, p1, v4

    .line 71
    .line 72
    add-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 76
    .line 77
    move-object/from16 v0, p6

    .line 78
    .line 79
    invoke-direct {p0, v0, p1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 80
    .line 81
    .line 82
    return-object p0
.end method

.method public static b(IF)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/drawable/PaintDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/PaintDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/PaintDrawable;->setCornerRadius(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static c(I[F)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/drawable/PaintDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/PaintDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/PaintDrawable;->setCornerRadii([F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
