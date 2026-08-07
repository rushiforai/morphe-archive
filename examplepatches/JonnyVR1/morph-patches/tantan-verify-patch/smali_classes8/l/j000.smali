.class public Ll/j000;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ll/uxj0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/f000;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/f000;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 14
    .line 15
    const-string v3, "moment_like"

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->LIKEOFMOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v3, p0}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {v1, v2, p0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-virtual {v0, p0, v1, v2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_0

    .line 51
    .line 52
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 56
    .line 57
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/uxj0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/b000;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/b000;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    invoke-virtual {v1, p0}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 12
    .line 13
    const-string v2, "local_moment_post_guide"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {p0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/j000;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static j(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/c000;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/c000;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/j000;->l(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/d000;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/d000;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/e000;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/e000;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static l(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/i000;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i000;-><init>(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "moment_like"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageReference;->new_()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "like"

    .line 22
    .line 23
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MomentAction;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 28
    .line 29
    iget-object v2, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "moment"

    .line 34
    .line 35
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v1, p1, v0, v2}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance p1, Ll/g000;

    .line 55
    .line 56
    invoke-direct {p1}, Ll/g000;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ll/h000;

    .line 60
    .line 61
    invoke-direct {v0}, Ll/h000;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static n(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/a000;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/a000;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
