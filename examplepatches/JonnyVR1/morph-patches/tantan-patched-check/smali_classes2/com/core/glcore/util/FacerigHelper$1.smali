.class Lcom/core/glcore/util/FacerigHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/core/glcore/util/FacerigHelper;->processFacrigFrame(Ll/umw;Ll/lnw;Ll/omw;)Ll/evf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$buff:[B

.field final synthetic val$buff1:[B

.field final synthetic val$buff2:[B


# direct methods
.method public constructor <init>([B[B[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/FacerigHelper$1;->val$buff:[B

    .line 2
    .line 3
    iput-object p2, p0, Lcom/core/glcore/util/FacerigHelper$1;->val$buff1:[B

    .line 4
    .line 5
    iput-object p3, p0, Lcom/core/glcore/util/FacerigHelper$1;->val$buff2:[B

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
    .locals 2

    .line 1
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->access$100()Lcom/momocv/facerigv3/FaceRigV3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/core/glcore/util/FacerigHelper$1;->val$buff:[B

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/momocv/facerigv3/FaceRigV3;->LoadModel([B)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Lcom/core/glcore/util/FacerigHelper;->access$002(Z)Z

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->access$200()Lcom/momocv/videoprocessor/VideoProcessor;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/core/glcore/util/FacerigHelper$1;->val$buff1:[B

    .line 19
    .line 20
    iget-object p0, p0, Lcom/core/glcore/util/FacerigHelper$1;->val$buff2:[B

    .line 21
    .line 22
    invoke-virtual {v0, v1, p0}, Lcom/momocv/videoprocessor/VideoProcessor;->LoadModel([B[B)Z

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    invoke-static {p0}, Lcom/core/glcore/util/FacerigHelper;->access$302(Z)Z

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    invoke-static {p0}, Lcom/core/glcore/util/FacerigHelper;->access$402(Z)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method
