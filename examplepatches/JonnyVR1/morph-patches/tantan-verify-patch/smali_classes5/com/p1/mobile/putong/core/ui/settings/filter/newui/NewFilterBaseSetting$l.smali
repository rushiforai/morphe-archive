.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->s0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$l;->b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$l;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$l;->b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->o:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$l;->a:I

    .line 22
    .line 23
    neg-int v2, v1

    .line 24
    int-to-float v2, v2

    .line 25
    mul-float/2addr v2, p1

    .line 26
    float-to-int v2, v2

    .line 27
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$l;->b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    mul-float/2addr v1, p1

    .line 33
    float-to-int p1, v1

    .line 34
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->p0(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$l;->b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->o:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
