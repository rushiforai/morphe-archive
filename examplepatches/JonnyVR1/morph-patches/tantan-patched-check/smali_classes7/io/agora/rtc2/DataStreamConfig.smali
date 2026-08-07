.class public Lio/agora/rtc2/DataStreamConfig;
.super Ljava/lang/Object;


# instance fields
.field public ordered:Z

.field public syncWithAudio:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/rtc2/DataStreamConfig;->syncWithAudio:Z

    iput-boolean v0, p0, Lio/agora/rtc2/DataStreamConfig;->ordered:Z

    return-void
.end method
