.class Le/e/a/MiniSession225$Session$6;
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

    .line 132
    iput-object p1, p0, Le/e/a/MiniSession225$Session$6;->this$1:Le/e/a/MiniSession225$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 133
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$6;->this$1:Le/e/a/MiniSession225$Session;

    if-ne v0, v1, :cond_3e

    # getter for: Le/e/a/MiniSession225;->foreground:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/MiniSession225;->access$4()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_3e

    iget-object v0, p0, Le/e/a/MiniSession225$Session$6;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-nez v0, :cond_1d

    goto :goto_3e

    .line 135
    :cond_1d
    iget-object v0, p0, Le/e/a/MiniSession225$Session$6;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    move-result v0

    if-nez v0, :cond_3d

    :try_start_28
    iget-object v0, p0, Le/e/a/MiniSession225$Session$6;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v1, "pause"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v2}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_36} :catch_37

    goto :goto_3d

    :catch_37
    move-exception v0

    const-string v1, "Cannot pause hidden playback"

    invoke-static {v1, v0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 136
    :cond_3d
    :goto_3d
    return-void

    .line 133
    :cond_3e
    :goto_3e
    return-void
.end method
