.class Le/e/a/MiniSession225$Session$7;
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

    .line 195
    iput-object p1, p0, Le/e/a/MiniSession225$Session$7;->this$1:Le/e/a/MiniSession225$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 195
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$7;->this$1:Le/e/a/MiniSession225$Session;

    if-ne v0, v1, :cond_37

    iget-object v0, p0, Le/e/a/MiniSession225$Session$7;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->phase:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_37

    iget-object v0, p0, Le/e/a/MiniSession225$Session$7;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->cancel()I

    # getter for: Le/e/a/MiniSession225;->foreground:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/MiniSession225;->access$4()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_37

    iget-object v1, p0, Le/e/a/MiniSession225$Session$7;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v1, v1, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    if-eq v0, v1, :cond_37

    :try_start_2a
    iget-object v1, p0, Le/e/a/MiniSession225$Session$7;->this$1:Le/e/a/MiniSession225$Session;

    invoke-virtual {v1, v0}, Le/e/a/MiniSession225$Session;->attach(Landroid/app/Activity;)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2f} :catch_30

    goto :goto_37

    :catch_30
    move-exception v0

    iget-object v0, p0, Le/e/a/MiniSession225$Session$7;->this$1:Le/e/a/MiniSession225$Session;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$Session;->close(Z)V

    :cond_37
    :goto_37
    return-void
.end method
