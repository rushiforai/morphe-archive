.class Lcom/immomo/moment/mediautils/m$d;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field a:Ll/uje;

.field final synthetic b:Lcom/immomo/moment/mediautils/m;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/m;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_4

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/immomo/moment/mediautils/m;->a(Lcom/immomo/moment/mediautils/m;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    monitor-enter p1

    .line 17
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 28
    .line 29
    iput-object v1, v0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 44
    .line 45
    iput-object v1, v0, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 46
    .line 47
    :cond_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-static {v0, v2}, Lcom/immomo/moment/mediautils/m;->c(Lcom/immomo/moment/mediautils/m;Z)Z

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/immomo/moment/mediautils/m;->a(Lcom/immomo/moment/mediautils/m;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m$d;->a:Ll/uje;

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/uje;->g()V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->a:Ll/uje;

    .line 70
    .line 71
    :cond_3
    monitor-exit p1

    .line 72
    return-void

    .line 73
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    throw p0

    .line 75
    :cond_4
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/immomo/moment/mediautils/m;->a(Lcom/immomo/moment/mediautils/m;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    monitor-enter p1

    .line 82
    :try_start_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->a:Ll/uje;

    .line 83
    .line 84
    if-nez v1, :cond_5

    .line 85
    .line 86
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 87
    .line 88
    invoke-static {v1}, Lcom/immomo/moment/mediautils/m;->b(Lcom/immomo/moment/mediautils/m;)Ll/uje;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    new-instance v1, Ll/uje;

    .line 95
    .line 96
    invoke-direct {v1}, Ll/uje;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->a:Ll/uje;

    .line 100
    .line 101
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 102
    .line 103
    invoke-static {v2}, Lcom/immomo/moment/mediautils/m;->b(Lcom/immomo/moment/mediautils/m;)Ll/uje;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget-object v2, v2, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Ll/uje;->b(Landroid/opengl/EGLContext;)V

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :catchall_1
    move-exception p0

    .line 114
    goto :goto_3

    .line 115
    :cond_5
    :goto_2
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 116
    .line 117
    iget-object v1, v1, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 118
    .line 119
    if-nez v1, :cond_6

    .line 120
    .line 121
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->a:Ll/uje;

    .line 122
    .line 123
    invoke-virtual {v1}, Ll/uje;->f()Z

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 127
    .line 128
    invoke-static {}, Ll/uje;->d()I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    iput v2, v1, Lcom/immomo/moment/mediautils/m;->t:I

    .line 133
    .line 134
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 135
    .line 136
    new-instance v2, Landroid/graphics/SurfaceTexture;

    .line 137
    .line 138
    iget-object v3, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 139
    .line 140
    iget v3, v3, Lcom/immomo/moment/mediautils/m;->t:I

    .line 141
    .line 142
    invoke-direct {v2, v3}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 143
    .line 144
    .line 145
    iput-object v2, v1, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 146
    .line 147
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 148
    .line 149
    new-instance v2, Landroid/view/Surface;

    .line 150
    .line 151
    iget-object v3, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 152
    .line 153
    iget-object v3, v3, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 154
    .line 155
    invoke-direct {v2, v3}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 156
    .line 157
    .line 158
    iput-object v2, v1, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 159
    .line 160
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 161
    .line 162
    iget-object v1, v1, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 163
    .line 164
    new-instance v2, Lcom/immomo/moment/mediautils/m$d$a;

    .line 165
    .line 166
    invoke-direct {v2, p0}, Lcom/immomo/moment/mediautils/m$d$a;-><init>(Lcom/immomo/moment/mediautils/m$d;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1, v2}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 170
    .line 171
    .line 172
    :cond_6
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 173
    .line 174
    invoke-static {v1, v0}, Lcom/immomo/moment/mediautils/m;->c(Lcom/immomo/moment/mediautils/m;Z)Z

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m$d;->b:Lcom/immomo/moment/mediautils/m;

    .line 178
    .line 179
    invoke-static {p0}, Lcom/immomo/moment/mediautils/m;->a(Lcom/immomo/moment/mediautils/m;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 184
    .line 185
    .line 186
    monitor-exit p1

    .line 187
    return-void

    .line 188
    :goto_3
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 189
    throw p0
.end method
