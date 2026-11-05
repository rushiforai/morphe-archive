.class Le/e/a/FullscreenViewport209$2;
.super Ljava/lang/Object;
.source "FullscreenViewport209.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FullscreenViewport209;->side(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$target:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 2

    .line 57
    iput-object p1, p0, Le/e/a/FullscreenViewport209$2;->val$target:Landroid/view/View;

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

    .line 57
    iget-object p1, p0, Le/e/a/FullscreenViewport209$2;->val$target:Landroid/view/View;

    invoke-static {p1}, Le/e/a/FullscreenViewport209;->restore(Landroid/view/View;)V

    return-void
.end method
