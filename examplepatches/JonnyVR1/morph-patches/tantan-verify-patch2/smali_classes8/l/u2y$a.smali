.class public Ll/u2y$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u2y;->p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Ll/u2y;


# direct methods
.method public constructor <init>(Ll/u2y;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/u2y$a;->b:Ll/u2y;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/c9c0;->b:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Ll/u2y$a;->a:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/u2y$a;->b:Ll/u2y;

    .line 6
    .line 7
    iget-object v1, v0, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;->f:Ll/b3y;

    .line 10
    .line 11
    iget v1, v1, Ll/b3y;->i:I

    .line 12
    .line 13
    iget v2, p0, Ll/u2y$a;->a:I

    .line 14
    .line 15
    invoke-static {v0}, Ll/u2y;->r(Ll/u2y;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    sub-float p1, v0, p1

    .line 25
    .line 26
    :goto_0
    invoke-static {v1, v2, p1}, Ll/ye5;->a(IIF)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object p0, p0, Ll/u2y$a;->b:Ll/u2y;

    .line 31
    .line 32
    iget-object p0, p0, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
