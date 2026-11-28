.class final Le/e/a/ArtworkRetry251$Publish;
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
    name = "Publish"
.end annotation


# instance fields
.field private final b:Landroid/graphics/Bitmap;

.field private final job:Le/e/a/ArtworkRetry251;


# direct methods
.method constructor <init>(Le/e/a/ArtworkRetry251;Landroid/graphics/Bitmap;)V
    .registers 3

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ArtworkRetry251$Publish;->job:Le/e/a/ArtworkRetry251;

    iput-object p2, p0, Le/e/a/ArtworkRetry251$Publish;->b:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 32
    iget-object v0, p0, Le/e/a/ArtworkRetry251$Publish;->job:Le/e/a/ArtworkRetry251;

    # invokes: Le/e/a/ArtworkRetry251;->current()Z
    invoke-static {v0}, Le/e/a/ArtworkRetry251;->access$000(Le/e/a/ArtworkRetry251;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/ArtworkRetry251$Publish;->job:Le/e/a/ArtworkRetry251;

    # invokes: Le/e/a/ArtworkRetry251;->same()Z
    invoke-static {v0}, Le/e/a/ArtworkRetry251;->access$100(Le/e/a/ArtworkRetry251;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/ArtworkRetry251$Publish;->job:Le/e/a/ArtworkRetry251;

    # getter for: Le/e/a/ArtworkRetry251;->session:Landroid/media/session/MediaSession;
    invoke-static {v0}, Le/e/a/ArtworkRetry251;->access$200(Le/e/a/ArtworkRetry251;)Landroid/media/session/MediaSession;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ArtworkRetry251$Publish;->job:Le/e/a/ArtworkRetry251;

    # getter for: Le/e/a/ArtworkRetry251;->token:Ljava/lang/Object;
    invoke-static {v1}, Le/e/a/ArtworkRetry251;->access$600(Le/e/a/ArtworkRetry251;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/ArtworkRetry251$Publish;->job:Le/e/a/ArtworkRetry251;

    # getter for: Le/e/a/ArtworkRetry251;->metadata:Landroid/media/MediaMetadata;
    invoke-static {v2}, Le/e/a/ArtworkRetry251;->access$700(Le/e/a/ArtworkRetry251;)Landroid/media/MediaMetadata;

    move-result-object v2

    iget-object v3, p0, Le/e/a/ArtworkRetry251$Publish;->b:Landroid/graphics/Bitmap;

    invoke-static {v0, v1, v2, v3}, Le/e/a/CachedMediaArtwork;->lambda$1(Landroid/media/session/MediaSession;Ljava/lang/Object;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method
