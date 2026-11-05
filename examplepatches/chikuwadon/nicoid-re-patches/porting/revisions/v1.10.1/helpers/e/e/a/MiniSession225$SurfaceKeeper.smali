.class final Le/e/a/MiniSession225$SurfaceKeeper;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MiniSession225;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SurfaceKeeper"
.end annotation


# instance fields
.field closed:Z

.field final delegate:Landroid/view/TextureView$SurfaceTextureListener;

.field restoreAttach:Landroid/view/View$OnAttachStateChangeListener;

.field restoreOutput:Ljava/lang/Runnable;

.field restoreTimeout:Ljava/lang/Runnable;

.field saved:Landroid/graphics/SurfaceTexture;

.field targetVideo:Landroid/view/View;

.field final view:Landroid/view/TextureView;


# direct methods
.method constructor <init>(Landroid/view/TextureView;)V
    .registers 3

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v0

    iput-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    iput-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->saved:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    return-void
.end method


# virtual methods
.method close()V
    .registers 5

    .line 118
    iget-boolean v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->closed:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->closed:Z

    iget-object v1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    const/4 v2, 0x0

    if-eqz v1, :cond_18

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v1

    iget-object v3, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-object v2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    :cond_18
    iget-object v1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreTimeout:Ljava/lang/Runnable;

    if-eqz v1, :cond_27

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v1

    iget-object v3, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreTimeout:Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-object v2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreTimeout:Ljava/lang/Runnable;

    :cond_27
    iget-object v1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreAttach:Landroid/view/View$OnAttachStateChangeListener;

    if-eqz v1, :cond_34

    iget-object v1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    iget-object v3, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreAttach:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v1, v3}, Landroid/view/TextureView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iput-object v2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreAttach:Landroid/view/View$OnAttachStateChangeListener;

    :cond_34
    iget-object v1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    iget-object v3, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {v1, v3}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    iget-object v1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->saved:Landroid/graphics/SurfaceTexture;

    iput-object v2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->saved:Landroid/graphics/SurfaceTexture;

    iget-object v2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-virtual {v2}, Landroid/view/TextureView;->isAttachedToWindow()Z

    move-result v2

    if-nez v2, :cond_5b

    if-eqz v1, :cond_5b

    iget-object v2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v2, :cond_56

    iget-object v2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v2, v1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    move-result v2

    if-nez v2, :cond_56

    const/4 v0, 0x0

    :cond_56
    if-eqz v0, :cond_5b

    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->release()V

    :cond_5b
    return-void
.end method

.method synthetic lambda$0$e-e-a-MiniSession225$SurfaceKeeper()V
    .registers 3

    .line 111
    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->targetVideo:Landroid/view/View;

    iget-object v1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-static {v0, v1}, Le/e/a/VideoOutput227;->bind(Landroid/view/View;Landroid/view/TextureView;)V

    return-void
.end method

.method synthetic lambda$1$e-e-a-MiniSession225$SurfaceKeeper()V
    .registers 3

    .line 112
    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->targetVideo:Landroid/view/View;

    iget-object v1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-static {v0, v1}, Le/e/a/VideoOutput227;->bind(Landroid/view/View;Landroid/view/TextureView;)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-MiniSession225$SurfaceKeeper(Landroid/view/View;)V
    .registers 3

    .line 116
    iget-boolean v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->closed:Z

    if-nez v0, :cond_d

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->targetVideo:Landroid/view/View;

    if-ne v0, p1, :cond_d

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-static {p1, v0}, Le/e/a/VideoOutput227;->bind(Landroid/view/View;Landroid/view/TextureView;)V

    :cond_d
    return-void
.end method

.method synthetic lambda$3$e-e-a-MiniSession225$SurfaceKeeper(Landroid/view/View;)V
    .registers 3

    .line 117
    iget-boolean v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->closed:Z

    if-nez v0, :cond_1c

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-static {p1, v0}, Le/e/a/VideoOutput227;->bind(Landroid/view/View;Landroid/view/TextureView;)V

    :cond_1c
    return-void
.end method

.method synthetic lambda$4$e-e-a-MiniSession225$SurfaceKeeper()V
    .registers 3

    .line 117
    iget-boolean v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->closed:Z

    if-nez v0, :cond_13

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Output restore timeout"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    const-string v1, "Retained output did not attach"

    invoke-static {v1, v0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {p0}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    :cond_13
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .registers 5

    .line 111
    iget-boolean v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->closed:Z

    if-nez v0, :cond_31

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->saved:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_31

    iget-object p2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->saved:Landroid/graphics/SurfaceTexture;

    if-eq p1, p2, :cond_13

    iget-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    iget-object p2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->saved:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1, p2}, Landroid/view/TextureView;->setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V

    :cond_13
    iget-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->targetVideo:Landroid/view/View;

    if-eqz p1, :cond_23

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    new-instance p2, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0}, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda2;-><init>(Le/e/a/MiniSession225$SurfaceKeeper;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_23
    iget-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    if-eqz p1, :cond_30

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    iget-object p2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_30
    return-void

    .line 112
    :cond_31
    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v0, :cond_3a

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    :cond_3a
    iget-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->targetVideo:Landroid/view/View;

    if-eqz p1, :cond_4a

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    new-instance p2, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda3;

    invoke-direct {p2, p0}, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda3;-><init>(Le/e/a/MiniSession225$SurfaceKeeper;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_4a
    iget-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    if-eqz p1, :cond_57

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    iget-object p2, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 113
    :cond_57
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .registers 4

    .line 109
    iget-boolean v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->closed:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v0, :cond_12

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v0, p1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    move-result p1

    if-nez p1, :cond_12

    return v1

    :cond_12
    const/4 p1, 0x1

    return p1

    :cond_14
    iput-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->saved:Landroid/graphics/SurfaceTexture;

    return v1
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .registers 5

    .line 114
    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V

    :cond_9
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .registers 3

    .line 115
    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->delegate:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-interface {v0, p1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V

    :cond_9
    return-void
.end method

.method output(Landroid/view/View;)V
    .registers 4

    .line 116
    iput-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->targetVideo:Landroid/view/View;

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_1e

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda4;-><init>(Le/e/a/MiniSession225$SurfaceKeeper;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1e
    return-void
.end method

.method restore(Landroid/view/View;)V
    .registers 5

    .line 117
    new-instance v0, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0, p1}, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda5;-><init>(Le/e/a/MiniSession225$SurfaceKeeper;Landroid/view/View;)V

    iput-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    new-instance p1, Le/e/a/MiniSession225$SurfaceKeeper$1;

    invoke-direct {p1, p0}, Le/e/a/MiniSession225$SurfaceKeeper$1;-><init>(Le/e/a/MiniSession225$SurfaceKeeper;)V

    iput-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreAttach:Landroid/view/View$OnAttachStateChangeListener;

    iget-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->view:Landroid/view/TextureView;

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreAttach:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {p1, v0}, Landroid/view/TextureView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance p1, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda6;

    invoke-direct {p1, p0}, Le/e/a/MiniSession225$SurfaceKeeper$$ExternalSyntheticLambda6;-><init>(Le/e/a/MiniSession225$SurfaceKeeper;)V

    iput-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreTimeout:Ljava/lang/Runnable;

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreTimeout:Ljava/lang/Runnable;

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
