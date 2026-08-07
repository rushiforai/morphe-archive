.class public Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;
.super Lcom/p1/mobile/putong/core/PutongCoreMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/PutongCoreMvpAct<",
        "Ll/yik;",
        "Ll/zik;",
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


# virtual methods
.method public bridge synthetic Y1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;->a2()Ll/yik;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;->b2()Ll/zik;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public a2()Ll/yik;
    .locals 1

    .line 1
    new-instance v0, Ll/yik;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yik;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b2()Ll/zik;
    .locals 1

    .line 1
    new-instance v0, Ll/zik;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zik;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_group_notice"

    .line 2
    .line 3
    return-object p0
.end method
