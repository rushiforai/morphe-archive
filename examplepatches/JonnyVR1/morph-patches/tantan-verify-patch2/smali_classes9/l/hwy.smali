.class public Ll/hwy;
.super Ll/vuy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vuy<",
        "Ll/fwy;",
        ">;"
    }
.end annotation


# instance fields
.field public b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public c:Ll/fwy;

.field public d:Lcom/p1/mobile/putong/data/User;

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/vuy;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/hwy;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/hwy;->f:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/hwy;->g:Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic v(Ll/hwy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hwy;->G(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Ll/ovb0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ovb0<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object v0, p0, Ll/hwy;->d:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 24
    .line 25
    iget-object v2, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    iget-object v3, p0, Ll/hwy;->c:Ll/fwy;

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/fwy;Ll/ovb0;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public B(Ll/pf60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    iget-object v2, p0, Ll/hwy;->c:Ll/fwy;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/fwy;->k0()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->m(Ll/pf60;I)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    iget-object v2, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    invoke-virtual {v1, v2, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Ll/bkj0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    iget-object v2, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    iget-object v3, p0, Ll/hwy;->c:Ll/fwy;

    .line 22
    .line 23
    invoke-virtual {v1, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->p(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/bkj0;Ll/fwy;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/zwk;->e()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const-string v1, "http://m.staging2.p1staff.com"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v1, "https://m.tantanapp.com"

    .line 18
    .line 19
    :goto_0
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/dating-report/index.html?speed=true&_bid=1004397&hideNavigationBar=1&hideNotch=1&from=user&receive_report_user_id="

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const/4 v6, 0x1

    .line 43
    const/4 v7, 0x0

    .line 44
    const-string v1, ""

    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    const/4 v4, 0x1

    .line 48
    const/4 v5, 0x1

    .line 49
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public H(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->v(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/hwy;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/hwy;->h:Z

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    new-array v0, v0, [Ll/sfj0$a;

    .line 10
    .line 11
    const-string v1, "e_other_state"

    .line 12
    .line 13
    const-string v2, "p_chat_view"

    .line 14
    .line 15
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->w(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    iget-object v2, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    iget-object v3, p0, Ll/hwy;->c:Ll/fwy;

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->y(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/fwy;Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public K()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    iget-object v2, p0, Ll/hwy;->d:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->z(Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public L()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    iget-object v2, p0, Ll/hwy;->d:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->A(Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public M(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->B(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/hwy;->w()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/vuy;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 21
    .line 22
    iget-object v2, p0, Ll/hwy;->d:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object v3, p0, Ll/hwy;->c:Ll/fwy;

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->k(Lcom/p1/mobile/putong/data/User;Ll/fwy;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fwy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hwy;->x(Ll/fwy;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;Lv/VImage;Lcom/p1/mobile/putong/data/User;)V
    .locals 6
    .param p2    # Lv/VImage;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "matched"

    .line 8
    .line 9
    const/high16 v2, 0x3f000000    # 0.5f

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 27
    .line 28
    const-string v4, "superLiked"

    .line 29
    .line 30
    invoke-static {v4}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    int-to-float p2, p2

    .line 62
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 72
    .line 73
    sget v0, Ll/ibc0;->F6:I

    .line 74
    .line 75
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    const-string p2, "#5bb6ff"

    .line 83
    .line 84
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorStart(I)V

    .line 89
    .line 90
    .line 91
    const-string p2, "#2fcffc"

    .line 92
    .line 93
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorEnd(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 101
    .line 102
    .line 103
    goto/16 :goto_0

    .line 104
    .line 105
    :cond_0
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 106
    .line 107
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 116
    .line 117
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_1

    .line 122
    .line 123
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 126
    .line 127
    const-string v4, "boosted"

    .line 128
    .line 129
    invoke-static {v4}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_1

    .line 138
    .line 139
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_1

    .line 152
    .line 153
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 154
    .line 155
    .line 156
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    int-to-float p2, p2

    .line 161
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 168
    .line 169
    .line 170
    iget-object p2, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 171
    .line 172
    sget v0, Ll/ibc0;->c7:I

    .line 173
    .line 174
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 179
    .line 180
    .line 181
    const-string p2, "#ff8eaf"

    .line 182
    .line 183
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorStart(I)V

    .line 188
    .line 189
    .line 190
    const-string p2, "#ea50c0"

    .line 191
    .line 192
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorEnd(I)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 200
    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iget-object v4, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 213
    .line 214
    invoke-interface {v0, v4}, Ll/r97;->Q4(Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    const/4 v4, 0x1

    .line 219
    if-eqz v0, :cond_2

    .line 220
    .line 221
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 222
    .line 223
    .line 224
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    int-to-float p2, p2

    .line 229
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 236
    .line 237
    .line 238
    sget p2, Ll/ibc0;->g6:I

    .line 239
    .line 240
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 241
    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :cond_2
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 246
    .line 247
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_3

    .line 252
    .line 253
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 254
    .line 255
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 256
    .line 257
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_3

    .line 262
    .line 263
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 264
    .line 265
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 266
    .line 267
    const-string v5, "letter"

    .line 268
    .line 269
    invoke-static {v5}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    invoke-interface {v0, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_3

    .line 278
    .line 279
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 280
    .line 281
    .line 282
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 283
    .line 284
    .line 285
    move-result p2

    .line 286
    int-to-float p2, p2

    .line 287
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 294
    .line 295
    .line 296
    sget p2, Ll/ibc0;->I6:I

    .line 297
    .line 298
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 299
    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :cond_3
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 304
    .line 305
    if-eqz v0, :cond_4

    .line 306
    .line 307
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 308
    .line 309
    const-string v5, "default"

    .line 310
    .line 311
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-nez v0, :cond_4

    .line 316
    .line 317
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 318
    .line 319
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 320
    .line 321
    const-string v5, "unknown_"

    .line 322
    .line 323
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    if-eqz v0, :cond_5

    .line 328
    .line 329
    :cond_4
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 330
    .line 331
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    if-eqz v0, :cond_5

    .line 336
    .line 337
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 338
    .line 339
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 340
    .line 341
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-eqz v0, :cond_5

    .line 346
    .line 347
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 348
    .line 349
    .line 350
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 351
    .line 352
    .line 353
    move-result p2

    .line 354
    int-to-float p2, p2

    .line 355
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setBordersize(F)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorAngle(I)V

    .line 362
    .line 363
    .line 364
    iget-object p2, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 365
    .line 366
    sget v0, Ll/ibc0;->w7:I

    .line 367
    .line 368
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 369
    .line 370
    .line 371
    move-result-object p2

    .line 372
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 373
    .line 374
    .line 375
    const-string p2, "#ff4349"

    .line 376
    .line 377
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 378
    .line 379
    .line 380
    move-result p2

    .line 381
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorStart(I)V

    .line 382
    .line 383
    .line 384
    const-string p2, "#ff7c3e"

    .line 385
    .line 386
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 387
    .line 388
    .line 389
    move-result p2

    .line 390
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setButtonColorEnd(I)V

    .line 391
    .line 392
    .line 393
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 394
    .line 395
    .line 396
    goto :goto_0

    .line 397
    :cond_5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 398
    .line 399
    .line 400
    move-result v0

    .line 401
    if-eqz v0, :cond_6

    .line 402
    .line 403
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 408
    .line 409
    .line 410
    move-result-object v0

    .line 411
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    if-nez v0, :cond_7

    .line 416
    .line 417
    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 418
    .line 419
    .line 420
    const/16 v0, 0x8

    .line 421
    .line 422
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 423
    .line 424
    .line 425
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 426
    .line 427
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 428
    .line 429
    iget-object v0, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 430
    .line 431
    invoke-interface {p1, v0, p3, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 432
    .line 433
    .line 434
    goto :goto_0

    .line 435
    :cond_6
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 436
    .line 437
    .line 438
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;->setEmpty(Z)V

    .line 439
    .line 440
    .line 441
    const/4 p2, 0x4

    .line 442
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 443
    .line 444
    .line 445
    :cond_7
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 446
    .line 447
    .line 448
    move-result-object p1

    .line 449
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    invoke-interface {p1}, Ll/r97;->G1()Z

    .line 454
    .line 455
    .line 456
    move-result p1

    .line 457
    if-eqz p1, :cond_8

    .line 458
    .line 459
    invoke-virtual {p0, p3}, Ll/hwy;->F(Lcom/p1/mobile/putong/data/User;)Z

    .line 460
    .line 461
    .line 462
    move-result p1

    .line 463
    if-nez p1, :cond_8

    .line 464
    .line 465
    iget-object p1, p0, Ll/vuy;->a:Ljava/util/List;

    .line 466
    .line 467
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 468
    .line 469
    .line 470
    move-result-object p1

    .line 471
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 472
    .line 473
    .line 474
    move-result p2

    .line 475
    if-eqz p2, :cond_8

    .line 476
    .line 477
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 478
    .line 479
    .line 480
    move-result-object p2

    .line 481
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 482
    .line 483
    iget-object v0, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 484
    .line 485
    invoke-virtual {p2, v0, p3}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 486
    .line 487
    .line 488
    goto :goto_1

    .line 489
    :cond_8
    return-void
.end method

.method public k(Ljava/util/List;Lv/VLinear;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Lv/VLinear;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/vuy;->k(Ljava/util/List;Lv/VLinear;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->D2()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    new-instance p2, Landroid/widget/TextView;

    .line 13
    .line 14
    iget-object v0, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 15
    .line 16
    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    const-string v0, "\u4e3e\u62a5"

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x11

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/gwy;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/gwy;-><init>(Ll/hwy;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    sget p0, Ll/ibc0;->k3:I

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    invoke-interface {p1, p0, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p2, p1}, Ll/dkb;->Aa(Lcom/p1/mobile/putong/data/User;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p1, 0x0

    .line 32
    :goto_0
    iget-boolean p2, p0, Ll/hwy;->e:Z

    .line 33
    .line 34
    if-eq p1, p2, :cond_1

    .line 35
    .line 36
    iput-boolean p1, p0, Ll/hwy;->e:Z

    .line 37
    .line 38
    iget-object p1, p0, Ll/hwy;->c:Ll/fwy;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string p2, "voiceCallView"

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Lv/VIcon;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_1

    .line 69
    .line 70
    iget-boolean p0, p0, Ll/hwy;->e:Z

    .line 71
    .line 72
    invoke-static {p1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwy;->c:Ll/fwy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ruy;->u0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/hwy;->w()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/hwy;->w()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/hwy;->c:Ll/fwy;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/j3z;->e0()Ll/mzl;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Ll/hwy;->c:Ll/fwy;

    .line 20
    .line 21
    invoke-virtual {v3}, Ll/j3z;->e0()Ll/mzl;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-interface {v3}, Ll/mzl;->l()Ll/clz;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Ll/clz;->r3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, v3}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object p0, p0, Ll/hwy;->c:Ll/fwy;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->Z1(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public s(Z)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/r97;->u()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/hwy;->c:Ll/fwy;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/hwy;->c:Ll/fwy;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->v2()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v0, 0x0

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    return v0

    .line 51
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isSeeUpgradedConv()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    return v0

    .line 64
    :cond_1
    const/4 p0, 0x1

    .line 65
    return p0
.end method

.method public w()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hwy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ll/fwy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hwy;->c:Ll/fwy;

    .line 2
    .line 3
    return-void
.end method

.method public y(Ll/fwy;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/vuy;->d(Ll/ruy;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/qzz;->s0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->q(Ll/fwy;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->i()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method
