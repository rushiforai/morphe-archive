.class public final enum Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/mediaplayer/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MediaPlayerPreloadEvent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

.field public static final enum PLAYER_PRELOAD_EVENT_BEGIN:Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

.field public static final enum PLAYER_PRELOAD_EVENT_COMPLETE:Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

.field public static final enum PLAYER_PRELOAD_EVENT_ERROR:Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    const-string v1, "PLAYER_PRELOAD_EVENT_BEGIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->PLAYER_PRELOAD_EVENT_BEGIN:Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    new-instance v1, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    const-string v2, "PLAYER_PRELOAD_EVENT_COMPLETE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->PLAYER_PRELOAD_EVENT_COMPLETE:Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    new-instance v2, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    const-string v3, "PLAYER_PRELOAD_EVENT_ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->PLAYER_PRELOAD_EVENT_ERROR:Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    filled-new-array {v0, v1, v2}, [Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    move-result-object v0

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

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

    iput p3, p0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->value:I

    return-void
.end method

.method public static fromNativeIndex(I)Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaPlayerPreloadEvent"
    .end annotation

    invoke-static {p0}, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->getTypeByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    move-result-object p0

    return-object p0
.end method

.method public static getTypeByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;
    .locals 5

    invoke-static {}, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->values()[Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget v4, v3, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->value:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->PLAYER_PRELOAD_EVENT_ERROR:Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    return-object p0
.end method

.method public static getValue(Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;)I
    .locals 0

    iget p0, p0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;
    .locals 1

    const-class v0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    return-object p0
.end method

.method public static values()[Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;
    .locals 1

    sget-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    invoke-virtual {v0}, [Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;

    return-object v0
.end method
