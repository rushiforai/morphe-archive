.class public final enum Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoSubscriptionOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "REMOTE_VIDEO_STREAM_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

.field public static final enum REMOTE_VIDEO_STREAM_HIGH:Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

.field public static final enum REMOTE_VIDEO_STREAM_LOW:Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    const-string v1, "REMOTE_VIDEO_STREAM_HIGH"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;->REMOTE_VIDEO_STREAM_HIGH:Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    new-instance v1, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    const-string v2, "REMOTE_VIDEO_STREAM_LOW"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;->REMOTE_VIDEO_STREAM_LOW:Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    filled-new-array {v0, v1}, [Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;->$VALUES:[Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;
    .locals 1

    const-class v0, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;
    .locals 1

    sget-object v0, Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;->$VALUES:[Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    invoke-virtual {v0}, [Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    return-object v0
.end method
