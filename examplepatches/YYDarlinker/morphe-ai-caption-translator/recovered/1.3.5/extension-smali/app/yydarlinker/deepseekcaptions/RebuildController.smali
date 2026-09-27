.class final Lapp/yydarlinker/deepseekcaptions/RebuildController;
.super Ljava/lang/Object;
.source "RebuildController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;,
        Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;
    }
.end annotation


# static fields
.field private static final CACHE:Ljava/util/concurrent/ExecutorService;

.field private static final CLOCK:Lapp/yydarlinker/deepseekcaptions/RebuildClock;

.field static final FAILED:I = 0x3

.field private static final IDS:Ljava/util/concurrent/atomic/AtomicLong;

.field private static final IO:Ljava/util/concurrent/ExecutorService;

.field private static final MAIN:Landroid/os/Handler;

.field static final READY:I = 0x2

.field static final RUNNING:I = 0x1

.field static final WAITING:I

.field private static volatile active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

.field private static activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile compact:Z

.field private static restoreUntil:J

.field private static tickPosted:Z

.field private static volatile video:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$Tjq6rJ64GuMyjA9c4spjNqvKXAI()V
    .registers 0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->tick()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetIDS()Ljava/util/concurrent/atomic/AtomicLong;
    .registers 1

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->IDS:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smendFallback(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;JLjava/lang/String;)V
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->endFallback(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;JLjava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 2

    .line 16
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->IDS:Ljava/util/concurrent/atomic/AtomicLong;

    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->MAIN:Landroid/os/Handler;

    .line 20
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda8;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda8;-><init>()V

    .line 21
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->IO:Ljava/util/concurrent/ExecutorService;

    .line 27
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda9;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda9;-><init>()V

    .line 28
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->CACHE:Ljava/util/concurrent/ExecutorService;

    .line 34
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildClock;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildClock;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->CLOCK:Lapp/yydarlinker/deepseekcaptions/RebuildClock;

    .line 36
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    .line 37
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activate(Landroid/content/Context;Ljava/lang/String;ZZ)V
    .registers 15

    if-eqz p0, :cond_188

    .line 268
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_188

    .line 269
    :cond_a
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v7

    .line 270
    iget-boolean v0, v7, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-nez v0, :cond_14

    goto/16 :goto_188

    .line 271
    :cond_14
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 272
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_20

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    :cond_20
    move-object v4, v0

    .line 273
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_188

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_39

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    goto/16 :goto_188

    :cond_39
    if-eqz p2, :cond_44

    .line 275
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->language()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromCode(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v0

    goto :goto_48

    :cond_44
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v0

    :goto_48
    if-nez v0, :cond_52

    if-eqz p2, :cond_4f

    .line 276
    const-string v0, "source"

    goto :goto_54

    :cond_4f
    const-string v0, ""

    goto :goto_54

    :cond_52
    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->code:Ljava/lang/String;

    :goto_54
    move-object v6, v0

    .line 277
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5d

    goto/16 :goto_188

    .line 278
    :cond_5d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 280
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionEngine;->sourceCaptionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "([?&])(?:expire|signature|sig)=[^&]*"

    const-string v3, "$1"

    .line 281
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    invoke-virtual {v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->fingerprint()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v7, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    .line 285
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 279
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 291
    const-class v10, Lapp/yydarlinker/deepseekcaptions/RebuildController;

    monitor-enter v10

    .line 292
    :try_start_a6
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_b8

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b8

    monitor-exit v10

    return-void

    .line 293
    :cond_b8
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;
    :try_end_ba
    .catchall {:try_start_a6 .. :try_end_ba} :catchall_184

    .line 296
    :try_start_ba
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 297
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionEngine;->sourceCaptionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    invoke-virtual {v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->fingerprint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v7, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    .line 301
    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_f8
    .catch Ljava/lang/Exception; {:try_start_ba .. :try_end_f8} :catch_f8
    .catchall {:try_start_ba .. :try_end_f8} :catchall_184

    :catch_f8
    move-object v5, v0

    .line 308
    :try_start_f9
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-eqz v0, :cond_11f

    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->identity:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11f

    .line 309
    iput-object p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->url:Ljava/lang/String;

    .line 310
    iget-boolean p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    or-int/2addr p1, p3

    iput-boolean p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    .line 311
    iget-object p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    if-nez p1, :cond_11d

    iget p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceFailures:I

    if-lez p1, :cond_11d

    const/4 p1, 0x0

    .line 312
    iput-boolean p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->terminal:Z

    const-wide/16 v2, 0x0

    .line 313
    iput-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceRetry:J

    :cond_11d
    move v8, p2

    goto :goto_135

    :cond_11f
    if-eqz v1, :cond_124

    .line 317
    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cancel()V

    .line 318
    :cond_124
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    move-object v3, p1

    move v8, p2

    move v9, p3

    invoke-direct/range {v1 .. v9}, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;ZZ)V

    .line 319
    sput-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    .line 320
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->clear()V

    .line 322
    :goto_135
    monitor-exit v10
    :try_end_136
    .catchall {:try_start_f9 .. :try_end_136} :catchall_184

    .line 323
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->position()J

    move-result-wide p1

    iput-wide p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    if-nez v8, :cond_14f

    .line 324
    invoke-virtual {v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->ready()Z

    move-result p1

    if-nez p1, :cond_14f

    const/4 p1, 0x1

    .line 325
    iput-boolean p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->terminal:Z

    .line 326
    const-string p1, "configure_api"

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->status:Ljava/lang/String;

    .line 328
    :cond_14f
    const-string p1, "CAPTION_REBUILD_R2"

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "engine=event-rebuild-r2.12;session="

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, ";video="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->owner:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ";"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v8, :cond_171

    .line 331
    const-string p3, "source_passthrough"

    goto :goto_173

    :cond_171
    const-string p3, "single_pass_events;source_owned_time;no_legacy_core"

    :goto_173
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 328
    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    .line 333
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->scheduleTick()V

    return-void

    :catchall_184
    move-exception v0

    move-object p0, v0

    .line 322
    :try_start_186
    monitor-exit v10
    :try_end_187
    .catchall {:try_start_186 .. :try_end_187} :catchall_184

    throw p0

    :cond_188
    :goto_188
    return-void
.end method

.method static activeUrl()Ljava/lang/String;
    .registers 2

    .line 187
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    .line 188
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v1

    if-eqz v1, :cond_b

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->url:Ljava/lang/String;

    return-object v0

    :cond_b
    const-string v0, ""

    return-object v0
.end method

.method static activity(Landroid/app/Activity;)V
    .registers 2

    .line 192
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activity:Ljava/lang/ref/WeakReference;

    .line 193
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->setActivity(Landroid/app/Activity;)V

    .line 194
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->tick()V

    return-void
.end method

.method private static blockAt(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;J)I
    .registers 8

    .line 538
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    .line 539
    :cond_6
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    :goto_f
    if-gt v1, v0, :cond_2b

    add-int v2, v1, v0

    ushr-int/lit8 v2, v2, 0x1

    .line 542
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    iget-wide v3, v3, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->start:J

    cmp-long v3, v3, p1

    if-gtz v3, :cond_27

    add-int/lit8 v2, v2, 0x1

    move v1, v2

    goto :goto_f

    :cond_27
    add-int/lit8 v2, v2, -0x1

    move v0, v2

    goto :goto_f

    :cond_2b
    return v0
.end method

.method private static covers(Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;J)Z
    .registers 5

    .line 549
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->start:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_e

    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->end:J

    cmp-long p0, p1, v0

    if-gez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method static declared-synchronized current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z
    .registers 3

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;

    monitor-enter v0

    if-eqz p0, :cond_24

    .line 178
    :try_start_5
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    if-ne v1, p0, :cond_24

    iget-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cancelled:Z

    if-nez v1, :cond_24

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1f

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->owner:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_24

    :cond_1f
    const/4 p0, 0x1

    goto :goto_25

    :catchall_21
    move-exception p0

    monitor-exit v0
    :try_end_23
    .catchall {:try_start_5 .. :try_end_23} :catchall_21

    throw p0

    :cond_24
    const/4 p0, 0x0

    :goto_25
    monitor-exit v0

    return p0
.end method

.method private static endFallback(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;JLjava/lang/String;)V
    .registers 8

    .line 761
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackReason:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4d

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "session="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";start="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackStart:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";end="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, ";cause="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ";reason="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackReason:Ljava/lang/String;

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    iget-object p2, p2, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    const/16 p3, 0x190

    .line 762
    invoke-static {p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 761
    const-string p2, "REBUILD_FALLBACK_END"

    invoke-static {v0, p2, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 763
    :cond_4d
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackReason:Ljava/lang/String;

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackStart:J

    return-void
.end method

.method private static kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V
    .registers 5

    .line 415
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 417
    :cond_7
    monitor-enter p0

    .line 418
    :try_start_8
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    if-nez v0, :cond_22

    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->loading:Z

    if-nez v0, :cond_22

    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->terminal:Z

    if-nez v0, :cond_22

    .line 421
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceRetry:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_22

    const/4 v0, 0x1

    .line 422
    iput-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->loading:Z

    goto :goto_23

    :cond_22
    const/4 v0, 0x0

    .line 425
    :goto_23
    monitor-exit p0
    :try_end_24
    .catchall {:try_start_8 .. :try_end_24} :catchall_47

    if-eqz v0, :cond_30

    .line 426
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->IO:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda5;-><init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 427
    :cond_30
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    if-eqz v0, :cond_43

    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->terminal:Z

    if-nez v0, :cond_43

    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    if-nez v0, :cond_43

    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    if-eqz v0, :cond_43

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->schedule(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    .line 428
    :cond_43
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->render(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    return-void

    :catchall_47
    move-exception v0

    .line 425
    :try_start_48
    monitor-exit p0
    :try_end_49
    .catchall {:try_start_48 .. :try_end_49} :catchall_47

    throw v0
.end method

.method static synthetic lambda$kick$2(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V
    .registers 1

    .line 426
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->load(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    return-void
.end method

.method static synthetic lambda$render$6(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;IJ)Z
    .registers 6

    .line 834
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-eqz v0, :cond_16

    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->generation:I

    if-ne v0, p1, :cond_16

    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->renderRevision:J

    cmp-long p1, v0, p2

    if-nez p1, :cond_16

    iget-boolean p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    if-eqz p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$render$7(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 840
    iget-boolean p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    if-eqz p0, :cond_5

    return-object p1

    :cond_5
    const-string p0, ""

    return-object p0
.end method

.method static synthetic lambda$schedule$3(Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;)V
    .registers 1

    .line 624
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->translate(Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;)V

    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 23
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "CaptionRebuildIO"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method static synthetic lambda$static$1(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 30
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "CaptionRebuildCache"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method static synthetic lambda$translate$4(I)Z
    .registers 1

    .line 670
    invoke-static {p0}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method static synthetic lambda$translate$5(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)V
    .registers 4

    .line 675
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cacheKey:Ljava/lang/String;

    invoke-static {v0, p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->write(Landroid/content/Context;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)V

    return-void
.end method

.method static lateUnreadable(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;J)Z
    .registers 9

    .line 767
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    sub-long v0, p1, v0

    const-wide/16 v2, 0x3e8

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-lez v0, :cond_24

    iget-wide v4, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    sub-long/2addr v4, p1

    cmp-long p1, v4, v2

    if-gez p1, :cond_24

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {p1, v1, p0}, Ljava/lang/String;->codePointCount(II)I

    move-result p0

    const/16 p1, 0xc

    if-le p0, p1, :cond_24

    const/4 p0, 0x1

    return p0

    :cond_24
    return v1
.end method

.method private static load(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V
    .registers 23

    move-object/from16 v1, p0

    const-string v0, "phase=rebuild;ms="

    .line 432
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    const/4 v3, -0x1

    const/4 v4, 0x0

    invoke-direct {v2, v1, v3, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;-><init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;IZ)V

    const/4 v3, 0x1

    .line 434
    :try_start_c
    iget-object v5, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->url:Ljava/lang/String;

    iget-boolean v7, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    xor-int/2addr v7, v3

    .line 435
    invoke-static {v5, v6, v4, v7, v2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->load(Landroid/content/Context;Ljava/lang/String;ZZLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    move-result-object v5

    .line 436
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v6

    if-nez v6, :cond_1f

    goto/16 :goto_2ce

    .line 437
    :cond_1f
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 438
    iget-object v8, v5, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->body:[B

    iget-object v9, v5, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    invoke-static {v8, v9}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->read([BLapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;)Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    move-result-object v8

    .line 439
    iget-object v9, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v10, "REBUILD_SOURCE_PHASE"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    sub-long/2addr v12, v6

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v10, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 441
    iget-boolean v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    if-nez v0, :cond_8e

    .line 443
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v9, v4

    :cond_52
    :goto_52
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_67

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    .line 444
    iget-object v10, v10, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->precision:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    sget-object v11, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ESTIMATED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    if-eq v10, v11, :cond_52

    add-int/lit8 v9, v9, 0x1

    goto :goto_52

    :cond_67
    mul-int/lit8 v9, v9, 0xa

    .line 445
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_6f} :catch_26d

    mul-int/lit8 v0, v0, 0x8

    if-ge v9, v0, :cond_8e

    .line 447
    :try_start_73
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    iget-object v9, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->url:Ljava/lang/String;

    invoke-static {v0, v9, v2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->reference(Landroid/content/Context;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    move-result-object v0

    if-eqz v0, :cond_8e

    .line 448
    iget-object v9, v0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->body:[B

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    invoke-static {v9, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->read([BLapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;)Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    move-result-object v0

    invoke-virtual {v8, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->align(Lapp/yydarlinker/deepseekcaptions/RebuildSource;)Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    move-result-object v0
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_89} :catch_8b

    move-object v8, v0

    goto :goto_8e

    .line 450
    :catch_8b
    :try_start_8b
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 453
    :cond_8e
    :goto_8e
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v2, "REBUILD_SOURCE_PHASE"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "phase=reference;ms="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    sub-long/2addr v10, v6

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v2, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 455
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->plan(Lapp/yydarlinker/deepseekcaptions/RebuildSource;)Ljava/util/List;

    move-result-object v0

    .line 456
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v9, "REBUILD_SOURCE_PHASE"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "phase=planner;ms="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    sub-long/2addr v11, v6

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v9, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 458
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    iget-object v9, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->target:Ljava/lang/String;

    invoke-static {v8, v2, v9}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->identity(Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 459
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    new-array v10, v9, [Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    .line 460
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v11

    new-array v11, v11, [I

    .line 462
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [Z

    .line 463
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->position()J

    move-result-wide v13

    .line 464
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15
    :try_end_f6
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_f6} :catch_26d

    move/from16 v16, v3

    move v3, v4

    :goto_f9
    :try_start_f9
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_115

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v4, v17

    check-cast v4, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    move-wide/from16 v18, v6

    iget-wide v6, v4, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->start:J

    cmp-long v6, v6, v13

    if-gtz v6, :cond_111

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    :cond_111
    move-wide/from16 v6, v18

    const/4 v4, 0x0

    goto :goto_f9

    :cond_115
    move-wide/from16 v18, v6

    .line 465
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v6, 0x0

    :cond_11c
    :goto_11c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v13, 0x2

    if-eqz v7, :cond_15d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    .line 466
    iget v14, v7, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    if-eq v14, v3, :cond_134

    iget v14, v7, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    add-int/lit8 v15, v3, 0x1

    if-eq v14, v15, :cond_134

    goto :goto_11c

    .line 467
    :cond_134
    iget v14, v7, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    aput-boolean v16, v12, v14

    .line 468
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v14

    if-nez v14, :cond_140

    goto/16 :goto_2ce

    .line 469
    :cond_140
    iget v14, v7, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    iget-boolean v15, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    if-eqz v15, :cond_148

    const/4 v15, 0x0

    goto :goto_14e

    :cond_148
    iget-object v15, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    invoke-static {v15, v2, v8, v7}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->read(Landroid/content/Context;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    move-result-object v15

    :goto_14e
    aput-object v15, v10, v14

    .line 470
    iget v14, v7, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    aget-object v14, v10, v14

    if-eqz v14, :cond_11c

    .line 471
    iget v7, v7, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    aput v13, v11, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_11c

    .line 475
    :cond_15d
    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v7, "REBUILD_SOURCE_PHASE"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "phase=cache;ms="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v20

    move-object/from16 v17, v12

    sub-long v12, v20, v18

    invoke-virtual {v14, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v4, v7, v12}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    monitor-enter p0
    :try_end_17e
    .catch Ljava/lang/Exception; {:try_start_f9 .. :try_end_17e} :catch_26b

    .line 477
    :try_start_17e
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v4

    if-nez v4, :cond_187

    monitor-exit p0

    goto/16 :goto_2ce

    .line 478
    :cond_187
    iput-object v5, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->raw:Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    .line 479
    iput-object v8, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    .line 480
    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cacheKey:Ljava/lang/String;

    .line 481
    iput-object v10, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    .line 482
    new-array v2, v9, [Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->pendingPlans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    .line 483
    iput-object v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    .line 484
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [I

    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    .line 485
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [J

    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->retryAt:[J

    .line 486
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->reasons:[Ljava/lang/String;

    .line 487
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->reasons:[Ljava/lang/String;

    const-string v4, ""

    invoke-static {v2, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 488
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    move-object/from16 v2, v17

    .line 489
    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cacheChecked:[Z

    const/4 v2, 0x0

    .line 490
    iput-boolean v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->loading:Z

    .line 491
    const-string v2, ""

    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->status:Ljava/lang/String;

    if-lez v6, :cond_1cc

    move/from16 v2, v16

    goto :goto_1cd

    :cond_1cc
    const/4 v2, 0x0

    .line 492
    :goto_1cd
    iput-boolean v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->everReady:Z

    .line 493
    iput-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    .line 494
    monitor-exit p0
    :try_end_1d2
    .catchall {:try_start_17e .. :try_end_1d2} :catchall_268

    .line 496
    :try_start_1d2
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    :cond_1d9
    :goto_1d9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1ee

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    .line 497
    iget-object v7, v7, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->precision:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    sget-object v9, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ESTIMATED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    if-eq v7, v9, :cond_1d9

    add-int/lit8 v4, v4, 0x1

    goto :goto_1d9

    .line 498
    :cond_1ee
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v7, "REBUILD_SOURCE_READY"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "words="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v8, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    .line 502
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ";measured_or_aligned="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ";estimated="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v8, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    .line 506
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v10, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ";coarse_reconstructed="

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, v8, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->coarseCueReconstructed:Z

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ";coarse_cues="

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v8, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->coarseCueCount:I

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ";blocks="

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 512
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ";cache_hits="

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 498
    invoke-static {v2, v7, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v3

    const/4 v15, 0x2

    invoke-static {v15, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v2, 0x0

    invoke-static {v0, v6, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->recordUnitCacheOutcome(IIZ)V

    .line 516
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->owner:Ljava/lang/String;

    iget-object v2, v5, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    invoke-interface {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->cues()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->publishSharedTimeline(Ljava/lang/String;Ljava/util/List;)Z

    .line 517
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V
    :try_end_267
    .catch Ljava/lang/Exception; {:try_start_1d2 .. :try_end_267} :catch_26b

    goto :goto_2ce

    :catchall_268
    move-exception v0

    .line 494
    :try_start_269
    monitor-exit p0
    :try_end_26a
    .catchall {:try_start_269 .. :try_end_26a} :catchall_268

    :try_start_26a
    throw v0
    :try_end_26b
    .catch Ljava/lang/Exception; {:try_start_26a .. :try_end_26b} :catch_26b

    :catch_26b
    move-exception v0

    goto :goto_270

    :catch_26d
    move-exception v0

    move/from16 v16, v3

    .line 519
    :goto_270
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v2

    if-nez v2, :cond_277

    goto :goto_2ce

    .line 520
    :cond_277
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy;->classify(Ljava/lang/Throwable;)Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    move-result-object v0

    .line 521
    monitor-enter p0

    const/4 v2, 0x0

    .line 522
    :try_start_27d
    iput-boolean v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->loading:Z

    .line 523
    iget v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceFailures:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceFailures:I

    .line 524
    iget-boolean v2, v0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->retryable:Z

    xor-int/lit8 v2, v2, 0x1

    iput-boolean v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->terminal:Z

    .line 526
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceFailures:I

    iget-wide v5, v0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->retryAfterMs:J

    .line 527
    invoke-static {v4, v5, v6}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy;->delay(IJ)J

    move-result-wide v4

    add-long/2addr v2, v4

    iput-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceRetry:J

    .line 528
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    .line 529
    iget-boolean v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->terminal:Z

    if-eqz v3, :cond_2a3

    const-string v3, "source_unavailable"

    goto :goto_2a5

    :cond_2a3
    const-string v3, "source_retry"

    :goto_2a5
    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->status:Ljava/lang/String;

    .line 530
    monitor-exit p0
    :try_end_2ac
    .catchall {:try_start_27d .. :try_end_2ac} :catchall_2cf

    .line 531
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v3, "REBUILD_SOURCE_ERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->category:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ";attempt="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceFailures:I

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->render(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    :goto_2ce
    return-void

    :catchall_2cf
    move-exception v0

    .line 530
    :try_start_2d0
    monitor-exit p0
    :try_end_2d1
    .catchall {:try_start_2d0 .. :try_end_2d1} :catchall_2cf

    throw v0
.end method

.method static observe(Ljava/lang/String;)V
    .registers 1

    return-void
.end method

.method private static original(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;JZ)Ljava/lang/String;
    .registers 11

    .line 752
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->raw:Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    const-string v1, ""

    if-nez v0, :cond_7

    return-object v1

    .line 754
    :cond_7
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->raw:Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    invoke-interface {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->cues()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_14
    :goto_14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    .line 755
    iget-wide v3, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    cmp-long v3, p1, v3

    if-ltz v3, :cond_14

    iget-wide v3, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->endMs:J

    cmp-long v3, p1, v3

    if-gez v3, :cond_14

    if-eqz v0, :cond_36

    iget-wide v3, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    iget-wide v5, v0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    cmp-long v3, v3, v5

    if-ltz v3, :cond_14

    :cond_36
    move-object v0, v2

    goto :goto_14

    :cond_38
    if-nez v0, :cond_3b

    return-object v1

    .line 757
    :cond_3b
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p3, :cond_44

    const-string v1, "[\u539f\u6587 / Original] "

    :cond_44
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, v0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->text:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static paused()Z
    .registers 3

    const/4 v0, 0x0

    .line 382
    :try_start_1
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    const/4 v2, 0x0

    if-nez v1, :cond_e

    move-object v1, v2

    goto :goto_12

    .line 383
    :cond_e
    invoke-virtual {v1}, Landroid/app/Activity;->getMediaController()Landroid/media/session/MediaController;

    move-result-object v1

    :goto_12
    if-nez v1, :cond_15

    goto :goto_19

    .line 384
    :cond_15
    invoke-virtual {v1}, Landroid/media/session/MediaController;->getPlaybackState()Landroid/media/session/PlaybackState;

    move-result-object v2

    :goto_19
    if-eqz v2, :cond_23

    .line 385
    invoke-virtual {v2}, Landroid/media/session/PlaybackState;->getState()I

    move-result v1
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1f} :catch_23

    const/4 v2, 0x2

    if-ne v1, v2, :cond_23

    const/4 v0, 0x1

    :catch_23
    :cond_23
    return v0
.end method

.method static player(Ljava/lang/String;)V
    .registers 9

    if-nez p0, :cond_5

    .line 219
    const-string v0, ""

    goto :goto_b

    :cond_5
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 220
    :goto_b
    const-string v1, "MINIM"

    .line 221
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_30

    const-string v1, "HIDDEN"

    .line 222
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_30

    const-string v1, "DISMISSED"

    .line 223
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_30

    const-string v1, "PICTURE_IN_PICTURE"

    .line 224
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2e

    goto :goto_30

    :cond_2e
    move v0, v2

    goto :goto_31

    :cond_30
    :goto_30
    move v0, v3

    .line 225
    :goto_31
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->compact:Z

    if-eqz v1, :cond_40

    if-nez v0, :cond_40

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const-wide/16 v6, 0xbb8

    add-long/2addr v4, v6

    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/RebuildController;->restoreUntil:J

    :cond_40
    if-eqz v0, :cond_49

    .line 226
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result v0

    if-nez v0, :cond_49

    move v2, v3

    :cond_49
    sput-boolean v2, Lapp/yydarlinker/deepseekcaptions/RebuildController;->compact:Z

    .line 227
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->setPlayerType(Ljava/lang/String;)V

    return-void
.end method

.method private static position()J
    .registers 9

    .line 362
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 363
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const/4 v3, 0x0

    if-nez v0, :cond_11

    move-object v4, v3

    goto :goto_15

    .line 365
    :cond_11
    :try_start_11
    invoke-virtual {v0}, Landroid/app/Activity;->getMediaController()Landroid/media/session/MediaController;

    move-result-object v4

    :goto_15
    if-eqz v4, :cond_2a

    .line 367
    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4}, Landroid/media/session/MediaController;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    goto :goto_2a

    :cond_26
    invoke-virtual {v4}, Landroid/media/session/MediaController;->getPlaybackState()Landroid/media/session/PlaybackState;

    move-result-object v3

    :cond_2a
    :goto_2a
    if-eqz v3, :cond_46

    .line 369
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->CLOCK:Lapp/yydarlinker/deepseekcaptions/RebuildClock;

    move-object v5, v3

    .line 371
    invoke-virtual {v5}, Landroid/media/session/PlaybackState;->getPosition()J

    move-result-wide v3

    move-object v7, v5

    .line 372
    invoke-virtual {v7}, Landroid/media/session/PlaybackState;->getLastPositionUpdateTime()J

    move-result-wide v5

    move-object v8, v7

    .line 373
    invoke-virtual {v8}, Landroid/media/session/PlaybackState;->getPlaybackSpeed()F

    move-result v7

    .line 374
    invoke-virtual {v8}, Landroid/media/session/PlaybackState;->getState()I

    move-result v8

    .line 369
    invoke-virtual/range {v0 .. v8}, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->position(JJJFI)J

    move-result-wide v0
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_45} :catch_46

    return-wide v0

    .line 377
    :catch_46
    :cond_46
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->CLOCK:Lapp/yydarlinker/deepseekcaptions/RebuildClock;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v3, -0x1

    const-wide/16 v5, 0x0

    invoke-virtual/range {v0 .. v8}, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->position(JJJFI)J

    move-result-wide v0

    return-wide v0
.end method

.method static prewarm(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    if-eqz p0, :cond_2c

    .line 259
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 260
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 261
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->isReady(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_15

    goto :goto_2c

    .line 262
    :cond_15
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    if-eqz v0, :cond_1a

    goto :goto_2c

    .line 263
    :cond_1a
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultTargetLanguage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 264
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2c

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->withCode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activate(Landroid/content/Context;Ljava/lang/String;ZZ)V

    :cond_2c
    :goto_2c
    return-void
.end method

.method static refresh(Landroid/content/Context;)V
    .registers 5

    .line 249
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    if-nez v0, :cond_5

    goto :goto_17

    .line 251
    :cond_5
    iget-boolean v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    iget-boolean v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    .line 252
    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->url:Ljava/lang/String;

    .line 253
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->stop()V

    .line 254
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->enabled(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-static {p0, v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->activate(Landroid/content/Context;Ljava/lang/String;ZZ)V

    :cond_17
    :goto_17
    return-void
.end method

.method private static render(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V
    .registers 26

    move-object/from16 v1, p0

    const-string v0, "session="

    const-string v2, "[\u539f\u6587 / Original] "

    const-string v3, "\u3014\u539f\u5b57\u5e55\u6570\u5b57\u5b58\u7591\u3015"

    const-string v4, "failed:"

    const-string v5, "session="

    .line 770
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v6

    if-eqz v6, :cond_354

    iget-boolean v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    if-nez v6, :cond_18

    goto/16 :goto_354

    .line 771
    :cond_18
    const-string v6, ""

    const-string v7, ""

    .line 772
    const-string v8, ""

    .line 776
    const-string v9, "none"

    .line 778
    monitor-enter p0

    .line 779
    :try_start_21
    iget v10, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->generation:I

    .line 780
    iget-wide v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    .line 781
    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    if-nez v13, :cond_39

    .line 782
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->status:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_34

    const-string v0, "\u5b57\u5e55\u51c6\u5907\u4e2d\u2026"

    goto :goto_36

    :cond_34
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->status:Ljava/lang/String;

    :goto_36
    move-object v6, v0

    :goto_37
    const/4 v0, 0x1

    goto :goto_45

    .line 784
    :cond_39
    iget-boolean v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    const/4 v15, 0x0

    if-eqz v13, :cond_4b

    iget-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-static {v1, v2, v3, v15}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->original(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;JZ)Ljava/lang/String;

    move-result-object v6

    move v0, v15

    :goto_45
    const-wide/16 v2, -0x1

    const-wide/16 v13, -0x1

    goto/16 :goto_229

    .line 785
    :cond_4b
    iget-boolean v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->terminal:Z

    if-eqz v13, :cond_52

    .line 786
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->status:Ljava/lang/String;

    goto :goto_37

    .line 789
    :cond_52
    iget-wide v14, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-static {v1, v14, v15}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->blockAt(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;J)I

    move-result v14

    if-ltz v14, :cond_21e

    .line 790
    iget-object v15, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    invoke-interface {v15, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    move/from16 v19, v14

    iget-wide v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-static {v15, v13, v14}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->covers(Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;J)Z

    move-result v13

    if-eqz v13, :cond_21e

    .line 791
    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->pendingPlans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    if-eqz v13, :cond_d0

    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->pendingPlans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v13, v13, v19

    if-eqz v13, :cond_d0

    .line 792
    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v13, v13, v19

    if-nez v13, :cond_80

    const/4 v13, 0x0

    const/16 v20, 0x0

    goto :goto_8c

    :cond_80
    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v13, v13, v19

    const/16 v20, 0x0

    iget-wide v14, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-virtual {v13, v14, v15}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->at(J)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;

    move-result-object v13

    :goto_8c
    if-nez v13, :cond_95

    .line 793
    const-string v14, ""

    move/from16 v15, v19

    move-object/from16 v19, v6

    goto :goto_b9

    :cond_95
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v15, v19

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-object/from16 v19, v6

    const-string v6, ":"

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v13, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "-"

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v13, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    :goto_b9
    if-eqz v13, :cond_c3

    .line 794
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->displayedEvent:Ljava/lang/String;

    invoke-virtual {v14, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_d6

    :cond_c3
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->pendingPlans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v13, v13, v15

    aput-object v13, v6, v15

    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->pendingPlans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aput-object v20, v6, v15

    goto :goto_d6

    :cond_d0
    move/from16 v15, v19

    const/16 v20, 0x0

    move-object/from16 v19, v6

    .line 796
    :cond_d6
    :goto_d6
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v6, v6, v15

    if-nez v6, :cond_df

    move-object/from16 v14, v20

    goto :goto_e5

    .line 797
    :cond_df
    iget-wide v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-virtual {v6, v13, v14}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->at(J)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;

    move-result-object v14

    :goto_e5
    if-eqz v14, :cond_1e2

    .line 799
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ":"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "-"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v20, v8

    .line 800
    iget-wide v7, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    move-wide/from16 v16, v7

    .line 801
    iget-wide v7, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    .line 802
    invoke-static {v6, v14}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->uncertainNumbers(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;)Z

    move-result v4

    if-eqz v4, :cond_124

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_126

    :cond_124
    iget-object v3, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    .line 803
    :goto_126
    invoke-static {v6, v14}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->blocked(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;)Z

    move-result v4

    .line 804
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->displayedEvent:Ljava/lang/String;

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_14b

    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->withheldEvent:Ljava/lang/String;

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_146

    move-object/from16 v19, v3

    move v6, v4

    iget-wide v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    .line 805
    invoke-static {v14, v3, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->lateUnreadable(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;J)Z

    move-result v3

    if-eqz v3, :cond_14e

    goto :goto_149

    :cond_146
    move-object/from16 v19, v3

    move v6, v4

    :goto_149
    const/4 v3, 0x1

    goto :goto_14f

    :cond_14b
    move-object/from16 v19, v3

    move v6, v4

    :cond_14e
    const/4 v3, 0x0

    :goto_14f
    if-nez v6, :cond_160

    if-eqz v3, :cond_154

    goto :goto_160

    .line 811
    :cond_154
    iput-object v9, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->displayedEvent:Ljava/lang/String;

    move-wide/from16 v21, v7

    move-object/from16 v6, v19

    move-object/from16 v8, v20

    const/16 v18, 0x0

    goto/16 :goto_1c5

    .line 807
    :cond_160
    :goto_160
    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    aget v4, v4, v15

    const/4 v13, 0x2

    if-eq v4, v13, :cond_172

    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    aget v4, v4, v15

    const/4 v13, 0x3

    if-ne v4, v13, :cond_16f

    goto :goto_172

    :cond_16f
    const-string v4, "\u5b57\u5e55\u6821\u6b63\u4e2d\u2026"

    goto :goto_174

    :cond_172
    :goto_172
    const-string v4, "\u5b57\u5e55\u6682\u4e0d\u53ef\u7528"

    :goto_174
    if-eqz v6, :cond_179

    .line 808
    const-string v6, "event_review"

    goto :goto_17b

    :cond_179
    const-string v6, "late_unreadable"

    :goto_17b
    if-eqz v3, :cond_1b8

    .line 809
    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->withheldEvent:Ljava/lang/String;

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1b8

    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v15, "REBUILD_LATE_UNREADABLE"

    move/from16 v19, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v0, v6

    move-wide/from16 v21, v7

    iget-wide v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v6, ";event="

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ";remaining="

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v6, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    move-wide/from16 v23, v6

    iget-wide v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    sub-long v6, v23, v6

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v13, v15, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1bd

    :cond_1b8
    move/from16 v19, v3

    move-object v0, v6

    move-wide/from16 v21, v7

    :goto_1bd
    if-eqz v19, :cond_1c1

    .line 810
    iput-object v9, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->withheldEvent:Ljava/lang/String;

    :cond_1c1
    move-object v8, v0

    move-object v6, v4

    const/16 v18, 0x1

    .line 812
    :goto_1c5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    iget v3, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v14, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-wide/from16 v2, v16

    move/from16 v0, v18

    move-wide/from16 v13, v21

    goto :goto_229

    :cond_1e2
    move-object/from16 v20, v8

    if-nez v6, :cond_222

    .line 814
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    aget v0, v0, v15

    const/4 v13, 0x3

    if-ne v0, v13, :cond_1f0

    const-string v0, "\u5b57\u5e55\u6682\u4e0d\u53ef\u7528"

    goto :goto_1f2

    :cond_1f0
    const-string v0, "\u5b57\u5e55\u7ffb\u8bd1\u4e2d\u2026"

    :goto_1f2
    move-object v6, v0

    .line 817
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    aget v0, v0, v15

    const/4 v13, 0x3

    if-ne v0, v13, :cond_20d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->reasons:[Ljava/lang/String;

    aget-object v2, v2, v15

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v8, v0

    const/4 v2, 0x1

    goto :goto_21a

    .line 818
    :cond_20d
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    aget v0, v0, v15

    const/4 v2, 0x1

    if-le v0, v2, :cond_217

    const-string v0, "retrying"

    goto :goto_219

    :cond_217
    const-string v0, "pending_translation"

    :goto_219
    move-object v8, v0

    :goto_21a
    move v0, v2

    move-object v7, v6

    goto/16 :goto_45

    :cond_21e
    move-object/from16 v19, v6

    move-object/from16 v20, v8

    :cond_222
    move-object/from16 v6, v19

    move-object/from16 v8, v20

    const/4 v0, 0x0

    goto/16 :goto_45

    .line 822
    :goto_229
    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackReason:Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_27c

    move-wide v15, v13

    .line 823
    iget-wide v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    const-string v4, "state_change"

    invoke-static {v1, v13, v14, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->endFallback(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;JLjava/lang/String;)V

    .line 824
    iput-object v8, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackReason:Ljava/lang/String;

    iget-wide v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    iput-wide v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackStart:J

    .line 825
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_279

    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v13, "REBUILD_FALLBACK_BEGIN"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v17, v2

    iget-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v14, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";position="

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-virtual {v14, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";reason="

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    const/16 v3, 0x190

    .line 826
    invoke-static {v8, v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 825
    invoke-static {v4, v13, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_27f

    :cond_279
    move-wide/from16 v17, v2

    goto :goto_27f

    :cond_27c
    move-wide/from16 v17, v2

    move-wide v15, v13

    .line 828
    :goto_27f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v0, :cond_289

    const-string v3, "status:"

    goto :goto_28b

    :cond_289
    const-string v3, "caption:"

    :goto_28b
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 829
    iget-object v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->lastShown:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2af

    monitor-exit p0

    return-void

    .line 830
    :cond_2af
    iput-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->lastShown:Ljava/lang/String;

    .line 831
    iget-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->renderRevision:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->renderRevision:J

    .line 832
    monitor-exit p0
    :try_end_2b9
    .catchall {:try_start_21 .. :try_end_2b9} :catchall_351

    .line 833
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;

    invoke-direct {v4, v1, v10, v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;-><init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;IJ)V

    if-eqz v0, :cond_2c4

    .line 836
    invoke-static {v6, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->showStatus(Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;)V

    goto :goto_2f4

    .line 837
    :cond_2c4
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2ce

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hide(Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;)V

    goto :goto_2f4

    .line 839
    :cond_2ce
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda11;

    invoke-direct {v0, v1, v7}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda11;-><init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v7, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v4, v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->showEvent(Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 841
    :goto_2f4
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_354

    .line 842
    iget-object v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v2, "REBUILD_SELECTED"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "id="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ";time="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, ";range="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-wide/from16 v4, v17

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-wide v4, v15

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, ";text="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    const/16 v4, 0x1f4

    .line 858
    invoke-static {v6, v1, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 842
    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_351
    move-exception v0

    .line 832
    :try_start_352
    monitor-exit p0
    :try_end_353
    .catchall {:try_start_352 .. :try_end_353} :catchall_351

    throw v0

    :cond_354
    :goto_354
    return-void
.end method

.method static restore(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 231
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    .line 232
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v1

    if-eqz v1, :cond_43

    iget-boolean v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    if-nez v1, :cond_43

    iget-boolean v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    if-eqz v1, :cond_43

    .line 235
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result v1

    if-eqz v1, :cond_43

    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->compact:Z

    if-nez v1, :cond_25

    .line 236
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/RebuildController;->restoreUntil:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_25

    goto :goto_43

    .line 237
    :cond_25
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 238
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_43

    .line 239
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3d

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->owner:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 240
    :cond_3d
    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->target:Ljava/lang/String;

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->withCode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_43
    :goto_43
    return-object p0
.end method

.method private static schedule(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V
    .registers 19

    move-object/from16 v1, p0

    .line 553
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 554
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 555
    monitor-enter p0

    .line 556
    :try_start_c
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v4

    if-eqz v4, :cond_1dc

    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    if-eqz v4, :cond_1dc

    iget-wide v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->providerRetry:J

    cmp-long v4, v2, v4

    if-gez v4, :cond_1e

    goto/16 :goto_1dc

    .line 557
    :cond_1e
    iget-wide v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-static {v1, v4, v5}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->blockAt(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;J)I

    move-result v4

    const/4 v5, 0x0

    if-gez v4, :cond_29

    move v4, v5

    goto :goto_44

    .line 559
    :cond_29
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    iget-wide v7, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-static {v6, v7, v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->covers(Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;J)Z

    move-result v6

    if-nez v6, :cond_44

    add-int/lit8 v6, v4, 0x1

    iget-object v7, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_44

    move v4, v6

    .line 561
    :cond_44
    :goto_44
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    array-length v7, v6

    move v8, v5

    move v9, v8

    :goto_49
    const/4 v10, 0x1

    if-ge v8, v7, :cond_55

    aget v11, v6, v8

    if-ne v11, v10, :cond_52

    add-int/lit8 v9, v9, 0x1

    :cond_52
    add-int/lit8 v8, v8, 0x1

    goto :goto_49

    .line 563
    :cond_55
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    array-length v7, v6

    move v8, v5

    move v11, v8

    :goto_5a
    if-ge v8, v7, :cond_7f

    aget-object v12, v6, v8

    if-eqz v12, :cond_7c

    .line 564
    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    iget v14, v12, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget v13, v13, v14

    if-ne v13, v10, :cond_7c

    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    iget v12, v12, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-interface {v13, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    iget-wide v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-static {v12, v13, v14}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->covers(Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;J)Z

    move-result v12

    if-nez v12, :cond_7c

    add-int/lit8 v11, v11, 0x1

    :cond_7c
    add-int/lit8 v8, v8, 0x1

    goto :goto_5a

    .line 566
    :cond_7f
    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v6, v6, v4

    const/4 v7, 0x3

    if-nez v6, :cond_9a

    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    aget v6, v6, v4

    if-eq v6, v7, :cond_9a

    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    aget-object v6, v6, v4

    if-eqz v6, :cond_ac

    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    aget-object v6, v6, v4

    iget-boolean v6, v6, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->sent:Z

    if-eqz v6, :cond_ac

    :cond_9a
    if-nez v11, :cond_ac

    .line 571
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->paused()Z

    move-result v6

    if-nez v6, :cond_ac

    sget-object v6, Lapp/yydarlinker/deepseekcaptions/RebuildController;->CLOCK:Lapp/yydarlinker/deepseekcaptions/RebuildClock;

    .line 572
    invoke-virtual {v6, v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->fresh(J)Z

    move-result v6

    if-eqz v6, :cond_ac

    move v6, v10

    goto :goto_ad

    :cond_ac
    move v6, v5

    :goto_ad
    move v8, v4

    .line 573
    :goto_ae
    iget-object v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-ge v8, v11, :cond_159

    const/4 v11, 0x2

    if-ge v9, v11, :cond_159

    .line 574
    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    invoke-interface {v12, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    .line 575
    iget-wide v12, v12, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->start:J

    iget-wide v14, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    const-wide/16 v16, 0x7530

    add-long v14, v14, v16

    cmp-long v12, v12, v14

    if-lez v12, :cond_cf

    goto/16 :goto_159

    :cond_cf
    if-le v8, v4, :cond_d5

    if-nez v6, :cond_d5

    goto/16 :goto_159

    .line 577
    :cond_d5
    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    aget v12, v12, v8

    if-nez v12, :cond_155

    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->retryAt:[J

    aget-wide v13, v12, v8

    cmp-long v12, v13, v2

    if-lez v12, :cond_e5

    goto/16 :goto_155

    .line 582
    :cond_e5
    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    aget v12, v12, v8

    const/4 v13, 0x6

    if-ne v12, v11, :cond_102

    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v12, v12, v8

    if-nez v12, :cond_102

    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->reasons:[Ljava/lang/String;

    aget-object v12, v12, v8

    .line 581
    invoke-static {v12}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->structuralRetry(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_102

    iget v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    if-ge v12, v13, :cond_102

    move v12, v7

    goto :goto_103

    :cond_102
    move v12, v11

    .line 585
    :goto_103
    iget-object v14, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    aget v14, v14, v8

    if-lt v14, v12, :cond_115

    .line 586
    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v13, v13, v8

    if-nez v13, :cond_112

    move v11, v7

    :cond_112
    aput v11, v12, v8

    goto :goto_155

    .line 589
    :cond_115
    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    aget v12, v12, v8

    if-lez v12, :cond_130

    .line 590
    iget v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    if-lt v12, v13, :cond_12b

    .line 591
    iget-object v12, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    iget-object v13, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    aget-object v13, v13, v8

    if-nez v13, :cond_128

    move v11, v7

    :cond_128
    aput v11, v12, v8

    goto :goto_155

    .line 594
    :cond_12b
    iget v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    add-int/2addr v11, v10

    iput v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    .line 596
    :cond_130
    iget-object v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    aget v12, v11, v8

    add-int/2addr v12, v10

    aput v12, v11, v8

    .line 597
    iget-object v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    aput v10, v11, v8

    if-ne v8, v4, :cond_13f

    move v11, v10

    goto :goto_140

    :cond_13f
    move v11, v5

    .line 599
    :goto_140
    new-instance v12, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    invoke-direct {v12, v1, v8, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;-><init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;IZ)V

    .line 600
    iget-object v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    aput-object v12, v11, v8

    .line 601
    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    if-gt v8, v4, :cond_159

    .line 603
    iget-boolean v11, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->everReady:Z

    if-nez v11, :cond_155

    goto :goto_159

    :cond_155
    :goto_155
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_ae

    .line 605
    :cond_159
    :goto_159
    monitor-exit p0
    :try_end_15a
    .catchall {:try_start_c .. :try_end_15a} :catchall_1de

    .line 606
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_15e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1db

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    .line 607
    iget-object v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    iget v4, v2, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    .line 608
    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v5, "REBUILD_REQUEST"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "session="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v7, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, ";request="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, v2, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->traceId:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, ";block="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 615
    invoke-virtual {v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->id()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ";purpose="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    iget-boolean v7, v2, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->priority:Z

    if-eqz v7, :cond_1a6

    const-string v7, "focus"

    goto :goto_1a8

    :cond_1a6
    const-string v7, "prefetch"

    :goto_1a8
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ";position="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, ";range="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, v3, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->start:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, v3, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->end:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 608
    invoke-static {v4, v5, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 624
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/RebuildController;->IO:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda6;

    invoke-direct {v4, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda6;-><init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    goto :goto_15e

    :cond_1db
    return-void

    .line 556
    :cond_1dc
    :goto_1dc
    :try_start_1dc
    monitor-exit p0

    return-void

    :catchall_1de
    move-exception v0

    .line 605
    monitor-exit p0
    :try_end_1e0
    .catchall {:try_start_1dc .. :try_end_1e0} :catchall_1de

    throw v0
.end method

.method private static scheduleTick()V
    .registers 4

    .line 392
    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;

    monitor-enter v0

    .line 393
    :try_start_3
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->tickPosted:Z

    if-nez v1, :cond_1d

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    if-nez v1, :cond_c

    goto :goto_1d

    :cond_c
    const/4 v1, 0x1

    .line 394
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->tickPosted:Z

    .line 395
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_1f

    .line 396
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->MAIN:Landroid/os/Handler;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda7;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda7;-><init>()V

    const-wide/16 v2, 0x50

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 393
    :cond_1d
    :goto_1d
    :try_start_1d
    monitor-exit v0

    return-void

    :catchall_1f
    move-exception v1

    .line 395
    monitor-exit v0
    :try_end_21
    .catchall {:try_start_1d .. :try_end_21} :catchall_1f

    throw v1
.end method

.method static declared-synchronized stop()V
    .registers 3

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;

    monitor-enter v0

    .line 211
    :try_start_3
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    const/4 v2, 0x0

    .line 212
    sput-object v2, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    if-eqz v1, :cond_d

    .line 213
    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cancel()V

    .line 214
    :cond_d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->clear()V

    .line 215
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_15

    .line 216
    monitor-exit v0

    return-void

    :catchall_15
    move-exception v1

    :try_start_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v1
.end method

.method private static tick()V
    .registers 4

    .line 400
    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;

    monitor-enter v0

    const/4 v1, 0x0

    .line 401
    :try_start_4
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->tickPosted:Z

    .line 402
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_25

    .line 403
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    .line 404
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-nez v0, :cond_10

    return-void

    .line 406
    :cond_10
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->refreshSurface()V

    .line 407
    monitor-enter v1

    .line 408
    :try_start_14
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->position()J

    move-result-wide v2

    iput-wide v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    .line 409
    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_14 .. :try_end_1b} :catchall_22

    .line 410
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    .line 411
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->scheduleTick()V

    return-void

    :catchall_22
    move-exception v0

    .line 409
    :try_start_23
    monitor-exit v1
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    throw v0

    :catchall_25
    move-exception v1

    .line 402
    :try_start_26
    monitor-exit v0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_25

    throw v1
.end method

.method static time(J)V
    .registers 13

    const-string v0, "session="

    .line 337
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 338
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/RebuildController;->CLOCK:Lapp/yydarlinker/deepseekcaptions/RebuildClock;

    invoke-virtual {v3, p0, p1, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->update(JJ)Z

    move-result v4

    .line 339
    sget-object v5, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    .line 340
    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v6

    if-nez v6, :cond_15

    return-void

    .line 341
    :cond_15
    monitor-enter v5

    if-eqz v4, :cond_49

    .line 342
    :try_start_18
    iget-wide v6, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    const-string v8, "seek"

    invoke-static {v5, v6, v7, v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->endFallback(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;JLjava/lang/String;)V

    iget-object v6, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v7, "REBUILD_SEEK"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v9, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ";from="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v9, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ";to="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v7, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_49

    :catchall_47
    move-exception p0

    goto :goto_a4

    .line 343
    :cond_49
    :goto_49
    invoke-virtual {v3, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->presentation(J)J

    move-result-wide v0

    iput-wide v0, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    if-eqz v4, :cond_97

    .line 345
    iget v0, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->generation:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->generation:I

    .line 346
    const-string v0, ""

    iput-object v0, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->lastShown:Ljava/lang/String;

    .line 347
    const-string v0, ""

    iput-object v0, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->displayedEvent:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->withheldEvent:Ljava/lang/String;

    .line 348
    iget-object v0, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    if-eqz v0, :cond_97

    .line 349
    iget-object v0, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    array-length v2, v0

    const/4 v3, 0x0

    :goto_6b
    if-ge v3, v2, :cond_97

    aget-object v6, v0, v3

    if-eqz v6, :cond_94

    .line 350
    iget-boolean v7, v6, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->sent:Z

    if-nez v7, :cond_94

    iget-object v7, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    if-eqz v7, :cond_94

    iget-object v7, v5, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    iget v8, v6, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    invoke-static {v7, p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->covers(Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;J)Z

    move-result v7

    if-nez v7, :cond_94

    .line 351
    iput-boolean v1, v6, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->cancelled:Z

    .line 352
    iget-object v7, v6, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->connection:Ljava/net/HttpURLConnection;

    if-eqz v7, :cond_94

    iget-object v6, v6, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_94
    add-int/lit8 v3, v3, 0x1

    goto :goto_6b

    .line 355
    :cond_97
    monitor-exit v5
    :try_end_98
    .catchall {:try_start_18 .. :try_end_98} :catchall_47

    if-eqz v4, :cond_9d

    .line 356
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->hide()V

    .line 357
    :cond_9d
    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    .line 358
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->scheduleTick()V

    return-void

    .line 355
    :goto_a4
    :try_start_a4
    monitor-exit v5
    :try_end_a5
    .catchall {:try_start_a4 .. :try_end_a5} :catchall_47

    throw p0
.end method

.method private static translate(Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;)V
    .registers 26

    move-object/from16 v4, p0

    const-string v7, "session="

    const-string v0, "session="

    .line 629
    iget-object v8, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->session:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    .line 630
    iget-object v1, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->blocks:Ljava/util/List;

    iget v2, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    const/4 v12, 0x1

    const/4 v13, 0x0

    .line 634
    :try_start_14
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cacheChecked:[Z
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_16} :catch_368
    .catchall {:try_start_14 .. :try_end_16} :catchall_365

    if-eqz v2, :cond_6c

    :try_start_18
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cacheChecked:[Z

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget-boolean v2, v2, v3

    if-nez v2, :cond_6c

    .line 635
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cacheChecked:[Z

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aput-boolean v12, v2, v3

    .line 636
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    iget-object v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cacheKey:Ljava/lang/String;

    iget-object v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    invoke-static {v2, v3, v5, v1}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->read(Landroid/content/Context;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    move-result-object v2

    if-eqz v2, :cond_34

    move v3, v12

    goto :goto_35

    :cond_34
    move v3, v13

    .line 638
    :goto_35
    invoke-static {v12, v3, v13}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->recordUnitCacheOutcome(IIZ)V

    if-eqz v3, :cond_61

    .line 639
    iget-object v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v6, "REBUILD_CACHE_RESTORED"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_43} :catch_65
    .catchall {:try_start_18 .. :try_end_43} :catchall_365

    const-wide/16 v16, 0x4b0

    :try_start_45
    iget-wide v9, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v15, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ";block="

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ";network_calls=0"

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v6, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_63

    :cond_61
    const-wide/16 v16, 0x4b0

    :goto_63
    move v9, v3

    goto :goto_70

    :catch_65
    move-exception v0

    const-wide/16 v16, 0x4b0

    :goto_68
    move/from16 v18, v13

    goto/16 :goto_36d

    :cond_6c
    const-wide/16 v16, 0x4b0

    move v9, v13

    const/4 v2, 0x0

    :goto_70
    if-nez v2, :cond_84

    .line 641
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    iget-object v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->target:Ljava/lang/String;

    iget-boolean v5, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->priority:Z

    iget-object v6, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->reasons:[Ljava/lang/String;

    iget v10, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget-object v6, v6, v10

    .line 642
    invoke-static/range {v0 .. v6}, Lapp/yydarlinker/deepseekcaptions/RebuildApi;->translate(Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;ZLjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    move-result-object v2

    .line 644
    :cond_84
    monitor-enter v8
    :try_end_85
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_85} :catch_362
    .catchall {:try_start_45 .. :try_end_85} :catchall_365

    .line 645
    :try_start_85
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-eqz v0, :cond_348

    iget-boolean v0, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->cancelled:Z

    if-eqz v0, :cond_91

    goto/16 :goto_348

    :cond_91
    if-eqz v9, :cond_a4

    .line 646
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    iget-object v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v6, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget v5, v5, v6

    sub-int/2addr v5, v12

    invoke-static {v13, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    aput v5, v0, v3

    .line 648
    :cond_a4
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget-object v0, v0, v3

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->prefer(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    move-result-object v0

    .line 649
    iget-object v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iget v5, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget-object v3, v3, v5
    :try_end_b4
    .catchall {:try_start_85 .. :try_end_b4} :catchall_357

    if-eqz v3, :cond_10d

    if-ne v0, v3, :cond_10d

    if-eq v2, v3, :cond_10d

    .line 650
    :try_start_ba
    iget-object v5, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_10d

    .line 651
    iget-object v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v6, "REBUILD_REPAIR_NO_PROGRESS"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    :try_end_cb
    .catchall {:try_start_ba .. :try_end_cb} :catchall_109

    const/4 v7, 0x0

    :try_start_cc
    iget-wide v14, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v9, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, ";request="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->traceId:J

    invoke-virtual {v9, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, ";block="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ";old_risks="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    .line 652
    invoke-static {v10}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ";candidate_risks="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 651
    invoke-static {v5, v6, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_10e

    :catchall_109
    move-exception v0

    const/4 v7, 0x0

    goto/16 :goto_343

    :cond_10d
    const/4 v7, 0x0

    :goto_10e
    if-nez v3, :cond_112

    move-object v2, v7

    goto :goto_118

    .line 653
    :cond_112
    iget-wide v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    invoke-virtual {v3, v5, v6}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->at(J)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;

    move-result-object v2

    :goto_118
    if-nez v2, :cond_11d

    .line 654
    const-string v5, ""

    goto :goto_13f

    :cond_11d
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v6, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_13f
    if-eqz v3, :cond_15a

    if-eq v0, v3, :cond_15a

    if-eqz v2, :cond_15a

    .line 655
    iget-object v6, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->displayedEvent:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15a

    invoke-static {v3, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->blocked(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;)Z

    move-result v2

    if-nez v2, :cond_15a

    .line 656
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->pendingPlans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aput-object v0, v2, v3

    goto :goto_160

    .line 657
    :cond_15a
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aput-object v0, v2, v3

    .line 658
    :goto_160
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget v19, v2, v3

    iget v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    iget-wide v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    iget-wide v9, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->end:J

    move-object/from16 v18, v0

    move/from16 v20, v2

    move-wide/from16 v21, v5

    move-wide/from16 v23, v9

    invoke-static/range {v18 .. v24}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->shouldRepair(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;IIJJ)Z

    move-result v0

    move-object/from16 v2, v18

    .line 659
    iget-object v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    iget v5, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    if-eqz v0, :cond_182

    move v6, v13

    goto :goto_183

    :cond_182
    const/4 v6, 0x2

    :goto_183
    aput v6, v3, v5

    if-eqz v0, :cond_19f

    .line 661
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->reasons:[Ljava/lang/String;

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    iget-object v5, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->repair(Ljava/util/List;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v3

    .line 662
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->retryAt:[J

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    add-long v5, v5, v16

    aput-wide v5, v0, v3

    .line 664
    :cond_19f
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aput-object v7, v0, v3

    .line 665
    iput-boolean v12, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->everReady:Z

    .line 666
    monitor-exit v8
    :try_end_1a8
    .catchall {:try_start_cc .. :try_end_1a8} :catchall_342

    .line 667
    :try_start_1a8
    iget-object v0, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1ae
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1ff

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    .line 668
    iget-object v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v6, "REBUILD_QUALITY_WARNING"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "session="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v9, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, ";request="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->traceId:J

    invoke-virtual {v9, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, ";block="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ";advisory=true;repair_candidate="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v10, v3, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->repair:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v10, ";"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->describe()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1ae

    .line 669
    :cond_1ff
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2cc

    iget-object v0, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->events:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_20d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2cc

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;

    .line 670
    iget-object v5, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/util/stream/IntStream;

    move-result-object v5

    new-instance v6, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda3;

    invoke-direct {v6}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda3;-><init>()V

    invoke-static {v5, v6}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    move-result-object v5

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;)J

    move-result-wide v5

    long-to-int v5, v5

    int-to-double v9, v5

    const-wide v14, 0x408f400000000000L    # 1000.0

    mul-double/2addr v9, v14

    .line 671
    iget-wide v14, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J
    :try_end_236
    .catch Ljava/lang/Exception; {:try_start_1a8 .. :try_end_236} :catch_33c
    .catchall {:try_start_1a8 .. :try_end_236} :catchall_365

    move v6, v13

    move-wide/from16 v18, v14

    :try_start_239
    iget-wide v13, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J
    :try_end_23b
    .catch Ljava/lang/Exception; {:try_start_239 .. :try_end_23b} :catch_2c5
    .catchall {:try_start_239 .. :try_end_23b} :catchall_365

    sub-long v13, v18, v13

    move/from16 v18, v6

    move-object v15, v7

    const-wide/16 v6, 0x1

    :try_start_242
    invoke-static {v6, v7, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    long-to-double v6, v6

    div-double/2addr v9, v6

    const/16 v6, 0x30

    if-gt v5, v6, :cond_256

    const-wide/high16 v6, 0x4028000000000000L    # 12.0

    cmpl-double v6, v9, v6

    if-lez v6, :cond_253

    goto :goto_256

    :cond_253
    move-object/from16 v20, v15

    goto :goto_2b9

    .line 672
    :cond_256
    :goto_256
    iget-object v6, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v7, "REBUILD_READABILITY_WARNING"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "block="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, ";range="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, "-"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, ";duration="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v11, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J
    :try_end_284
    .catch Ljava/lang/Exception; {:try_start_242 .. :try_end_284} :catch_2c0
    .catchall {:try_start_242 .. :try_end_284} :catchall_365

    move-object/from16 v20, v15

    :try_start_286
    iget-wide v14, v3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    sub-long/2addr v11, v14

    invoke-virtual {v13, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ";characters="

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ";cps="

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v5, "%.2f"

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    const/4 v10, 0x1

    new-array v11, v10, [Ljava/lang/Object;

    aput-object v9, v11, v18

    invoke-static {v3, v5, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ";advisory_only=true"

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v7, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :goto_2b9
    move/from16 v13, v18

    move-object/from16 v7, v20

    const/4 v12, 0x1

    goto/16 :goto_20d

    :catch_2c0
    move-exception v0

    move-object/from16 v20, v15

    goto/16 :goto_36f

    :catch_2c5
    move-exception v0

    move/from16 v18, v6

    move-object/from16 v20, v7

    goto/16 :goto_36f

    :cond_2cc
    move-object/from16 v20, v7

    move/from16 v18, v13

    .line 675
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->CACHE:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;

    invoke-direct {v3, v8, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;-><init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)V

    invoke-interface {v0, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 676
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v3, "REBUILD_EVENTS_ACCEPTED"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "block="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ";events="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->events:Ljava/util/List;

    .line 682
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ";session="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v6, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v6, ";request="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v6, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->traceId:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v6, ";review_risks="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    .line 683
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ";attempts="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    aget v2, v2, v6

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 676
    invoke-static {v0, v3, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_332
    .catch Ljava/lang/Exception; {:try_start_286 .. :try_end_332} :catch_35e
    .catchall {:try_start_286 .. :try_end_332} :catchall_365

    .line 747
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-eqz v0, :cond_56a

    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    return-void

    :catch_33c
    move-exception v0

    move-object/from16 v20, v7

    move/from16 v18, v13

    goto :goto_36f

    :catchall_342
    move-exception v0

    :goto_343
    move-object/from16 v20, v7

    move/from16 v18, v13

    goto :goto_35c

    :cond_348
    :goto_348
    move/from16 v18, v13

    const/16 v20, 0x0

    .line 645
    :try_start_34c
    monitor-exit v8
    :try_end_34d
    .catchall {:try_start_34c .. :try_end_34d} :catchall_360

    .line 747
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-eqz v0, :cond_56a

    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    return-void

    :catchall_357
    move-exception v0

    move/from16 v18, v13

    const/16 v20, 0x0

    .line 666
    :goto_35c
    :try_start_35c
    monitor-exit v8
    :try_end_35d
    .catchall {:try_start_35c .. :try_end_35d} :catchall_360

    :try_start_35d
    throw v0
    :try_end_35e
    .catch Ljava/lang/Exception; {:try_start_35d .. :try_end_35e} :catch_35e
    .catchall {:try_start_35d .. :try_end_35e} :catchall_365

    :catch_35e
    move-exception v0

    goto :goto_36f

    :catchall_360
    move-exception v0

    goto :goto_35c

    :catch_362
    move-exception v0

    goto/16 :goto_68

    :catchall_365
    move-exception v0

    goto/16 :goto_56e

    :catch_368
    move-exception v0

    move/from16 v18, v13

    const-wide/16 v16, 0x4b0

    :goto_36d
    const/16 v20, 0x0

    .line 687
    :goto_36f
    :try_start_36f
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v2
    :try_end_373
    .catchall {:try_start_36f .. :try_end_373} :catchall_365

    if-nez v2, :cond_380

    .line 747
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-eqz v0, :cond_56a

    :goto_37b
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    goto/16 :goto_56a

    .line 688
    :cond_380
    :try_start_380
    monitor-enter v8
    :try_end_381
    .catchall {:try_start_380 .. :try_end_381} :catchall_365

    .line 689
    :try_start_381
    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aput-object v20, v2, v3

    .line 690
    iget-boolean v2, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->cancelled:Z

    if-eqz v2, :cond_3ce

    .line 691
    iget-boolean v0, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->sent:Z

    if-nez v0, :cond_3b8

    .line 692
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v1, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget v0, v0, v1

    const/4 v10, 0x1

    if-le v0, v10, :cond_3a3

    iget v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    sub-int/2addr v0, v10

    move/from16 v6, v18

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    .line 693
    :cond_3a3
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v1, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget v2, v2, v3

    const/16 v19, 0x1

    add-int/lit8 v2, v2, -0x1

    const/4 v6, 0x0

    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    aput v2, v0, v1

    .line 695
    :cond_3b8
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    iget v1, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    const/4 v6, 0x0

    aput v6, v0, v1

    .line 696
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->retryAt:[J

    iget v1, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v4, 0x1f4

    add-long/2addr v2, v4

    aput-wide v2, v0, v1

    goto/16 :goto_561

    :cond_3ce
    move/from16 v6, v18

    .line 699
    instance-of v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;

    if-eqz v2, :cond_3da

    .line 700
    move-object v2, v0

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;->code:Ljava/lang/String;

    goto :goto_3ec

    .line 701
    :cond_3da
    instance-of v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;

    if-eqz v2, :cond_3e4

    .line 702
    move-object v2, v0

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;->code:Ljava/lang/String;

    goto :goto_3ec

    .line 703
    :cond_3e4
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    .line 704
    :goto_3ec
    iget-object v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->reasons:[Ljava/lang/String;

    iget v5, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    instance-of v9, v0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;

    if-eqz v9, :cond_41e

    move-object v9, v0

    check-cast v9, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;

    iget-object v9, v9, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;->detail:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_41e

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "; "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v10, v0

    check-cast v10, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;

    iget-object v10, v10, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;->detail:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_420

    :cond_41e
    const-string v9, ""

    :goto_420
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v5

    .line 705
    instance-of v3, v0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;

    if-eqz v3, :cond_437

    move-object v3, v0

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;

    iget-boolean v3, v3, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;->configuration:Z

    if-eqz v3, :cond_437

    const/16 v18, 0x1

    goto :goto_439

    :cond_437
    move/from16 v18, v6

    :goto_439
    if-eqz v18, :cond_452

    const/4 v10, 0x1

    .line 707
    iput-boolean v10, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->terminal:Z

    .line 708
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u5b57\u5e55 API \u914d\u7f6e\u9519\u8bef\uff1a"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->status:Ljava/lang/String;

    goto :goto_453

    :cond_452
    const/4 v10, 0x1

    .line 710
    :goto_453
    instance-of v3, v0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;

    if-eqz v3, :cond_466

    const-string v3, "content_filter"

    move-object v5, v0

    check-cast v5, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;

    iget-object v5, v5, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;->code:Ljava/lang/String;

    .line 712
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_466

    move v3, v10

    goto :goto_467

    :cond_466
    move v3, v6

    .line 713
    :goto_467
    iget-object v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iget v7, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget-object v5, v5, v7

    const/4 v7, 0x6

    const/4 v9, 0x3

    if-nez v5, :cond_485

    iget-object v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v11, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget v5, v5, v11

    if-ge v5, v9, :cond_485

    .line 716
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->structuralRetry(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_485

    iget v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    if-ge v5, v7, :cond_485

    move v12, v10

    goto :goto_486

    :cond_485
    move v12, v6

    .line 718
    :goto_486
    iget-object v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    iget v10, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    if-nez v18, :cond_4a8

    if-nez v3, :cond_4a8

    if-nez v12, :cond_499

    .line 721
    iget-object v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v11, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget v3, v3, v11

    const/4 v14, 0x2

    if-ge v3, v14, :cond_4a8

    :cond_499
    iget-object v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v11, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget v3, v3, v11

    if-ge v3, v9, :cond_4a8

    iget v3, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    if-lt v3, v7, :cond_4a6

    goto :goto_4a8

    :cond_4a6
    move v13, v6

    goto :goto_4a9

    :cond_4a8
    :goto_4a8
    move v13, v9

    .line 723
    :goto_4a9
    aput v13, v5, v10

    .line 724
    instance-of v3, v0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;

    if-eqz v3, :cond_4b4

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;

    iget-wide v5, v0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;->delay:J

    goto :goto_4b6

    :cond_4b4
    const-wide/16 v5, 0x0

    .line 725
    :goto_4b6
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->retryAt:[J

    iget v3, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    move-wide/from16 v11, v16

    invoke-static {v11, v12, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    add-long/2addr v9, v11

    aput-wide v9, v0, v3

    .line 726
    const-string v0, "http_429"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d7

    const-string v0, "http_5"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4ea

    .line 727
    :cond_4d7
    iget-wide v9, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->providerRetry:J

    .line 728
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    const-wide/16 v14, 0x1388

    invoke-static {v14, v15, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    add-long/2addr v11, v5

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    iput-wide v5, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->providerRetry:J

    .line 729
    :cond_4ea
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    const-string v3, "REBUILD_EVENTS_REJECTED"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "block="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ";reason="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ";session="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v6, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";request="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v6, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->traceId:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ";detail="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->reasons:[Ljava/lang/String;

    iget v6, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget-object v2, v2, v6

    iget-object v6, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    iget-object v6, v6, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    const/16 v7, 0x190

    .line 737
    invoke-static {v2, v6, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->redact(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ";attempts="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->attempts:[I

    iget v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    aget v1, v2, v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ";session_repairs="

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->repairCount:I

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 729
    invoke-static {v0, v3, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 743
    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iget v1, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_561

    if-nez v18, :cond_561

    iget-object v0, v8, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->states:[I

    iget v1, v4, Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;->index:I

    const/4 v14, 0x2

    aput v14, v0, v1

    .line 745
    :cond_561
    :goto_561
    monitor-exit v8
    :try_end_562
    .catchall {:try_start_381 .. :try_end_562} :catchall_56b

    .line 747
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v0

    if-eqz v0, :cond_56a

    goto/16 :goto_37b

    :cond_56a
    :goto_56a
    return-void

    :catchall_56b
    move-exception v0

    .line 745
    :try_start_56c
    monitor-exit v8
    :try_end_56d
    .catchall {:try_start_56c .. :try_end_56d} :catchall_56b

    :try_start_56d
    throw v0
    :try_end_56e
    .catchall {:try_start_56d .. :try_end_56e} :catchall_365

    .line 747
    :goto_56e
    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v1

    if-eqz v1, :cond_577

    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->kick(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)V

    .line 748
    :cond_577
    throw v0
.end method

.method static declared-synchronized video(Ljava/lang/String;)V
    .registers 5

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;

    monitor-enter v0

    if-eqz p0, :cond_3e

    .line 198
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_10

    goto :goto_3e

    .line 199
    :cond_10
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 200
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 201
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->video:Ljava/lang/String;

    if-nez v1, :cond_36

    .line 203
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->CLOCK:Lapp/yydarlinker/deepseekcaptions/RebuildClock;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildClock;->reset(J)V

    .line 204
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    if-eqz v1, :cond_36

    .line 205
    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->owner:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_36

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->stop()V

    .line 207
    :cond_36
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->onVideoId(Ljava/lang/String;)V
    :try_end_39
    .catchall {:try_start_5 .. :try_end_39} :catchall_3b

    .line 208
    monitor-exit v0

    return-void

    :catchall_3b
    move-exception p0

    :try_start_3c
    monitor-exit v0
    :try_end_3d
    .catchall {:try_start_3c .. :try_end_3d} :catchall_3b

    throw p0

    .line 198
    :cond_3e
    :goto_3e
    monitor-exit v0

    return-void
.end method

.method static visible()Z
    .registers 2

    .line 182
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildController;->active:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    .line 183
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->current(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;)Z

    move-result v1

    if-eqz v1, :cond_e

    iget-boolean v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    return v0

    :cond_e
    const/4 v0, 0x0

    return v0
.end method
