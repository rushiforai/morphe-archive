.class public final Ll/txq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/idv/identity/base/algorithm/IdentityAlgConfig;

.field public final synthetic b:Lcom/idv/identity/base/algorithm/IIdentityDelegate;

.field public final synthetic c:Lcom/idv/identity/service/IdentityFaceService;


# direct methods
.method public constructor <init>(Lcom/idv/identity/service/IdentityFaceService;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Lcom/idv/identity/base/algorithm/IIdentityDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/txq0;->c:Lcom/idv/identity/service/IdentityFaceService;

    .line 2
    .line 3
    iput-object p2, p0, Ll/txq0;->a:Lcom/idv/identity/base/algorithm/IdentityAlgConfig;

    .line 4
    .line 5
    iput-object p3, p0, Ll/txq0;->b:Lcom/idv/identity/base/algorithm/IIdentityDelegate;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/txq0;->c:Lcom/idv/identity/service/IdentityFaceService;

    .line 2
    .line 3
    iget-object v1, p0, Ll/txq0;->a:Lcom/idv/identity/base/algorithm/IdentityAlgConfig;

    .line 4
    .line 5
    iget-object p0, p0, Ll/txq0;->b:Lcom/idv/identity/base/algorithm/IIdentityDelegate;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/idv/identity/service/IdentityFaceService;->access$000(Lcom/idv/identity/service/IdentityFaceService;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Lcom/idv/identity/base/algorithm/IIdentityDelegate;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
