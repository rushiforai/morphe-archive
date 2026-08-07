.class public Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/VideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CodecSpecificInfo"
.end annotation


# instance fields
.field public codec_standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;->codec_standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 5
    .line 6
    return-void
.end method
