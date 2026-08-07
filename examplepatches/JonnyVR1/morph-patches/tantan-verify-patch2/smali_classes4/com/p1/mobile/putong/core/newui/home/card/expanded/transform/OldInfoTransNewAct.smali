.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransNewAct;
.super Lcom/p1/mobile/putong/core/PutongCoreMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/PutongCoreMvpAct<",
        "Ll/hh50;",
        "Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/PutongCoreMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransNewAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransNewAct;->e2(Landroid/os/Bundle;)V

    return-void
.end method

.method private c2()V
    .locals 2

    .line 1
    const/16 v0, 0x400

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/high16 v1, -0x80000000

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/high16 v1, 0x4000000

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic e2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransNewAct;->c2()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic Y1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransNewAct;->b2()Ll/hh50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Z1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransNewAct;->d2()Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b2()Ll/hh50;
    .locals 1

    .line 1
    new-instance v0, Ll/hh50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hh50;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d2()Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/PutongCoreMvpAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/zg50;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/zg50;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransNewAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/PutongCoreMvpAct;->e:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->B()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_confirm_new_profile"

    .line 2
    .line 3
    return-object p0
.end method
