.class public final synthetic Ll/xez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Landroid/widget/FrameLayout$LayoutParams;

.field public final synthetic b:Ll/qzz;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/FrameLayout$LayoutParams;Ll/qzz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xez;->a:Landroid/widget/FrameLayout$LayoutParams;

    iput-object p2, p0, Ll/xez;->b:Ll/qzz;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xez;->a:Landroid/widget/FrameLayout$LayoutParams;

    iget-object p0, p0, Ll/xez;->b:Ll/qzz;

    invoke-static {v0, p0, p1}, Ll/ffz;->y(Landroid/widget/FrameLayout$LayoutParams;Ll/qzz;Landroid/animation/ValueAnimator;)V

    return-void
.end method
