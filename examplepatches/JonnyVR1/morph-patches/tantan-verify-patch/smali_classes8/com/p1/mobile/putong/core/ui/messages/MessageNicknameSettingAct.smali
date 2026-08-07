.class public Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;
.super Lcom/p1/mobile/putong/core/PutongCoreMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/PutongCoreMvpAct<",
        "Ll/u200;",
        "Ll/w200;",
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

.method public static a2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "USER_ID"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public bridge synthetic Y1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;->b2()Ll/u200;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;->c2()Ll/w200;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b2()Ll/u200;
    .locals 1

    .line 1
    new-instance v0, Ll/u200;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/u200;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c2()Ll/w200;
    .locals 1

    .line 1
    new-instance v0, Ll/w200;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/w200;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public checkGradientColors()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Ll/g9c0;->q:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    sget v0, Ll/g9c0;->q:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public initPageHelper()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initPageHelper()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 5
    .line 6
    const-string v0, "tooltips_trigger_mode"

    .line 7
    .line 8
    const-string v1, "active"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    filled-new-array {v0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/PutongCoreMvpAct;->e:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/w200;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/w200;->c(Landroid/view/Menu;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_set_nickname"

    .line 2
    .line 3
    return-object p0
.end method

.method public setTheme()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTheme()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
