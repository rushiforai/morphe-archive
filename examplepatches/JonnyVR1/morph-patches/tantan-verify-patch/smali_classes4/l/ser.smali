.class public final synthetic Ll/ser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/view/LightningView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/view/LightningView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ser;->a:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ser;->a:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l(Lcom/p1/mobile/putong/core/newui/view/LightningView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
