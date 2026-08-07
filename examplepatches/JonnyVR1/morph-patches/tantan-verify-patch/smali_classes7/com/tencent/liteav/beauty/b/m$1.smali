.class Lcom/tencent/liteav/beauty/b/m$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/beauty/b/m;->a(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/graphics/Bitmap;

.field final synthetic b:Landroid/graphics/Bitmap;

.field final synthetic c:Lcom/tencent/liteav/beauty/b/m;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/b/m;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/beauty/b/m$1;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/beauty/b/m$1;->b:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/m$1;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/beauty/b/m;->a(Lcom/tencent/liteav/beauty/b/m;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/m$1;->b:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/tencent/liteav/beauty/b/m;->b(Lcom/tencent/liteav/beauty/b/m;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->a:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const/high16 v3, 0x3f800000    # 1.0f

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    const/4 v5, -0x1

    .line 24
    const/4 v6, 0x0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tencent/liteav/beauty/b/m;->a(Lcom/tencent/liteav/beauty/b/m;)I

    .line 28
    .line 29
    .line 30
    move-result v7

    .line 31
    invoke-static {v0, v7, v6}, Lcom/tencent/liteav/basic/c/j;->a(Landroid/graphics/Bitmap;IZ)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/beauty/b/m;->a(Lcom/tencent/liteav/beauty/b/m;I)I

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tencent/liteav/beauty/b/m;->b(Lcom/tencent/liteav/beauty/b/m;)[F

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    aput v3, v0, v6

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {v1}, Lcom/tencent/liteav/beauty/b/m;->a(Lcom/tencent/liteav/beauty/b/m;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eq v0, v5, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tencent/liteav/beauty/b/m;->a(Lcom/tencent/liteav/beauty/b/m;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    filled-new-array {v0}, [I

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v4, v0, v6}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 67
    .line 68
    invoke-static {v0, v5}, Lcom/tencent/liteav/beauty/b/m;->a(Lcom/tencent/liteav/beauty/b/m;I)I

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/tencent/liteav/beauty/b/m;->b(Lcom/tencent/liteav/beauty/b/m;)[F

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    aput v2, v0, v6

    .line 78
    .line 79
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->b:Landroid/graphics/Bitmap;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 82
    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    invoke-static {v1}, Lcom/tencent/liteav/beauty/b/m;->c(Lcom/tencent/liteav/beauty/b/m;)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-static {v0, v2, v6}, Lcom/tencent/liteav/basic/c/j;->a(Landroid/graphics/Bitmap;IZ)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-static {v1, v0}, Lcom/tencent/liteav/beauty/b/m;->b(Lcom/tencent/liteav/beauty/b/m;I)I

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 97
    .line 98
    invoke-static {p0}, Lcom/tencent/liteav/beauty/b/m;->b(Lcom/tencent/liteav/beauty/b/m;)[F

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    aput v3, p0, v4

    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    invoke-static {v1}, Lcom/tencent/liteav/beauty/b/m;->c(Lcom/tencent/liteav/beauty/b/m;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eq v0, v5, :cond_3

    .line 110
    .line 111
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 112
    .line 113
    invoke-static {v0}, Lcom/tencent/liteav/beauty/b/m;->c(Lcom/tencent/liteav/beauty/b/m;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    filled-new-array {v0}, [I

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v4, v0, v6}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 122
    .line 123
    .line 124
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 125
    .line 126
    invoke-static {v0, v5}, Lcom/tencent/liteav/beauty/b/m;->b(Lcom/tencent/liteav/beauty/b/m;I)I

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/m$1;->c:Lcom/tencent/liteav/beauty/b/m;

    .line 130
    .line 131
    invoke-static {p0}, Lcom/tencent/liteav/beauty/b/m;->b(Lcom/tencent/liteav/beauty/b/m;)[F

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    aput v2, p0, v4

    .line 136
    .line 137
    return-void
.end method
