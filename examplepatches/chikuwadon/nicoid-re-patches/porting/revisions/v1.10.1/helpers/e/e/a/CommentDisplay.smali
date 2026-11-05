.class public final Le/e/a/CommentDisplay;
.super Ljava/lang/Object;
.source "CommentDisplay.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Landroid/view/View;I)V
    .registers 11

    .line 15
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 16
    :cond_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x0

    if-lt v0, v1, :cond_50

    .line 17
    instance-of v0, p0, Landroid/view/SurfaceView;

    if-eqz v0, :cond_2a

    move-object v0, p0

    check-cast v0, Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    if-eqz v0, :cond_50

    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    move-result v1

    if-eqz v1, :cond_50

    int-to-float v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/Surface;->setFrameRate(FI)V

    goto :goto_50

    .line 18
    :cond_2a
    instance-of v0, p0, Landroid/view/TextureView;

    if-eqz v0, :cond_50

    move-object v0, p0

    check-cast v0, Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_50

    .line 19
    new-instance v0, Landroid/view/Surface;

    move-object v1, p0

    check-cast v1, Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V
    :try_end_43
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_43} :catch_f5

    int-to-float v1, p1

    :try_start_44
    invoke-virtual {v0, v1, v2}, Landroid/view/Surface;->setFrameRate(FI)V
    :try_end_47
    .catchall {:try_start_44 .. :try_end_47} :catchall_4b

    :try_start_47
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    goto :goto_50

    :catchall_4b
    move-exception p0

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    throw p0

    .line 22
    :cond_50
    :goto_50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    :goto_55
    const/16 v3, 0xc

    if-ge v1, v3, :cond_70

    instance-of v3, v0, Landroid/content/ContextWrapper;

    if-eqz v3, :cond_70

    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_62

    goto :goto_70

    :cond_62
    move-object v3, v0

    check-cast v3, Landroid/content/ContextWrapper;

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-ne v3, v0, :cond_6c

    goto :goto_70

    :cond_6c
    add-int/lit8 v1, v1, 0x1

    move-object v0, v3

    goto :goto_55

    .line 23
    :cond_70
    :goto_70
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_f4

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-ge v1, v3, :cond_7c

    goto/16 :goto_f4

    .line 24
    :cond_7c
    check-cast v0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p0

    if-nez p0, :cond_85

    return-void

    .line 25
    :cond_85
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 26
    const/16 v3, 0x3c

    if-gt p1, v3, :cond_9e

    const/4 p0, 0x0

    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->preferredRefreshRate:F

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->preferredDisplayModeId:I

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void

    .line 27
    :cond_9e
    invoke-virtual {p0}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v3

    .line 28
    invoke-virtual {p0}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object p0

    array-length v4, p0

    const/4 v5, 0x0

    :goto_a8
    if-lt v2, v4, :cond_c0

    .line 29
    if-eqz v5, :cond_fd

    invoke-virtual {v5}, Landroid/view/Display$Mode;->getModeId()I

    move-result p0

    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->preferredDisplayModeId:I

    invoke-virtual {v5}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result p0

    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->preferredRefreshRate:F

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 30
    goto :goto_fd

    .line 28
    :cond_c0
    aget-object v6, p0, v2

    invoke-virtual {v6}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v7

    invoke-virtual {v3}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v8

    if-ne v7, v8, :cond_f1

    invoke-virtual {v6}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v7

    invoke-virtual {v3}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v8

    if-ne v7, v8, :cond_f1

    invoke-virtual {v6}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v7

    const/high16 v8, 0x3f000000    # 0.5f

    add-float/2addr v7, v8

    int-to-float v8, p1

    cmpl-float v7, v7, v8

    if-ltz v7, :cond_f1

    if-eqz v5, :cond_f0

    invoke-virtual {v6}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v7

    invoke-virtual {v5}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v8
    :try_end_ec
    .catch Ljava/lang/RuntimeException; {:try_start_47 .. :try_end_ec} :catch_f5

    cmpg-float v7, v7, v8

    if-gez v7, :cond_f1

    :cond_f0
    move-object v5, v6

    :cond_f1
    add-int/lit8 v2, v2, 0x1

    goto :goto_a8

    .line 23
    :cond_f4
    :goto_f4
    return-void

    .line 30
    :catch_f5
    move-exception p0

    const-string p0, "nicoid-comments"

    const-string p1, "Display refresh hint unavailable"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    :cond_fd
    :goto_fd
    return-void
.end method

.method public static request(Landroid/view/View;I)V
    .registers 3

    .line 13
    new-instance v0, Le/e/a/CommentDisplay$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Le/e/a/CommentDisplay$$ExternalSyntheticLambda0;-><init>(Landroid/view/View;I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 32
    return-void
.end method
