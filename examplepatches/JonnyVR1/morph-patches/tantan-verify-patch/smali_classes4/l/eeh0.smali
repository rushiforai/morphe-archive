.class public Ll/eeh0;
.super Ll/c4k0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c4k0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/data/OMSAction;)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    const-string v1, "NA,NA,noMatchGuidePage"

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 16
    .line 17
    invoke-interface {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/c4k0;->b()V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "svip_dialog"

    .line 2
    .line 3
    return-object p0
.end method
