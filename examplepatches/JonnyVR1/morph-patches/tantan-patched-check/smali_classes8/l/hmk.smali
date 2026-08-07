.class public Ll/hmk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bnk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/core/data/Conversation;

.field public d:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public e:I


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic R0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bnk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bnk;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic S0(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    iget-object v0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/e;->h7(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Ll/hmk;->e:I

    .line 18
    .line 19
    iget p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 20
    .line 21
    if-eq v0, p1, :cond_0

    .line 22
    .line 23
    iput p1, p0, Ll/hmk;->e:I

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic e0(Ll/hmk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->P0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/hmk;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/hmk;->Q0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Ll/hmk;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->c1(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/hmk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hmk;->R0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Ll/hmk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->X0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/hmk;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hmk;->Y0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m0(Ll/hmk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->a1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Ll/hmk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hmk;->S0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic p0(Ll/hmk;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->W0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic q0(Ll/hmk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->O0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic r0(Ll/hmk;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->V0(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic s0(Ljava/util/List;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic t0(Ll/hmk;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->U0(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method

.method public static synthetic u0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x0(Ll/hmk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmk;->b1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y0(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ll/plk;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ll/plk;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method


# virtual methods
.method public A0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "groupchat_id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "e_alter_group_state"

    .line 18
    .line 19
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 33
    .line 34
    invoke-static {p0}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-static {v1, v2, p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupDescriptionEditAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public C0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "groupchat_id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "e_alter_group_name"

    .line 18
    .line 19
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 33
    .line 34
    invoke-static {p0}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-static {v1, v2, p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupNameEditAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public D0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v1, v1, [Ll/sfj0$a;

    .line 7
    .line 8
    const-string v2, "e_my_alias_in_group"

    .line 9
    .line 10
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object p0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupNicknameSetAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public E0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 13
    .line 14
    iget-object v1, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v2, p0, Ll/hmk;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/e;->w6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/vlk;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/vlk;-><init>(Ll/hmk;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/wlk;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/wlk;-><init>(Ll/hmk;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public F0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v2, v1, [Ll/sfj0$a;

    .line 7
    .line 8
    const-string v3, "e_group_chat_information_entrance"

    .line 9
    .line 10
    invoke-static {v3, v0, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 24
    .line 25
    invoke-static {v2, v3, p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;->a2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public G0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "groupchat_id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "e_group_members"

    .line 18
    .line 19
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Ll/hmk;->b:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public H0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public I0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "groupchat_id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "e_group_chat_settings_manage"

    .line 18
    .line 19
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object p0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSettingManagerAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final J0(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qlk;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/qlk;-><init>(Ll/hmk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2, v0}, Ll/jek;->v(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/util/List;Ll/jek$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public L0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public N0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic O0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic P0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-interface {v0, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, p4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/bnk;

    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Ll/bnk;->G0(Ljava/util/List;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic U0(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bnk;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/bnk;->I0(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic V0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hmk;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/bnk;

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/bnk;->H0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic W0(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 4
    .line 5
    iput-object v0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v1, Ll/bnk;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ll/bnk;->E0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 15
    .line 16
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {p0, v0, p1}, Ll/hmk;->J0(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    iget p1, p0, Ll/hmk;->e:I

    .line 24
    .line 25
    if-lez p1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 28
    .line 29
    iget v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 30
    .line 31
    if-eq p1, v0, :cond_0

    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 36
    .line 37
    iget-object v0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/e;->Q8(Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p1, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 43
    .line 44
    iget p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 45
    .line 46
    iput p1, p0, Ll/hmk;->e:I

    .line 47
    .line 48
    return-void
.end method

.method public final synthetic X0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/hmk;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Ll/bnk;

    .line 12
    .line 13
    iget-object p0, p0, Ll/hmk;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ll/bnk;->H0(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic Y0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p1, "other_user_id_list"

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "e_group_chat_invite_send"

    .line 12
    .line 13
    const-string v1, "p_group_chat_invite"

    .line 14
    .line 15
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 16
    .line 17
    .line 18
    const-string p1, ","

    .line 19
    .line 20
    invoke-virtual {p2, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 27
    .line 28
    iget-object v0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/api/e;->O6(Ljava/lang/String;Ljava/util/List;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance p1, Ll/xlk;

    .line 48
    .line 49
    invoke-direct {p1}, Ll/xlk;-><init>()V

    .line 50
    .line 51
    .line 52
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 53
    .line 54
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/oik;

    .line 62
    .line 63
    invoke-direct {v0, p2}, Ll/oik;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "group_id"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "conversation_id"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/hmk;->b:Ljava/lang/String;

    .line 27
    .line 28
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bmk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/bmk;-><init>(Ll/hmk;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 15
    .line 16
    iget-object v1, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->X8(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->V6()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/cmk;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/cmk;-><init>(Ll/hmk;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 48
    .line 49
    iget-object v1, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/hh7;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/hh7;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/dmk;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/dmk;-><init>(Ll/hmk;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 91
    .line 92
    iget-object v1, p0, Ll/hmk;->b:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/sb8;

    .line 103
    .line 104
    invoke-direct {v1}, Ll/sb8;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/emk;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/emk;-><init>(Ll/hmk;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 126
    .line 127
    iget-object v1, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->W6(Ljava/lang/String;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 134
    .line 135
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 136
    .line 137
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    new-instance v2, Ll/fmk;

    .line 144
    .line 145
    invoke-direct {v2}, Ll/fmk;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/gmk;

    .line 157
    .line 158
    invoke-direct {v1, p0}, Ll/gmk;-><init>(Ll/hmk;)V

    .line 159
    .line 160
    .line 161
    new-instance p0, Ll/olk;

    .line 162
    .line 163
    invoke-direct {p0}, Ll/olk;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public final synthetic a1(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic b1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c1(Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    iget-object p0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->K8(Ljava/lang/String;Ljava/util/List;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public d1(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "groupchat_id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "is_open"

    .line 14
    .line 15
    invoke-static {v2, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    filled-new-array {v1, v2}, [Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "e_group_chat_mute_notification_button"

    .line 24
    .line 25
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/hmk;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/hmk;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 37
    .line 38
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 39
    .line 40
    if-ne v0, p1, :cond_0

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 46
    .line 47
    iget-object v1, p0, Ll/hmk;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/api/e;->G8(Ljava/lang/String;Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance v0, Ll/rlk;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/rlk;-><init>()V

    .line 60
    .line 61
    .line 62
    new-instance v1, Ll/slk;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/slk;-><init>(Ll/hmk;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0}, Ll/r97;->T2(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public f1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ll/jek;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v2, ""

    .line 16
    .line 17
    invoke-static {v1, v2, p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public g1()V
    .locals 14

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_group_chat_invite"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->w:I

    .line 34
    .line 35
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->I:I

    .line 44
    .line 45
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v4, "10"

    .line 50
    .line 51
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {v1, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sget v7, Lcom/p1/mobile/putong/core/message/R$string;->G:I

    .line 64
    .line 65
    invoke-virtual {v1, v7}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    sget v7, Lcom/p1/mobile/putong/core/message/R$string;->I:I

    .line 74
    .line 75
    invoke-virtual {v1, v7}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v9

    .line 87
    iget-object v1, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 88
    .line 89
    iget-object v11, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 90
    .line 91
    new-instance v13, Ll/tlk;

    .line 92
    .line 93
    invoke-direct {v13, p0}, Ll/tlk;-><init>(Ll/hmk;)V

    .line 94
    .line 95
    .line 96
    const-string v4, "selectFriends"

    .line 97
    .line 98
    const/16 v7, 0xa

    .line 99
    .line 100
    const/4 v10, 0x0

    .line 101
    const-string v12, ""

    .line 102
    .line 103
    invoke-interface/range {v2 .. v13}, Ll/r97;->n2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ll/z20;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    new-instance v1, Ll/ulk;

    .line 108
    .line 109
    invoke-direct {v1, v0}, Ll/ulk;-><init>(Ll/l4g0;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public h1()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "groupchat_id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "e_invite_friends_to_group"

    .line 18
    .line 19
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/jvp0;->g(Landroid/content/Context;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->D6:I

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object v0, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/data/Link;

    .line 48
    .line 49
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v1, "invite"

    .line 53
    .line 54
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkIntent;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 59
    .line 60
    new-instance v1, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const-string v3, "user"

    .line 71
    .line 72
    invoke-direct {v1, v2, v3}, Lcom/p1/mobile/putong/data/IdBoxed;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    filled-new-array {v1}, [Lcom/p1/mobile/putong/data/IdBoxed;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 84
    .line 85
    iget-object v1, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1}, Ll/jek;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->F:I

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->K0:I

    .line 110
    .line 111
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 112
    .line 113
    check-cast v3, Ll/bnk;

    .line 114
    .line 115
    invoke-virtual {v3}, Ll/bnk;->j0()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    iget-object v1, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 128
    .line 129
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 136
    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 138
    .line 139
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Ll/hmk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 146
    .line 147
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 148
    .line 149
    const/4 v2, 0x0

    .line 150
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    :goto_0
    move-object v9, v1

    .line 165
    goto :goto_1

    .line 166
    :cond_2
    sget v1, Ll/ibc0;->k:I

    .line 167
    .line 168
    invoke-static {v1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->U(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    goto :goto_0

    .line 173
    :goto_1
    new-instance v3, Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 174
    .line 175
    invoke-direct {v3, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    new-instance v5, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 183
    .line 184
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    sget v1, Lcom/p1/mobile/putong/common/R$string;->c2:I

    .line 189
    .line 190
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    sget-object v1, Ll/vvp0;->b:Ljava/lang/String;

    .line 195
    .line 196
    const-string v2, "wechat-session"

    .line 197
    .line 198
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    const-string v6, "com.tencent.mm"

    .line 203
    .line 204
    filled-new-array {v6}, [Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    invoke-direct {v5, p0, v1, v2, v6}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual/range {v3 .. v9}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->A0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    return-void
.end method

.method public i1(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/hmk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "groupchat_id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/hmk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "e_alter_group_photo"

    .line 18
    .line 19
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, ""

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 41
    .line 42
    .line 43
    const-string v0, "chat-group"

    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/yb5;->I(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v0, Ll/nlk;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/nlk;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v0, Ll/ylk;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/ylk;-><init>(Ll/hmk;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance v0, Ll/zlk;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/zlk;-><init>(Ll/hmk;)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Ll/amk;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/amk;-><init>(Ll/hmk;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_group_chat_settings"

    .line 2
    .line 3
    return-object p0
.end method

.method public z0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmk;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
