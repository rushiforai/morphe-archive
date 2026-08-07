.class public final Ll/qf60$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qf60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qf60$d;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Landroid/graphics/Bitmap;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dli0;",
            ">;"
        }
    .end annotation
.end field

.field public d:I

.field public e:I

.field public f:I

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qf60$c;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/graphics/Rect;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qf60$b;->c:Ljava/util/List;

    .line 10
    .line 11
    const/16 v1, 0x10

    .line 12
    .line 13
    iput v1, p0, Ll/qf60$b;->d:I

    .line 14
    .line 15
    const/16 v1, 0x3100

    .line 16
    .line 17
    iput v1, p0, Ll/qf60$b;->e:I

    .line 18
    .line 19
    const/4 v1, -0x1

    .line 20
    iput v1, p0, Ll/qf60$b;->f:I

    .line 21
    .line 22
    new-instance v1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/qf60$b;->g:Ljava/util/List;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    sget-object v3, Ll/qf60;->f:Ll/qf60$c;

    .line 39
    .line 40
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/qf60$b;->b:Landroid/graphics/Bitmap;

    .line 44
    .line 45
    iput-object v2, p0, Ll/qf60$b;->a:Ljava/util/List;

    .line 46
    .line 47
    sget-object p0, Ll/dli0;->e:Ll/dli0;

    .line 48
    .line 49
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    sget-object p0, Ll/dli0;->f:Ll/dli0;

    .line 53
    .line 54
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    sget-object p0, Ll/dli0;->g:Ll/dli0;

    .line 58
    .line 59
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    sget-object p0, Ll/dli0;->h:Ll/dli0;

    .line 63
    .line 64
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    sget-object p0, Ll/dli0;->i:Ll/dli0;

    .line 68
    .line 69
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    sget-object p0, Ll/dli0;->j:Ll/dli0;

    .line 73
    .line 74
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    const-string p0, "Bitmap is not valid"

    .line 79
    .line 80
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    throw v2
.end method


