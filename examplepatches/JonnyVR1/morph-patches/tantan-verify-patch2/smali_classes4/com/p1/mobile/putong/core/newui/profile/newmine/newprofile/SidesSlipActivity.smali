.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/eaf0;",
        "Ll/kaf0;",
        ">;"
    }
.end annotation


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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->Z1()Ll/eaf0;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->a2()Ll/kaf0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Z1()Ll/eaf0;
    .locals 1

    .line 1
    new-instance v0, Ll/eaf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/eaf0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public a2()Ll/kaf0;
    .locals 1

    .line 1
    new-instance v0, Ll/kaf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kaf0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/x7c0;->g:I

    .line 5
    .line 6
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kaf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kaf0;->l()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_navigation_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
