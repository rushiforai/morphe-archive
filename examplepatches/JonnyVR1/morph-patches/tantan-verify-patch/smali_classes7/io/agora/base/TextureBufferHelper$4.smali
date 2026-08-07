.class Lio/agora/base/TextureBufferHelper$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/TextureBufferHelper;->returnTextureFrame()V
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

    iput-object p1, p0, Lio/agora/base/TextureBufferHelper$4;->this$0:Lio/agora/base/TextureBufferHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lio/agora/base/TextureBufferHelper$4;->this$0:Lio/agora/base/TextureBufferHelper;

    invoke-static {v0}, Lio/agora/base/TextureBufferHelper;->access$210(Lio/agora/base/TextureBufferHelper;)I

    iget-object v0, p0, Lio/agora/base/TextureBufferHelper$4;->this$0:Lio/agora/base/TextureBufferHelper;

    invoke-static {v0}, Lio/agora/base/TextureBufferHelper;->access$300(Lio/agora/base/TextureBufferHelper;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/agora/base/TextureBufferHelper$4;->this$0:Lio/agora/base/TextureBufferHelper;

    invoke-virtual {v0}, Lio/agora/base/TextureBufferHelper;->isTextureInUse()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lio/agora/base/TextureBufferHelper$4;->this$0:Lio/agora/base/TextureBufferHelper;

    invoke-static {p0}, Lio/agora/base/TextureBufferHelper;->access$400(Lio/agora/base/TextureBufferHelper;)V

    :cond_0
    return-void
.end method