# virtual methods
.method public a()Ll/qf60;
    .locals 7
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qf60$b;->b:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/qf60$b;->c(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v2, p0, Ll/qf60$b;->h:Landroid/graphics/Rect;

    .line 11
    .line 12
    iget-object v3, p0, Ll/qf60$b;->b:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    if-eq v0, v3, :cond_0

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    int-to-double v3, v3

    .line 23
    iget-object v5, p0, Ll/qf60$b;->b:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    int-to-double v5, v5

    .line 30
    div-double/2addr v3, v5

    .line 31
    iget v5, v2, Landroid/graphics/Rect;->left:I

    .line 32
    .line 33
    int-to-double v5, v5

    .line 34
    mul-double/2addr v5, v3

    .line 35
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    double-to-int v5, v5

    .line 40
    iput v5, v2, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    iget v5, v2, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    int-to-double v5, v5

    .line 45
    mul-double/2addr v5, v3

    .line 46
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    .line 47
    .line 48
    .line 49
    move-result-wide v5

    .line 50
    double-to-int v5, v5

    .line 51
    iput v5, v2, Landroid/graphics/Rect;->top:I

    .line 52
    .line 53
    iget v5, v2, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    int-to-double v5, v5

    .line 56
    mul-double/2addr v5, v3

    .line 57
    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    .line 58
    .line 59
    .line 60
    move-result-wide v5

    .line 61
    double-to-int v5, v5

    .line 62
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    iput v5, v2, Landroid/graphics/Rect;->right:I

    .line 71
    .line 72
    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    .line 73
    .line 74
    int-to-double v5, v5

    .line 75
    mul-double/2addr v5, v3

    .line 76
    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    .line 77
    .line 78
    .line 79
    move-result-wide v3

    .line 80
    double-to-int v3, v3

    .line 81
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 90
    .line 91
    :cond_0
    new-instance v2, Ll/af5;

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ll/qf60$b;->b(Landroid/graphics/Bitmap;)[I

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iget v4, p0, Ll/qf60$b;->d:I

    .line 98
    .line 99
    iget-object v5, p0, Ll/qf60$b;->g:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    if-eqz v5, :cond_1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_1
    iget-object v1, p0, Ll/qf60$b;->g:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    new-array v5, v5, [Ll/qf60$c;

    .line 115
    .line 116
    invoke-interface {v1, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, [Ll/qf60$c;

    .line 121
    .line 122
    :goto_0
    invoke-direct {v2, v3, v4, v1}, Ll/af5;-><init>([II[Ll/qf60$c;)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Ll/qf60$b;->b:Landroid/graphics/Bitmap;

    .line 126
    .line 127
    if-eq v0, v1, :cond_2

    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 130
    .line 131
    .line 132
    :cond_2
    invoke-virtual {v2}, Ll/af5;->d()Ljava/util/List;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    goto :goto_1

    .line 137
    :cond_3
    iget-object v0, p0, Ll/qf60$b;->a:Ljava/util/List;

    .line 138
    .line 139
    if-eqz v0, :cond_4

    .line 140
    .line 141
    :goto_1
    new-instance v1, Ll/qf60;

    .line 142
    .line 143
    iget-object p0, p0, Ll/qf60$b;->c:Ljava/util/List;

    .line 144
    .line 145
    invoke-direct {v1, v0, p0}, Ll/qf60;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1}, Ll/qf60;->c()V

    .line 149
    .line 150
    .line 151
    return-object v1

    .line 152
    :cond_4
    invoke-static {}, Ll/aqg0;->a()V

    .line 153
    .line 154
    .line 155
    return-object v1
.end method

.method public final b(Landroid/graphics/Bitmap;)[I
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v7

    .line 9
    mul-int v0, v3, v7

    .line 10
    .line 11
    new-array v1, v0, [I

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    move v6, v3

    .line 17
    move-object v0, p1

    .line 18
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/qf60$b;->h:Landroid/graphics/Rect;

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object v0, p0, Ll/qf60$b;->h:Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    mul-int v2, p1, v0

    .line 37
    .line 38
    new-array v2, v2, [I

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    :goto_0
    if-ge v4, v0, :cond_1

    .line 42
    .line 43
    iget-object v5, p0, Ll/qf60$b;->h:Landroid/graphics/Rect;

    .line 44
    .line 45
    iget v6, v5, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    add-int/2addr v6, v4

    .line 48
    mul-int/2addr v6, v3

    .line 49
    iget v5, v5, Landroid/graphics/Rect;->left:I

    .line 50
    .line 51
    add-int/2addr v6, v5

    .line 52
    mul-int v5, v4, p1

    .line 53
    .line 54
    invoke-static {v1, v6, v2, v5, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    return-object v2
.end method

.method public final c(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    iget v0, p0, Ll/qf60$b;->e:I

    .line 2
    .line 3
    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    mul-int/2addr v0, v3

    .line 16
    iget p0, p0, Ll/qf60$b;->e:I

    .line 17
    .line 18
    if-le v0, p0, :cond_1

    .line 19
    .line 20
    int-to-double v1, p0

    .line 21
    int-to-double v3, v0

    .line 22
    div-double/2addr v1, v3

    .line 23
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget v0, p0, Ll/qf60$b;->f:I

    .line 29
    .line 30
    if-lez v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget p0, p0, Ll/qf60$b;->f:I

    .line 45
    .line 46
    if-le v0, p0, :cond_1

    .line 47
    .line 48
    int-to-double v1, p0

    .line 49
    int-to-double v3, v0

    .line 50
    div-double/2addr v1, v3

    .line 51
    :cond_1
    :goto_0
    const-wide/16 v3, 0x0

    .line 52
    .line 53
    cmpg-double p0, v1, v3

    .line 54
    .line 55
    if-gtz p0, :cond_2

    .line 56
    .line 57
    return-object p1

    .line 58
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    int-to-double v3, p0

    .line 63
    mul-double/2addr v3, v1

    .line 64
    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    .line 65
    .line 66
    .line 67
    move-result-wide v3

    .line 68
    double-to-int p0, v3

    .line 69
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    int-to-double v3, v0

    .line 74
    mul-double/2addr v3, v1

    .line 75
    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    double-to-int v0, v0

    .line 80
    const/4 v1, 0x0

    .line 81
    invoke-static {p1, p0, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method
