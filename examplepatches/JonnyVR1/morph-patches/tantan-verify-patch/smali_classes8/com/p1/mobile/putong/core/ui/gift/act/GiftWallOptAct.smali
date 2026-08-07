.class public Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"

# interfaces
.implements Ll/w1j0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/x1k;",
        "Ll/e2k;",
        ">;",
        "Ll/w1j0;"
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
.method public G()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptAct;->Z1()Ll/x1k;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptAct;->a2()Ll/e2k;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Z1()Ll/x1k;
    .locals 1

    .line 1
    new-instance v0, Ll/x1k;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x1k;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public a2()Ll/e2k;
    .locals 1

    .line 1
    new-instance v0, Ll/e2k;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/e2k;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_presentwall"

    .line 2
    .line 3
    return-object p0
.end method

.method public setTransparentStatusBar()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/16 v0, 0x400

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
