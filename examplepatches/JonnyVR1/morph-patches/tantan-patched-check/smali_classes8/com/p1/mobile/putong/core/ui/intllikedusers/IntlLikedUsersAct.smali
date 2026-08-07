.class public Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/zsn;",
        "Ll/ctn;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Ll/nsn;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->a2()Ll/zsn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->b2()Ll/ctn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Z1()Ll/nsn;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->e:Ll/nsn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nsn;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 8
    .line 9
    check-cast v1, Ll/zsn;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/nsn;-><init>(Ll/zsn;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->e:Ll/nsn;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->e:Ll/nsn;

    .line 17
    .line 18
    return-object p0
.end method

.method public a2()Ll/zsn;
    .locals 1

    .line 1
    new-instance v0, Ll/zsn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zsn;-><init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b2()Ll/ctn;
    .locals 1

    .line 1
    new-instance v0, Ll/ctn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ctn;-><init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public isAnonymousMode()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 2
    .line 3
    check-cast v0, Ll/zsn;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ll/an2;->I0(IILandroid/content/Intent;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_like_i_sent"

    .line 2
    .line 3
    return-object p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
