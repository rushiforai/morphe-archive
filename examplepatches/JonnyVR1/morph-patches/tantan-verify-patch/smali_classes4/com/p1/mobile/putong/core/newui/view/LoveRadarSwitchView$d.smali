.class public Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$d;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$d;->a:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

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
    .locals 0
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$d;->a:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->b(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
