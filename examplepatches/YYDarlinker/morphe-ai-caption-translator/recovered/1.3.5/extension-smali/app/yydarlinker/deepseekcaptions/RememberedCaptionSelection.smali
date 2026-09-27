.class final Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;
.super Ljava/lang/Object;
.source "RememberedCaptionSelection.java"


# static fields
.field private static asr:Z = false

.field private static known:Z = false

.field private static language:Ljava/lang/String; = ""

.field private static on:Z

.field private static translated:Z


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized asr()Z
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;

    monitor-enter v0

    .line 14
    :try_start_3
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->asr:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return v1

    :catchall_7
    move-exception v1

    :try_start_8
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_8 .. :try_end_9} :catchall_7

    throw v1
.end method

.method static declared-synchronized decision()I
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;

    monitor-enter v0

    .line 11
    :try_start_3
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->known:Z

    if-nez v1, :cond_9

    const/4 v1, -0x1

    goto :goto_10

    :cond_9
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->on:Z
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_12

    if-eqz v1, :cond_f

    const/4 v1, 0x1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    monitor-exit v0

    return v1

    :catchall_12
    move-exception v1

    :try_start_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw v1
.end method

.method static declared-synchronized language()Ljava/lang/String;
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;

    monitor-enter v0

    .line 12
    :try_start_3
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->language:Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    :try_start_8
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_8 .. :try_end_9} :catchall_7

    throw v1
.end method

.method static declared-synchronized off()V
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;

    monitor-enter v0

    const/4 v1, 0x1

    .line 10
    :try_start_4
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->known:Z

    const/4 v1, 0x0

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->on:Z
    :try_end_9
    .catchall {:try_start_4 .. :try_end_9} :catchall_b

    monitor-exit v0

    return-void

    :catchall_b
    move-exception v1

    :try_start_c
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_b

    throw v1
.end method

.method static declared-synchronized reset()V
    .registers 3

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;

    monitor-enter v0

    const/4 v1, 0x0

    .line 15
    :try_start_4
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->known:Z

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->on:Z

    const-string v2, ""

    sput-object v2, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->language:Ljava/lang/String;

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->translated:Z

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->asr:Z
    :try_end_10
    .catchall {:try_start_4 .. :try_end_10} :catchall_12

    monitor-exit v0

    return-void

    :catchall_12
    move-exception v1

    :try_start_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw v1
.end method

.method static declared-synchronized select(Ljava/lang/String;ZZ)V
    .registers 5

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;

    monitor-enter v0

    if-eqz p0, :cond_24

    .line 7
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_24

    const-string v1, "_OPTION"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    goto :goto_24

    .line 8
    :cond_14
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->language:Ljava/lang/String;

    sput-boolean p1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->translated:Z

    sput-boolean p2, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->asr:Z

    const/4 p0, 0x1

    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->known:Z

    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->on:Z
    :try_end_1f
    .catchall {:try_start_5 .. :try_end_1f} :catchall_21

    .line 9
    monitor-exit v0

    return-void

    :catchall_21
    move-exception p0

    :try_start_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw p0

    .line 7
    :cond_24
    :goto_24
    monitor-exit v0

    return-void
.end method

.method static declared-synchronized translated()Z
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;

    monitor-enter v0

    .line 13
    :try_start_3
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->translated:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return v1

    :catchall_7
    move-exception v1

    :try_start_8
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_8 .. :try_end_9} :catchall_7

    throw v1
.end method
