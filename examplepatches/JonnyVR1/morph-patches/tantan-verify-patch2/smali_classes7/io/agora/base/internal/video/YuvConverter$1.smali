.class Lio/agora/base/internal/video/YuvConverter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/YuvConverter;->convert(Lio/agora/base/VideoFrame$TextureBuffer;Lio/agora/base/VideoFrame$ColorSpace;)Lio/agora/base/VideoFrame$I420Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/YuvConverter;

.field final synthetic val$i420ByteBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/YuvConverter;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/YuvConverter$1;->this$0:Lio/agora/base/internal/video/YuvConverter;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/base/internal/video/YuvConverter$1;->val$i420ByteBuffer:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/YuvConverter$1;->val$i420ByteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-static {p0}, Lio/agora/base/internal/JniCommon;->nativeFreeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
