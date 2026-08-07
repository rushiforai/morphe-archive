.class Lcom/ss/bytertc/engine/utils/TextureBufferImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/TextureBufferImpl;-><init>(IIIILcom/ss/bytertc/engine/utils/TextureHelper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

.field final synthetic val$id:I

.field final synthetic val$textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;Lcom/ss/bytertc/engine/utils/TextureHelper;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$1;->this$0:Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$1;->val$textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 4
    .line 5
    iput p3, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$1;->val$id:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$1;->val$textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$1;->val$id:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->releaseTextureID(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
