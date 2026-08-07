.class public final synthetic Ll/dm50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

.field public final synthetic b:F

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;FLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dm50;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    iput p2, p0, Ll/dm50;->b:F

    iput-object p3, p0, Ll/dm50;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dm50;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    iget v1, p0, Ll/dm50;->b:F

    iget-object p0, p0, Ll/dm50;->c:Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->a(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;FLandroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method
