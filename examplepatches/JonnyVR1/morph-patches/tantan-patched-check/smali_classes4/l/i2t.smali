.class public final synthetic Ll/i2t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/view/LiveLightView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/view/LiveLightView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2t;->a:Lcom/p1/mobile/putong/core/newui/view/LiveLightView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2t;->a:Lcom/p1/mobile/putong/core/newui/view/LiveLightView;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/LiveLightView;->a(Lcom/p1/mobile/putong/core/newui/view/LiveLightView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
