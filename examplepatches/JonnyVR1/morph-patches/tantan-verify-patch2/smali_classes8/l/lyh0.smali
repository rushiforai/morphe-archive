.class public Ll/lyh0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[Ljava/lang/String;

.field public static final b:[Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const-string v10, "fonts/Semibold-Italic.ttf"

    .line 2
    .line 3
    const-string v11, "fonts/hyqiheidigit.ttf"

    .line 4
    .line 5
    const-string v0, "fonts/Roboto-Thin.ttf"

    .line 6
    .line 7
    const-string v1, "fonts/Roboto-Light.ttf"

    .line 8
    .line 9
    const-string v2, "fonts/Roboto-Regular.ttf"

    .line 10
    .line 11
    const-string v3, "fonts/Roboto-Medium.ttf"

    .line 12
    .line 13
    const-string v4, "fonts/Roboto-Bold.ttf"

    .line 14
    .line 15
    const-string v5, "fonts/Roboto-Black.ttf"

    .line 16
    .line 17
    const-string v6, "fonts/RobotoCondensed-Light.ttf"

    .line 18
    .line 19
    const-string v7, "fonts/RobotoCondensed-Regular.ttf"

    .line 20
    .line 21
    const-string v8, "fonts/RobotoCondensed-Bold.ttf"

    .line 22
    .line 23
    const-string v9, "fonts/Roboto-Italic.ttf"

    .line 24
    .line 25
    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/lyh0;->a:[Ljava/lang/String;

    .line 30
    .line 31
    array-length v0, v0

    .line 32
    new-array v0, v0, [Landroid/graphics/Typeface;

    .line 33
    .line 34
    sput-object v0, Ll/lyh0;->b:[Landroid/graphics/Typeface;

    .line 35
    .line 36
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

.method public static a(Landroid/widget/TextView;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_6

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ll/hhc0;->i5:[I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, p2, v1, v2, p3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v3, Ll/hhc0;->j5:I

    .line 19
    .line 20
    const/4 v4, -0x1

    .line 21
    invoke-virtual {v1, v3, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 26
    .line 27
    .line 28
    if-eq v3, v4, :cond_0

    .line 29
    .line 30
    sget-object v1, Ll/hhc0;->i5:[I

    .line 31
    .line 32
    invoke-virtual {v0, v3, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 38
    :goto_0
    const/4 v1, 0x2

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    move v4, v2

    .line 46
    :goto_1
    if-ge v4, v3, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    sget v6, Ll/hhc0;->p5:I

    .line 53
    .line 54
    if-ne v5, v6, :cond_1

    .line 55
    .line 56
    invoke-virtual {v0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 64
    .line 65
    .line 66
    :cond_3
    if-eqz p2, :cond_4

    .line 67
    .line 68
    sget-object v0, Ll/hhc0;->i5:[I

    .line 69
    .line 70
    invoke-virtual {p1, p2, v0, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget p2, Ll/hhc0;->p5:I

    .line 75
    .line 76
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 81
    .line 82
    .line 83
    :cond_4
    const/4 p1, 0x4

    .line 84
    if-ne v1, p1, :cond_5

    .line 85
    .line 86
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_5
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 97
    .line 98
    .line 99
    :goto_2
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaintFlags()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    or-int/lit16 p1, p1, 0x80

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 106
    .line 107
    .line 108
    :cond_6
    return-void
.end method

.method public static b(Landroid/widget/TextView;Landroid/content/Context;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static c(I)Landroid/graphics/Typeface;
    .locals 2

    .line 1
    sget-object v0, Ll/lyh0;->a:[Ljava/lang/String;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-lt p0, v1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    :cond_0
    aget-object p0, v0, p0

    .line 8
    .line 9
    invoke-static {p0}, Ll/myh0;->b(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
