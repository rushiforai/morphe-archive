.class public final enum Lio/agora/mediaplayer/Constants$MediaStreamType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/mediaplayer/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MediaStreamType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/mediaplayer/Constants$MediaStreamType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/mediaplayer/Constants$MediaStreamType;

.field public static final enum STREAM_TYPE_AUDIO:Lio/agora/mediaplayer/Constants$MediaStreamType;

.field public static final enum STREAM_TYPE_SUBTITLE:Lio/agora/mediaplayer/Constants$MediaStreamType;

.field public static final enum STREAM_TYPE_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaStreamType;

.field public static final enum STREAM_TYPE_VIDEO:Lio/agora/mediaplayer/Constants$MediaStreamType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lio/agora/mediaplayer/Constants$MediaStreamType;

    const-string v1, "STREAM_TYPE_UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/mediaplayer/Constants$MediaStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaStreamType;->STREAM_TYPE_UNKNOWN:Lio/agora/mediaplayer/Constants$MediaStreamType;

    new-instance v1, Lio/agora/mediaplayer/Constants$MediaStreamType;

    const-string v2, "STREAM_TYPE_VIDEO"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/mediaplayer/Constants$MediaStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/mediaplayer/Constants$MediaStreamType;->STREAM_TYPE_VIDEO:Lio/agora/mediaplayer/Constants$MediaStreamType;

    new-instance v2, Lio/agora/mediaplayer/Constants$MediaStreamType;

    const-string v3, "STREAM_TYPE_AUDIO"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/mediaplayer/Constants$MediaStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/mediaplayer/Constants$MediaStreamType;->STREAM_TYPE_AUDIO:Lio/agora/mediaplayer/Constants$MediaStreamType;

    new-instance v3, Lio/agora/mediaplayer/Constants$MediaStreamType;

    const-string v4, "STREAM_TYPE_SUBTITLE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lio/agora/mediaplayer/Constants$MediaStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/mediaplayer/Constants$MediaStreamType;->STREAM_TYPE_SUBTITLE:Lio/agora/mediaplayer/Constants$MediaStreamType;

    filled-new-array {v0, v1, v2, v3}, [Lio/agora/mediaplayer/Constants$MediaStreamType;

    move-result-object v0

    sput-object v0, Lio/agora/mediaplayer/Constants$MediaStreamType;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaStreamType;

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

    iput p3, p0, Lio/agora/mediaplayer/Constants$MediaStreamType;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/mediaplayer/Constants$MediaStreamType;)I
    .locals 0

    iget p0, p0, Lio/agora/mediaplayer/Constants$MediaStreamType;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/mediaplayer/Constants$MediaStreamType;
    .locals 1

    const-class v0, Lio/agora/mediaplayer/Constants$MediaStreamType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/mediaplayer/Constants$MediaStreamType;

    return-object p0
.end method

.method public static values()[Lio/agora/mediaplayer/Constants$MediaStreamType;
    .locals 1

    sget-object v0, Lio/agora/mediaplayer/Constants$MediaStreamType;->$VALUES:[Lio/agora/mediaplayer/Constants$MediaStreamType;

    invoke-virtual {v0}, [Lio/agora/mediaplayer/Constants$MediaStreamType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/mediaplayer/Constants$MediaStreamType;

    return-object v0
.end method
