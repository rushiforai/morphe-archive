.class Le/e/a/MiniSession225$Session$4;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MiniSession225$Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/MiniSession225$Session;


# direct methods
.method constructor <init>(Le/e/a/MiniSession225$Session;)V
    .registers 2

    .line 130
    iput-object p1, p0, Le/e/a/MiniSession225$Session$4;->this$1:Le/e/a/MiniSession225$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 130
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$4;->this$1:Le/e/a/MiniSession225$Session;

    if-ne v0, v1, :cond_25

    iget-object v0, p0, Le/e/a/MiniSession225$Session$4;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_25

    iget-object v0, p0, Le/e/a/MiniSession225$Session$4;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->phase:I

    if-nez v0, :cond_25

    iget-object v0, p0, Le/e/a/MiniSession225$Session$4;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v1, p0, Le/e/a/MiniSession225$Session$4;->this$1:Le/e/a/MiniSession225$Session;

    iget v1, v1, Le/e/a/MiniSession225$Session;->initialExpansion:F

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$Session;->apply(F)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session$4;->this$1:Le/e/a/MiniSession225$Session;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$Session;->settle(Z)V

    :cond_25
    return-void
.end method
