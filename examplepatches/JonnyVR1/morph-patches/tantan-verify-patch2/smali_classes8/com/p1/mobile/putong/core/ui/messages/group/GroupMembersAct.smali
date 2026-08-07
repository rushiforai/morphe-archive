.class public Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;
.super Lcom/p1/mobile/putong/core/PutongCoreMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/PutongCoreMvpAct<",
        "Ll/zgk;",
        "Ll/chk;",
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

.method public static a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "conversation_id"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "group_id"

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;->b2()Ll/zgk;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;->c2()Ll/chk;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b2()Ll/zgk;
    .locals 1

    .line 1
    new-instance v0, Ll/zgk;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zgk;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c2()Ll/chk;
    .locals 1

    .line 1
    new-instance v0, Ll/chk;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/chk;-><init>(Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public checkGradientColors()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initPageHelper()V
    .locals 5

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
    const-string v1, "group_id"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/e;->h7(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 27
    .line 28
    const-string v3, "is_anonymou_group"

    .line 29
    .line 30
    const-string v4, "groupchat_id"

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/PutongCoreMvpAct;->e:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/chk;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/chk;->j(Landroid/view/Menu;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_group_members"

    .line 2
    .line 3
    return-object p0
.end method
