.class public Lcom/bef/effectsdk/message/MessageCenter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/message/MessageCenter$MessageHandler;,
        Lcom/bef/effectsdk/message/MessageCenter$Listener;
    }
.end annotation


# static fields
.field public static final BEF_MSG_TYPE_RECORD_VIDEO:I = 0x48

.field public static final MSG_CLIENT_TO_SDK_CHALLENGE_GAME:I = 0x1007

.field public static final MSG_CLIENT_TO_SDK_PUASE_GAME:I = 0x1004

.field public static final MSG_CLIENT_TO_SDK_RESTART_GAME:I = 0x1006

.field public static final MSG_CLIENT_TO_SDK_RESUME_GAME:I = 0x1005

.field public static final MSG_CLIENT_TO_SDK_START_GAME:I = 0x1001

.field public static final MSG_CLINET_TO_SDK_FINISH_GAME:I = 0x1002

.field public static final MSG_ERROR_TYPE_CONFIG:I = 0x1001

.field public static final MSG_EVENT_2D_ANIMATION_CYCLE_FINISH:I = 0x5

.field public static final MSG_EVENT_ALGORITHM_CHANGE_FACE_COUNT:I = 0x1

.field public static final MSG_EVENT_AUDIO_FILE_WRITTEN:I = 0x2

.field public static final MSG_EVENT_AUDIO_INIT:I = 0x1

.field public static final MSG_EVENT_AUDIO_RECORD_FILEPATH:I = 0x2

.field public static final MSG_EVENT_AUDIO_RECORD_START:I = 0x0

.field public static final MSG_EVENT_AUDIO_RECORD_STOP:I = 0x1

.field public static final MSG_EVENT_BODY_DANCE_CATEGORY_ADJUST:I = 0x1

.field public static final MSG_EVENT_BODY_DANCE_CATEGORY_SCORE:I = 0x2

.field public static final MSG_EVENT_CAMERA_SWITCH:I = 0x3

.field public static final MSG_EVENT_CAMERA_TO_BACK:I = 0x2

.field public static final MSG_EVENT_CAMERA_TO_FRONT:I = 0x1

.field public static final MSG_EVENT_ENIGMA_COMPLETE:I = 0x1

.field public static final MSG_EVENT_EXIT_GAME:I = 0x0

.field public static final MSG_EVENT_GAME_END:I = 0x3

.field public static final MSG_EVENT_GAME_READY:I = 0x2

.field public static final MSG_EVENT_LOAD_FAIL:I = 0x4

.field public static final MSG_EVENT_LOAD_INIT:I = 0x1

.field public static final MSG_EVENT_LOAD_LOADING:I = 0x2

.field public static final MSG_EVENT_LOAD_SUCCESS:I = 0x3

.field public static final MSG_EVENT_PLAY_GAME_BGM:I = 0x1

.field public static final MSG_EVENT_RECORD_CLIP_KEY:I = 0x2

.field public static final MSG_EVENT_REPLAY_GAME:I = 0x1

.field public static final MSG_EVENT_STOP_GAME_BGM:I = 0x0

.field public static final MSG_ID_BEGIN:I = 0x10

.field public static final MSG_SDK_TO_CLIENT_END_GAME_REQ:I = 0x1003

.field public static final MSG_SDK_TO_CLIENT_GAME_RESOURCE_LOADED:I = 0x1008

.field public static final MSG_TYPE_2D_ANIMATION_CYCLE:I = 0x12

.field public static final MSG_TYPE_ALGORITHM_CHANGE:I = 0x17

.field public static final MSG_TYPE_APP_STATUS:I = 0x16

.field public static final MSG_TYPE_ARSCAN_STICKER:I = 0x35

.field public static final MSG_TYPE_AUDIO_PLAYER:I = 0x15

.field public static final MSG_TYPE_AUDIO_RECORD:I = 0x2b

.field public static final MSG_TYPE_BODY_DANCE:I = 0x13

.field public static final MSG_TYPE_CLIENT_INTERACTION:I = 0x29

.field public static final MSG_TYPE_EFFECT:I = 0x14

.field public static final MSG_TYPE_FACE_ATTRIBUTIONS:I = 0x22

.field public static final MSG_TYPE_FACE_VERIFY:I = 0x23

.field public static final MSG_TYPE_GAME_DATA:I = 0x2a

.field public static final MSG_TYPE_GAME_MUSIC_END:I = 0x2c

.field public static final MSG_TYPE_GAME_MUSIC_REQ:I = 0x2f

.field public static final MSG_TYPE_GAME_NTF:I = 0x2e

.field public static final MSG_TYPE_GAME_REQ:I = 0x2d

.field public static final MSG_TYPE_GENERAL_AUDIO:I = 0x3a

.field public static final MSG_TYPE_HIDEINPUTMETHOD:I = 0x21

.field public static final MSG_TYPE_LIVE_ACTIVITY_INFO:I = 0x38

.field public static final MSG_TYPE_LIVE_GIFT_NOTIFY:I = 0x39

