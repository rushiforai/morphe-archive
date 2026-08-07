.class public final synthetic Lv/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lv/VBaseSlider;


# direct methods
.method public synthetic constructor <init>(Lv/VBaseSlider;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv/b;->a:Lv/VBaseSlider;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/b;->a:Lv/VBaseSlider;

    invoke-static {p0, p1}, Lv/VBaseSlider;->a(Lv/VBaseSlider;Landroid/animation/ValueAnimator;)V

    return-void
.end method
