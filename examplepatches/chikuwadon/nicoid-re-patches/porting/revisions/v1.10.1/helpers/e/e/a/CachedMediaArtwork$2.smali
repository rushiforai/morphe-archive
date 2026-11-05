.class public final synthetic Le/e/a/CachedMediaArtwork$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/media/session/MediaSession;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Landroid/media/MediaMetadata;

.field public final synthetic f$3:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Landroid/media/session/MediaSession;Ljava/lang/Object;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CachedMediaArtwork$2;->f$0:Landroid/media/session/MediaSession;

    iput-object p2, p0, Le/e/a/CachedMediaArtwork$2;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/CachedMediaArtwork$2;->f$2:Landroid/media/MediaMetadata;

    iput-object p4, p0, Le/e/a/CachedMediaArtwork$2;->f$3:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/CachedMediaArtwork$2;->f$0:Landroid/media/session/MediaSession;

    iget-object v1, p0, Le/e/a/CachedMediaArtwork$2;->f$1:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/CachedMediaArtwork$2;->f$2:Landroid/media/MediaMetadata;

    iget-object v3, p0, Le/e/a/CachedMediaArtwork$2;->f$3:Landroid/graphics/Bitmap;

    invoke-static {v0, v1, v2, v3}, Le/e/a/CachedMediaArtwork;->lambda$1(Landroid/media/session/MediaSession;Ljava/lang/Object;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V

    return-void
.end method
