.class Le/e/a/MiniSession225$Session$8;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/MiniSession225$Session;->attach(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/MiniSession225$Session;

.field private final synthetic val$installed:Landroid/widget/FrameLayout;


# direct methods
.method constructor <init>(Le/e/a/MiniSession225$Session;Landroid/widget/FrameLayout;)V
    .registers 3

    .line 158
    iput-object p1, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iput-object p2, p0, Le/e/a/MiniSession225$Session$8;->val$installed:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .line 158
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    if-ne v0, v1, :cond_83

    iget-object v0, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le/e/a/MiniSession225$Session$8;->val$installed:Landroid/widget/FrameLayout;

    if-ne v0, v1, :cond_83

    iget-object v0, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-nez v0, :cond_1b

    goto :goto_83

    :cond_1b
    iget-object v0, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    iget-object v1, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v1, v1, Le/e/a/MiniSession225$Session;->texture:Landroid/view/TextureView;

    invoke-static {v0, v1}, Le/e/a/VideoOutput227;->bind(Landroid/view/View;Landroid/view/TextureView;)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-boolean v0, v0, Le/e/a/MiniSession225$Session;->firstResume:Z

    if-eqz v0, :cond_83

    iget-object v0, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    const/4 v1, 0x0

    iput-boolean v1, v0, Le/e/a/MiniSession225$Session;->firstResume:Z

    :try_start_31
    iget-object v0, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v2, "audioFocusHelper"

    invoke-static {v0, v2}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v3, "pausedForLoss"

    invoke-static {v0, v3}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v2, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-boolean v2, v2, Le/e/a/MiniSession225$Session;->intendedPlaying:Z

    if-eqz v2, :cond_83

    if-nez v0, :cond_83

    iget-object v0, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/PlaybackSession;->allowRetry(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_83

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v2, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v2, v2, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v3, "isPlaying"

    new-array v4, v1, [Ljava/lang/Class;

    new-array v5, v1, [Ljava/lang/Object;

    invoke-static {v2, v3, v4, v5}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_83

    iget-object v0, p0, Le/e/a/MiniSession225$Session$8;->this$1:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v2, "start"

    new-array v3, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v2, v3, v1}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_7c} :catch_7d

    goto :goto_83

    :catch_7d
    move-exception v0

    const-string v1, "Cannot preserve navigation playback state"

    invoke-static {v1, v0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_83
    :goto_83
    return-void
.end method
