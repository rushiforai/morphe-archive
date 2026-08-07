.class public Lcom/tencent/liteav/network/TXCStreamUploader$UploadStats;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/network/TXCStreamUploader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UploadStats"
.end annotation


# instance fields
.field public audioCacheLen:J

.field public audioDropCount:J

.field public bandwidthEst:J

.field public channelType:J

.field public connTS:J

.field public connectTimeCost:J

.field public connectionID:Ljava/lang/String;

.field public connectionStats:Ljava/lang/String;

.field public dnsTS:J

.field public dnsparseTimeCost:J

.field public handshakeTimeCost:J

.field public inAudioBytes:J

.field public inVideoBytes:J

.field public outAudioBytes:J

.field public outVideoBytes:J

.field public serverIP:Ljava/lang/String;

.field public startTS:J

.field final synthetic this$0:Lcom/tencent/liteav/network/TXCStreamUploader;

.field public videoCacheLen:J

.field public videoDropCount:J


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXCStreamUploader;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXCStreamUploader$UploadStats;->this$0:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
