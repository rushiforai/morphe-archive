.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveLovePlanetUpdateOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "VoiceLiveLovePlanetUpdateOrBuilder"
.end annotation


# virtual methods
.method public abstract getCurrentTime()J
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getHost()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;
.end method

.method public abstract getLovePlanetId()Ljava/lang/String;
.end method

.method public abstract getLovePlanetIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getMvp()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;
.end method

.method public abstract getPlayers(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;
.end method

.method public abstract getPlayersCount()I
.end method

.method public abstract getPlayersList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTeams(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetTeam;
.end method

.method public abstract getTeamsCount()I
.end method

.method public abstract getTeamsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetTeam;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUpdateType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveLovePlanetUpdate$Type;
.end method

.method public abstract getUpdateTypeValue()I
.end method

.method public abstract hasHost()Z
.end method

.method public abstract hasMvp()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
