.class Le/e/a/FullscreenViewport209$3;
.super Ljava/lang/Object;
.source "FullscreenViewport209.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FullscreenViewport209;->normalStatus(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$target:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;)V
    .registers 2

    .line 74
    iput-object p1, p0, Le/e/a/FullscreenViewport209$3;->val$target:Ljava/lang/ref/WeakReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 74
    iget-object p1, p0, Le/e/a/FullscreenViewport209$3;->val$target:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-eqz p1, :cond_d

    invoke-static {p1}, Le/e/a/FullscreenViewport209;->restore(Landroid/view/View;)V

    :cond_d
    return-void
.end method
