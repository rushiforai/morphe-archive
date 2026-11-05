.class Le/e/a/Review181$3;
.super Ljava/lang/Object;
.source "Review181.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Review181;->shortOverlay(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$overlay:Landroid/widget/FrameLayout;

.field private final synthetic val$update:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/widget/FrameLayout;Ljava/lang/Runnable;)V
    .registers 3

    .line 120
    iput-object p1, p0, Le/e/a/Review181$3;->val$overlay:Landroid/widget/FrameLayout;

    iput-object p2, p0, Le/e/a/Review181$3;->val$update:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 120
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 120
    iget-object p1, p0, Le/e/a/Review181$3;->val$overlay:Landroid/widget/FrameLayout;

    iget-object v0, p0, Le/e/a/Review181$3;->val$update:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method
