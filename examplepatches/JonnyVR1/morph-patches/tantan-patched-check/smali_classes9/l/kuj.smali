.class public final synthetic Ll/kuj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;

.field public final synthetic b:Landroid/widget/FrameLayout$LayoutParams;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kuj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;

    iput-object p2, p0, Ll/kuj;->b:Landroid/widget/FrameLayout$LayoutParams;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kuj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;

    iget-object p0, p0, Ll/kuj;->b:Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;->v(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;Landroid/widget/FrameLayout$LayoutParams;Landroid/animation/ValueAnimator;)V

    return-void
.end method
