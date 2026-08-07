.class Ltv/danmaku/ijk/media/streamer/TextureRender$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/streamer/TextureRender;->D(Ll/qmq0$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/qmq0$a;

.field final synthetic b:Ltv/danmaku/ijk/media/streamer/TextureRender;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/TextureRender;Ll/qmq0$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->b:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->a:Ll/qmq0$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->a:Ll/qmq0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->b:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget-object v2, v1, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

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
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->b:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 25
    .line 26
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 27
    .line 28
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ll/pej;->a(Ll/wej;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->b:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iput-object v0, v1, Ltv/danmaku/ijk/media/streamer/TextureRender;->j:Ll/qmq0$a;

    .line 40
    .line 41
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 42
    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    new-instance v0, Ll/qmq0;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/qmq0;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, v1, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 51
    .line 52
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->b:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 53
    .line 54
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 55
    .line 56
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->a(Ltv/danmaku/ijk/media/streamer/TextureRender;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->b:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 61
    .line 62
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->b(Ltv/danmaku/ijk/media/streamer/TextureRender;)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v1, v0, v2}, Ll/wej;->setRenderSize(II)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->b:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 70
    .line 71
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 72
    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 82
    .line 83
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$1;->b:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 89
    .line 90
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->f:Ll/qmq0;

    .line 91
    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender;->j:Ll/qmq0$a;

    .line 95
    .line 96
    iput-object p0, v0, Ll/qmq0;->a:Ll/qmq0$a;

    .line 97
    .line 98
    :cond_4
    return-void
.end method
