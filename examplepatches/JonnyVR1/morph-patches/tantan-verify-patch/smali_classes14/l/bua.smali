.class public Ll/bua;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/bua;->a:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/bua;->b:J

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/of7;->o()Ll/of7;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/of7;->z()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/PushMessage;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O2:Ll/wyd0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lqb;->k5()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->J9()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/d09;->m()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/d09;->n()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    :goto_0
    invoke-static {}, Ll/of7;->o()Ll/of7;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/of7;->z()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic i(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->H9()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic j(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k(Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/game/MsgGameMkWebViewAct;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Ge(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static l(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/u17;->z()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public static m(I)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 v0, -0x1

    .line 24
    if-ne p0, v0, :cond_2

    .line 25
    .line 26
    :cond_1
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_2
    const/4 p0, 0x0

    .line 29
    return p0
.end method


# virtual methods
.method public n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 7

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p2

    const/4 p3, 0x0

    if-eqz p2, :cond_71

    .line 2
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v0, "user.state.changed"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_1

    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    :cond_0
    :goto_0
    move p0, p3

    :goto_1
    move p1, v0

    goto/16 :goto_12

    .line 4
    :cond_1
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "conversation.single.delete"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-string v2, "conversation"

    if-eqz p2, :cond_2

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 5
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 6
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "id:"

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 8
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {p0}, Ll/cmb0;->N()Z

    move-result p0

    if-nez p0, :cond_0

    return v0

    .line 9
    :cond_2
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "greeting.list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-string v1, "greeting"

    if-eqz p2, :cond_4

    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/j;->q0:Lrx/subjects/b;

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 11
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/bua;->o(Ljava/lang/String;)V

    .line 12
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_3

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 14
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/j;->I6(Ljava/lang/String;)Lrx/c;

    .line 16
    :cond_3
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    goto/16 :goto_0

    .line 17
    :cond_4
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "greeting.single"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    iget-object v1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    const-string v2, "anonymous"

    .line 19
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    .line 20
    invoke-virtual {p1, p2, v1}, Lcom/p1/mobile/putong/core/api/j;->G6(Ljava/lang/String;Z)Lrx/c;

    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/j;->q0:Lrx/subjects/b;

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 22
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/bua;->o(Ljava/lang/String;)V

    .line 23
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 24
    invoke-static {p0}, Ll/bua;->l(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_5

    .line 25
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    move-result-object p0

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/esf0;->y(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    :cond_5
    return v0

    .line 26
    :cond_6
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "greeting.update"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/j;->q0:Lrx/subjects/b;

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 29
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/bua;->o(Ljava/lang/String;)V

    .line 30
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    goto/16 :goto_0

    .line 31
    :cond_7
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "conversation.single.blocked"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_8

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 32
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_8

    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/dkb;->Ba(Ljava/lang/String;)V

    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    goto/16 :goto_0

    .line 35
    :cond_8
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "conversation.single.update.oneside"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    return v0

    .line 37
    :cond_9
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "chatheat.exchat"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_a

    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    goto/16 :goto_0

    .line 39
    :cond_a
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "conversation.single"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_b

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "male.message.repeat"

    .line 40
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_f

    :cond_b
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 41
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_f

    .line 42
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/cn7;->C3(Ljava/lang/String;)V

    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 44
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {p0}, Ll/cmb0;->N()Z

    move-result p0

    if-nez p0, :cond_c

    return v0

    .line 45
    :cond_c
    iget p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    add-int/lit16 p0, p0, -0x2710

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/bua;->l(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_e

    .line 46
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    move-result-object p0

    iget p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    add-int/lit16 p1, p1, -0x2710

    .line 47
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/esf0;->y(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_2

    .line 48
    :cond_d
    iget p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    add-int/lit16 p0, p0, -0x2710

    invoke-static {p0}, Ll/bua;->m(I)Z

    move-result p0

    goto/16 :goto_1

    :cond_e
    :goto_2
    return v0

    .line 49
    :cond_f
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "message.single.update"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-string v3, "message.group.update"

    const-string v4, "message"

    if-nez p2, :cond_10

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 50
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_14

    :cond_10
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 51
    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_14

    .line 52
    invoke-static {}, Ll/gra;->V1()Z

    move-result p0

    if-nez p0, :cond_11

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_11

    return v0

    .line 53
    :cond_11
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_13

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->type:Ljava/lang/String;

    .line 54
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_13

    .line 55
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    .line 58
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    iget-object v1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    invoke-virtual {p0, p2, p1, v1}, Lcom/p1/mobile/putong/core/api/g;->Ln(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 59
    :cond_12
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {p0}, Ll/cmb0;->N()Z

    move-result p0

    if-nez p0, :cond_0

    return v0

    .line 60
    :cond_13
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->type:Ljava/lang/String;

    .line 61
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 62
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p3}, Lcom/p1/mobile/putong/core/api/j;->F6(Ljava/lang/String;ZZ)Lrx/c;

    .line 63
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->q0:Lrx/subjects/b;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 65
    :cond_14
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "single.comment.delete"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_16

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 66
    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_16

    .line 67
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/api/g;->On(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    :cond_15
    return v0

    .line 69
    :cond_16
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "conversation.list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-wide/16 v5, 0x1

    if-nez p2, :cond_6a

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v3, "kankan.match"

    .line 70
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_17

    goto/16 :goto_10

    .line 71
    :cond_17
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "conversation.single.message.audiotext"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_68

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "conversation.group.message.audiotext"

    .line 72
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_18

    goto/16 :goto_e

    .line 73
    :cond_18
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "user.status.changed"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_19

    .line 74
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    new-instance p1, Ll/qta;

    invoke-direct {p1}, Ll/qta;-><init>()V

    new-instance p2, Ll/tta;

    invoke-direct {p2}, Ll/tta;-><init>()V

    .line 76
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    goto/16 :goto_0

    .line 78
    :cond_19
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "superLike.received"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_67

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "letter.received"

    .line 79
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a

    goto/16 :goto_d

    .line 80
    :cond_1a
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "oms.reload"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1b

    .line 81
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object p0

    sget-boolean p1, Ll/uqb0;->A:Z

    invoke-virtual {p0, p1}, Ll/pk50;->p(Z)V

    goto/16 :goto_f

    .line 82
    :cond_1b
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "user.status.good2fake"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1c

    .line 83
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    move-result-object p0

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 84
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 85
    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    new-instance p1, Ll/uta;

    invoke-direct {p1, p4}, Ll/uta;-><init>(Lcom/p1/mobile/putong/data/PushMessage;)V

    new-instance p2, Ll/vta;

    invoke-direct {p2}, Ll/vta;-><init>()V

    .line 86
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object p1

    .line 87
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    goto/16 :goto_0

    .line 88
    :cond_1c
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "user.verification.reason"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1d

    .line 89
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    move-result-object p0

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 90
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 91
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->P2:Ll/wyd0;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 92
    :cond_1d
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "user.membership.changed"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1e

    .line 93
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    goto/16 :goto_0

    .line 94
    :cond_1e
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "user.picture.verification"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_23

    .line 95
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 96
    invoke-static {}, Ll/gra;->Z2()Z

    move-result p0

    if-eqz p0, :cond_1f

    .line 97
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    invoke-virtual {p0}, Ll/dx6;->q3()Lrx/c;

    .line 98
    :cond_1f
    invoke-static {}, Ll/d09;->m()Z

    move-result p0

    if-eqz p0, :cond_20

    .line 99
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 100
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->p4(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    new-instance p1, Ll/wta;

    invoke-direct {p1}, Ll/wta;-><init>()V

    new-instance p2, Ll/xta;

    invoke-direct {p2}, Ll/xta;-><init>()V

    .line 101
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    goto/16 :goto_0

    .line 103
    :cond_20
    invoke-static {}, Ll/gra;->K1()Z

    move-result p0

    if-nez p0, :cond_22

    .line 104
    invoke-static {}, Ll/gra;->c3()Z

    move-result p0

    if-eqz p0, :cond_21

    goto :goto_3

    .line 105
    :cond_21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->p4(Ljava/lang/String;)Lrx/c;

    goto/16 :goto_0

    .line 106
    :cond_22
    :goto_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 107
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->p4(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    new-instance p1, Ll/yta;

    invoke-direct {p1}, Ll/yta;-><init>()V

    new-instance p2, Ll/zta;

    invoke-direct {p2}, Ll/zta;-><init>()V

    .line 108
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object p1

    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    goto/16 :goto_0

    .line 109
    :cond_23
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "quickchat.match"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_66

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "quickchat.speed-match"

    .line 110
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_24

    goto/16 :goto_c

    .line 111
    :cond_24
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "quickchat.broadcast"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_65

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "quickchat.bell"

    .line 112
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_65

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "quickchat.speed-push"

    .line 113
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_65

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "quickchat.oneside"

    .line 114
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_65

    .line 115
    invoke-static {}, Ll/rm50;->e()Z

    move-result p2

    if-eqz p2, :cond_25

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "voicechat.broadcast"

    .line 116
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_25

    goto/16 :goto_b

    .line 117
    :cond_25
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "selectedcard.received"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_26

    .line 118
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    iput-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    goto/16 :goto_0

    .line 119
    :cond_26
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "suggested.list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "huawei.unreadMsg"

    .line 120
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_27

    goto/16 :goto_0

    .line 121
    :cond_27
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "suggest.swipe"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_28

    .line 122
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->S:Lrx/subjects/a;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    .line 124
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    return v0

    .line 125
    :cond_28
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "shuoshuo.callback"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_29

    return v0

    .line 126
    :cond_29
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "user.idcard.verification"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_64

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "user.age.verification"

    .line 127
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_64

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "user.ctdid.verification"

    .line 128
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2a

    goto/16 :goto_a

    .line 129
    :cond_2a
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "newMaleUserLike.received"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_63

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "newMaleUserLike.send"

    .line 130
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2b

    goto/16 :goto_9

    .line 131
    :cond_2b
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "growth.dauMale"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2c

    return v0

    .line 132
    :cond_2c
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "call.voice.single"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_31

    .line 133
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    move-result-object p0

    invoke-virtual {p0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    move-result-object p0

    .line 134
    sget-object p1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    if-eq p0, p1, :cond_2d

    sget-object p1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    if-eq p0, p1, :cond_2d

    sget-object p1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->LIVE_IN_ROOM:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    if-ne p0, p1, :cond_2e

    .line 135
    :cond_2d
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    .line 136
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/VoiceCallStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VoiceCallStatus;

    move-result-object p0

    const-string p1, "calling"

    .line 137
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2e

    return v0

    .line 138
    :cond_2e
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    move-result-object p0

    invoke-virtual {p0, p4, p3}, Ll/xzm0;->v(Lcom/p1/mobile/putong/data/PushMessage;Z)V

    .line 139
    invoke-static {}, Ll/w1n0;->d()Z

    move-result p0

    if-nez p0, :cond_2f

    iget-boolean p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    if-nez p0, :cond_2f

    .line 140
    iget p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    invoke-static {p0}, Ll/u17;->O(I)V

    .line 141
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    move-result-object p0

    iget p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/xzm0;->x(Ljava/lang/Integer;)V

    .line 142
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    invoke-virtual {p0, p4, p5, p3}, Ll/wr2;->k(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    .line 143
    :cond_2f
    iget-boolean p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    if-eqz p0, :cond_30

    .line 144
    iget p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    invoke-static {p0}, Ll/u17;->P(I)V

    .line 145
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    move-result-object p0

    invoke-virtual {p0}, Ll/xzm0;->g()V

    .line 146
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    iget p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    invoke-virtual {p0, p1}, Ll/wr2;->b(I)V

    :cond_30
    return v0

    .line 147
    :cond_31
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "growth.follow"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_32

    goto/16 :goto_0

    .line 148
    :cond_32
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "common.link"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_33

    goto/16 :goto_0

    .line 149
    :cond_33
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "heartbeat.match.link"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_34

    goto/16 :goto_0

    .line 150
    :cond_34
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "heartbeat.match.recall"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_35

    goto/16 :goto_0

    .line 151
    :cond_35
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "visit.notify"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_36

    goto/16 :goto_0

    .line 152
    :cond_36
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "see.picks"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_37

    goto/16 :goto_0

    .line 153
    :cond_37
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "push.pay.landpage"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_38

    .line 154
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    const-string p1, "purchase_result"

    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->G5(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    goto/16 :goto_0

    .line 155
    :cond_38
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "chat.conversation.other_read"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_39

    .line 156
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/api/g;->nq(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    goto/16 :goto_0

    .line 158
    :cond_39
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "call.voiceinviting.single"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3a

    .line 159
    iget p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    invoke-static {p0}, Ll/u17;->O(I)V

    .line 160
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 161
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 162
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 163
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 164
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->type:Ljava/lang/String;

    .line 165
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 166
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 167
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    .line 168
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 169
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/api/g;->Kn(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    goto/16 :goto_0

    .line 170
    :cond_3a
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "boost.end.push"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3b

    goto/16 :goto_0

    .line 171
    :cond_3b
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "order.firstPay.fail.sendCoupon"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3c

    goto/16 :goto_f

    .line 172
    :cond_3c
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "userbag.couponbag.changed"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3d

    goto/16 :goto_f

    .line 173
    :cond_3d
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p2, "conversation.group"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    const-string p2, "topic"

    if-eqz p1, :cond_42

    .line 174
    invoke-static {}, Ll/gra;->V1()Z

    move-result p1

    if-nez p1, :cond_3e

    return v0

    .line 175
    :cond_3e
    iget-wide v1, p0, Ll/bua;->b:J

    add-long/2addr v1, v5

    iput-wide v1, p0, Ll/bua;->b:J

    .line 176
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3f

    .line 177
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/e;->F6(I)Lrx/c;

    .line 178
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e;->a9()Lrx/c;

    goto :goto_4

    .line 179
    :cond_3f
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 180
    :goto_4
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {p0}, Ll/cmb0;->N()Z

    move-result p0

    if-eqz p0, :cond_41

    iget-boolean p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    if-eqz p0, :cond_40

    goto :goto_5

    .line 181
    :cond_40
    iget p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    add-int/lit16 p0, p0, -0x2710

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/bua;->l(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_41

    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 182
    invoke-virtual {p0}, Ll/u17;->F()Z

    move-result p0

    if-nez p0, :cond_41

    .line 183
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    move-result-object p0

    iget p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    add-int/lit16 p1, p1, -0x2710

    .line 184
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/esf0;->y(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    :cond_41
    :goto_5
    return v0

    .line 185
    :cond_42
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "conversation.group.update"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    .line 186
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    if-eqz p0, :cond_44

    .line 187
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_43

    .line 188
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/e;->F6(I)Lrx/c;

    .line 189
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e;->a9()Lrx/c;

    goto :goto_6

    .line 190
    :cond_43
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    :goto_6
    return v0

    .line 191
    :cond_44
    const-string p0, "group.notification.list"

    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_48

    .line 192
    invoke-static {}, Ll/gra;->V1()Z

    move-result p0

    if-nez p0, :cond_45

    return v0

    .line 193
    :cond_45
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e;->U8()Lrx/c;

    .line 194
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {p0}, Ll/cmb0;->N()Z

    move-result p0

    if-nez p0, :cond_46

    return v0

    .line 195
    :cond_46
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_47

    .line 196
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/R$string;->w1:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 197
    :cond_47
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    invoke-virtual {p0, p4, p5, p3}, Ll/wr2;->k(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    return v0

    .line 198
    :cond_48
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "group.member.update"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_4c

    .line 199
    invoke-static {}, Ll/gra;->V1()Z

    move-result p0

    if-nez p0, :cond_49

    return v0

    .line 200
    :cond_49
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4a

    .line 202
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    goto :goto_7

    :cond_4a
    const/4 p0, 0x0

    .line 203
    :goto_7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4b

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4b

    .line 204
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->Z8(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    :cond_4b
    return v0

    .line 205
    :cond_4c
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "group.update"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_50

    .line 206
    invoke-static {}, Ll/gra;->V1()Z

    move-result p0

    if-nez p0, :cond_4d

    return v0

    .line 207
    :cond_4d
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 208
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4f

    .line 209
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_4e

    .line 210
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/e;->F6(I)Lrx/c;

    .line 211
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/e;->a9()Lrx/c;

    .line 212
    :cond_4e
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/e;->X8(Ljava/lang/String;)Lrx/c;

    .line 213
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/e;->g0:Lrx/subjects/b;

    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    :cond_4f
    return v0

    .line 214
    :cond_50
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "monetizationGift.chatmessage.push"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_53

    .line 215
    invoke-static {}, Ll/spl0;->n()Z

    move-result p0

    if-eqz p0, :cond_52

    .line 216
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    .line 217
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    .line 218
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_52

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_52

    .line 219
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p2

    .line 220
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_51

    .line 221
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/api/g;->Kn(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    goto :goto_8

    .line 222
    :cond_51
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    invoke-virtual {p1, p0, v0, p3}, Lcom/p1/mobile/putong/core/api/j;->F6(Ljava/lang/String;ZZ)Lrx/c;

    :cond_52
    :goto_8
    return v0

    .line 223
    :cond_53
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "guide.update"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_54

    goto/16 :goto_0

    .line 224
    :cond_54
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "membership.expiration"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_55

    goto/16 :goto_0

    .line 225
    :cond_55
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "voicechat.match"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_56

    goto/16 :goto_f

    .line 226
    :cond_56
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "quickchat.bell-greet"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_57

    .line 227
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_69

    .line 228
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    goto/16 :goto_f

    .line 229
    :cond_57
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "quickchat.speed-delete"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_63

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "quickchat.oneside-delete"

    .line 230
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_58

    goto/16 :goto_9

    .line 231
    :cond_58
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "heartbeat.match.broadcast"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5b

    .line 232
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide p0

    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    iget-wide v1, p2, Ll/f49;->h0:J

    cmp-long p0, p0, v1

    if-gtz p0, :cond_59

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 233
    invoke-virtual {p2, p0}, Ll/f49;->K3(Lcom/p1/mobile/putong/data/PushMessageCustom;)Z

    move-result p0

    if-nez p0, :cond_59

    return v0

    .line 234
    :cond_59
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5a

    .line 235
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5a

    .line 236
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-static {p0}, Ll/upm;->X(Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    :cond_5a
    return v0

    .line 237
    :cond_5b
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "growth.match.recall"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5c

    .line 238
    invoke-static {}, Ll/x19;->w()Ll/x19;

    move-result-object p0

    invoke-virtual {p0, p4}, Ll/x19;->F(Lcom/p1/mobile/putong/data/PushMessage;)V

    return v0

    .line 239
    :cond_5c
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "quickchat.party"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5d

    goto/16 :goto_0

    .line 240
    :cond_5d
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "user.setting.changed"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5e

    .line 241
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    return v0

    .line 242
    :cond_5e
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5f

    .line 243
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    return v0

    .line 244
    :cond_5f
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "moment-lab.verification.push"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_60

    .line 245
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->j0:Lrx/subjects/a;

    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    return v0

    .line 246
    :cond_60
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "chat.online.guide"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_61

    .line 247
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    return v0

    .line 248
    :cond_61
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "intl.receive.liked"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_62

    .line 249
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t7()V

    return v0

    .line 250
    :cond_62
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string p1, "user.picture.tags.changed"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_69

    .line 251
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_63

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 252
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_63

    .line 253
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 254
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    move-result-object p1

    invoke-virtual {p1, p0}, Ll/gj40;->p(Ljava/util/List;)V

    :cond_63
    :goto_9
    return v0

    .line 256
    :cond_64
    :goto_a
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 257
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->p4(Ljava/lang/String;)Lrx/c;

    :cond_65
    :goto_b
    return v0

    .line 258
    :cond_66
    :goto_c
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    new-instance p1, Ll/aua;

    invoke-direct {p1}, Ll/aua;-><init>()V

    const-wide/16 v1, 0x3e8

    invoke-static {p0, p1, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    goto/16 :goto_0

    .line 259
    :cond_67
    :goto_d
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget p1, Lcom/p1/mobile/putong/core/R$string;->Zp:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 260
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    iput-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 261
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 262
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->W:J

    .line 263
    iput p3, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->X:I

    goto/16 :goto_0

    .line 264
    :cond_68
    :goto_e
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->c2:Lrx/subjects/a;

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    .line 265
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    .line 266
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    :cond_69
    :goto_f
    move p0, p3

    move p1, p0

    goto/16 :goto_12

    .line 267
    :cond_6a
    :goto_10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 268
    iget-wide p1, p0, Ll/bua;->a:J

    add-long/2addr p1, v5

    iput-wide p1, p0, Ll/bua;->a:J

    .line 269
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    invoke-virtual {p0}, Ll/cmb0;->N()Z

    move-result p0

    if-nez p0, :cond_6b

    return v0

    .line 270
    :cond_6b
    invoke-static {}, Ll/gra;->j2()Z

    move-result p0

    if-eqz p0, :cond_6d

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 271
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6d

    .line 272
    invoke-static {}, Ll/gra;->n3()Z

    move-result p0

    if-eqz p0, :cond_6c

    .line 273
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-static {p0, v0}, Ll/pdi;->d0(Ljava/lang/String;Z)V

    goto :goto_11

    .line 274
    :cond_6c
    invoke-static {}, Ll/wgx;->A()Ll/wgx;

    move-result-object p0

    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/wgx;->N(Ljava/lang/String;)V

    .line 275
    :cond_6d
    :goto_11
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object p0

    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object p0

    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->lk()Z

    move-result p0

    if-eqz p0, :cond_0

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 276
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 277
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 278
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 279
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 280
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->o3(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    return v0

    .line 281
    :goto_12
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "game.woodenfish.update"

    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_6f

    .line 282
    iget-object p0, p4, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 283
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_6e

    .line 284
    :try_start_0
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    .line 285
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    .line 286
    iget-object p3, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-object p3, p3, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 287
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/g;->h2:Lrx/subjects/b;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    move-result-object p1

    invoke-virtual {p4, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    goto :goto_13

    :catch_0
    return v0

    .line 288
    :cond_6e
    :goto_13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 289
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    move-result-object p1

    new-instance p2, Ll/rta;

    invoke-direct {p2, p0}, Ll/rta;-><init>(Ljava/lang/String;)V

    new-instance p0, Ll/sta;

    invoke-direct {p0}, Ll/sta;-><init>()V

    .line 290
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object p0

    .line 291
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return v0

    .line 292
    :cond_6f
    iget-object p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    const-string v1, "match.tooMany"

    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_70

    .line 293
    invoke-static {}, Ll/w20;->g()V

    return v0

    .line 294
    :cond_70
    iget-boolean p2, p4, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    if-nez p2, :cond_71

    if-eqz p1, :cond_71

    .line 295
    sget-object p1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    invoke-virtual {p1, p4, p5, p0}, Ll/wr2;->k(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    return v0

    :cond_71
    return p3
.end method

.method public final o(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/j;->K6(Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public p()V
    .locals 113

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    new-instance v1, Ll/bua$a;

    .line 4
    .line 5
    move-object/from16 v2, p0

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ll/bua$a;-><init>(Ll/bua;)V

    .line 8
    .line 9
    .line 10
    const-string v111, "chat.online.guide"

    .line 11
    .line 12
    const-string v112, "intl.receive.liked"

    .line 13
    .line 14
    const-string v2, "unknown_"

    .line 15
    .line 16
    const-string v3, "conversation.single.delete"

    .line 17
    .line 18
    const-string v4, "message.single.update"

    .line 19
    .line 20
    const-string v5, "conversation.single"

    .line 21
    .line 22
    const-string v6, "conversation.list"

    .line 23
    .line 24
    const-string v7, "suggested.list"

    .line 25
    .line 26
    const-string v8, "huawei.unreadMsg"

    .line 27
    .line 28
    const-string v9, "local.message.secret"

    .line 29
    .line 30
    const-string v10, "secretcrush.received"

    .line 31
    .line 32
    const-string v11, "superLike.received"

    .line 33
    .line 34
    const-string v12, "superLike.invite"

    .line 35
    .line 36
    const-string v13, "user.status.changed"

    .line 37
    .line 38
    const-string v14, "user.status.good2fake"

    .line 39
    .line 40
    const-string v15, "user.verification.reason"

    .line 41
    .line 42
    const-string v16, "friendship.request"

    .line 43
    .line 44
    const-string v17, "user.membership.changed"

    .line 45
    .line 46
    const-string v18, "user.state.changed"

    .line 47
    .line 48
    const-string v19, "user.picture.verification"

    .line 49
    .line 50
    const-string v20, "suggested.liked"

    .line 51
    .line 52
    const-string v21, "gift.received.like"

    .line 53
    .line 54
    const-string v22, "push.arrival.ab.local.push"

    .line 55
    .line 56
    const-string v23, "home.picks"

    .line 57
    .line 58
    const-string v24, "rev.low.price"

    .line 59
    .line 60
    const-string v25, "lucky.money.received"

    .line 61
    .line 62
    const-string v26, "lucky.money.taken"

    .line 63
    .line 64
    const-string v27, "placesv2.challenge"

    .line 65
    .line 66
    const-string v28, "sayHiLiked.received"

    .line 67
    .line 68
    const-string v29, "letter.received"

    .line 69
    .line 70
    const-string v30, "growth.follow"

    .line 71
    .line 72
    const-string v31, "conversation.single.blocked"

    .line 73
    .line 74
    const-string v32, "friend.reminder"

    .line 75
    .line 76
    const-string v33, "quickchat.match"

    .line 77
    .line 78
    const-string v34, "selectedcard.received"

    .line 79
    .line 80
    const-string v35, "quickchat.broadcast"

    .line 81
    .line 82
    const-string v36, "boost.status"

    .line 83
    .line 84
    const-string v37, "pcs.broadcast.status"

    .line 85
    .line 86
    const-string v38, "soulship.agree"

    .line 87
    .line 88
    const-string v39, "seenotice.received"

    .line 89
    .line 90
    const-string v40, "shuoshuo.callback"

    .line 91
    .line 92
    const-string v41, "user.idcard.verification"

    .line 93
    .line 94
    const-string v42, "newMaleUserLike.received"

    .line 95
    .line 96
    const-string v43, "newMaleUserLike.send"

    .line 97
    .line 98
    const-string v44, "call.voice.single"

    .line 99
    .line 100
    const-string v45, "devicepush.list"

    .line 101
    .line 102
    const-string v46, "growth.dauMale"

    .line 103
    .line 104
    const-string v47, "chat.conversation.other_read"

    .line 105
    .line 106
    const-string v48, "user.age.verification"

    .line 107
    .line 108
    const-string v49, "call.voiceinviting.single"

    .line 109
    .line 110
    const-string v50, "conversation.notify"

    .line 111
    .line 112
    const-string v51, "conversation.single.self.delete"

    .line 113
    .line 114
    const-string v52, "push.pay.landpage"

    .line 115
    .line 116
    const-string v53, "boost.end.push"

    .line 117
    .line 118
    const-string v54, "order.firstPay.fail.sendCoupon"

    .line 119
    .line 120
    const-string v55, "userbag.couponbag.changed"

    .line 121
    .line 122
    const-string v56, "conversation.group"

    .line 123
    .line 124
    const-string v57, "message.group.update"

    .line 125
    .line 126
    const-string v58, "group.notification.list"

    .line 127
    .line 128
    const-string v59, "group.member.update"

    .line 129
    .line 130
    const-string v60, "visit.notify"

    .line 131
    .line 132
    const-string v61, "group.update"

    .line 133
    .line 134
    const-string v62, "conversation.single.update.oneside"

    .line 135
    .line 136
    const-string v63, "kankan.match"

    .line 137
    .line 138
    const-string v64, "conversation.single.message.audiotext"

    .line 139
    .line 140
    const-string v65, "conversation.group.message.audiotext"

    .line 141
    .line 142
    const-string v66, "greeting.list"

    .line 143
    .line 144
    const-string v67, "greeting.single"

    .line 145
    .line 146
    const-string v68, "greeting.update"

    .line 147
    .line 148
    const-string v69, "greeting.kankantab"

    .line 149
    .line 150
    const-string v70, "monetizationGift.chatmessage.push"

    .line 151
    .line 152
    const-string v71, "guide.update"

    .line 153
    .line 154
    const-string v72, "common.link"

    .line 155
    .line 156
    const-string v73, "voicechat.match"

    .line 157
    .line 158
    const-string v74, "see.picks"

    .line 159
    .line 160
    const-string v75, "quickchat.bell"

    .line 161
    .line 162
    const-string v76, "quickchat.bell-greet"

    .line 163
    .line 164
    const-string v77, "group.member.join"

    .line 165
    .line 166
    const-string v78, "group.member.leave"

    .line 167
    .line 168
    const-string v79, "quickchat.speed-match"

    .line 169
    .line 170
    const-string v80, "quickchat.speed-delete"

    .line 171
    .line 172
    const-string v81, "quickchat.speed-push"

    .line 173
    .line 174
    const-string v82, "conversation.group.update"

    .line 175
    .line 176
    const-string v83, "creation.soul2"

    .line 177
    .line 178
    const-string v84, "quickchat_state.push"

    .line 179
    .line 180
    const-string v85, "quickchat_state.match"

    .line 181
    .line 182
    const-string v86, "heartbeat.match.broadcast"

    .line 183
    .line 184
    const-string v87, "quickchat_state.match"

    .line 185
    .line 186
    const-string v88, "quickchat.oneside"

    .line 187
    .line 188
    const-string v89, "quickchat.oneside-delete"

    .line 189
    .line 190
    const-string v90, "avatar.like"

    .line 191
    .line 192
    const-string v91, "suggest.swipe"

    .line 193
    .line 194
    const-string v92, "heartbeat.match.link"

    .line 195
    .line 196
    const-string v93, "quickchat.bubble.chatroom"

    .line 197
    .line 198
    const-string v94, "heartbeat.match.tagFill"

    .line 199
    .line 200
    const-string v95, "chatheat.exchat"

    .line 201
    .line 202
    const-string v96, "voicechat.broadcast"

    .line 203
    .line 204
    const-string v97, "heartbeat.match.recall"

    .line 205
    .line 206
    const-string v98, "extreme_pick.list"

    .line 207
    .line 208
    const-string v99, "extreme_pick.daily"

    .line 209
    .line 210
    const-string v100, "game.woodenfish.update"

    .line 211
    .line 212
    const-string v101, "male.message.repeat"

    .line 213
    .line 214
    const-string v102, "match.tooMany"

    .line 215
    .line 216
    const-string v103, "growth.match.recall"

    .line 217
    .line 218
    const-string v104, "membership.expiration"

    .line 219
    .line 220
    const-string v105, "quickchat.party"

    .line 221
    .line 222
    const-string v106, "user.setting.changed"

    .line 223
    .line 224
    const-string v107, "intl.ai_avatar.status.change"

    .line 225
    .line 226
    const-string v108, "user.picture.tags.changed"

    .line 227
    .line 228
    const-string v109, "user.ctdid.verification"

    .line 229
    .line 230
    const-string v110, "moment-lab.verification.push"

    .line 231
    .line 232
    filled-new-array/range {v2 .. v112}, [Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    invoke-virtual {v0, v1, v2}, Ll/cmb0;->a0(Ll/cmb0$g;Ljava/util/List;)V

    .line 241
    .line 242
    .line 243
    return-void
.end method
