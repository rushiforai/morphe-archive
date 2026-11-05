.class Le/e/a/MiniSession225$Session$2;
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

    .line 128
    iput-object p1, p0, Le/e/a/MiniSession225$Session$2;->this$1:Le/e/a/MiniSession225$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 128
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$2;->this$1:Le/e/a/MiniSession225$Session;

    if-ne v0, v1, :cond_21

    iget-object v0, p0, Le/e/a/MiniSession225$Session$2;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-nez v0, :cond_13

    goto :goto_21

    :cond_13
    iget-object v0, p0, Le/e/a/MiniSession225$Session$2;->this$1:Le/e/a/MiniSession225$Session;

    invoke-virtual {v0}, Le/e/a/MiniSession225$Session;->update()V

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_21
    :goto_21
    return-void
.end method
