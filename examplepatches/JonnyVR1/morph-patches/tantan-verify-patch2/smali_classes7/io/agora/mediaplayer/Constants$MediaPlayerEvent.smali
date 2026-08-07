.class public final enum Lio/agora/mediaplayer/Constants$MediaPlayerEvent;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/mediaplayer/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MediaPlayerEvent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/mediaplayer/Constants$MediaPlayerEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_AUDIO_TRACK_CHANGED:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_BUFFER_LOW:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_BUFFER_RECOVER:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_FIRST_DISPLAYED:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_FREEZE_START:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_FREEZE_STOP:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_REACH_CACHE_FILE_MAX_COUNT:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_REACH_CACHE_FILE_MAX_SIZE:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_SEEK_BEGIN:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_SEEK_COMPLETE:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_SEEK_ERROR:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_SWITCH_BEGIN:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_SWITCH_COMPLETE:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_SWITCH_ERROR:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_TRY_OPEN_FAILED:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_TRY_OPEN_START:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_TRY_OPEN_SUCCEED:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

.field public static final enum PLAYER_EVENT_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 21

    new-instance v1, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const/4 v0, -0x1

    const-string v2, "PLAYER_EVENT_UNKNOWN"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v0}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v2, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_SEEK_BEGIN"

    const/4 v4, 0x1

    invoke-direct {v2, v0, v4, v3}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_SEEK_BEGIN:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v3, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_SEEK_COMPLETE"

    const/4 v5, 0x2

    invoke-direct {v3, v0, v5, v4}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_SEEK_COMPLETE:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v4, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_SEEK_ERROR"

    const/4 v6, 0x3

    invoke-direct {v4, v0, v6, v5}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_SEEK_ERROR:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v5, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_AUDIO_TRACK_CHANGED"

    const/4 v6, 0x4

    const/4 v7, 0x5

    invoke-direct {v5, v0, v6, v7}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_AUDIO_TRACK_CHANGED:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v6, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_BUFFER_LOW"

    const/4 v8, 0x6

    invoke-direct {v6, v0, v7, v8}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_BUFFER_LOW:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v7, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_BUFFER_RECOVER"

    const/4 v9, 0x7

    invoke-direct {v7, v0, v8, v9}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_BUFFER_RECOVER:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v8, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_FREEZE_START"

    const/16 v10, 0x8

    invoke-direct {v8, v0, v9, v10}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_FREEZE_START:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v9, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_FREEZE_STOP"

    const/16 v11, 0x9

    invoke-direct {v9, v0, v10, v11}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_FREEZE_STOP:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v10, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_SWITCH_BEGIN"

    const/16 v12, 0xa

    invoke-direct {v10, v0, v11, v12}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_SWITCH_BEGIN:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v11, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_SWITCH_COMPLETE"

    const/16 v13, 0xb

    invoke-direct {v11, v0, v12, v13}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_SWITCH_COMPLETE:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v12, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_SWITCH_ERROR"

    const/16 v14, 0xc

    invoke-direct {v12, v0, v13, v14}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_SWITCH_ERROR:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v13, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_FIRST_DISPLAYED"

    const/16 v15, 0xd

    invoke-direct {v13, v0, v14, v15}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_FIRST_DISPLAYED:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v14, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_REACH_CACHE_FILE_MAX_COUNT"

    move-object/from16 v16, v1

    const/16 v1, 0xe

    invoke-direct {v14, v0, v15, v1}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_REACH_CACHE_FILE_MAX_COUNT:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v15, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v0, "PLAYER_EVENT_REACH_CACHE_FILE_MAX_SIZE"

    move-object/from16 v17, v2

    const/16 v2, 0xf

    invoke-direct {v15, v0, v1, v2}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v15, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_REACH_CACHE_FILE_MAX_SIZE:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v1, "PLAYER_EVENT_TRY_OPEN_START"

    move-object/from16 v18, v3

    const/16 v3, 0x10

    invoke-direct {v0, v1, v2, v3}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_TRY_OPEN_START:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v1, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v2, "PLAYER_EVENT_TRY_OPEN_SUCCEED"

    move-object/from16 v19, v0

    const/16 v0, 0x11

    invoke-direct {v1, v2, v3, v0}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_TRY_OPEN_SUCCEED:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    new-instance v2, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    const-string v3, "PLAYER_EVENT_TRY_OPEN_FAILED"

    move-object/from16 v20, v1

    const/16 v1, 0x12

    invoke-direct {v2, v3, v0, v1}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_TRY_OPEN_FAILED:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    move-object/from16 v1, v16

    move-object/from16 v3, v18

    move-object/from16 v16, v19

    move-object/from16 v18, v2

    move-object/from16 v2, v17

    move-object/from16 v17, v20

    filled-new-array/range {v1 .. v18}, [Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    move-result-object v0

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->value:I

    return-void
.end method

.method public static fromNativeIndex(I)Lio/agora/mediaplayer/Constants$MediaPlayerEvent;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaPlayerEvent"
    .end annotation

    invoke-static {p0}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->getEventByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    move-result-object p0

    return-object p0
.end method

.method public static getEventByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerEvent;
    .locals 5

    invoke-static {}, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->values()[Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget v4, v3, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->value:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->PLAYER_EVENT_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    return-object p0
.end method

.method public static getValue(Lio/agora/mediaplayer/Constants$MediaPlayerEvent;)I
    .locals 0

    iget p0, p0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/mediaplayer/Constants$MediaPlayerEvent;
    .locals 1

    const-class v0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    return-object p0
.end method

.method public static values()[Lio/agora/mediaplayer/Constants$MediaPlayerEvent;
    .locals 1

    sget-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    invoke-virtual {v0}, [Lio/agora/mediaplayer/Constants$MediaPlayerEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/mediaplayer/Constants$MediaPlayerEvent;

    return-object v0
.end method
