.class final Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;
.super Ljava/lang/Object;
.source "RebuildController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Session"
.end annotation


# instance fields
.field attempts:[I

.field blocks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;",
            ">;"
        }
    .end annotation
.end field

.field cacheChecked:[Z

.field cacheKey:Ljava/lang/String;

.field volatile cancelled:Z

.field final config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

.field final connections:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/net/HttpURLConnection;",
            ">;"
        }
    .end annotation
.end field

.field final context:Landroid/content/Context;

.field displayedEvent:Ljava/lang/String;

.field everReady:Z

.field fallbackReason:Ljava/lang/String;

.field fallbackStart:J

.field volatile generation:I

.field final id:J

.field final identity:Ljava/lang/String;

.field jobs:[Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

.field lastShown:Ljava/lang/String;

.field volatile loading:Z

.field final owner:Ljava/lang/String;

.field pendingPlans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

.field plans:[Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

.field volatile position:J

.field volatile providerRetry:J

.field raw:Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

.field reasons:[Ljava/lang/String;

.field volatile renderRevision:J

.field repairCount:I

.field retryAt:[J

.field source:Lapp/yydarlinker/deepseekcaptions/RebuildSource;

.field sourceFailures:I

.field final sourceOnly:Z

.field volatile sourceRetry:J

.field states:[I

.field volatile status:Ljava/lang/String;

.field final target:Ljava/lang/String;

.field volatile terminal:Z

.field volatile url:Ljava/lang/String;

.field volatile visible:Z

.field withheldEvent:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;ZZ)V
    .registers 12

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->-$$Nest$sfgetIDS()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->id:J

    .line 51
    const-string v0, ""

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->status:Ljava/lang/String;

    .line 55
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cacheKey:Ljava/lang/String;

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->lastShown:Ljava/lang/String;

    .line 56
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackReason:Ljava/lang/String;

    const-wide/16 v1, -0x1

    .line 57
    iput-wide v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->fallbackStart:J

    .line 59
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->displayedEvent:Ljava/lang/String;

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->withheldEvent:Ljava/lang/String;

    .line 69
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->connections:Ljava/util/Set;

    .line 80
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->context:Landroid/content/Context;

    .line 81
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->url:Ljava/lang/String;

    .line 82
    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->owner:Ljava/lang/String;

    .line 83
    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->identity:Ljava/lang/String;

    .line 84
    iput-object p5, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->target:Ljava/lang/String;

    .line 85
    iput-object p6, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->config:Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    .line 86
    iput-boolean p7, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->sourceOnly:Z

    .line 87
    iput-boolean p8, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->visible:Z

    return-void
.end method


# virtual methods
.method cancel()V
    .registers 4

    .line 91
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->position:J

    const-string v2, "session_end"

    invoke-static {p0, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->-$$Nest$smendFallback(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;JLjava/lang/String;)V

    monitor-exit p0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_34

    const/4 v0, 0x1

    .line 92
    iput-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->cancelled:Z

    .line 93
    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->generation:I

    add-int/2addr v1, v0

    iput v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->generation:I

    .line 94
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->connections:Ljava/util/Set;

    monitor-enter v0

    .line 95
    :try_start_14
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->connections:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :catch_1a
    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_26
    .catchall {:try_start_14 .. :try_end_26} :catchall_31

    .line 97
    :try_start_26
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_29} :catch_1a
    .catchall {:try_start_26 .. :try_end_29} :catchall_31

    goto :goto_1a

    .line 100
    :cond_2a
    :try_start_2a
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;->connections:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 101
    monitor-exit v0

    return-void

    :catchall_31
    move-exception p0

    monitor-exit v0
    :try_end_33
    .catchall {:try_start_2a .. :try_end_33} :catchall_31

    throw p0

    :catchall_34
    move-exception v0

    .line 91
    :try_start_35
    monitor-exit p0
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_34

    throw v0
.end method
