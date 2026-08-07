.class public final enum Lio/agora/mediaplayer/Constants$MediaPlayerState;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/mediaplayer/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MediaPlayerState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/mediaplayer/Constants$MediaPlayerState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_DO_NOTHING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_FAILED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_GETTING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_IDLE:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_NONE_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_OPENING:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_OPEN_COMPLETED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_PAUSED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_PAUSING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_PLAYBACK_ALL_LOOPS_COMPLETED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_PLAYBACK_COMPLETED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_PLAYING:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_SEEKING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_SET_TRACK_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_STOPPED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_STOPPING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

.field public static final enum PLAYER_STATE_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerState;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 20

    new-instance v1, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/4 v0, -0x1

    const-string v2, "PLAYER_STATE_UNKNOWN"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v0}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v2, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const-string v0, "PLAYER_STATE_IDLE"

    const/4 v4, 0x1

    invoke-direct {v2, v0, v4, v3}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_IDLE:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v3, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const-string v0, "PLAYER_STATE_OPENING"

    const/4 v5, 0x2

    invoke-direct {v3, v0, v5, v4}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_OPENING:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v4, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const-string v0, "PLAYER_STATE_OPEN_COMPLETED"

    const/4 v6, 0x3

    invoke-direct {v4, v0, v6, v5}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_OPEN_COMPLETED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v5, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const-string v0, "PLAYER_STATE_PLAYING"

    const/4 v7, 0x4

    invoke-direct {v5, v0, v7, v6}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_PLAYING:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v6, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const-string v0, "PLAYER_STATE_PAUSED"

    const/4 v8, 0x5

    invoke-direct {v6, v0, v8, v7}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_PAUSED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v7, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const-string v0, "PLAYER_STATE_PLAYBACK_COMPLETED"

    const/4 v9, 0x6

    invoke-direct {v7, v0, v9, v8}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_PLAYBACK_COMPLETED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v8, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const-string v0, "PLAYER_STATE_PLAYBACK_ALL_LOOPS_COMPLETED"

    const/4 v10, 0x7

    invoke-direct {v8, v0, v10, v9}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_PLAYBACK_ALL_LOOPS_COMPLETED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v9, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const-string v0, "PLAYER_STATE_STOPPED"

    const/16 v11, 0x8

    invoke-direct {v9, v0, v11, v10}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_STOPPED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v10, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/16 v0, 0x9

    const/16 v11, 0x32

    const-string v12, "PLAYER_STATE_PAUSING_INTERNAL"

    invoke-direct {v10, v12, v0, v11}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_PAUSING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v11, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/16 v0, 0xa

    const/16 v12, 0x33

    const-string v13, "PLAYER_STATE_STOPPING_INTERNAL"

    invoke-direct {v11, v13, v0, v12}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_STOPPING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v12, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/16 v0, 0xb

    const/16 v13, 0x34

    const-string v14, "PLAYER_STATE_SEEKING_INTERNAL"

    invoke-direct {v12, v14, v0, v13}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_SEEKING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v13, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/16 v0, 0xc

    const/16 v14, 0x35

    const-string v15, "PLAYER_STATE_GETTING_INTERNAL"

    invoke-direct {v13, v15, v0, v14}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_GETTING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v14, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/16 v0, 0xd

    const/16 v15, 0x36

    move-object/from16 v16, v1

    const-string v1, "PLAYER_STATE_NONE_INTERNAL"

    invoke-direct {v14, v1, v0, v15}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_NONE_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v15, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/16 v0, 0xe

    const/16 v1, 0x37

    move-object/from16 v17, v2

    const-string v2, "PLAYER_STATE_DO_NOTHING_INTERNAL"

    invoke-direct {v15, v2, v0, v1}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v15, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_DO_NOTHING_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v0, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/16 v1, 0xf

    const/16 v2, 0x38

    move-object/from16 v18, v3

    const-string v3, "PLAYER_STATE_SET_TRACK_INTERNAL"

    invoke-direct {v0, v3, v1, v2}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_SET_TRACK_INTERNAL:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    new-instance v1, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    const/16 v2, 0x10

    const/16 v3, 0x64

    move-object/from16 v19, v0

    const-string v0, "PLAYER_STATE_FAILED"

    invoke-direct {v1, v0, v2, v3}, Lio/agora/mediaplayer/Constants$MediaPlayerState;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_FAILED:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move-object/from16 v17, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v19

    filled-new-array/range {v1 .. v17}, [Lio/agora/mediaplayer/Constants$MediaPlayerState;

    move-result-object v0

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerState;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerState;

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

    iput p3, p0, Lio/agora/mediaplayer/Constants$MediaPlayerState;->value:I

    return-void
.end method

.method public static fromNativeIndex(I)Lio/agora/mediaplayer/Constants$MediaPlayerState;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaPlayerState"
    .end annotation

    invoke-static {p0}, Lio/agora/mediaplayer/Constants$MediaPlayerState;->getStateByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerState;

    move-result-object p0

    return-object p0
.end method

.method public static getStateByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerState;
    .locals 5

    invoke-static {}, Lio/agora/mediaplayer/Constants$MediaPlayerState;->values()[Lio/agora/mediaplayer/Constants$MediaPlayerState;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget v4, v3, Lio/agora/mediaplayer/Constants$MediaPlayerState;->value:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lio/agora/mediaplayer/Constants$MediaPlayerState;->PLAYER_STATE_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerState;

    return-object p0
.end method

.method public static getValue(Lio/agora/mediaplayer/Constants$MediaPlayerState;)I
    .locals 0

    iget p0, p0, Lio/agora/mediaplayer/Constants$MediaPlayerState;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/mediaplayer/Constants$MediaPlayerState;
    .locals 1

    const-class v0, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/mediaplayer/Constants$MediaPlayerState;

    return-object p0
.end method

.method public static values()[Lio/agora/mediaplayer/Constants$MediaPlayerState;
    .locals 1

    sget-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerState;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerState;

    invoke-virtual {v0}, [Lio/agora/mediaplayer/Constants$MediaPlayerState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/mediaplayer/Constants$MediaPlayerState;

    return-object v0
.end method
