.class public Lio/agora/base/internal/video/CodecSpecificInfo$CodecSpecificInfoHEVC;
.super Lio/agora/base/internal/video/CodecSpecificInfo;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/CodecSpecificInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CodecSpecificInfoHEVC"
.end annotation


# instance fields
.field private profile:Lio/agora/base/internal/video/VideoCodecProfile;

.field final synthetic this$0:Lio/agora/base/internal/video/CodecSpecificInfo;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/VideoCodecProfile;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/CodecSpecificInfo$CodecSpecificInfoHEVC;->this$0:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lio/agora/base/internal/video/CodecSpecificInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lio/agora/base/internal/video/CodecSpecificInfo$CodecSpecificInfoHEVC;->profile:Lio/agora/base/internal/video/VideoCodecProfile;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getVideoCodecProfile()Lio/agora/base/internal/video/VideoCodecProfile;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/CodecSpecificInfo$CodecSpecificInfoHEVC;->profile:Lio/agora/base/internal/video/VideoCodecProfile;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoCodecType()Lio/agora/base/internal/video/VideoCodecType;
    .locals 0

    .line 1
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->H265:Lio/agora/base/internal/video/VideoCodecType;

    .line 2
    .line 3
    return-object p0
.end method
