.class Lcom/immomo/velib/player/EffectSurfaceView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/velib/player/EffectSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/velib/player/EffectSurfaceView;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/player/EffectSurfaceView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView$a;->a:Lcom/immomo/velib/player/EffectSurfaceView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/EffectSurfaceView$a;->a:Lcom/immomo/velib/player/EffectSurfaceView;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/immomo/velib/player/EffectSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/immomo/velib/player/EffectSurfaceView;->e:Z

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    iget-object v1, v0, Lcom/immomo/velib/player/EffectSurfaceView;->a:Lcom/immomo/velib/player/d;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget v1, v0, Lcom/immomo/velib/player/EffectSurfaceView;->c:I

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget v0, v0, Lcom/immomo/velib/player/EffectSurfaceView;->d:I

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p1, v1, v0}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView$a;->a:Lcom/immomo/velib/player/EffectSurfaceView;

    .line 25
    .line 26
    iget-object v0, p1, Lcom/immomo/velib/player/EffectSurfaceView;->a:Lcom/immomo/velib/player/d;

    .line 27
    .line 28
    invoke-interface {v0, p1}, Lcom/immomo/velib/player/d;->d(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p0, Lcom/immomo/velib/player/EffectSurfaceView$a;->a:Lcom/immomo/velib/player/EffectSurfaceView;

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->e:Z

    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView$a;->a:Lcom/immomo/velib/player/EffectSurfaceView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/immomo/velib/player/EffectSurfaceView;->f:Lcom/immomo/velib/player/d$a;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Lcom/immomo/velib/player/d$a;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lcom/immomo/velib/player/EffectSurfaceView$a;->a:Lcom/immomo/velib/player/EffectSurfaceView;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/immomo/velib/player/EffectSurfaceView;->b:Landroid/view/SurfaceHolder;

    .line 14
    .line 15
    return-void
.end method
