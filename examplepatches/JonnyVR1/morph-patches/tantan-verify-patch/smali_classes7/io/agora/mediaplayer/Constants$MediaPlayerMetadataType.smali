.class public final enum Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/mediaplayer/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MediaPlayerMetadataType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

.field public static final enum PLAYER_METADATA_TYPE_SEI:Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

.field public static final enum PLAYER_METADATA_TYPE_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    const-string v1, "PLAYER_METADATA_TYPE_UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->PLAYER_METADATA_TYPE_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    new-instance v1, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    const-string v2, "PLAYER_METADATA_TYPE_SEI"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->PLAYER_METADATA_TYPE_SEI:Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    filled-new-array {v0, v1}, [Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    move-result-object v0

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

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

    iput p3, p0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->value:I

    return-void
.end method

.method public static fromNativeIndex(I)Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaPlayerMetadataType"
    .end annotation

    invoke-static {p0}, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->getTypeByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    move-result-object p0

    return-object p0
.end method

.method public static getTypeByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;
    .locals 5

    invoke-static {}, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->values()[Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget v4, v3, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->value:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->PLAYER_METADATA_TYPE_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    return-object p0
.end method

.method public static getValue(Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;)I
    .locals 0

    iget p0, p0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;
    .locals 1

    const-class v0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    return-object p0
.end method

.method public static values()[Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;
    .locals 1

    sget-object v0, Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    invoke-virtual {v0}, [Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;

    return-object v0
.end method
