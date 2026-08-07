.class public Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$e;->a:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$e;->a:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->a(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)Landroid/graphics/Paint;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$e;->a:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
