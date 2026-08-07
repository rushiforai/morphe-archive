.class Lcom/ss/bytertc/engine/utils/TextureBufferImpl$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

.field final synthetic val$targetTextureId:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$2;->val$targetTextureId:I

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$2;->this$0:Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->access$000(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;)Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$2;->val$targetTextureId:I

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->queueTexture(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
