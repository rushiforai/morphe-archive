.class Lcom/idv/identity/platform/api/IdentityPlatform$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/api/IdentityRetCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/api/IdentityPlatform;->verifyStart(Ljava/lang/String;Ljava/util/Map;Lcom/idv/identity/platform/api/IdentityCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/idv/identity/platform/api/IdentityPlatform;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/api/IdentityPlatform;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityPlatform$2;->this$0:Lcom/idv/identity/platform/api/IdentityPlatform;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onIdentityFinish(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onIdentityFinish  errorCode"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/idv/identity/platform/api/IdentityPlatform$2;->this$0:Lcom/idv/identity/platform/api/IdentityPlatform;

    .line 19
    .line 20
    invoke-static {p0, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->access$000(Lcom/idv/identity/platform/api/IdentityPlatform;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
