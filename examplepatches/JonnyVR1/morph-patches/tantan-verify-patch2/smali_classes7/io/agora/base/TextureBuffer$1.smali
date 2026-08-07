.class Lio/agora/base/TextureBuffer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/TextureBuffer;->applyNewI420Handler(Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;)Lio/agora/base/VideoFrame$Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/TextureBuffer;


# direct methods
.method public constructor <init>(Lio/agora/base/TextureBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/TextureBuffer$1;->this$0:Lio/agora/base/TextureBuffer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/TextureBuffer$1;->this$0:Lio/agora/base/TextureBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
