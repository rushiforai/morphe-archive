.class Ltv/danmaku/ijk/media/streamer/ScreenRender$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ll/qmq0$a;

.field final synthetic b:Ltv/danmaku/ijk/media/streamer/ScreenRender;


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$1;->a:Ll/qmq0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$1;->b:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 4
    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 8
    .line 9
    if-eqz v0, :cond_8

    .line 10
    .line 11
    iget-object v2, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {v2, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v2, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 20
    .line 21
    iget-boolean v3, v2, Ll/jfj;->a:Z

    .line 22
    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$1;->b:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 35
    .line 36
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c:Ll/pej;

    .line 37
    .line 38
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ll/pej;->a(Ll/wej;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$1;->b:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 44
    .line 45
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 54
    .line 55
    iget-boolean v0, v0, Ll/jfj;->a:Z

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 63
    .line 64
    :goto_1
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 65
    .line 66
    return-void

    .line 67
    :cond_4
    iput-object v0, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->i:Ll/qmq0$a;

    .line 68
    .line 69
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 70
    .line 71
    if-nez v0, :cond_7

    .line 72
    .line 73
    new-instance v0, Ll/qmq0;

    .line 74
    .line 75
    invoke-direct {v0}, Ll/qmq0;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object v0, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 79
    .line 80
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$1;->b:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 81
    .line 82
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 83
    .line 84
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$1;->b:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 89
    .line 90
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v1, v0, v2}, Ll/wej;->setRenderSize(II)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$1;->b:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 98
    .line 99
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 100
    .line 101
    if-eqz v1, :cond_5

    .line 102
    .line 103
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 104
    .line 105
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_5
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 110
    .line 111
    iget-boolean v2, v1, Ll/jfj;->a:Z

    .line 112
    .line 113
    if-eqz v2, :cond_6

    .line 114
    .line 115
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 116
    .line 117
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_6
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 122
    .line 123
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 124
    .line 125
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 126
    .line 127
    .line 128
    :cond_7
    :goto_2
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$1;->b:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 129
    .line 130
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e:Ll/qmq0;

    .line 131
    .line 132
    if-eqz v0, :cond_8

    .line 133
    .line 134
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->i:Ll/qmq0$a;

    .line 135
    .line 136
    iput-object p0, v0, Ll/qmq0;->a:Ll/qmq0$a;

    .line 137
    .line 138
    :cond_8
    return-void
.end method
