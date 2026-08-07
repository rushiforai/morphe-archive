.class Lcom/tencent/liteav/beauty/c$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/beauty/c;->a(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:Landroid/graphics/Bitmap;

.field final synthetic c:F

.field final synthetic d:Landroid/graphics/Bitmap;

.field final synthetic e:F

.field final synthetic f:Lcom/tencent/liteav/beauty/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/c;FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/beauty/c$6;->a:F

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/beauty/c$6;->b:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/beauty/c$6;->c:F

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/liteav/beauty/c$6;->d:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    iput p6, p0, Lcom/tencent/liteav/beauty/c$6;->e:F

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/tencent/liteav/beauty/a;->a()Lcom/tencent/liteav/beauty/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/a;->e()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->h(Lcom/tencent/liteav/beauty/c;)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->i(Lcom/tencent/liteav/beauty/c;)Landroid/graphics/Bitmap;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-static {p0, v0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/b/m;)Lcom/tencent/liteav/beauty/b/m;

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void

    .line 56
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 63
    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    invoke-static {v1}, Lcom/tencent/liteav/beauty/c;->f(Lcom/tencent/liteav/beauty/c;)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->g(Lcom/tencent/liteav/beauty/c;)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->j(Lcom/tencent/liteav/beauty/c;)F

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->h(Lcom/tencent/liteav/beauty/c;)Landroid/graphics/Bitmap;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->k(Lcom/tencent/liteav/beauty/c;)F

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->i(Lcom/tencent/liteav/beauty/c;)Landroid/graphics/Bitmap;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c$6;->f:Lcom/tencent/liteav/beauty/c;

    .line 101
    .line 102
    invoke-static {p0}, Lcom/tencent/liteav/beauty/c;->l(Lcom/tencent/liteav/beauty/c;)F

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    invoke-static/range {v1 .. v8}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;IIFLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_3
    invoke-static {v1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    iget v3, p0, Lcom/tencent/liteav/beauty/c$6;->a:F

    .line 115
    .line 116
    iget-object v4, p0, Lcom/tencent/liteav/beauty/c$6;->b:Landroid/graphics/Bitmap;

    .line 117
    .line 118
    iget v5, p0, Lcom/tencent/liteav/beauty/c$6;->c:F

    .line 119
    .line 120
    iget-object v6, p0, Lcom/tencent/liteav/beauty/c$6;->d:Landroid/graphics/Bitmap;

    .line 121
    .line 122
    iget v7, p0, Lcom/tencent/liteav/beauty/c$6;->e:F

    .line 123
    .line 124
    invoke-virtual/range {v2 .. v7}, Lcom/tencent/liteav/beauty/b/m;->a(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V

    .line 125
    .line 126
    .line 127
    return-void
.end method
