.class public Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;
.super Ljava/lang/Object;


# instance fields
.field private destInfos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/agora/rtc2/video/ChannelMediaInfo;",
            ">;"
        }
    .end annotation
.end field

.field private srcInfo:Lio/agora/rtc2/video/ChannelMediaInfo;


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->srcInfo:Lio/agora/rtc2/video/ChannelMediaInfo;

    iput-object v0, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->destInfos:Ljava/util/Map;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->destInfos:Ljava/util/Map;

    new-instance v1, Lio/agora/rtc2/video/ChannelMediaInfo;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v0, v2}, Lio/agora/rtc2/video/ChannelMediaInfo;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    iput-object v1, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->srcInfo:Lio/agora/rtc2/video/ChannelMediaInfo;

    return-void
.end method


# virtual methods
.method public getDestChannelMediaInfos()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/agora/rtc2/video/ChannelMediaInfo;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->destInfos:Ljava/util/Map;

    return-object p0
.end method

.method public getSrcChannelMediaInfo()Lio/agora/rtc2/video/ChannelMediaInfo;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->srcInfo:Lio/agora/rtc2/video/ChannelMediaInfo;

    return-object p0
.end method

.method public removeDestChannelInfo(Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->destInfos:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setDestChannelInfo(Ljava/lang/String;Lio/agora/rtc2/video/ChannelMediaInfo;)V
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->destInfos:Ljava/util/Map;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setSrcChannelInfo(Lio/agora/rtc2/video/ChannelMediaInfo;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->srcInfo:Lio/agora/rtc2/video/ChannelMediaInfo;

    return-void
.end method
