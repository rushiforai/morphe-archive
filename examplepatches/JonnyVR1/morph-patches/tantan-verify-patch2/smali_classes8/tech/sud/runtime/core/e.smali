.class Ltech/sud/runtime/core/e;
.super Landroid/opengl/GLSurfaceView;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/core/c;


# instance fields
.field private final a:Ltech/sud/runtime/core/d;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/g;Landroid/content/Context;Z)V
    .locals 1

    .line 1
    invoke-direct {p0, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    const/4 v0, -0x3

    .line 12
    invoke-interface {p3, v0}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0, p2}, Landroid/opengl/GLSurfaceView;->setPreserveEGLContextOnPause(Z)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ltech/sud/runtime/core/d;

    .line 22
    .line 23
    invoke-direct {p2, p1, p0}, Ltech/sud/runtime/core/d;-><init>(Ltech/sud/runtime/core/g;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iput-object p2, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a()Ltech/sud/runtime/core/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ltech/sud/runtime/core/d;->b(Z)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onDetachedFromWindow()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Ltech/sud/runtime/core/d;->b(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Ltech/sud/runtime/core/d;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onPause()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 14
    .line 15
    invoke-virtual {p0}, Ltech/sud/runtime/core/d;->c()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Ltech/sud/runtime/core/d;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onResume()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 14
    .line 15
    invoke-virtual {p0}, Ltech/sud/runtime/core/d;->b()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ltech/sud/runtime/core/d;->b(Z)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Ltech/sud/runtime/core/d;->b(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ltech/sud/runtime/core/d;->a(Landroid/view/MotionEvent;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ltech/sud/runtime/core/d;->a(Z)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/opengl/GLSurfaceView;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ltech/sud/runtime/core/d;->a(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ltech/sud/runtime/core/d;->b(Z)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0, p1}, Landroid/opengl/GLSurfaceView;->surfaceDestroyed(Landroid/view/SurfaceHolder;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Ltech/sud/runtime/core/d;->b(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public surfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ltech/sud/runtime/core/d;->b(Z)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/opengl/GLSurfaceView;->surfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ltech/sud/runtime/core/e;->a:Ltech/sud/runtime/core/d;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Ltech/sud/runtime/core/d;->b(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
