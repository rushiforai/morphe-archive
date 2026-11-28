.class final Le/e/a/ArtworkRetry251$Retry;
.super Ljava/lang/Object;
.source "ArtworkRetry251.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ArtworkRetry251;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Retry"
.end annotation


# instance fields
.field private final job:Le/e/a/ArtworkRetry251;


# direct methods
.method constructor <init>(Le/e/a/ArtworkRetry251;)V
    .registers 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ArtworkRetry251$Retry;->job:Le/e/a/ArtworkRetry251;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 31
    iget-object v0, p0, Le/e/a/ArtworkRetry251$Retry;->job:Le/e/a/ArtworkRetry251;

    # invokes: Le/e/a/ArtworkRetry251;->current()Z
    invoke-static {v0}, Le/e/a/ArtworkRetry251;->access$000(Le/e/a/ArtworkRetry251;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/ArtworkRetry251$Retry;->job:Le/e/a/ArtworkRetry251;

    # invokes: Le/e/a/ArtworkRetry251;->same()Z
    invoke-static {v0}, Le/e/a/ArtworkRetry251;->access$100(Le/e/a/ArtworkRetry251;)Z

    move-result v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Le/e/a/ArtworkRetry251$Retry;->job:Le/e/a/ArtworkRetry251;

    # getter for: Le/e/a/ArtworkRetry251;->session:Landroid/media/session/MediaSession;
    invoke-static {v0}, Le/e/a/ArtworkRetry251;->access$200(Le/e/a/ArtworkRetry251;)Landroid/media/session/MediaSession;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/session/MediaSession;->isActive()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/ArtworkRetry251$Retry;->job:Le/e/a/ArtworkRetry251;

    # getter for: Le/e/a/ArtworkRetry251;->owner:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Le/e/a/ArtworkRetry251;->access$300(Le/e/a/ArtworkRetry251;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ArtworkRetry251$Retry;->job:Le/e/a/ArtworkRetry251;

    # getter for: Le/e/a/ArtworkRetry251;->id:Ljava/lang/String;
    invoke-static {v1}, Le/e/a/ArtworkRetry251;->access$400(Le/e/a/ArtworkRetry251;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-static {v0}, Le/e/a/FeedbackMedia;->bundle(Ljava/lang/Object;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ArtworkProbe249;->key(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Le/e/a/ArtworkRetry251$Retry;->job:Le/e/a/ArtworkRetry251;

    # setter for: Le/e/a/ArtworkRetry251;->key:Ljava/lang/String;
    invoke-static {v1, v0}, Le/e/a/ArtworkRetry251;->access$502(Le/e/a/ArtworkRetry251;Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    sget-object v0, Le/e/a/CachedMediaArtwork;->WORKER:Ljava/util/concurrent/ExecutorService;

    iget-object v1, p0, Le/e/a/ArtworkRetry251$Retry;->job:Le/e/a/ArtworkRetry251;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :catch_0
    move-exception v0

    :cond_1
    return-void
.end method