.field public static final MSG_TYPE_LIVE_INTERACTION:I = 0x28

.field public static final MSG_TYPE_LIVE_MAGIC_GESTURE_INFO:I = 0x37

.field public static final MSG_TYPE_LIVE_OGC_INFO:I = 0x40

.field public static final MSG_TYPE_M10N_INFO:I = 0x42

.field public static final MSG_TYPE_RESOURCE:I = 0x11

.field public static final MSG_TYPE_SHOWINPUTMETHOD:I = 0x20

.field public static final MSG_TYPE_START_RECORD:I = 0x30

.field public static final MSG_TYPE_STICKER_ASK_LOAD_CNT:I = 0x33

.field public static final MSG_TYPE_STICKER_LOAD_CNT:I = 0x32

.field public static final MSG_TYPE_STOP_RECORD:I = 0x31

.field public static final MSG_TYPE_SWITCH_CAMERA_POSITION:I = 0x47

.field public static final MSG_TYPE_SWITCH_TO_AR_MODE:I = 0x50

.field public static final MSG_TYPE_TYPE_ENIGMA:I = 0x18

.field public static final MSG_TYPE_VE_AUDIO:I = 0x3b

.field public static final MSG_TYPE_VRBRUSH_STICKER:I = 0x36

.field private static final TAG:Ljava/lang/String; = "MessageCenter"

.field private static final sListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bef/effectsdk/message/MessageCenter$Listener;",
            ">;"
        }
    .end annotation
.end field

.field private static sMessageCenterThread:Landroid/os/HandlerThread;

.field private static final sMessageCenterThreadLock:Ljava/lang/Object;

.field private static sMessageHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThreadLock:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sListeners:Ljava/util/List;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000(Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/bef/effectsdk/message/MessageCenter;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static addListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sListeners:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->init()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public static destroy()V
    .locals 4

    .line 1
    sget-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sListeners:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v1

    .line 13
    goto :goto_2

    .line 14
    :cond_0
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThreadLock:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    :try_start_1
    sget-object v2, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    sput-object v3, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_1
    move-exception v2

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    sget-object v2, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    .line 31
    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/os/HandlerThread;->quit()Z

    .line 35
    .line 36
    .line 37
    sput-object v3, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    .line 38
    .line 39
    :cond_2
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 40
    :try_start_2
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 41
    .line 42
    .line 43
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    return-void

    .line 45
    :goto_1
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 46
    :try_start_4
    throw v2

    .line 47
    :goto_2
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 48
    throw v1
.end method

.method private static handleMessage(Landroid/os/Message;)V
    .locals 8

    .line 1
    sget-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sListeners:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    new-array v2, v1, [Lcom/bef/effectsdk/message/MessageCenter$Listener;

    .line 9
    .line 10
    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    if-gtz v1, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    if-ge v0, v1, :cond_1

    .line 19
    .line 20
    aget-object v3, v2, v0

    .line 21
    .line 22
    iget v4, p0, Landroid/os/Message;->what:I

    .line 23
    .line 24
    iget v5, p0, Landroid/os/Message;->arg1:I

    .line 25
    .line 26
    iget v6, p0, Landroid/os/Message;->arg2:I

    .line 27
    .line 28
    iget-object v7, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v7, Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v3, v4, v5, v6, v7}, Lcom/bef/effectsdk/message/MessageCenter$Listener;->onMessageReceived(IIILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    :goto_1
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p0
.end method

.method public static init()V
    .locals 3

    .line 1
    sget-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThreadLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Thread;->isAlive()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    new-instance v1, Landroid/os/HandlerThread;

    .line 26
    .line 27
    const-string v2, "MessageCenter"

    .line 28
    .line 29
    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sput-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 35
    .line 36
    .line 37
    new-instance v1, Lcom/bef/effectsdk/message/MessageCenter$MessageHandler;

    .line 38
    .line 39
    sget-object v2, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThread:Landroid/os/HandlerThread;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-direct {v1, v2}, Lcom/bef/effectsdk/message/MessageCenter$MessageHandler;-><init>(Landroid/os/Looper;)V

    .line 46
    .line 47
    .line 48
    sput-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    .line 49
    .line 50
    :cond_1
    monitor-exit v0

    .line 51
    return-void

    .line 52
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw v1
.end method

.method private static postMessage(IIILjava/lang/String;)V
    .locals 2
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    sget-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sMessageCenterThreadLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/bef/effectsdk/message/MessageCenter;->sMessageHandler:Landroid/os/Handler;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {v1, p0, p1, p2, p3}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public static removeAllListener()V
    .locals 2

    .line 1
    sget-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sListeners:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->destroy()V

    .line 8
    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v1

    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw v1
.end method

.method public static removeListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sListeners:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->destroy()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public static setListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/message/MessageCenter;->sListeners:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p0}, Lcom/bef/effectsdk/message/MessageCenter;->addListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V

    .line 5
    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method
