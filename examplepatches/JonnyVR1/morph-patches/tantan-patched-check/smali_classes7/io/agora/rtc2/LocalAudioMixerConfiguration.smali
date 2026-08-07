.class public Lio/agora/rtc2/LocalAudioMixerConfiguration;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;
    }
.end annotation


# instance fields
.field public audioInputStreams:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;",
            ">;"
        }
    .end annotation
.end field

.field public syncWithLocalMic:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/LocalAudioMixerConfiguration;->audioInputStreams:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/rtc2/LocalAudioMixerConfiguration;->syncWithLocalMic:Z

    return-void
.end method
