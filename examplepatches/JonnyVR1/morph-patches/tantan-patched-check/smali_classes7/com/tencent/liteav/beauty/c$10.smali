.class Lcom/tencent/liteav/beauty/c$10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/beauty/c;->a(Landroid/graphics/Bitmap;FFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/graphics/Bitmap;

.field final synthetic b:F

.field final synthetic c:F

.field final synthetic d:F

.field final synthetic e:Lcom/tencent/liteav/beauty/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/c;Landroid/graphics/Bitmap;FFF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/beauty/c$10;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/beauty/c$10;->b:F

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/beauty/c$10;->c:F

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/beauty/c$10;->d:F

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/liteav/beauty/a;->a()Lcom/tencent/liteav/beauty/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/a;->g()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->a:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/z;->d()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 35
    .line 36
    invoke-static {p0, v2}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/b/z;)Lcom/tencent/liteav/beauty/b/z;

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void

    .line 40
    :cond_2
    invoke-static {v1}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x1

    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->c(Lcom/tencent/liteav/beauty/c;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const-string v3, "TXCFilterDrawer"

    .line 54
    .line 55
    if-lez v0, :cond_5

    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->d(Lcom/tencent/liteav/beauty/c;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-gtz v0, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 67
    .line 68
    new-instance v4, Lcom/tencent/liteav/beauty/b/z;

    .line 69
    .line 70
    invoke-direct {v4}, Lcom/tencent/liteav/beauty/b/z;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v4}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/b/z;)Lcom/tencent/liteav/beauty/b/z;

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 86
    .line 87
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_4

    .line 96
    .line 97
    const-string v0, "mWatermarkFilter.init failed!"

    .line 98
    .line 99
    invoke-static {v3, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/z;->d()V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 112
    .line 113
    invoke-static {p0, v2}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/b/z;)Lcom/tencent/liteav/beauty/b/z;

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 118
    .line 119
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 124
    .line 125
    invoke-static {v2}, Lcom/tencent/liteav/beauty/c;->c(Lcom/tencent/liteav/beauty/c;)I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    iget-object v3, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 130
    .line 131
    invoke-static {v3}, Lcom/tencent/liteav/beauty/c;->d(Lcom/tencent/liteav/beauty/c;)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-virtual {v0, v2, v3}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_5
    :goto_0
    const-string p0, "output Width and Height is error!"

    .line 140
    .line 141
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_6
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 146
    .line 147
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/z;->d(Z)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$10;->e:Lcom/tencent/liteav/beauty/c;

    .line 155
    .line 156
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/z;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object v1, p0, Lcom/tencent/liteav/beauty/c$10;->a:Landroid/graphics/Bitmap;

    .line 161
    .line 162
    iget v2, p0, Lcom/tencent/liteav/beauty/c$10;->b:F

    .line 163
    .line 164
    iget v3, p0, Lcom/tencent/liteav/beauty/c$10;->c:F

    .line 165
    .line 166
    iget p0, p0, Lcom/tencent/liteav/beauty/c$10;->d:F

    .line 167
    .line 168
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/tencent/liteav/beauty/b/z;->a(Landroid/graphics/Bitmap;FFF)V

    .line 169
    .line 170
    .line 171
    return-void
.end method
