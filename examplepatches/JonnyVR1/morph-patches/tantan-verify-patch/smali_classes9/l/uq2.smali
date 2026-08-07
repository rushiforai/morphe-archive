.class public final synthetic Ll/uq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

.field public final synthetic b:Landroid/graphics/PathMeasure;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;Landroid/graphics/PathMeasure;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uq2;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    iput-object p2, p0, Ll/uq2;->b:Landroid/graphics/PathMeasure;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uq2;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    iget-object p0, p0, Ll/uq2;->b:Landroid/graphics/PathMeasure;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->h0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;Landroid/graphics/PathMeasure;Landroid/animation/ValueAnimator;)V

    return-void
.end method
