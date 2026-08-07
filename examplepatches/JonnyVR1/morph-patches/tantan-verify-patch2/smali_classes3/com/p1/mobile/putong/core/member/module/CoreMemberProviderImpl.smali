.class public Lcom/p1/mobile/putong/core/member/module/CoreMemberProviderImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreMemberProviderModule"
    path = "/core_member/service"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public Eh()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rs9;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public h9(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/qap$a;->n(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public wf()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/qap;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
