.class public Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;
.super Landroid/view/SurfaceView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;,
        Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$a;
    }
.end annotation


# instance fields
.field public a:Ll/cox;

.field public b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->a(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->a(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->a(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance p1, Ll/cox;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/cox;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->a:Ll/cox;

    .line 7
    .line 8
    new-instance p1, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView$b;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-interface {p0, p1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public getView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setClassName(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->a:Ll/cox;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/cox;->a(II)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->a:Ll/cox;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/cox;->c()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->a:Ll/cox;

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/cox;->b()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setAspectRatio(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/SurfaceRenderView;->a:Ll/cox;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/cox;->d(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVideoRotation(I)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "SurfaceView doesn\'t support rotation ("

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ")!\n"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, ""

    .line 21
    .line 22
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    return-void
.end method
