.class Le/e/a/MiniSession225$SurfaceKeeper$1;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/MiniSession225$SurfaceKeeper;->restore(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/MiniSession225$SurfaceKeeper;


# direct methods
.method constructor <init>(Le/e/a/MiniSession225$SurfaceKeeper;)V
    .registers 2

    .line 117
    iput-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper$1;->this$1:Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 117
    iget-object p1, p0, Le/e/a/MiniSession225$SurfaceKeeper$1;->this$1:Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object p1, p1, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    if-eqz p1, :cond_11

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    iget-object v0, p0, Le/e/a/MiniSession225$SurfaceKeeper$1;->this$1:Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object v0, v0, Le/e/a/MiniSession225$SurfaceKeeper;->restoreOutput:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_11
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 117
    return-void
.end method
