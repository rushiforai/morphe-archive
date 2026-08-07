.class public final synthetic Ll/njr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/njr;->a:I

    iput-object p2, p0, Ll/njr;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/njr;->a:I

    iget-object p0, p0, Ll/njr;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    invoke-static {v0, p0, p1}, Ll/ojr;->k(ILcom/p1/mobile/putong/core/ui/PictureView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
