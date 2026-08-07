.class public Ll/bvy;
.super Ll/vuy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vuy<",
        "Ll/avy;",
        ">;"
    }
.end annotation


# instance fields
.field public b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public c:Ll/avy;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vuy;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bvy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bvy;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/vuy;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/avy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bvy;->v(Ll/avy;)V

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

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bvy;->c:Ll/avy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ruy;->u0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/bvy;->c:Ll/avy;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/clz;->i3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p0, v2, v0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public v(Ll/avy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bvy;->c:Ll/avy;

    .line 2
    .line 3
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/core/data/ChatGroup;Z)V
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
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x(Lcom/p1/mobile/putong/core/data/ChatGroup;Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method
