.class Le/e/a/PlaybackSession$Session;
.super Ljava/lang/Object;
.source "PlaybackSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlaybackSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Session"
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field handler:Landroid/os/Handler;

.field receiver:Landroid/content/BroadcastReceiver;

.field switching:Z

.field tick:Ljava/lang/Runnable;

.field unplugged:Z

.field video:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/PlaybackSession$1;)V
    .registers 2
    .param p1, "x0"    # Le/e/a/PlaybackSession$1;

    .line 20
    invoke-direct {p0}, Le/e/a/PlaybackSession$Session;-><init>()V

    return-void
.end method
