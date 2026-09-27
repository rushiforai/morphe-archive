.class final Lapp/yydarlinker/deepseekcaptions/CaptionChoice;
.super Ljava/lang/Object;
.source "CaptionChoice.java"


# static fields
.field private static asr:Z = false

.field private static chosen:Z = false

.field private static language:Ljava/lang/String; = ""

.field private static on:Z

.field private static translation:Z


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

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    .line 11
    :try_start_3
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->asr:Z
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

.method static declared-synchronized isOn()Z
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    .line 13
    :try_start_3
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->chosen:Z

    if-eqz v1, :cond_15

    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->on:Z

    if-eqz v1, :cond_15

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->language:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_18

    if-nez v1, :cond_15

    const/4 v1, 0x1

    goto :goto_16

    :cond_15
    const/4 v1, 0x0

    :goto_16
    monitor-exit v0

    return v1

    :catchall_18
    move-exception v1

    :try_start_19
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_18

    throw v1
.end method

.method static declared-synchronized known()Z
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    .line 14
    :try_start_3
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->chosen:Z
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

.method static declared-synchronized language()Ljava/lang/String;
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    .line 16
    :try_start_3
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->language:Ljava/lang/String;
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

.method static declared-synchronized reset()V
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    .line 17
    :try_start_3
    const-string v1, ""

    sput-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->language:Ljava/lang/String;

    const/4 v1, 0x0

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translation:Z

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->on:Z

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->chosen:Z

    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->asr:Z
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

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

.method static declared-synchronized select(Ljava/lang/String;Z)V
    .registers 4

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    if-eqz p0, :cond_29

    .line 7
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_29

    const-string v1, "_OPTION"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_18

    goto :goto_29

    .line 8
    :cond_18
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->language:Ljava/lang/String;

    sput-boolean p1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translation:Z

    const/4 p0, 0x1

    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->on:Z

    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->chosen:Z

    const/4 p0, 0x0

    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->asr:Z
    :try_end_24
    .catchall {:try_start_5 .. :try_end_24} :catchall_26

    .line 9
    monitor-exit v0

    return-void

    :catchall_26
    move-exception p0

    :try_start_27
    monitor-exit v0
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_26

    throw p0

    .line 7
    :cond_29
    :goto_29
    monitor-exit v0

    return-void
.end method

.method static declared-synchronized select(Ljava/lang/String;ZZ)V
    .registers 4

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    .line 10
    :try_start_3
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->select(Ljava/lang/String;Z)V

    sput-boolean p2, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->asr:Z
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_a

    monitor-exit v0

    return-void

    :catchall_a
    move-exception p0

    :try_start_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_a

    throw p0
.end method

.method static declared-synchronized toggle(Z)V
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    .line 12
    :try_start_3
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->on:Z

    if-nez p0, :cond_a

    const/4 p0, 0x1

    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->chosen:Z
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_c

    :cond_a
    monitor-exit v0

    return-void

    :catchall_c
    move-exception p0

    :try_start_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_d .. :try_end_e} :catchall_c

    throw p0
.end method

.method static declared-synchronized translates()Z
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;

    monitor-enter v0

    .line 15
    :try_start_3
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translation:Z
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
