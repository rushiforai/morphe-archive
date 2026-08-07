.class public final synthetic Lcom/p1/mobile/android/ui/cropiwa/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    invoke-static {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
