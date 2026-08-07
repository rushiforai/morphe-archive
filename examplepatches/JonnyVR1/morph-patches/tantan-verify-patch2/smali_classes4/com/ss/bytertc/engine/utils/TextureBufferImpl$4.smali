.class Lcom/ss/bytertc/engine/utils/TextureBufferImpl$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->cropAndScaleWithFilter(IIIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/utils/TextureBufferImpl;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$4;->this$0:Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$4;->this$0:Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
