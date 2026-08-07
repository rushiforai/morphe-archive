.class public final Ll/gae;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010\u0007\n\u0002\u0008\t\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J1\u0010\u000c\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\nH\u0007\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\'\u0010\u0010\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000e\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\nH\u0007\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J)\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0016\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u0012H\u0007\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u0018\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u0012H\u0007\u00a2\u0006\u0004\u0008\u0018\u0010\u0017J\u001f\u0010\u0019\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/gae;",
        "",
        "<init>",
        "()V",
        "Ll/qmd0;",
        "rotationOptions",
        "Ll/q3d0;",
        "resizeOptions",
        "Ll/n0f;",
        "encodedImage",
        "",
        "maxBitmapDimension",
        "b",
        "(Ll/qmd0;Ll/q3d0;Ll/n0f;I)I",
        "pixelSize",
        "maxBitmapSizeInBytes",
        "c",
        "(Ll/n0f;II)I",
        "",
        "a",
        "(Ll/qmd0;Ll/q3d0;Ll/n0f;)F",
        "ratio",
        "e",
        "(F)I",
        "f",
        "d",
        "(Ll/qmd0;Ll/n0f;)I",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/gae;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/gae;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gae;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gae;->INSTANCE:Ll/gae;

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

.method public static final a(Ll/qmd0;Ll/q3d0;Ll/n0f;)F
    .locals 11
    .param p0    # Ll/qmd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ll/q3d0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/n0f;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Ll/n0f;->Z(Ll/n0f;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_6

    .line 12
    .line 13
    if-eqz p1, :cond_5

    .line 14
    .line 15
    iget v0, p1, Ll/q3d0;->b:I

    .line 16
    .line 17
    if-lez v0, :cond_5

    .line 18
    .line 19
    iget v0, p1, Ll/q3d0;->a:I

    .line 20
    .line 21
    if-lez v0, :cond_5

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/n0f;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_5

    .line 28
    .line 29
    invoke-virtual {p2}, Ll/n0f;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    goto :goto_4

    .line 36
    :cond_0
    sget-object v0, Ll/gae;->INSTANCE:Ll/gae;

    .line 37
    .line 38
    invoke-virtual {v0, p0, p2}, Ll/gae;->d(Ll/qmd0;Ll/n0f;)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    const/16 v0, 0x5a

    .line 43
    .line 44
    if-eq p0, v0, :cond_2

    .line 45
    .line 46
    const/16 v0, 0x10e

    .line 47
    .line 48
    if-ne p0, v0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/4 p0, 0x0

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 54
    :goto_1
    if-eqz p0, :cond_3

    .line 55
    .line 56
    invoke-virtual {p2}, Ll/n0f;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    goto :goto_2

    .line 61
    :cond_3
    invoke-virtual {p2}, Ll/n0f;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    :goto_2
    if-eqz p0, :cond_4

    .line 66
    .line 67
    invoke-virtual {p2}, Ll/n0f;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    goto :goto_3

    .line 72
    :cond_4
    invoke-virtual {p2}, Ll/n0f;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    :goto_3
    iget p2, p1, Ll/q3d0;->a:I

    .line 77
    .line 78
    int-to-float p2, p2

    .line 79
    int-to-float v1, v0

    .line 80
    div-float/2addr p2, v1

    .line 81
    iget v1, p1, Ll/q3d0;->b:I

    .line 82
    .line 83
    int-to-float v1, v1

    .line 84
    int-to-float v2, p0

    .line 85
    div-float/2addr v1, v2

    .line 86
    invoke-static {p2, v1}, Lkotlin/ranges/a;->a(FF)F

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    iget v3, p1, Ll/q3d0;->a:I

    .line 91
    .line 92
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    iget p1, p1, Ll/q3d0;->b:I

    .line 97
    .line 98
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 111
    .line 112
    .line 113
    move-result-object v8

    .line 114
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 115
    .line 116
    .line 117
    move-result-object v9

    .line 118
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 119
    .line 120
    .line 121
    move-result-object v10

    .line 122
    filled-new-array/range {v4 .. v10}, [Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    const-string p1, "DownsampleUtil"

    .line 127
    .line 128
    const-string p2, "Downsample - Specified size: %dx%d, image size: %dx%d ratio: %.1f x %.1f, ratio: %.3f"

    .line 129
    .line 130
    invoke-static {p1, p2, p0}, Ll/huf;->t(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    return v2

    .line 134
    :cond_5
    :goto_4
    const/high16 p0, 0x3f800000    # 1.0f

    .line 135
    .line 136
    return p0

    .line 137
    :cond_6
    const-string p0, "Check failed."

    .line 138
    .line 139
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    const/4 p0, 0x0

    .line 143
    return p0
.end method

.method public static final b(Ll/qmd0;Ll/q3d0;Ll/n0f;I)I
    .locals 2
    .param p0    # Ll/qmd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ll/q3d0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/n0f;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Ll/n0f;->Z(Ll/n0f;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-static {p0, p1, p2}, Ll/gae;->a(Ll/qmd0;Ll/q3d0;Ll/n0f;)F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p2}, Ll/n0f;->F()Ll/him;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Ll/ppd;->a:Ll/him;

    .line 24
    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    invoke-static {p0}, Ll/gae;->f(F)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-static {p0}, Ll/gae;->e(F)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    :goto_0
    invoke-virtual {p2}, Ll/n0f;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p2}, Ll/n0f;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget p1, p1, Ll/q3d0;->c:F

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    int-to-float p1, p3

    .line 54
    :goto_1
    div-int p3, v0, p0

    .line 55
    .line 56
    int-to-float p3, p3

    .line 57
    cmpl-float p3, p3, p1

    .line 58
    .line 59
    if-lez p3, :cond_4

    .line 60
    .line 61
    invoke-virtual {p2}, Ll/n0f;->F()Ll/him;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    sget-object v1, Ll/ppd;->a:Ll/him;

    .line 66
    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    mul-int/lit8 p0, p0, 0x2

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    add-int/lit8 p0, p0, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_4
    return p0
.end method

.method public static final c(Ll/n0f;II)I
    .locals 2
    .param p0    # Ll/n0f;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/n0f;->J()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Ll/n0f;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0}, Ll/n0f;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    mul-int/2addr v1, p0

    .line 17
    mul-int/2addr v1, p1

    .line 18
    :goto_0
    div-int p0, v1, v0

    .line 19
    .line 20
    div-int/2addr p0, v0

    .line 21
    if-le p0, p2, :cond_0

    .line 22
    .line 23
    mul-int/lit8 v0, v0, 0x2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return v0
.end method

.method public static final e(F)I
    .locals 8
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const v0, 0x3f2aaaab

    .line 2
    .line 3
    .line 4
    cmpl-float v0, p0, v0

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    :goto_0
    int-to-double v2, v0

    .line 12
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 13
    .line 14
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 15
    .line 16
    .line 17
    move-result-wide v4

    .line 18
    sub-double/2addr v4, v2

    .line 19
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 20
    .line 21
    div-double v4, v6, v4

    .line 22
    .line 23
    div-double/2addr v6, v2

    .line 24
    const-wide v2, 0x3fd5555560000000L    # 0.3333333432674408

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    mul-double/2addr v4, v2

    .line 30
    add-double/2addr v6, v4

    .line 31
    float-to-double v2, p0

    .line 32
    cmpg-double v2, v6, v2

    .line 33
    .line 34
    if-gtz v2, :cond_1

    .line 35
    .line 36
    sub-int/2addr v0, v1

    .line 37
    return v0

    .line 38
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0
.end method

.method public static final f(F)I
    .locals 6
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const v0, 0x3f2aaaab

    .line 2
    .line 3
    .line 4
    cmpl-float v0, p0, v0

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    :goto_0
    mul-int/lit8 v1, v0, 0x2

    .line 12
    .line 13
    int-to-double v2, v1

    .line 14
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 15
    .line 16
    div-double/2addr v4, v2

    .line 17
    const-wide v2, 0x3fd5555560000000L    # 0.3333333432674408

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    mul-double/2addr v2, v4

    .line 23
    add-double/2addr v4, v2

    .line 24
    float-to-double v2, p0

    .line 25
    cmpg-double v2, v4, v2

    .line 26
    .line 27
    if-gtz v2, :cond_1

    .line 28
    .line 29
    return v0

    .line 30
    :cond_1
    move v0, v1

    .line 31
    goto :goto_0
.end method


# virtual methods
.method public final d(Ll/qmd0;Ll/n0f;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/qmd0;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p2}, Ll/n0f;->V()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    const/16 p1, 0x5a

    .line 16
    .line 17
    if-eq p0, p1, :cond_2

    .line 18
    .line 19
    const/16 p1, 0xb4

    .line 20
    .line 21
    if-eq p0, p1, :cond_2

    .line 22
    .line 23
    const/16 p1, 0x10e

    .line 24
    .line 25
    if-ne p0, p1, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const-string p0, "Check failed."

    .line 29
    .line 30
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    :cond_2
    :goto_0
    return p0
.end method
