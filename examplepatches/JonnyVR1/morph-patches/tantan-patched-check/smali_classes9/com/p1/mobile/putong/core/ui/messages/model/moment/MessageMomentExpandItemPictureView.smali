.class public Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;

.field public e:Lv/VDraweeView;

.field public f:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->f:F

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, -0x40800000    # -1.0f

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->f:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, -0x40800000    # -1.0f

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->f:F

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->f:F

    .line 12
    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m000;->a(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->f:F

    .line 2
    .line 3
    const/high16 v1, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v1, v0, v1

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    div-int/lit8 v1, v1, 0x3

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    cmpg-float v0, v0, v1

    .line 17
    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    const/4 p0, -0x1

    .line 21
    return p0

    .line 22
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->f:F

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    mul-int/lit8 p0, p0, 0x2

    .line 29
    .line 30
    div-int/lit8 p0, p0, 0x3

    .line 31
    .line 32
    int-to-float p0, p0

    .line 33
    cmpl-float p0, v0, p0

    .line 34
    .line 35
    if-lez p0, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public setRadius(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView$a;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->e:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->e:Lv/VDraweeView;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->webpMaxWidth1080()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->e:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
