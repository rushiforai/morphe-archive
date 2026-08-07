.class Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->processFacrigFrame(Ll/umw;Ll/lnw;Ll/omw;)Ll/evf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$buff:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper$1;->val$buff:[B

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
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->access$100()Lcom/momocv/facerigv3/FaceRigV3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper$1;->val$buff:[B

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/momocv/facerigv3/FaceRigV3;->LoadModel([B)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->access$002(Z)Z

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-static {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->access$202(Z)Z

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    invoke-static {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->access$302(Z)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method
