.class Lcom/tencent/iliveroom/a/a$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->startRemoteRender(JLandroid/view/SurfaceView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Landroid/view/SurfaceView;

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;JLandroid/view/SurfaceView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$3;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a$3;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/iliveroom/a/a$3;->b:Landroid/view/SurfaceView;

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
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$3;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/a$3;->a:J

    .line 9
    .line 10
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-static {v0, v1, v3}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$3;->b:Landroid/view/SurfaceView;

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$3;->c:Lcom/tencent/iliveroom/a/a;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->k(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$3;->a:J

    .line 38
    .line 39
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$3;->c:Lcom/tencent/iliveroom/a/a;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->k(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$3;->a:J

    .line 56
    .line 57
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/tencent/iliveroom/a/a$a;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/a$a;->b()V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$3;->b:Landroid/view/SurfaceView;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Landroid/view/Surface;->isValid()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$3;->c:Lcom/tencent/iliveroom/a/a;

    .line 87
    .line 88
    new-instance v3, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    iget-wide v4, p0, Lcom/tencent/iliveroom/a/a$3;->a:J

    .line 94
    .line 95
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    const/4 v5, 0x0

    .line 110
    invoke-static {v1, v3, v5, v4}, Lcom/tencent/iliveroom/a/a;->g(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$3;->c:Lcom/tencent/iliveroom/a/a;

    .line 114
    .line 115
    new-instance v3, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    iget-wide v6, p0, Lcom/tencent/iliveroom/a/a$3;->a:J

    .line 121
    .line 122
    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-static {v1, v2, v5, v3, v0}, Lcom/tencent/iliveroom/a/a;->d(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;III)V

    .line 149
    .line 150
    .line 151
    :cond_2
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$3;->c:Lcom/tencent/iliveroom/a/a;

    .line 152
    .line 153
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->k(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a$3;->a:J

    .line 158
    .line 159
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    new-instance v2, Lcom/tencent/iliveroom/a/a$a;

    .line 164
    .line 165
    iget-object v3, p0, Lcom/tencent/iliveroom/a/a$3;->c:Lcom/tencent/iliveroom/a/a;

    .line 166
    .line 167
    iget-wide v4, p0, Lcom/tencent/iliveroom/a/a$3;->a:J

    .line 168
    .line 169
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$3;->b:Landroid/view/SurfaceView;

    .line 170
    .line 171
    invoke-direct {v2, v3, v4, v5, p0}, Lcom/tencent/iliveroom/a/a$a;-><init>(Lcom/tencent/iliveroom/a/a;JLandroid/view/SurfaceView;)V

    .line 172
    .line 173
    .line 174
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    return-void
.end method
