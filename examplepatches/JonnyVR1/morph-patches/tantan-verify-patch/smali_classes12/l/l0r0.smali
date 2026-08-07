.class public final Ll/l0r0;
.super Ll/o4r0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lcom/idv/identity/service/IdentityFaceService;


# direct methods
.method public constructor <init>(Lcom/idv/identity/service/IdentityFaceService;Lcom/idv/identity/base/algorithm/IDFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l0r0;->b:Lcom/idv/identity/service/IdentityFaceService;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/o4r0;-><init>(Lcom/idv/identity/base/algorithm/IDFrame;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l0r0;->b:Lcom/idv/identity/service/IdentityFaceService;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/service/IdentityFaceService;->preProcess()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/o4r0;->a:Lcom/idv/identity/base/algorithm/IDFrame;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/idv/identity/service/algorithm/IdentityFace;->processImage(Lcom/idv/identity/base/algorithm/IDFrame;)I

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/l0r0;->b:Lcom/idv/identity/service/IdentityFaceService;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/idv/identity/service/IdentityFaceService;->access$100(Lcom/idv/identity/service/IdentityFaceService;)Ll/gfm;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/l0r0;->b:Lcom/idv/identity/service/IdentityFaceService;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/idv/identity/service/IdentityFaceService;->access$100(Lcom/idv/identity/service/IdentityFaceService;)Ll/gfm;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/o4r0;->a:Lcom/idv/identity/base/algorithm/IDFrame;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ll/gfm;->j(Lcom/idv/identity/base/algorithm/IDFrame;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/l0r0;->b:Lcom/idv/identity/service/IdentityFaceService;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/idv/identity/service/IdentityFaceService;->access$200(Lcom/idv/identity/service/IdentityFaceService;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
