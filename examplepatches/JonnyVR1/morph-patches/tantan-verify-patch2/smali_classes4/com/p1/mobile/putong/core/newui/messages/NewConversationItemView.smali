.class public Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;
.super Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;
.source "SourceFile"


# instance fields
.field public w:Ll/kcg0;

.field public x:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public y:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->x:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeat;->new_()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->y:Lrx/subjects/a;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->x:Lrx/subjects/a;

    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeat;->new_()Lcom/p1/mobile/putong/core/data/ChatHeat;

    move-result-object p1

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->y:Lrx/subjects/a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->x:Lrx/subjects/a;

    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeat;->new_()Lcom/p1/mobile/putong/core/data/ChatHeat;

    move-result-object p1

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->y:Lrx/subjects/a;

    return-void
.end method

.method public static synthetic A2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->O3(Ll/pf60;)V

    return-void
.end method

.method public static synthetic B2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->y3(Ll/pf60;)V

    return-void
.end method

.method public static synthetic C2(Ll/pf60;Ll/vg60;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic D2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->J3(Ll/orl;)V

    return-void
.end method

.method public static synthetic E2(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Ll/uxj0;)Ll/ovb0;
    .locals 0

    .line 1
    new-instance p4, Ll/ovb0;

    .line 2
    .line 3
    invoke-direct {p4, p0, p1, p2, p3}, Ll/ovb0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p4
.end method

.method public static synthetic F2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->W3(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic G2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->K3(Ll/pf60;Ll/orl;)V

    return-void
.end method

.method public static synthetic H2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->R3(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Integer;Ll/uxj0;Lcom/p1/mobile/putong/core/data/Message;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p3, p5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic J2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->Y3(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic K2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->L3(Ll/pf60;)V

    return-void
.end method

.method public static synthetic L2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/sj6;Ll/ovb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->H3(Ll/sj6;Ll/ovb0;)V

    return-void
.end method

.method public static synthetic M2(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->h0(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N2(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->d0(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O2(Ll/vg60;)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public static synthetic P2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->U3(Ll/pf60;)V

    return-void
.end method

.method public static synthetic Q2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->f4(Ll/pf60;)V

    return-void
.end method

.method public static synthetic R2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->V3(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S2(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v1, "tantan_verify_toast"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    const-string v1, "live_vip_greet"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 22
    .line 23
    const-string v1, "local_tickle_tip"

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 32
    .line 33
    const-string v1, "soul_test_guide"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 42
    .line 43
    const-string v1, "local_friend_comment_toast"

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 52
    .line 53
    const-string v0, "local_intl_prompt_message_type"

    .line 54
    .line 55
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_0

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const/4 p0, 0x0

    .line 64
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public static synthetic T2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->X3(Ll/orl;)V

    return-void
.end method

.method public static synthetic U2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V2(Ll/pf60;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    check-cast v0, Ll/vg60;

    .line 14
    .line 15
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 27
    .line 28
    iget-object v1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Ll/vg60;

    .line 31
    .line 32
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v1}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Tn(Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/cu20;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/cu20;-><init>(Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 57
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public static synthetic W2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->g4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic X2(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->m(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->D3(Ll/orl;)V

    return-void
.end method

.method public static synthetic a3(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->A(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->T3(Ll/orl;)V

    return-void
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->S3(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->e(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->B3(Ll/orl;)V

    return-void
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->M3(Ll/orl;)V

    return-void
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/sj6;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->I3(Ll/sj6;Ll/pf60;)V

    return-void
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->P3(Ll/orl;)V

    return-void
.end method

.method public static synthetic i3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->E3(Ll/orl;)V

    return-void
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->F3(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic k3(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->P(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->G3(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->e4(Ll/orl;)V

    return-void
.end method

.method public static synthetic n3(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->t0(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->d4(Ll/orl;)V

    return-void
.end method

.method public static synthetic p3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->b4(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->Q3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r3(Ll/vg60;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/pt20;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/pt20;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    return-object p0
.end method

.method public static synthetic s3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->C3(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic t3(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->Q0(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->a4(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic v3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->N3(Ll/pf60;Ll/orl;)V

    return-void
.end method

.method public static synthetic w3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/sj6;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->c4(Ll/sj6;Ll/pf60;)V

    return-void
.end method

.method public static synthetic x3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/sj6;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->z3(Ll/sj6;Ll/pf60;)V

    return-void
.end method

.method public static synthetic y2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/orl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->A3(Ll/orl;)V

    return-void
.end method

.method private synthetic y3(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->x:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic z2(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->Z3(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public final synthetic A3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->P1(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->X0(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C3(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object v1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object v1, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iput-object v1, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ll/vg60;

    .line 18
    .line 19
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 28
    .line 29
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, Ll/vg60;

    .line 32
    .line 33
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 41
    .line 42
    iput-object p1, v0, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 45
    .line 46
    new-instance v0, Ll/bu20;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/bu20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {p0, p1, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic D3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->t0(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->J(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F3(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iput-object p1, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ll/rt20;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/rt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, p1, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic G3(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->k:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H3(Ll/sj6;Ll/ovb0;)V
    .locals 1

    .line 1
    iget-object v0, p2, Ll/ovb0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 4
    .line 5
    iput-object v0, p1, Ll/sj6;->B:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 6
    .line 7
    iget-object v0, p2, Ll/ovb0;->c:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iput-object v0, p1, Ll/sj6;->w:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, p2, Ll/ovb0;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/sj6;->b(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p2, Ll/ovb0;->d:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 23
    .line 24
    iput-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->i:[Ll/kcg0;

    .line 27
    .line 28
    iput-object p2, p1, Ll/sj6;->C:[Ll/kcg0;

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 31
    .line 32
    new-instance v0, Ll/ut20;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/ut20;-><init>(Ll/sj6;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p0, p2, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p0, p1}, Ll/ue6;->S0(Ll/sj6;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic I3(Ll/sj6;Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/pf60;

    .line 5
    .line 6
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 9
    .line 10
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 11
    .line 12
    iput v1, p1, Ll/sj6;->H:I

    .line 13
    .line 14
    move-object v1, v0

    .line 15
    check-cast v1, Ll/pf60;

    .line 16
    .line 17
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 22
    .line 23
    iput-wide v1, p1, Ll/sj6;->G:D

    .line 24
    .line 25
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 28
    .line 29
    iput-object p2, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 30
    .line 31
    check-cast v0, Ll/pf60;

    .line 32
    .line 33
    iget-object p2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p2, Ll/vg60;

    .line 36
    .line 37
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iput p2, p1, Ll/sj6;->N:I

    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 46
    .line 47
    new-instance v0, Ll/zt20;

    .line 48
    .line 49
    invoke-direct {v0, p1}, Ll/zt20;-><init>(Ll/sj6;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p0, p2, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic J3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->m0(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K3(Ll/pf60;Ll/orl;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 10
    .line 11
    invoke-interface {p2, v0, p1, p0}, Ll/orl;->l0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/sj6;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic L3(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/au20;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/au20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic M3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->F0(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic N3(Ll/pf60;Ll/orl;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 10
    .line 11
    invoke-interface {p2, v0, p1, p0}, Ll/orl;->z0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/sj6;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic O3(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/ot20;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/ot20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic P3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->U(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Q3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/marriage/MarriageMsgAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/core/data/Conversation;)Ll/bkj0;
    .locals 5

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 2
    .line 3
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 6
    .line 7
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->jg(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 15
    .line 16
    iget-object v3, v3, Ll/il8;->c:Ll/t600;

    .line 17
    .line 18
    iget-object v4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v3, v4, v0, v1, v2}, Ll/t600;->Z(Ljava/lang/String;DZ)Ll/wzh0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/wzh0$a;->j()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {p0, v0, v1}, Ll/ue6;->R0(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/Message;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p1, v1, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic S3(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iput-object p1, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    return-object p1
.end method

.method public final synthetic T3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->E(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic U3(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    check-cast v2, Ll/bkj0;

    .line 7
    .line 8
    iget-object v2, v2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 11
    .line 12
    iput-object v2, v0, Ll/sj6;->O:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    move-object v2, v1

    .line 15
    check-cast v2, Ll/bkj0;

    .line 16
    .line 17
    iget-object v2, v2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iput-object v2, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    check-cast v1, Ll/bkj0;

    .line 24
    .line 25
    iget-object v1, v1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 28
    .line 29
    iput-object v1, v0, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 30
    .line 31
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iput-object p1, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 38
    .line 39
    new-instance v0, Ll/xt20;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/xt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p0, p1, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic V3(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {p1, p0}, Ll/ue6;->t(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic W3(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic X3(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->d(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y3(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object v1, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object v1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/sj6;->b(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 17
    .line 18
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 21
    .line 22
    iput-object p1, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 25
    .line 26
    new-instance v0, Ll/yt20;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/yt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p0, p1, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p2, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p5, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ll/fcp;->g(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic a4(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget v0, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const/4 v0, 0x1

    .line 12
    new-array v0, v0, [Ljava/lang/CharSequence;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    aput-object p2, v0, v1

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    new-array v2, v2, [Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    check-cast p2, [Ljava/lang/CharSequence;

    .line 40
    .line 41
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance v0, Ll/vt20;

    .line 46
    .line 47
    invoke-direct {v0, p0, p1}, Ll/vt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 55
    .line 56
    .line 57
    return v1
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "theme_type"

    .line 12
    .line 13
    const-string v1, "greet_chat"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "greet_from"

    .line 20
    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0x19

    .line 32
    .line 33
    invoke-static {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g2(Landroid/content/Context;Ljava/lang/String;I[Ll/pf60;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic c4(Ll/sj6;Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iput-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 14
    .line 15
    new-instance v0, Ll/tt20;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/tt20;-><init>(Ll/sj6;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p2, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic d4(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->Q1(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e4(Ll/orl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/orl;->G0(Ll/sj6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f4(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object p1, v0, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/qt20;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/qt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0, p1, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic g4(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getUserLiveLabelHashMap()Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ue6;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method

.method public h4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ZILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sj6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 4
    .line 5
    .line 6
    iput-boolean p4, v0, Ll/sj6;->e:Z

    .line 7
    .line 8
    iput p5, v0, Ll/sj6;->g:I

    .line 9
    .line 10
    iput p5, v0, Ll/sj6;->m:I

    .line 11
    .line 12
    iput-object p3, v0, Ll/sj6;->J:Ll/x20;

    .line 13
    .line 14
    iput-object p2, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 15
    .line 16
    iput-object p6, v0, Ll/sj6;->y:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->i4(Ll/sj6;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public i4(Ll/sj6;)V
    .locals 10

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "NewConversationItemView start id = "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/ue6;->C(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/d79;->U()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "fake_conversation_greeting"

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "fake_conversation_anonymous_greeting"

    .line 50
    .line 51
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    :cond_1
    const/4 v0, 0x0

    .line 58
    iput-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    :cond_2
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 61
    .line 62
    check-cast v0, Ll/u46;

    .line 63
    .line 64
    invoke-interface {v0}, Ll/u46;->l()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput v0, p1, Ll/sj6;->h:I

    .line 69
    .line 70
    const-string v0, "default"

    .line 71
    .line 72
    iput-object v0, p1, Ll/sj6;->j:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 75
    .line 76
    new-instance v1, Ll/ws20;

    .line 77
    .line 78
    invoke-direct {v1, p1}, Ll/ws20;-><init>(Ll/sj6;)V

    .line 79
    .line 80
    .line 81
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 82
    .line 83
    .line 84
    iget-boolean v0, p1, Ll/sj6;->v:Z

    .line 85
    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    :goto_0
    return-void

    .line 89
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->x:Lrx/subjects/a;

    .line 90
    .line 91
    const/4 v1, 0x0

    .line 92
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Ll/d79;->e0()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 114
    .line 115
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->v6(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_4

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 130
    .line 131
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Da(Ljava/lang/String;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    goto :goto_1

    .line 138
    :cond_4
    new-instance v0, Ll/pf60;

    .line 139
    .line 140
    const/4 v1, -0x1

    .line 141
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 146
    .line 147
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    :goto_1
    iget-object v1, p1, Ll/sj6;->d:Ll/pol;

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-interface {v1, v2, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Ll/xs20;

    .line 165
    .line 166
    invoke-direct {v1, p0}, Ll/xs20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 167
    .line 168
    .line 169
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 174
    .line 175
    .line 176
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 185
    .line 186
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 187
    .line 188
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v2, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 199
    .line 200
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 201
    .line 202
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    iget-object v2, p1, Ll/sj6;->d:Ll/pol;

    .line 211
    .line 212
    invoke-interface {p0, v2}, Ll/ue6;->W(Ll/pol;)Z

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    if-eqz v2, :cond_5

    .line 217
    .line 218
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 219
    .line 220
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 221
    .line 222
    iget-object v5, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 223
    .line 224
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 225
    .line 226
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    :goto_2
    move-object v5, v2

    .line 235
    goto :goto_3

    .line 236
    :cond_5
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 237
    .line 238
    invoke-static {v2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    goto :goto_2

    .line 243
    :goto_3
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->x:Lrx/subjects/a;

    .line 244
    .line 245
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v6

    .line 249
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->h:Lrx/subjects/a;

    .line 250
    .line 251
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j:Lrx/subjects/a;

    .line 252
    .line 253
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 254
    .line 255
    .line 256
    move-result-object v8

    .line 257
    new-instance v9, Ll/ys20;

    .line 258
    .line 259
    invoke-direct {v9}, Ll/ys20;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-static/range {v3 .. v9}, Ll/psd0;->v(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/vcj;)Lrx/c;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    new-instance v1, Ll/zs20;

    .line 271
    .line 272
    invoke-direct {v1, p0, p1}, Ll/zs20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/sj6;)V

    .line 273
    .line 274
    .line 275
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 280
    .line 281
    .line 282
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 283
    .line 284
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 285
    .line 286
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->w4(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    return-void
.end method

.method public j4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/sj6;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1, p2}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 11
    .line 12
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 13
    .line 14
    new-instance v0, Ll/fs20;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/fs20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0, p2, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 27
    .line 28
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 41
    .line 42
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 55
    .line 56
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Tn(Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/gs20;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/gs20;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p2, v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-interface {p1, p3, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance p2, Ll/hs20;

    .line 78
    .line 79
    invoke-direct {p2, p0}, Ll/hs20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public k4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ZILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sj6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 7
    .line 8
    iput-boolean p4, v0, Ll/sj6;->e:Z

    .line 9
    .line 10
    iput p5, v0, Ll/sj6;->g:I

    .line 11
    .line 12
    iput p5, v0, Ll/sj6;->m:I

    .line 13
    .line 14
    iput-object p3, v0, Ll/sj6;->J:Ll/x20;

    .line 15
    .line 16
    iput-object p2, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    iput-object p6, v0, Ll/sj6;->y:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ll/d79;->U()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 27
    .line 28
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    const-string p3, "fake_conversation_greeting"

    .line 33
    .line 34
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 41
    .line 42
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    const-string p3, "fake_conversation_anonymous_greeting"

    .line 47
    .line 48
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 55
    .line 56
    const/4 p3, 0x0

    .line 57
    iput-object p3, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 60
    .line 61
    iget-object p3, p1, Ll/sj6;->d:Ll/pol;

    .line 62
    .line 63
    check-cast p3, Ll/u46;

    .line 64
    .line 65
    invoke-interface {p3}, Ll/u46;->l()I

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    iput p3, p1, Ll/sj6;->h:I

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 72
    .line 73
    const-string p3, "default"

    .line 74
    .line 75
    iput-object p3, p1, Ll/sj6;->j:Ljava/lang/String;

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 78
    .line 79
    new-instance p3, Ll/bt20;

    .line 80
    .line 81
    invoke-direct {p3, p0}, Ll/bt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {p0, p1, p3}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 88
    .line 89
    iget-object p3, p1, Ll/sj6;->d:Ll/pol;

    .line 90
    .line 91
    iget-object p1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 96
    .line 97
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p4, p2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-interface {p3, p1, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    new-instance p2, Ll/ct20;

    .line 108
    .line 109
    invoke-direct {p2, p0}, Ll/ct20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 110
    .line 111
    .line 112
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public l4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ZILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sj6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 4
    .line 5
    .line 6
    iput-boolean p4, v0, Ll/sj6;->e:Z

    .line 7
    .line 8
    iput p5, v0, Ll/sj6;->g:I

    .line 9
    .line 10
    iput-object p3, v0, Ll/sj6;->J:Ll/x20;

    .line 11
    .line 12
    iput-object p6, v0, Ll/sj6;->y:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->m4(Ll/sj6;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public m4(Ll/sj6;)V
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 5
    .line 6
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    iget-object v4, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 21
    .line 22
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 31
    .line 32
    iget-wide v5, v3, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->joinedTime:D

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-wide/high16 v5, -0x4010000000000000L    # -1.0

    .line 36
    .line 37
    :goto_0
    invoke-virtual {v2, v4, v5, v6}, Lcom/p1/mobile/putong/core/api/g;->Un(Ljava/lang/String;D)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    new-instance v3, Ll/dt20;

    .line 42
    .line 43
    invoke-direct {v3}, Ll/dt20;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/et20;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/et20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 67
    .line 68
    new-instance v1, Ll/ft20;

    .line 69
    .line 70
    invoke-direct {v1, p1}, Ll/ft20;-><init>(Ll/sj6;)V

    .line 71
    .line 72
    .line 73
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->k:Lrx/subjects/a;

    .line 83
    .line 84
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 91
    .line 92
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 93
    .line 94
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    iget-object v2, p1, Ll/sj6;->r:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_2

    .line 111
    .line 112
    const/4 v2, 0x0

    .line 113
    invoke-static {v2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    :goto_1
    move-object v5, v2

    .line 118
    goto :goto_2

    .line 119
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 122
    .line 123
    iget-object v5, p1, Ll/sj6;->r:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v2, v5}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    goto :goto_1

    .line 134
    :goto_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 137
    .line 138
    iget-object v6, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 139
    .line 140
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v2, v6}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->h:Lrx/subjects/a;

    .line 151
    .line 152
    new-instance v8, Ll/gt20;

    .line 153
    .line 154
    invoke-direct {v8}, Ll/gt20;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-static/range {v3 .. v8}, Ll/psd0;->u(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    new-instance v1, Ll/ht20;

    .line 166
    .line 167
    invoke-direct {v1, p0, p1}, Ll/ht20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/sj6;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public n4(Ll/u46;)V
    .locals 2

    .line 1
    new-instance v0, Ll/sj6;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, v1}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->o4(Ll/sj6;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public o4(Ll/sj6;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 5
    .line 6
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p1, Ll/sj6;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ll/fu20;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Ll/fu20;-><init>(Ll/sj6;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    const-string v3, "-770011"

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/g;->Ap()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    new-instance v4, Ll/gu20;

    .line 49
    .line 50
    invoke-direct {v4}, Ll/gu20;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v2, v3, v4}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/hu20;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/hu20;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/iu20;

    .line 71
    .line 72
    invoke-direct {v1, p0, p1}, Ll/iu20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/sj6;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public p4(Ll/u46;ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u46;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    new-instance v1, Ll/sj6;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, v0}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 21
    .line 22
    iput-object p3, v1, Ll/sj6;->P:Ljava/util/List;

    .line 23
    .line 24
    iput p2, v1, Ll/sj6;->g:I

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 27
    .line 28
    new-instance p3, Ll/mt20;

    .line 29
    .line 30
    invoke-direct {p3, p0}, Ll/mt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p0, p2, p3}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->w:Ll/kcg0;

    .line 37
    .line 38
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 39
    .line 40
    .line 41
    const/4 p2, 0x0

    .line 42
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->w:Ll/kcg0;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 53
    .line 54
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p3, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 63
    .line 64
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 67
    .line 68
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/qu20;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/qu20;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {p3, v0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    invoke-interface {p1, p2, p3}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance p2, Ll/nt20;

    .line 90
    .line 91
    invoke-direct {p2, p0}, Ll/nt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->w:Ll/kcg0;

    .line 103
    .line 104
    return-void
.end method

.method public q4(Ll/u46;I)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->J0:Ll/wyd0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Ll/sj6;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1, v0}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 33
    .line 34
    iput p2, v0, Ll/sj6;->g:I

    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 37
    .line 38
    new-instance v0, Ll/us20;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/us20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p0, p2, v0}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 55
    .line 56
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 65
    .line 66
    iget-object v1, v1, Ll/il8;->m:Ll/mm6;

    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 69
    .line 70
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    new-instance v2, Ll/qu20;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/qu20;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-interface {p1, p2, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance p2, Ll/vs20;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Ll/vs20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 94
    .line 95
    .line 96
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public r4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    new-instance v0, Ll/sj6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 9
    .line 10
    new-instance v1, Ll/is20;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/is20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/js20;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/js20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->cf()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Ll/ks20;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/ks20;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/sb8;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/sb8;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/ls20;

    .line 65
    .line 66
    invoke-direct {v2, p0}, Ll/ls20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 76
    .line 77
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v2, p2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    new-instance v2, Ll/ms20;

    .line 84
    .line 85
    invoke-direct {v2, p0}, Ll/ms20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    new-instance v2, Ll/ns20;

    .line 93
    .line 94
    invoke-direct {v2}, Ll/ns20;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-static {v1, p2, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-interface {p1, v0, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance p2, Ll/os20;

    .line 114
    .line 115
    invoke-direct {p2, p0}, Ll/os20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 116
    .line 117
    .line 118
    new-instance p0, Ll/qs20;

    .line 119
    .line 120
    invoke-direct {p0}, Ll/qs20;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public s4(Lcom/p1/mobile/putong/core/data/Conversation;Ll/dq1;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/sj6;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2, p1}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 13
    .line 14
    iget-object v0, v0, Ll/sj6;->d:Ll/pol;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 21
    .line 22
    iget-object v2, v2, Ll/il8;->c:Ll/t600;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 25
    .line 26
    iget-object v3, v3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ll/t600;->W(Ljava/lang/String;)Ll/wzh0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ll/wzh0$a;->m()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    new-instance v3, Ll/es20;

    .line 39
    .line 40
    invoke-direct {v3, p0}, Ll/es20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/ps20;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/ps20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j:Lrx/subjects/a;

    .line 68
    .line 69
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 90
    .line 91
    iget-object v4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v3}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    new-instance v4, Ll/at20;

    .line 102
    .line 103
    invoke-direct {v4}, Ll/at20;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {v1, v2, v3, v4}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p2, v0, v1}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    new-instance v0, Ll/lt20;

    .line 115
    .line 116
    invoke-direct {v0, p0}, Ll/lt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    new-instance p2, Ll/wt20;

    .line 127
    .line 128
    invoke-direct {p2, p0, p1}, Ll/wt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 132
    .line 133
    .line 134
    new-instance p2, Ll/eu20;

    .line 135
    .line 136
    invoke-direct {p2, p0, p1}, Ll/eu20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public t4(Ll/sj6;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 5
    .line 6
    const-string v0, "svip"

    .line 7
    .line 8
    iput-object v0, p1, Ll/sj6;->j:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 11
    .line 12
    new-instance v1, Ll/rs20;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Ll/rs20;-><init>(Ll/sj6;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 31
    .line 32
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 41
    .line 42
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 43
    .line 44
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    new-instance v4, Ll/ss20;

    .line 51
    .line 52
    invoke-direct {v4}, Ll/ss20;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v2, v3, v4}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/ts20;

    .line 64
    .line 65
    invoke-direct {v1, p0, p1}, Ll/ts20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Ll/sj6;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public u4(Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sj6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 4
    .line 5
    .line 6
    iput-object p5, v0, Ll/sj6;->y:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, v0, Ll/sj6;->J:Ll/x20;

    .line 9
    .line 10
    iput p4, v0, Ll/sj6;->m:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->t4(Ll/sj6;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public v4(Ll/u46;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/sj6;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, p1, v1}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ll/it20;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/it20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->R0:Ll/wyd0;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/hxd0;->obs()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/jt20;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/jt20;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {p1, p2, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Ll/kt20;

    .line 67
    .line 68
    invoke-direct {p2, p0}, Ll/kt20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final w4(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->r1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/n46;->o(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 18
    .line 19
    iget-object v0, v0, Ll/sj6;->d:Ll/pol;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2, p1}, Ll/n46;->i(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {v0, v1, p1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/du20;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/du20;-><init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic z3(Ll/sj6;Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/bkj0;

    .line 5
    .line 6
    iget-object v1, v1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iput-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    check-cast v0, Ll/bkj0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    iput-object v0, p1, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iget-object v0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Ll/pf60;

    .line 23
    .line 24
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Ll/pf60;

    .line 35
    .line 36
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v0, 0x0

    .line 46
    :goto_0
    iput v0, p1, Ll/sj6;->A:I

    .line 47
    .line 48
    iget-object v0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v0, Ll/pf60;

    .line 51
    .line 52
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/sj6;->b(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/pzi0;->o()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 64
    .line 65
    move-object v2, p2

    .line 66
    check-cast v2, Ll/bkj0;

    .line 67
    .line 68
    iget-object v2, v2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 69
    .line 70
    if-nez v2, :cond_3

    .line 71
    .line 72
    iget-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 73
    .line 74
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-eqz p2, :cond_1

    .line 79
    .line 80
    iget-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 81
    .line 82
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 83
    .line 84
    const-string v2, "intlSeeChatRequest"

    .line 85
    .line 86
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    if-eqz p2, :cond_1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    iget-object p0, p1, Ll/sj6;->d:Ll/pol;

    .line 94
    .line 95
    instance-of p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 96
    .line 97
    if-eqz p2, :cond_2

    .line 98
    .line 99
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 100
    .line 101
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->K(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void

    .line 109
    :cond_3
    check-cast p2, Ll/bkj0;

    .line 110
    .line 111
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 114
    .line 115
    iput-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 116
    .line 117
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 118
    .line 119
    new-instance v2, Ll/st20;

    .line 120
    .line 121
    invoke-direct {v2, p1}, Ll/st20;-><init>(Ll/sj6;)V

    .line 122
    .line 123
    .line 124
    invoke-interface {p0, p2, v2}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 125
    .line 126
    .line 127
    invoke-interface {p0, p1}, Ll/ue6;->S0(Ll/sj6;)V

    .line 128
    .line 129
    .line 130
    iget-object p2, p1, Ll/sj6;->d:Ll/pol;

    .line 131
    .line 132
    invoke-interface {p0, p2}, Ll/ue6;->W(Ll/pol;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_4

    .line 137
    .line 138
    iget-object p0, p1, Ll/sj6;->d:Ll/pol;

    .line 139
    .line 140
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 141
    .line 142
    iget-object p2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 143
    .line 144
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 145
    .line 146
    invoke-virtual {p0, p2, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-nez p0, :cond_4

    .line 151
    .line 152
    iget-object p0, p1, Ll/sj6;->d:Ll/pol;

    .line 153
    .line 154
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 155
    .line 156
    iget-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 157
    .line 158
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->K(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string p2, "name = "

    .line 166
    .line 167
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object p2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 171
    .line 172
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    if-eqz p2, :cond_5

    .line 177
    .line 178
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 179
    .line 180
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_5
    const-string p1, ""

    .line 184
    .line 185
    :goto_2
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string p1, "  during = "

    .line 189
    .line 190
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-static {}, Ll/pzi0;->o()J

    .line 194
    .line 195
    .line 196
    move-result-wide p1

    .line 197
    sub-long/2addr p1, v0

    .line 198
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-static {p0}, Ll/ue6;->C(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method
