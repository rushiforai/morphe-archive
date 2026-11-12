.class public final Lioi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ScrollCaptureCallback;


# instance fields
.field public a:Lhoi;


# virtual methods
.method public final onScrollCaptureEnd(Ljava/lang/Runnable;)V
    .registers 4

    iget-object p0, p0, Lioi;->a:Lhoi;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->Mud1A5Xc()Z

    iget-object v0, p0, Lhoi;->c:Lr72;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lr72;->b()V

    iput-object v1, p0, Lhoi;->c:Lr72;

    :cond_12
    iput-object v1, p0, Lhoi;->d:Landroid/graphics/Rect;

    const/4 v0, 0x0

    iput v0, p0, Lhoi;->e:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lhoi;->f:F

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final onScrollCaptureImageRequest(Landroid/view/ScrollCaptureSession;Landroid/os/CancellationSignal;Landroid/graphics/Rect;Ljava/util/function/Consumer;)V
    .registers 12

    iget-object v1, p0, Lioi;->a:Lhoi;

    invoke-virtual {p1}, Landroid/view/ScrollCaptureSession;->getSurface()Landroid/view/Surface;

    move-result-object v5

    new-instance v3, Lwa;

    const/16 p0, 0x17

    invoke-direct {v3, p4, p0}, Lwa;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    iget p1, v1, Lhoi;->e:I

    invoke-virtual {p3, p0, p1}, Landroid/graphics/Rect;->offset(II)V

    iget-object p0, v1, Lhoi;->d:Landroid/graphics/Rect;

    invoke-virtual {p3, p0}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    move-result p0

    if-eqz p0, :cond_5c

    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result p0

    const/16 p1, 0x14

    if-lt p0, p1, :cond_5c

    iget-object p0, v1, Lhoi;->c:Lr72;

    new-instance v2, Lg1d;

    iget-object p1, p0, Lr72;->c:Ljava/lang/Object;

    check-cast p1, Lng3;

    new-instance p2, Lfb;

    const/4 p4, 0x1

    invoke-direct {p2, p4}, Lfb;-><init>(B)V

    invoke-direct {v2, p1, p3, p2}, Lg1d;-><init>(Lng3;Landroid/graphics/Rect;Lfb;)V

    iget-byte p1, p0, Lr72;->a:B

    const/4 p2, 0x4

    if-ne p1, p2, :cond_3d

    invoke-virtual {v2}, Lg1d;->a()V

    goto :goto_4b

    :cond_3d
    const/4 p2, 0x5

    if-ne p1, p2, :cond_48

    iget-object p0, p0, Lr72;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4b

    :cond_48
    invoke-virtual {v2, p1}, Lg1d;->b(I)V

    :goto_4b
    new-instance v0, Luf;

    const/4 v6, 0x3

    move-object v4, p3

    invoke-direct/range {v0 .. v6}, Luf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, v2, Lg1d;->e:Luf;

    iget-byte p0, v2, Lg1d;->c:B

    if-eqz p0, :cond_5b

    invoke-virtual {v2, p0}, Lg1d;->b(I)V

    :cond_5b
    return-void

    :cond_5c
    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3, p0}, Lwa;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method public final onScrollCaptureSearch(Landroid/os/CancellationSignal;Ljava/util/function/Consumer;)V
    .registers 7

    iget-object p0, p0, Lioi;->a:Lhoi;

    iget-object p1, p0, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    iget-object v0, p0, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_41

    if-eqz p1, :cond_41

    iget-object v0, p0, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-wide v0, v0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_41

    invoke-static {v0, v1}, LJ/N;->MWxyiKiL(J)Z

    move-result v0

    if-eqz v0, :cond_41

    check-cast p1, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p1, p1, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    new-instance v0, Landroid/graphics/Rect;

    iget v1, p1, Lhuh;->e:F

    invoke-virtual {p1, v1}, Lhuh;->a(F)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {p1}, Lhuh;->b()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iget p1, p1, Lhuh;->h:F

    iput p1, p0, Lhoi;->f:F

    goto :goto_46

    :cond_41
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    :goto_46
    invoke-interface {p2, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method public final onScrollCaptureStart(Landroid/view/ScrollCaptureSession;Landroid/os/CancellationSignal;Ljava/lang/Runnable;)V
    .registers 6

    iget-object p0, p0, Lioi;->a:Lhoi;

    iget-object p1, p0, Lhoi;->a:La36;

    iget-object p1, p0, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    new-instance v0, Lr72;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lr72;-><init>(Ldx3;Lcom/opera/android/browser/WebContentsWrapper;)V

    iput-object v0, p0, Lhoi;->c:Lr72;

    new-instance p1, Lgoi;

    invoke-direct {p1, p0, p2, p3}, Lgoi;-><init>(Lhoi;Landroid/os/CancellationSignal;Ljava/lang/Runnable;)V

    iget-object p0, v0, Lr72;->d:Ljava/lang/Object;

    check-cast p0, Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-byte p0, v0, Lr72;->a:B

    invoke-virtual {p1, p0}, Lgoi;->b(I)V

    iget-byte p0, v0, Lr72;->a:B

    const/4 p2, 0x4

    if-ne p0, p2, :cond_40

    iget-object p0, v0, Lr72;->c:Ljava/lang/Object;

    check-cast p0, Lng3;

    iget-object p0, p0, Lng3;->a:Lvzk;

    const/4 p2, 0x0

    if-nez p0, :cond_32

    move-object p3, p2

    goto :goto_36

    :cond_32
    iget-object p3, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p3, Landroid/util/Size;

    :goto_36
    if-eqz p0, :cond_3d

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    move-object p2, p0

    check-cast p2, Landroid/graphics/Point;

    :cond_3d
    invoke-virtual {p1, p3, p2}, Lgoi;->a(Landroid/util/Size;Landroid/graphics/Point;)V

    :cond_40
    invoke-static {}, LJ/N;->Mjfn11hV()V

    return-void
.end method
