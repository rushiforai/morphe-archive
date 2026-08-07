.class Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/AndroidVideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OutputBufferInfo"
.end annotation


# instance fields
.field final bufferIndex:I

.field final presentationTimestampUs:J


# direct methods
.method public constructor <init>(JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;->presentationTimestampUs:J

    .line 5
    .line 6
    iput p3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;->bufferIndex:I

    .line 7
    .line 8
    return-void
.end method
