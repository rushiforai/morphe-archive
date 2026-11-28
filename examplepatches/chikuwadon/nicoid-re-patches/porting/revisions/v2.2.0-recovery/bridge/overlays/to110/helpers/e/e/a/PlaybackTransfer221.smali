.class public final Le/e/a/PlaybackTransfer221;
.super Ljava/lang/Object;
.source "PlaybackTransfer221.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlaybackTransfer221$Transfer;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field static final PORTRAIT:Ljava/lang/String; = "nicoid_portrait_restore"

.field static final TOKEN:Ljava/lang/String; = "nicoid_playback_transfer"

.field private static pending:Le/e/a/PlaybackTransfer221$Transfer;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 16
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/PlaybackTransfer221;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Le/e/a/PlaybackTransfer221$Transfer;
    .registers 1

    .line 17
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    return-object v0
.end method

.method public static allowStart(Ljava/lang/Object;)Z
    .registers 5

    .line 69
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-boolean v2, v0, Le/e/a/PlaybackTransfer221$Transfer;->committing:Z

    if-eqz v2, :cond_1

    iget-object v2, v0, Le/e/a/PlaybackTransfer221$Transfer;->targetPlayer:Ljava/lang/Object;

    if-ne v2, p0, :cond_1

    return v1

    .line 70
    :cond_1
    :try_start_0
    iget-boolean v2, v0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    iget-object v2, v0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    if-eqz v2, :cond_2

    iget-object v0, v0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    const-string v2, "e"

    invoke-static {v0, v2}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_2

    return v3

    :cond_2
    return v1

    .line 71
    :cond_3
    instance-of v2, p0, Landroid/view/View;

    if-nez v2, :cond_4

    return v1

    :cond_4
    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    :goto_0
    const/16 v2, 0x8

    if-ge v3, v2, :cond_7

    instance-of v2, p0, Landroid/content/ContextWrapper;

    if-nez v2, :cond_5

    goto :goto_1

    .line 72
    :cond_5
    instance-of v2, p0, Landroid/app/Activity;

    if-eqz v2, :cond_6

    iget-object v0, v0, Le/e/a/PlaybackTransfer221$Transfer;->token:Ljava/lang/String;

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v2, "nicoid_playback_transfer"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    :cond_6
    check-cast p0, Landroid/content/ContextWrapper;

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 73
    const-string v0, "nicoid-transfer"

    const-string v2, "Cannot inspect pending playback"

    invoke-static {v0, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_7
    :goto_1
    return v1
.end method

.method static awaitStart(Le/e/a/PlaybackTransfer221$Transfer;I)V
    .registers 4

    .line 87
    sget-object v0, Le/e/a/PlaybackTransfer221;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/PlaybackTransfer221$2;

    invoke-direct {v1, p0, p1}, Le/e/a/PlaybackTransfer221$2;-><init>(Le/e/a/PlaybackTransfer221$Transfer;I)V

    const-wide/16 p0, 0x64

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static bindService(Ljava/lang/Object;Landroid/content/Intent;)V
    .registers 5

    .line 63
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-eqz v0, :cond_0

    iget-boolean v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    iget-object v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->token:Ljava/lang/String;

    const-string v2, "nicoid_playback_transfer"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->id:Ljava/lang/String;

    const-string v2, "url"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iput-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static cancel(Le/e/a/PlaybackTransfer221$Transfer;)V
    .registers 6

    .line 89
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-eq v0, p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    sput-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    sget-object v0, Le/e/a/PlaybackTransfer221;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PlaybackTransfer221$Transfer;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :try_start_0
    iget-boolean v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->committing:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->targetPlayer:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->targetPlayer:Ljava/lang/Object;

    const-string v2, "pause"

    new-array v3, v1, [Ljava/lang/Class;

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {v0, v2, v3, v4}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-boolean v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->committing:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->resumeOnCancel:Z

    if-eqz v0, :cond_2

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->valid(Le/e/a/PlaybackTransfer221$Transfer;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/PlaybackSession;->allowRetry(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    const-string v2, "start"

    new-array v3, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v2, v3, v1}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "nicoid-transfer"

    const-string v2, "Cannot restore original playback"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_0
    :try_start_1
    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    instance-of v0, v0, Landroid/app/Service;

    if-eqz v0, :cond_3

    iget-object p0, p0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    check-cast p0, Landroid/app/Service;

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    if-eqz v0, :cond_4

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    const-string v1, "A1"

    invoke-static {v0, v1}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_4

    iget-object p0, p0, Le/e/a/PlaybackTransfer221$Transfer;->token:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_playback_transfer"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_4
    :goto_1
    return-void
.end method

.method static capture(Ljava/lang/Object;Z)Le/e/a/PlaybackTransfer221$Transfer;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 31
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-nez v0, :cond_5

    .line 32
    new-instance v0, Le/e/a/PlaybackTransfer221$Transfer;

    invoke-direct {v0}, Le/e/a/PlaybackTransfer221$Transfer;-><init>()V

    iput-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    if-eqz p1, :cond_0

    const-string v1, "e"

    goto :goto_0

    :cond_0
    const-string v1, "a0"

    :goto_0
    invoke-static {p0, v1}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->id(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->id:Ljava/lang/String;

    .line 33
    iget-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    if-eqz p0, :cond_4

    iget-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->id:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "null"

    iget-object v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->id:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    .line 34
    iget-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v3, v1, [Ljava/lang/Object;

    const-string v4, "getDuration"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-lez p0, :cond_3

    .line 35
    iget-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->position(Ljava/lang/Object;)J

    move-result-wide v2

    iput-wide v2, v0, Le/e/a/PlaybackTransfer221$Transfer;->position:J

    iget-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->isPlaying(Ljava/lang/Object;)Z

    move-result p0

    iput-boolean p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->playing:Z

    xor-int/lit8 p0, p1, 0x1

    iput-boolean p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->token:Ljava/lang/String;

    const/high16 p0, 0x3f800000    # 1.0f

    .line 36
    :try_start_0
    iget-object p1, v0, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    const-string v2, "getPlaybackSpeed"

    new-array v3, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v2, v3, v1}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    iput p1, v0, Le/e/a/PlaybackTransfer221$Transfer;->speed:F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    iput p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->speed:F

    .line 37
    :goto_1
    iget p1, v0, Le/e/a/PlaybackTransfer221$Transfer;->speed:F

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    if-nez p1, :cond_1

    iget p1, v0, Le/e/a/PlaybackTransfer221$Transfer;->speed:F

    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result p1

    if-nez p1, :cond_1

    iget p1, v0, Le/e/a/PlaybackTransfer221$Transfer;->speed:F

    const/4 v1, 0x0

    cmpg-float p1, p1, v1

    if-gtz p1, :cond_2

    :cond_1
    iput p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->speed:F

    .line 38
    :cond_2
    sput-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    new-instance p0, Le/e/a/PlaybackTransfer221$1;

    invoke-direct {p0, v0}, Le/e/a/PlaybackTransfer221$1;-><init>(Le/e/a/PlaybackTransfer221$Transfer;)V

    iput-object p0, v0, Le/e/a/PlaybackTransfer221$Transfer;->timeout:Ljava/lang/Runnable;

    sget-object p0, Le/e/a/PlaybackTransfer221;->MAIN:Landroid/os/Handler;

    iget-object p1, v0, Le/e/a/PlaybackTransfer221$Transfer;->timeout:Ljava/lang/Runnable;

    const-wide/16 v1, 0x4e20

    invoke-virtual {p0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-object v0

    .line 34
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Source not prepared"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 33
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "No prepared source"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 31
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Transfer already in progress"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static complete(Le/e/a/PlaybackTransfer221$Transfer;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 88
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-eq v0, p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    sput-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    sget-object v0, Le/e/a/PlaybackTransfer221;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PlaybackTransfer221$Transfer;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-boolean v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    const-string v1, "A1"

    if-eqz v0, :cond_1

    iget-object p0, p0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    invoke-static {p0, v1}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->portrait(Ljava/lang/Object;)V

    iget-object v0, p0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    invoke-static {v0, v1}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_portrait_restore"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    iget-object p0, p0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    check-cast p0, Landroid/app/Service;

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :goto_0
    const-string p0, "Playback transfer ready; position, state and speed preserved"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    invoke-static {}, Le/e/a/PlaybackBar221;->refresh()V

    return-void
.end method

.method public static destroyed(Ljava/lang/Object;)V
    .registers 3

    .line 90
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-eqz v0, :cond_1

    iget-object v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    if-eq v1, p0, :cond_0

    iget-object v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    if-ne v1, p0, :cond_1

    :cond_0
    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    :cond_1
    invoke-static {}, Le/e/a/PlaybackBar221;->refresh()V

    return-void
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static id(Ljava/lang/Object;Z)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 28
    const-string p1, "f"

    goto :goto_0

    :cond_0
    const-string p1, "b0"

    :goto_0
    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static isPlaying(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 26
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "isPlaying"

    invoke-static {p0, v3, v2, v1}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static keepPopupModel(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 100
    invoke-static {p0}, Le/e/a/PopupReturn244;->keep(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-eqz v0, :cond_0

    iget-boolean v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    if-nez v1, :cond_0

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->valid(Le/e/a/PlaybackTransfer221$Transfer;)Z

    move-result v1

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v0, v0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "k0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-object p0
.end method

.method static matches(Le/e/a/PlaybackTransfer221$Transfer;Ljava/lang/Object;Z)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    .line 64
    iget-boolean v1, p0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    if-ne v1, p2, :cond_4

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->valid(Le/e/a/PlaybackTransfer221$Transfer;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 65
    :cond_0
    :try_start_0
    iget-object v1, p0, Le/e/a/PlaybackTransfer221$Transfer;->id:Ljava/lang/String;

    invoke-static {p1, p2}, Le/e/a/PlaybackTransfer221;->id(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    const/4 v1, 0x1

    if-eqz p2, :cond_3

    .line 66
    iget-object p0, p0, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    if-ne p0, p1, :cond_2

    return v1

    :cond_2
    return v0

    .line 67
    :cond_3
    const-string p2, "A1"

    invoke-static {p1, p2}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    if-eqz p1, :cond_4

    iget-object p0, p0, Le/e/a/PlaybackTransfer221$Transfer;->token:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string p2, "nicoid_playback_transfer"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_4

    return v1

    :catch_0
    :cond_4
    :goto_0
    return v0
.end method

.method public static policy(Ljava/lang/Object;Z)I
    .registers 5

    invoke-static {p0, p1}, Le/e/a/MiniSession225;->back(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, -0x1

    .line 56
    :try_start_0
    invoke-static {p0, p1}, Le/e/a/AppSwitchGuard;->intercept(Ljava/lang/Object;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    move-object v1, p0

    check-cast v1, Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/PlaybackRouting25;->owner(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_7

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 57
    :cond_2
    sget-object v2, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-eqz v2, :cond_3

    iget-object v2, v2, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    if-ne v2, p0, :cond_3

    const/4 p0, 0x1

    return p0

    .line 58
    :cond_3
    const-string v2, "a0"

    invoke-static {p0, v2}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PlaybackTransfer221;->isPlaying(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    return v0

    :cond_4
    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    if-eqz p1, :cond_5

    const-string p1, "back_playback"

    goto :goto_0

    :cond_5
    const-string p1, "app_switch_playback"

    :goto_0
    const-string v2, "none"

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 59
    const-string v1, "popup"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "background"

    if-nez v1, :cond_6

    :try_start_1
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v0

    .line 60
    :cond_6
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return p0

    :catch_0
    :cond_7
    :goto_1
    return v0
.end method

.method public static popup(Ljava/lang/Object;Z)Z
    .registers 16

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 43
    :try_start_0
    const-string v2, "A1"

    invoke-static {p0, v2}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    if-eqz v2, :cond_7

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_7

    const-string v3, "x0"

    invoke-static {p0, v3}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_1

    .line 44
    :cond_0
    sget-object v3, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    iget-object p1, v3, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    if-ne p1, p0, :cond_1

    return v4

    :cond_1
    return v0

    :cond_2
    if-nez p1, :cond_3

    .line 45
    invoke-static {v2, p0}, Le/e/a/VideoMiniPlayer;->canTransfer(Landroid/content/Context;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string p0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u306b\u306f\u4ed6\u306e\u30a2\u30d7\u30ea\u306e\u4e0a\u306b\u8868\u793a\u3059\u308b\u6a29\u9650\u304c\u5fc5\u8981\u3067\u3059"

    const-string p1, "Allow display over other apps for popup playback"

    const-string v3, "\u61f8\u6d6e\u64ad\u653e\u9700\u8981\u986f\u793a\u65bc\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u4e0a\u5c64\u7684\u6b0a\u9650"

    invoke-static {v2, p0, p1, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return v0

    .line 46
    :cond_3
    const-string v3, "g1"

    invoke-static {p0, v3}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_7

    const-string v5, "d"

    invoke-static {v3, v5}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_4

    goto/16 :goto_1

    .line 47
    :cond_4
    invoke-static {p0, v0}, Le/e/a/PlaybackTransfer221;->capture(Ljava/lang/Object;Z)Le/e/a/PlaybackTransfer221$Transfer;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-static {v2, v5, p1}, Le/e/a/PlaybackTransfer221;->serviceIntent(Landroid/content/Context;Le/e/a/PlaybackTransfer221$Transfer;Z)Landroid/content/Intent;

    move-result-object v6

    invoke-static {v6, p0}, Le/e/a/VideoMiniPlayer;->markAudioOnly(Landroid/content/Intent;Ljava/lang/Object;)V

    .line 48
    const-string v7, "com.sauzask.nicoid.NicoidVideoFragment"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const-string v8, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const-string v9, "e.e.a.v0"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 49
    const-string v10, "V1"

    invoke-virtual {v7, v10}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7, v1, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v3, "t0"

    invoke-virtual {v8, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    iget-wide v7, v5, Le/e/a/PlaybackTransfer221$Transfer;->position:J

    const-wide/32 v10, 0x7fffffff

    invoke-static {v10, v11, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-int v8, v7

    invoke-virtual {v3, v1, v8}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 50
    const-string v3, "C1"

    invoke-static {p0, v3}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v7, v3, Ljava/util/ArrayList;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v8, "a"

    const/4 v10, 0x2

    if-eqz v7, :cond_5

    const/4 v7, 0x4

    :try_start_2
    new-array v11, v7, [Ljava/lang/Class;

    const-class v12, Landroid/content/Intent;

    aput-object v12, v11, v0

    const-class v12, Ljava/util/ArrayList;

    aput-object v12, v11, v4

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v12, v11, v10

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v13, 0x3

    aput-object v12, v11, v13

    invoke-virtual {v9, v8, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v6, v7, v0

    aput-object v3, v7, v4

    const-string v3, "D1"

    invoke-static {p0, v3}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v7, v10

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    aput-object p0, v7, v13

    invoke-virtual {v11, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    :cond_5
    new-array p0, v10, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    aput-object v3, p0, v0

    const-class v3, Landroid/content/Intent;

    aput-object v3, p0, v4

    invoke-virtual {v9, v8, p0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v3, v10, [Ljava/lang/Object;

    aput-object v2, v3, v0

    aput-object v6, v3, v4

    invoke-virtual {p0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_6

    .line 52
    const-string p0, "Preparing background playback transfer"

    goto :goto_0

    :cond_6
    const-string p0, "Preparing popup playback transfer"

    :goto_0
    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return v4

    :catch_0
    move-exception p0

    move-object v1, v5

    goto :goto_2

    :cond_7
    :goto_1
    return v0

    :catch_1
    move-exception p0

    :goto_2
    if-eqz v1, :cond_8

    .line 53
    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    :cond_8
    const-string p1, "nicoid-transfer"

    const-string v1, "Cannot prepare playback transfer"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method public static popupControls(Ljava/lang/Object;)V
    .registers 10

    .line 102
    const-string v0, "popup-portrait-restore"

    :try_start_0
    const-string v1, "a"

    invoke-static {p0, v1}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const-string v2, "popup-modern-controls"

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "\u25af"

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string/jumbo v6, "\u7e26\u5411\u304d\u901a\u5e38\u518d\u751f\u3078\u623b\u308b"

    const-string v7, "Return to portrait playback"

    const-string/jumbo v8, "\u8fd4\u56de\u76f4\u5411\u4e00\u822c\u64ad\u653e"

    invoke-static {v5, v6, v7, v8}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Le/e/a/PlaybackTransfer221$3;

    invoke-direct {v6, p0}, Le/e/a/PlaybackTransfer221$3;-><init>(Ljava/lang/Object;)V

    invoke-static {v3, v4, v5, v6}, Le/e/a/PlaybackBar221;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0x2c

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-direct {v0, v3, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception p0

    const-string v0, "nicoid-transfer"

    const-string v1, "Cannot attach portrait restore control"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method public static portrait(Ljava/lang/Object;)V
    .registers 5

    if-eqz p0, :cond_0

    instance-of v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;

    if-nez v0, :cond_1

    :cond_0
    return-void

    .line 101
    :cond_1
    :try_start_0
    const-string v0, "A1"

    invoke-static {p0, v0}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_portrait_restore"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {v0, p0, v3}, Le/e/a/PlayerGestures219;->fullscreen(Landroid/app/Activity;Ljava/lang/Object;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "nicoid-transfer"

    const-string v1, "Cannot restore portrait layout"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_0
    return-void
.end method

.method static position(Ljava/lang/Object;)J
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 27
    new-array v1, v0, [Ljava/lang/Class;

    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "getCurrentPosition"

    invoke-static {p0, v2, v1, v0}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static prepared(Ljava/lang/Object;Z)V
    .registers 13

    .line 74
    const-string v0, "pause"

    sget-object v1, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    invoke-static {v1, p0, p1}, Le/e/a/PlaybackTransfer221;->matches(Le/e/a/PlaybackTransfer221$Transfer;Ljava/lang/Object;Z)Z

    move-result v2

    if-eqz v2, :cond_a

    iget-boolean v2, v1, Le/e/a/PlaybackTransfer221$Transfer;->committing:Z

    if-eqz v2, :cond_0

    goto/16 :goto_2

    .line 76
    :cond_0
    :try_start_0
    iget-boolean v2, v1, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    if-eqz v2, :cond_2

    iget-object v2, v1, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    const-string v3, "A1"

    invoke-static {v2, v3}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    return-void

    .line 77
    :cond_2
    iput-object p0, v1, Le/e/a/PlaybackTransfer221$Transfer;->target:Ljava/lang/Object;

    if-eqz p1, :cond_3

    const-string p1, "e"

    goto :goto_0

    :cond_3
    const-string p1, "a0"

    :goto_0
    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Media3PlaybackHandoff;->isBinding(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->complete(Le/e/a/PlaybackTransfer221$Transfer;)V

    return-void

    :cond_4
    const-string p1, "getDuration"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {p0, p1, v3, v4}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long p1, v3, v5

    if-gtz p1, :cond_5

    return-void

    .line 79
    :cond_5
    iget-object p1, v1, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/PlaybackTransfer221;->position(Ljava/lang/Object;)J

    move-result-wide v7

    const-wide/16 v9, 0x1

    sub-long/2addr v3, v9

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    iget-object p1, v1, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/PlaybackTransfer221;->isPlaying(Ljava/lang/Object;)Z

    move-result p1

    .line 80
    const-string v5, "setPlaybackSpeed"

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v2

    new-array v8, v6, [Ljava/lang/Object;

    iget v9, v1, Le/e/a/PlaybackTransfer221$Transfer;->speed:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v8, v2

    invoke-static {p0, v5, v7, v8}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->position(Ljava/lang/Object;)J

    move-result-wide v7

    sub-long/2addr v7, v3

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    move-result-wide v7

    const-wide/16 v9, 0xfa

    cmp-long v5, v7, v9

    if-lez v5, :cond_6

    const-string v5, "seekTo"

    new-array v7, v6, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v2

    new-array v8, v6, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v8, v2

    invoke-static {p0, v5, v7, v8}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_6
    iput-object p0, v1, Le/e/a/PlaybackTransfer221$Transfer;->targetPlayer:Ljava/lang/Object;

    iput-boolean p1, v1, Le/e/a/PlaybackTransfer221$Transfer;->resumeOnCancel:Z

    iput-boolean v6, v1, Le/e/a/PlaybackTransfer221$Transfer;->committing:Z

    iget-object v3, v1, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    new-array v4, v2, [Ljava/lang/Class;

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {v3, v0, v4, v5}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_7

    .line 83
    const-string v0, "start"

    :cond_7
    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {p0, v0, v3, v4}, Le/e/a/PlaybackTransfer221;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_9

    .line 84
    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->isPlaying(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    goto :goto_1

    :cond_8
    invoke-static {v1, v2}, Le/e/a/PlaybackTransfer221;->awaitStart(Le/e/a/PlaybackTransfer221$Transfer;I)V

    goto :goto_2

    :cond_9
    :goto_1
    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->complete(Le/e/a/PlaybackTransfer221$Transfer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    .line 85
    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    const-string p1, "nicoid-transfer"

    const-string v0, "Cannot finish playback transfer"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_a
    :goto_2
    return-void
.end method

.method public static restore(Ljava/lang/Object;Z)Z
    .registers 15

    invoke-static {p0}, Le/e/a/Media3PlaybackHandoff;->tryRestorePopup(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 92
    :try_start_0
    sget-object v2, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-eqz v2, :cond_1

    return v0

    :cond_1
    move-object v2, p0

    check-cast v2, Landroid/app/Service;

    const/4 v3, 0x1

    invoke-static {p0, v3}, Le/e/a/PlaybackTransfer221;->capture(Ljava/lang/Object;Z)Le/e/a/PlaybackTransfer221$Transfer;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 93
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "k0"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "com.sauzask.nicoid.NicoidVideoFragment"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-string v7, "V1"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v1, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 94
    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "https://www.nicovideo.jp/watch/"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, v4, Le/e/a/PlaybackTransfer221$Transfer;->id:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v6, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v5, v2, v6}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const/high16 v6, 0x10000000

    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "intentselect"

    invoke-virtual {v5, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "playposition"

    iget-wide v7, v4, Le/e/a/PlaybackTransfer221$Transfer;->position:J

    const-wide/32 v9, 0x7fffffff

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-int v8, v7

    invoke-virtual {v5, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "nicoid_playback_transfer"

    iget-object v7, v4, Le/e/a/PlaybackTransfer221$Transfer;->token:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "nicoid_portrait_restore"

    invoke-virtual {v5, v6, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    .line 95
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "s0"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Landroid/os/Bundle;

    if-eqz v6, :cond_2

    const-string v6, "infodata"

    check-cast v5, Landroid/os/Bundle;

    invoke-virtual {p1, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 96
    :cond_2
    const-string v5, "O"

    invoke-static {p0, v5}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Ljava/util/ArrayList;

    if-eqz v6, :cond_3

    const-string v6, "e.e.a.v0"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-string v7, "a"

    const/4 v8, 0x4

    new-array v9, v8, [Ljava/lang/Class;

    const-class v10, Landroid/content/Intent;

    aput-object v10, v9, v0

    const-class v10, Ljava/util/ArrayList;

    aput-object v10, v9, v3

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x2

    aput-object v10, v9, v11

    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v12, 0x3

    aput-object v10, v9, v12

    invoke-virtual {v6, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    new-array v7, v8, [Ljava/lang/Object;

    aput-object p1, v7, v0

    aput-object v5, v7, v3

    const-string v5, "P"

    invoke-static {p0, v5}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v7, v11

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    aput-object p0, v7, v12

    invoke-virtual {v6, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    :cond_3
    invoke-virtual {v2, p1}, Landroid/app/Service;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return v3

    :catch_0
    move-exception p0

    move-object v1, v4

    goto :goto_0

    :catch_1
    move-exception p0

    :goto_0
    if-eqz v1, :cond_4

    .line 98
    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->cancel(Le/e/a/PlaybackTransfer221$Transfer;)V

    :cond_4
    const-string p1, "nicoid-transfer"

    const-string v1, "Cannot restore playback"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method public static retaining(Landroid/app/Activity;)Z
    .registers 4

    .line 62
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-boolean v2, v0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    if-eqz v2, :cond_1

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->valid(Le/e/a/PlaybackTransfer221$Transfer;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    iget-object v0, v0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    const-string v2, "A1"

    invoke-static {v0, v2}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v0, p0, :cond_1

    const/4 p0, 0x1

    return p0

    :catch_0
    :cond_1
    :goto_0
    return v1
.end method

.method static serviceIntent(Landroid/content/Context;Le/e/a/PlaybackTransfer221$Transfer;Z)Landroid/content/Intent;
    .registers 7

    .line 40
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "url"

    iget-object v1, p1, Le/e/a/PlaybackTransfer221$Transfer;->id:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-wide/32 v0, 0x7fffffff

    iget-wide v2, p1, Le/e/a/PlaybackTransfer221$Transfer;->position:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v1, v0

    const-string v0, "nowpoti"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "isBackgroundPlay"

    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const-string p2, "nicoid_playback_transfer"

    iget-object p1, p1, Le/e/a/PlaybackTransfer221$Transfer;->token:Ljava/lang/String;

    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static stopService(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 5

    .line 99
    invoke-static {p0, p1}, Le/e/a/PopupReturn244;->retaining(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    sget-object v0, Le/e/a/PlaybackTransfer221;->pending:Le/e/a/PlaybackTransfer221$Transfer;

    if-eqz v0, :cond_1

    iget-boolean v1, v0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    if-nez v1, :cond_1

    invoke-static {v0}, Le/e/a/PlaybackTransfer221;->valid(Le/e/a/PlaybackTransfer221$Transfer;)Z

    move-result v1

    if-eqz v1, :cond_1

    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, v0, Le/e/a/PlaybackTransfer221$Transfer;->token:Ljava/lang/String;

    move-object v1, p0

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_playback_transfer"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    invoke-virtual {p0, p1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method static valid(Le/e/a/PlaybackTransfer221$Transfer;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 29
    :try_start_0
    iget-object v1, p0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    iget-boolean v2, p0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    if-eqz v2, :cond_0

    const-string v2, "a0"

    goto :goto_0

    :cond_0
    const-string v2, "e"

    :goto_0
    invoke-static {v1, v2}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlaybackTransfer221$Transfer;->sourcePlayer:Ljava/lang/Object;

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Le/e/a/PlaybackTransfer221$Transfer;->id:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/PlaybackTransfer221$Transfer;->source:Ljava/lang/Object;

    iget-boolean p0, p0, Le/e/a/PlaybackTransfer221$Transfer;->toPopup:Z

    const/4 v3, 0x1

    xor-int/2addr p0, v3

    invoke-static {v2, p0}, Le/e/a/PlaybackTransfer221;->id(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_1

    return v3

    :catch_0
    :cond_1
    return v0
.end method
