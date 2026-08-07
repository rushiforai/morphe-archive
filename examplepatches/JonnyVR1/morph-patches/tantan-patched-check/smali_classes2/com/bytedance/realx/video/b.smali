.class public final synthetic Lcom/bytedance/realx/video/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper$ReleaseOutPutBuffer;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/AndroidVideoDecoder;

.field public final synthetic b:I

.field public final synthetic c:Landroid/media/MediaCodec$BufferInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bytedance/realx/video/b;->a:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    iput p2, p0, Lcom/bytedance/realx/video/b;->b:I

    iput-object p3, p0, Lcom/bytedance/realx/video/b;->c:Landroid/media/MediaCodec$BufferInfo;

    return-void
.end method


# virtual methods
.method public final release(Z)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/b;->a:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    iget v1, p0, Lcom/bytedance/realx/video/b;->b:I

    iget-object p0, p0, Lcom/bytedance/realx/video/b;->c:Landroid/media/MediaCodec$BufferInfo;

    invoke-static {v0, v1, p0, p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->a(Lcom/bytedance/realx/video/AndroidVideoDecoder;ILandroid/media/MediaCodec$BufferInfo;Z)I

    move-result p0

    return p0
.end method
