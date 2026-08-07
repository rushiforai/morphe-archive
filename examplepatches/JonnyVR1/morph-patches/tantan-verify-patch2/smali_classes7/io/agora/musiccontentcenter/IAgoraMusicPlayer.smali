.class public interface abstract Lio/agora/musiccontentcenter/IAgoraMusicPlayer;
.super Ljava/lang/Object;

# interfaces
.implements Lio/agora/mediaplayer/IMediaPlayer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/musiccontentcenter/IAgoraMusicPlayer$MusicPlayMode;
    }
.end annotation


# virtual methods
.method public abstract destroy()I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getPlaySrc()Ljava/lang/String;
.end method

.method public abstract open(JJ)I
.end method

.method public abstract open(Ljava/lang/String;J)I
.end method

.method public abstract setPlayMode(Lio/agora/musiccontentcenter/IAgoraMusicPlayer$MusicPlayMode;)I
.end method

.method public abstract stop()I
.end method
