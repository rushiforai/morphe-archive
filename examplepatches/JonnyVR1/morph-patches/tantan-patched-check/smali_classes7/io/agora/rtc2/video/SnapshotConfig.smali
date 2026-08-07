.class public Lio/agora/rtc2/video/SnapshotConfig;
.super Ljava/lang/Object;


# instance fields
.field public filePath:Ljava/lang/String;

.field public position:Lio/agora/rtc2/Constants$VideoModulePosition;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/video/SnapshotConfig;->filePath:Ljava/lang/String;

    sget-object v0, Lio/agora/rtc2/Constants$VideoModulePosition;->VIDEO_MODULE_POSITION_PRE_ENCODER:Lio/agora/rtc2/Constants$VideoModulePosition;

    iput-object v0, p0, Lio/agora/rtc2/video/SnapshotConfig;->position:Lio/agora/rtc2/Constants$VideoModulePosition;

    return-void
.end method
