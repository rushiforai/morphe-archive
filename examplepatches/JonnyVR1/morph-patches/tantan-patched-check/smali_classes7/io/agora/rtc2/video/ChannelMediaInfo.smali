.class public Lio/agora/rtc2/video/ChannelMediaInfo;
.super Ljava/lang/Object;


# instance fields
.field public channelName:Ljava/lang/String;

.field public token:Ljava/lang/String;

.field public uid:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/video/ChannelMediaInfo;->channelName:Ljava/lang/String;

    iput-object p2, p0, Lio/agora/rtc2/video/ChannelMediaInfo;->token:Ljava/lang/String;

    iput p3, p0, Lio/agora/rtc2/video/ChannelMediaInfo;->uid:I

    return-void
.end method


# virtual methods
.method public getChannelName()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/video/ChannelMediaInfo;->channelName:Ljava/lang/String;

    return-object p0
.end method

.method public getToken()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/video/ChannelMediaInfo;->token:Ljava/lang/String;

    return-object p0
.end method

.method public getUid()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/ChannelMediaInfo;->uid:I

    return p0
.end method
