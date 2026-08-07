.class Lio/agora/base/TextureBufferHelper$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/TextureBufferHelper;->wrapTextureBuffer(IILio/agora/base/VideoFrame$TextureBuffer$Type;IJLandroid/graphics/Matrix;)Lio/agora/base/VideoFrame$TextureBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/TextureBufferHelper;


# direct methods
.method public constructor <init>(Lio/agora/base/TextureBufferHelper;)V
    .locals 0

    iput-object p1, p0, Lio/agora/base/TextureBufferHelper$3;->this$0:Lio/agora/base/TextureBufferHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    iget-object p0, p0, Lio/agora/base/TextureBufferHelper$3;->this$0:Lio/agora/base/TextureBufferHelper;

    invoke-static {p0}, Lio/agora/base/TextureBufferHelper;->access$100(Lio/agora/base/TextureBufferHelper;)V

    return-void
.end method
