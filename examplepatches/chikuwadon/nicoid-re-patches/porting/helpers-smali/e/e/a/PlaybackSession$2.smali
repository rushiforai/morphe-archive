.class Le/e/a/PlaybackSession$2;
.super Landroid/content/BroadcastReceiver;
.source "PlaybackSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlaybackSession;->prepared(Ljava/lang/Object;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$popup:Z

.field final synthetic val$ref:Ljava/lang/ref/WeakReference;

.field final synthetic val$state:Le/e/a/PlaybackSession$Session;


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V
    .registers 4

    .line 132
    iput-object p1, p0, Le/e/a/PlaybackSession$2;->val$ref:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/PlaybackSession$2;->val$state:Le/e/a/PlaybackSession$Session;

    iput-boolean p3, p0, Le/e/a/PlaybackSession$2;->val$popup:Z

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6

    .line 133
    iget-object p1, p0, Le/e/a/PlaybackSession$2;->val$ref:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_9

    return-void

    .line 134
    :cond_9
    iget-object p2, p0, Le/e/a/PlaybackSession$2;->val$state:Le/e/a/PlaybackSession$Session;

    const/4 v0, 0x1

    iput-boolean v0, p2, Le/e/a/PlaybackSession$Session;->unplugged:Z

    .line 135
    :try_start_e
    iget-boolean p2, p0, Le/e/a/PlaybackSession$2;->val$popup:Z

    if-eqz p2, :cond_15

    const-string p2, "e"

    goto :goto_17

    :cond_15
    const-string p2, "a0"

    :goto_17
    invoke-static {p1, p2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    const-string v0, "pause"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2, v0, v2, v1}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    iget-boolean p2, p0, Le/e/a/PlaybackSession$2;->val$popup:Z

    if-eqz p2, :cond_2c

    invoke-static {p1}, Le/e/a/ModernEnhancements;->noisy(Ljava/lang/Object;)V

    .line 137
    :cond_2c
    iget-boolean p2, p0, Le/e/a/PlaybackSession$2;->val$popup:Z

    invoke-static {p1, p2}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_31} :catch_32

    .line 138
    goto :goto_36

    :catch_32
    move-exception p1

    invoke-static {p1}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 139
    :goto_36
    return-void
.end method
