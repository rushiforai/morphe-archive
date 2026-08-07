.class public Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;
.super Landroid/view/TextureView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;,
        Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;
    }
.end annotation


# instance fields
.field public a:Ll/cox;

.field public b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 0

    .line 1
    new-instance p1, Ll/cox;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/cox;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a:Ll/cox;

    .line 7
    .line 8
    new-instance p1, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getSurfaceHolder()Ll/s4m;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->a(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;)Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;

    .line 10
    .line 11
    invoke-direct {v0, p0, v1, v2}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;Landroid/graphics/SurfaceTexture;Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->d()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->b:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->b()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;

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

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;

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
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a:Ll/cox;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/cox;->a(II)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a:Ll/cox;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/cox;->c()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a:Ll/cox;

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
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a:Ll/cox;

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
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;->a:Ll/cox;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/cox;->e(I)V

    .line 4
    .line 5
    .line 6
    int-to-float p1, p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setRotation(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
