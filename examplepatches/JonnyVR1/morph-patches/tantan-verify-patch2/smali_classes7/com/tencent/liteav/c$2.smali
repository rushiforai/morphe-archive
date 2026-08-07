.class Lcom/tencent/liteav/c$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/c;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    const-string v0, "CameraCapture"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/tencent/liteav/c;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tencent/liteav/c;->b(Lcom/tencent/liteav/c;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tencent/liteav/c;->c(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/capturer/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lcom/tencent/liteav/capturer/a;->l()Landroid/hardware/Camera;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    const-string v1, "camera monitor restart capture"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/tencent/liteav/c;->c(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/capturer/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Lcom/tencent/liteav/capturer/a;->g()V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/tencent/liteav/c;->d(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/basic/c/m;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const/4 v2, 0x0

    .line 52
    invoke-interface {v1, v2}, Lcom/tencent/liteav/basic/c/m;->a(Z)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/tencent/liteav/c;->c(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/capturer/a;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object v2, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 62
    .line 63
    invoke-static {v2}, Lcom/tencent/liteav/c;->a(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/g;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget v2, v2, Lcom/tencent/liteav/g;->h:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/capturer/a;->a(I)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 73
    .line 74
    invoke-static {v1}, Lcom/tencent/liteav/c;->c(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/capturer/a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget-object v2, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 79
    .line 80
    invoke-static {v2}, Lcom/tencent/liteav/c;->a(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/g;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget-boolean v2, v2, Lcom/tencent/liteav/g;->W:Z

    .line 85
    .line 86
    iget-object v3, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 87
    .line 88
    invoke-static {v3}, Lcom/tencent/liteav/c;->a(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/g;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget v3, v3, Lcom/tencent/liteav/g;->a:I

    .line 93
    .line 94
    iget-object v4, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 95
    .line 96
    invoke-static {v4}, Lcom/tencent/liteav/c;->a(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/g;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    iget v4, v4, Lcom/tencent/liteav/g;->b:I

    .line 101
    .line 102
    invoke-virtual {v1, v2, v3, v4}, Lcom/tencent/liteav/capturer/a;->a(ZII)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 106
    .line 107
    invoke-static {v1}, Lcom/tencent/liteav/c;->c(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/capturer/a;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iget-object v2, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 112
    .line 113
    invoke-static {v2}, Lcom/tencent/liteav/c;->d(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/basic/c/m;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-interface {v2}, Lcom/tencent/liteav/basic/c/m;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/capturer/a;->a(Landroid/graphics/SurfaceTexture;)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 125
    .line 126
    invoke-static {v1}, Lcom/tencent/liteav/c;->c(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/capturer/a;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iget-object p0, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 131
    .line 132
    invoke-static {p0}, Lcom/tencent/liteav/c;->a(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/g;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    iget-boolean p0, p0, Lcom/tencent/liteav/g;->m:Z

    .line 137
    .line 138
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/capturer/a;->d(Z)I

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 143
    .line 144
    invoke-static {v1}, Lcom/tencent/liteav/c;->e(Lcom/tencent/liteav/c;)Landroid/os/Handler;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    if-eqz v1, :cond_1

    .line 149
    .line 150
    iget-object v1, p0, Lcom/tencent/liteav/c$2;->a:Lcom/tencent/liteav/c;

    .line 151
    .line 152
    invoke-static {v1}, Lcom/tencent/liteav/c;->e(Lcom/tencent/liteav/c;)Landroid/os/Handler;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    const-wide/16 v2, 0x7d0

    .line 157
    .line 158
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .line 160
    .line 161
    :cond_1
    return-void

    .line 162
    :catch_0
    const-string p0, "camera monitor exception "

    .line 163
    .line 164
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    return-void
.end method
