.class public Lcom/p1/mobile/putong/core/ui/verification/remind/hold/AvatarForceChangeAct;
.super Lcom/p1/mobile/putong/core/PutongCoreMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/PutongCoreMvpAct<",
        "Ll/dm1;",
        "Ll/lm1;",
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

.method public static a2(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/verification/remind/hold/AvatarForceChangeAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "type"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "from"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public bridge synthetic Y1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verification/remind/hold/AvatarForceChangeAct;->b2()Ll/dm1;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verification/remind/hold/AvatarForceChangeAct;->c2()Ll/lm1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b2()Ll/dm1;
    .locals 1

    .line 1
    new-instance v0, Ll/dm1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dm1;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c2()Ll/lm1;
    .locals 1

    .line 1
    new-instance v0, Ll/lm1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lm1;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public initPageHelper()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initPageHelper()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "type"

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v0, v1, :cond_2

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    if-eq v0, v1, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v0, "CTID"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string v0, "Identity"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const-string v0, "avatar"

    .line 33
    .line 34
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 35
    .line 36
    const-string v1, "validation_type"

    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    filled-new-array {v0}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_change_avatar_verification"

    .line 2
    .line 3
    return-object p0
.end method
