.class Lio/agora/rtc2/internal/TextureConverter$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/internal/TextureConverter;->releaseEglEnv()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/TextureConverter;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/TextureConverter;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/TextureConverter$2;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$2;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$200(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$2;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$200(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->release()V

    :cond_0
    iget-object p0, p0, Lio/agora/rtc2/internal/TextureConverter$2;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/agora/rtc2/internal/TextureConverter;->access$202(Lio/agora/rtc2/internal/TextureConverter;Lio/agora/base/internal/video/GlTextureFrameBuffer;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    return-object v0
.end method
