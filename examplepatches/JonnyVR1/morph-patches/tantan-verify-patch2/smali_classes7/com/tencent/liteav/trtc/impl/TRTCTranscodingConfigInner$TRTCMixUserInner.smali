.class public Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner$TRTCMixUserInner;
.super Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TRTCMixUserInner"
.end annotation


# instance fields
.field public streamId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner$TRTCMixUserInner;->streamId:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;-><init>(Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;)V

    .line 12
    const-string p1, ""

    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner$TRTCMixUserInner;->streamId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIIII)V
    .locals 0

    .line 9
    invoke-direct/range {p0 .. p6}, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;-><init>(Ljava/lang/String;IIIII)V

    .line 10
    const-string p1, ""

    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner$TRTCMixUserInner;->streamId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", streamId="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner$TRTCMixUserInner;->streamId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
