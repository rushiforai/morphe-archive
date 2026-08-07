.class public Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/orl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Z

.field public f:Ll/sj6;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->e:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->e:Z

    return-void
.end method

.method public static synthetic B(Ll/sj6;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic M0(Ljava/lang/String;Ll/sj6;Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p2, "chat_guide_button"

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "is_temporary_match"

    .line 8
    .line 9
    const-string v1, "1"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, ","

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v2, "chat_guide_uid"

    .line 50
    .line 51
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    filled-new-array {p2, v0, v1}, [Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const-string v0, "e_chat_guide"

    .line 60
    .line 61
    const-string v1, "p_messages_view"

    .line 62
    .line 63
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    const-string v0, "text"

    .line 71
    .line 72
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 77
    .line 78
    iput-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 79
    .line 80
    iget-object p0, p1, Ll/sj6;->d:Ll/pol;

    .line 81
    .line 82
    iget-object v0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 87
    .line 88
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 89
    .line 90
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 91
    .line 92
    const/4 v3, 0x0

    .line 93
    invoke-virtual {v1, v2, p2, v3}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-interface {p0, v0, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance p2, Ll/qb6;

    .line 102
    .line 103
    invoke-direct {p2, p1}, Ll/qb6;-><init>(Ll/sj6;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->n1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->m1()V

    return-void
.end method

.method public static synthetic d1(Ljava/lang/String;Ll/sj6;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p2, "chat_guide_button"

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ","

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "chat_guide_uid"

    .line 42
    .line 43
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->hasReSwipeConvIceBreak()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    const-string v1, "break_ice"

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const-string v1, "unbreak_ice"

    .line 59
    .line 60
    :goto_0
    const-string v2, "pairing_type"

    .line 61
    .line 62
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    filled-new-array {p2, v0, v1}, [Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    const-string v0, "e_chat_guide"

    .line 71
    .line 72
    const-string v1, "p_messages_view"

    .line 73
    .line 74
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    const-string v0, "text"

    .line 82
    .line 83
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 88
    .line 89
    iput-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 94
    .line 95
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public static synthetic e1(Ll/sj6;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/joa;->L3()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const-string v0, "is_privileged"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "moments_user_id"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "message_tab"

    .line 26
    .line 27
    const-string v2, "lifted"

    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    filled-new-array {p1, v0, v1}, [Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "e_getback_matck"

    .line 38
    .line 39
    const-string v1, "p_messages_view"

    .line 40
    .line 41
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 42
    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/joa;->L3()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 57
    .line 58
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Op(Ljava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    iget-object p0, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    const-string p1, "p_unmatch,getback_match"

    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 71
    .line 72
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public static synthetic f1(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g1(Ljava/lang/String;Ll/sj6;Ljava/util/HashSet;Ljava/util/HashSet;Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p4, "chat_guide_button"

    .line 2
    .line 3
    invoke-static {p4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ","

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "chat_guide_uid"

    .line 42
    .line 43
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    filled-new-array {p4, v0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    const-string v0, "e_chat_guide"

    .line 52
    .line 53
    const-string v1, "p_messages_view"

    .line 54
    .line 55
    invoke-static {v0, v1, p4}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 59
    .line 60
    .line 61
    move-result-object p4

    .line 62
    const-string v0, "text"

    .line 63
    .line 64
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p4, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 69
    .line 70
    iput-object p0, p4, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 71
    .line 72
    iget-object p0, p1, Ll/sj6;->d:Ll/pol;

    .line 73
    .line 74
    iget-object v0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 79
    .line 80
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 81
    .line 82
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    const/4 v3, 0x0

    .line 85
    invoke-virtual {v1, v2, p4, v3}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    invoke-interface {p0, v0, p4}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance p4, Ll/zb6;

    .line 94
    .line 95
    invoke-direct {p4, p2, p1, p3}, Ll/zb6;-><init>(Ljava/util/HashSet;Ll/sj6;Ljava/util/HashSet;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public static synthetic h1(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i1(Ljava/util/HashSet;Ll/sj6;Ljava/util/HashSet;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    iget-object p3, p3, Ll/dkb;->p3:Ll/xyd0;

    .line 13
    .line 14
    invoke-virtual {p3, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    iget-object p0, p0, Ll/dkb;->q3:Ll/xyd0;

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic j1(Ll/sj6;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k1(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u(Ll/sj6;Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p1, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationTag;->emoji:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "chat_guide_button"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ","

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "chat_guide_uid"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v0, "e_chat_guide"

    .line 60
    .line 61
    const-string v1, "p_messages_view"

    .line 62
    .line 63
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const-string v0, "text"

    .line 71
    .line 72
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 77
    .line 78
    iget-object v0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 79
    .line 80
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 83
    .line 84
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationTag;->emoji:Ljava/lang/String;

    .line 85
    .line 86
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v1, p0, Ll/sj6;->d:Ll/pol;

    .line 89
    .line 90
    iget-object v2, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 97
    .line 98
    const/4 v4, 0x0

    .line 99
    invoke-virtual {v3, v0, p1, v4}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-interface {v1, v2, p1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    new-instance v0, Ll/pb6;

    .line 108
    .line 109
    invoke-direct {v0, p0}, Ll/pb6;-><init>(Ll/sj6;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

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


# virtual methods
.method public A(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->w3:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/joa;->L3()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const-string v1, "is_privileged"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 46
    .line 47
    const-string v2, "moments_user_id"

    .line 48
    .line 49
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v2, "message_tab"

    .line 54
    .line 55
    const-string v3, "lifted"

    .line 56
    .line 57
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    filled-new-array {v0, v1, v2}, [Ll/sfj0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "e_getback_matck"

    .line 66
    .line 67
    const-string v2, "p_messages_view"

    .line 68
    .line 69
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ll/nb6;

    .line 73
    .line 74
    invoke-direct {v0, p1}, Ll/nb6;-><init>(Ll/sj6;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-boolean p1, p1, Ll/sj6;->o:Z

    .line 81
    .line 82
    xor-int/lit8 p1, p1, 0x1

    .line 83
    .line 84
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public Q0(Ll/sj6;)V
    .locals 10

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "intlSeeChatRequest"

    .line 22
    .line 23
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 31
    .line 32
    sget v2, Ll/qa00;->w:I

    .line 33
    .line 34
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 38
    .line 39
    const/high16 v2, 0x41600000    # 14.0f

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 45
    .line 46
    sget v2, Ll/dbc0;->f0:I

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 52
    .line 53
    sget v2, Ll/qa00;->j:I

    .line 54
    .line 55
    invoke-static {v0, v2}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 59
    .line 60
    invoke-static {v0, v2}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 64
    .line 65
    invoke-static {v0}, Ll/evf0;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/high16 v2, 0x41400000    # 12.0f

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 75
    .line 76
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 77
    .line 78
    if-lez p1, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 81
    .line 82
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 86
    .line 87
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 101
    .line 102
    sget v0, Ll/qa00;->q:I

    .line 103
    .line 104
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 108
    .line 109
    sget v0, Ll/qa00;->h:I

    .line 110
    .line 111
    invoke-static {p1, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 115
    .line 116
    invoke-static {p1, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 120
    .line 121
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 125
    .line 126
    const-string v0, "\u4eca\u65e5\u63a8\u8350"

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 132
    .line 133
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 137
    .line 138
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 145
    .line 146
    sget v0, Ll/dbc0;->wr:I

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 149
    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_2
    invoke-interface {p0, p1}, Ll/ue6;->q(Ll/sj6;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_3

    .line 158
    .line 159
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 163
    .line 164
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 168
    .line 169
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 173
    .line 174
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 178
    .line 179
    sget v0, Ll/qa00;->q:I

    .line 180
    .line 181
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 185
    .line 186
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 190
    .line 191
    sget v0, Ll/qa00;->h:I

    .line 192
    .line 193
    invoke-static {p1, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 197
    .line 198
    invoke-static {p1, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 202
    .line 203
    sget v0, Ll/dbc0;->wr:I

    .line 204
    .line 205
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 209
    .line 210
    invoke-static {}, Ll/gra;->S()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Qb()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_5

    .line 232
    .line 233
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 234
    .line 235
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitedTrialSee(Ljava/lang/String;)Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-eqz v0, :cond_5

    .line 248
    .line 249
    invoke-static {}, Ll/joa;->M3()Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_5

    .line 254
    .line 255
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 256
    .line 257
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 258
    .line 259
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-nez v0, :cond_5

    .line 268
    .line 269
    sget-object v0, Ll/for;->INSTANCE:Ll/for;

    .line 270
    .line 271
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v4

    .line 275
    const-string v5, "trialEnd"

    .line 276
    .line 277
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v4

    .line 281
    if-nez v4, :cond_4

    .line 282
    .line 283
    const-string v4, "waiting"

    .line 284
    .line 285
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    if-nez v4, :cond_4

    .line 294
    .line 295
    const-string v4, "expired"

    .line 296
    .line 297
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-eqz v0, :cond_5

    .line 306
    .line 307
    :cond_4
    const-string v0, "p_messages,seetrial_recover_one"

    .line 308
    .line 309
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->p1(Ll/sj6;Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    goto/16 :goto_0

    .line 313
    .line 314
    :cond_5
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 315
    .line 316
    invoke-interface {p0, v0}, Ll/ue6;->p0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    if-eqz v0, :cond_a

    .line 321
    .line 322
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 323
    .line 324
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 325
    .line 326
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 327
    .line 328
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestText:Ljava/lang/String;

    .line 329
    .line 330
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-eqz v0, :cond_6

    .line 335
    .line 336
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 337
    .line 338
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 339
    .line 340
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 341
    .line 342
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->emoji:Ljava/lang/String;

    .line 343
    .line 344
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    if-nez v0, :cond_a

    .line 349
    .line 350
    :cond_6
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 351
    .line 352
    iget v4, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 353
    .line 354
    if-gtz v4, :cond_9

    .line 355
    .line 356
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 357
    .line 358
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 359
    .line 360
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 361
    .line 362
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    if-nez v0, :cond_7

    .line 367
    .line 368
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 369
    .line 370
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 371
    .line 372
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 373
    .line 374
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 375
    .line 376
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 377
    .line 378
    .line 379
    move-result v0

    .line 380
    if-nez v0, :cond_9

    .line 381
    .line 382
    invoke-static {}, Ll/pzi0;->o()J

    .line 383
    .line 384
    .line 385
    move-result-wide v4

    .line 386
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 387
    .line 388
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 389
    .line 390
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 391
    .line 392
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 393
    .line 394
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 395
    .line 396
    .line 397
    move-result-wide v6

    .line 398
    const-wide/16 v8, 0x3e8

    .line 399
    .line 400
    mul-long/2addr v6, v8

    .line 401
    cmp-long v0, v4, v6

    .line 402
    .line 403
    if-gez v0, :cond_9

    .line 404
    .line 405
    :cond_7
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 406
    .line 407
    .line 408
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 409
    .line 410
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 411
    .line 412
    .line 413
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 414
    .line 415
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 416
    .line 417
    .line 418
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 419
    .line 420
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 421
    .line 422
    .line 423
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 424
    .line 425
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 426
    .line 427
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 428
    .line 429
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestText:Ljava/lang/String;

    .line 430
    .line 431
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 432
    .line 433
    .line 434
    move-result v0

    .line 435
    if-nez v0, :cond_8

    .line 436
    .line 437
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 438
    .line 439
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 440
    .line 441
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 442
    .line 443
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 444
    .line 445
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestText:Ljava/lang/String;

    .line 446
    .line 447
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    .line 449
    .line 450
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 451
    .line 452
    sget v1, Ll/qa00;->q:I

    .line 453
    .line 454
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 455
    .line 456
    .line 457
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 458
    .line 459
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 460
    .line 461
    .line 462
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 463
    .line 464
    sget v1, Ll/qa00;->h:I

    .line 465
    .line 466
    invoke-static {v0, v1}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 467
    .line 468
    .line 469
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 470
    .line 471
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 472
    .line 473
    .line 474
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 475
    .line 476
    sget v1, Ll/dbc0;->wr:I

    .line 477
    .line 478
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 479
    .line 480
    .line 481
    new-instance v0, Ll/vb6;

    .line 482
    .line 483
    invoke-direct {v0, p1}, Ll/vb6;-><init>(Ll/sj6;)V

    .line 484
    .line 485
    .line 486
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 487
    .line 488
    .line 489
    :cond_8
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 490
    .line 491
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 492
    .line 493
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 494
    .line 495
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->emoji:Ljava/lang/String;

    .line 496
    .line 497
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 498
    .line 499
    .line 500
    move-result v0

    .line 501
    if-nez v0, :cond_f

    .line 502
    .line 503
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 504
    .line 505
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 506
    .line 507
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 508
    .line 509
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 510
    .line 511
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationTag;->emoji:Ljava/lang/String;

    .line 512
    .line 513
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 514
    .line 515
    .line 516
    new-instance v0, Ll/wb6;

    .line 517
    .line 518
    invoke-direct {v0, p1}, Ll/wb6;-><init>(Ll/sj6;)V

    .line 519
    .line 520
    .line 521
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 522
    .line 523
    .line 524
    goto/16 :goto_0

    .line 525
    .line 526
    :cond_9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 527
    .line 528
    .line 529
    goto/16 :goto_0

    .line 530
    .line 531
    :cond_a
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 532
    .line 533
    invoke-interface {p0, v0}, Ll/ue6;->j(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 534
    .line 535
    .line 536
    move-result v0

    .line 537
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 538
    .line 539
    if-eqz v0, :cond_d

    .line 540
    .line 541
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->limitMatchGreetEmoji()Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object v0

    .line 545
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 546
    .line 547
    .line 548
    move-result v2

    .line 549
    if-nez v2, :cond_c

    .line 550
    .line 551
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 552
    .line 553
    .line 554
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 555
    .line 556
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 557
    .line 558
    .line 559
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 560
    .line 561
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 562
    .line 563
    iget v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 564
    .line 565
    if-lez v4, :cond_b

    .line 566
    .line 567
    move v1, v3

    .line 568
    :cond_b
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 569
    .line 570
    .line 571
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 572
    .line 573
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 574
    .line 575
    .line 576
    new-instance v1, Ll/xb6;

    .line 577
    .line 578
    invoke-direct {v1, v0, p1}, Ll/xb6;-><init>(Ljava/lang/String;Ll/sj6;)V

    .line 579
    .line 580
    .line 581
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 582
    .line 583
    .line 584
    goto :goto_0

    .line 585
    :cond_c
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 586
    .line 587
    .line 588
    goto :goto_0

    .line 589
    :cond_d
    invoke-interface {p0, v2}, Ll/ue6;->Z0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 590
    .line 591
    .line 592
    move-result v0

    .line 593
    if-eqz v0, :cond_f

    .line 594
    .line 595
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 596
    .line 597
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->hasRemoveLabel()Z

    .line 598
    .line 599
    .line 600
    move-result v0

    .line 601
    if-nez v0, :cond_f

    .line 602
    .line 603
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 604
    .line 605
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 606
    .line 607
    if-nez v0, :cond_e

    .line 608
    .line 609
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 610
    .line 611
    .line 612
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 613
    .line 614
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 615
    .line 616
    .line 617
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 618
    .line 619
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 620
    .line 621
    .line 622
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 623
    .line 624
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 625
    .line 626
    .line 627
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 628
    .line 629
    .line 630
    move-result-object v0

    .line 631
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 632
    .line 633
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 634
    .line 635
    invoke-virtual {v0, v2, v1}, Ll/n46;->j(Ljava/lang/String;Z)Ljava/lang/String;

    .line 636
    .line 637
    .line 638
    move-result-object v0

    .line 639
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 640
    .line 641
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 642
    .line 643
    .line 644
    new-instance v1, Ll/yb6;

    .line 645
    .line 646
    invoke-direct {v1, v0, p1}, Ll/yb6;-><init>(Ljava/lang/String;Ll/sj6;)V

    .line 647
    .line 648
    .line 649
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 650
    .line 651
    .line 652
    goto :goto_0

    .line 653
    :cond_e
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 654
    .line 655
    .line 656
    :cond_f
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->y0()V

    .line 657
    .line 658
    .line 659
    return-void
.end method

.method public U(Ll/sj6;)V
    .locals 0
    .param p1    # Ll/sj6;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public X0(Ll/sj6;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public bridge synthetic getUserLiveLabelHashMap()Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ue6;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method

.method public final l1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ac6;->a(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->y0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public m0(Ll/sj6;)V
    .locals 2

    .line 1
    const-string v0, "p_messages,seetrial_recover_one"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->p1(Ll/sj6;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/sj6;->P:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Ll/sj6;->P:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 34
    .line 35
    add-int/2addr v1, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->q1(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final m1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->l2:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->y1:Ll/jxd0;

    .line 25
    .line 26
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    const-string v1, "\u70b9\u51fb\u5feb\u6377\u8868\u60c5\u6253\u4e2a\u62db\u547c\n\u66f4\u5bb9\u6613\u5f97\u5230\u56de\u590d\u54e6\uff01"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget v2, Ll/c9c0;->I:I

    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    filled-new-array {v1}, [I

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Ll/c9c0;->N:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v1, 0x1

    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const/high16 v1, 0x41500000    # 13.0f

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x0

    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget v2, Ll/qa00;->h:I

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget v2, Ll/qa00;->j:I

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const-wide/16 v2, 0x1388

    .line 99
    .line 100
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    sget v2, Ll/zvk;->A:I

    .line 105
    .line 106
    sget v3, Ll/zvk;->E:I

    .line 107
    .line 108
    or-int/2addr v2, v3

    .line 109
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    const-string v3, "newUserShowGuidePop"

    .line 118
    .line 119
    invoke-virtual {v2, v0, p0, v3}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    const-string p0, "p_messages_view"

    .line 123
    .line 124
    new-array v0, v1, [Ll/sfj0$a;

    .line 125
    .line 126
    const-string v1, "e_newuser_icebreak_lead1"

    .line 127
    .line 128
    invoke-static {v1, p0, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final synthetic n1(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->performClick()Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final o1()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->l2:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 32
    .line 33
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/g;->l2:Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 41
    .line 42
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->l2:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->e:Z

    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {}, Ll/gra;->I3()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    invoke-static {}, Ll/pzi0;->o()J

    .line 77
    .line 78
    .line 79
    move-result-wide v1

    .line 80
    long-to-double v1, v1

    .line 81
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 82
    .line 83
    sub-double/2addr v1, v3

    .line 84
    const-wide v3, 0x4194997000000000L    # 8.64E7

    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    cmpl-double v0, v1, v3

    .line 90
    .line 91
    if-gtz v0, :cond_4

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->y1:Ll/jxd0;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ljava/lang/Boolean;

    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_4

    .line 110
    .line 111
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->e:Z

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_3
    const/4 v0, 0x1

    .line 117
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->e:Z

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/ob6;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/ob6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;)V

    .line 126
    .line 127
    .line 128
    const-wide/16 v2, 0x7d0

    .line 129
    .line 130
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 131
    .line 132
    .line 133
    :cond_4
    :goto_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->l1(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p1(Ll/sj6;Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 12
    .line 13
    const-string v2, "\u53bb\u6062\u590d"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->q1(I)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/rb6;

    .line 31
    .line 32
    invoke-direct {v0, p1, p2}, Ll/rb6;-><init>(Ll/sj6;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final q1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    .line 11
    sget v0, Ll/qa00;->o:I

    .line 12
    .line 13
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 14
    .line 15
    sget v0, Ll/qa00;->e:I

    .line 16
    .line 17
    neg-int v0, v0

    .line 18
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public bridge synthetic setPicPercent(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/nrl;->setPicPercent(F)V

    return-void
.end method

.method public t0(Ll/sj6;)V
    .locals 10

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    sget v2, Ll/qa00;->k:I

    .line 21
    .line 22
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 23
    .line 24
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 27
    .line 28
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    iget-boolean v1, p1, Ll/sj6;->v:Z

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    goto/16 :goto_2

    .line 36
    .line 37
    :cond_0
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p0, p1}, Ll/ue6;->q(Ll/sj6;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/4 v1, 0x1

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 55
    .line 56
    invoke-static {}, Ll/gra;->S()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    new-instance p1, Ll/tb6;

    .line 64
    .line 65
    invoke-direct {p1}, Ll/tb6;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    invoke-interface {p0, p1}, Ll/ue6;->n0(Ll/sj6;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_5

    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 81
    .line 82
    iget-object v0, v0, Ll/dkb;->p3:Ll/xyd0;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ljava/util/HashSet;

    .line 89
    .line 90
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 93
    .line 94
    iget-object v2, v2, Ll/dkb;->q3:Ll/xyd0;

    .line 95
    .line 96
    invoke-virtual {v2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    check-cast v2, Ljava/util/HashSet;

    .line 101
    .line 102
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 103
    .line 104
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-eqz v3, :cond_5

    .line 111
    .line 112
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 113
    .line 114
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-nez v3, :cond_5

    .line 121
    .line 122
    const-string v8, "\u4f60\u597d\u5440"

    .line 123
    .line 124
    const-string v9, "\u54c8\u55bd"

    .line 125
    .line 126
    const-string v4, "[\u6697\u4e2d\u89c2\u5bdf]"

    .line 127
    .line 128
    const-string v5, "[\u6478\u9526\u9ca4]"

    .line 129
    .line 130
    const-string v6, "[\u6253call]"

    .line 131
    .line 132
    const-string v7, "Hi"

    .line 133
    .line 134
    filled-new-array/range {v4 .. v9}, [Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    new-instance v4, Ljava/util/Random;

    .line 139
    .line 140
    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    .line 141
    .line 142
    .line 143
    const/4 v5, 0x6

    .line 144
    invoke-virtual {v4, v5}, Ljava/util/Random;->nextInt(I)I

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    aget-object v3, v3, v4

    .line 149
    .line 150
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 151
    .line 152
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 153
    .line 154
    iget-object v4, v4, Ll/dkb;->t3:Ll/wyd0;

    .line 155
    .line 156
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    check-cast v4, Ljava/lang/String;

    .line 161
    .line 162
    :try_start_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    if-nez v6, :cond_2

    .line 167
    .line 168
    new-instance v6, Lorg/json/JSONObject;

    .line 169
    .line 170
    invoke-direct {v6, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_2
    new-instance v6, Lorg/json/JSONObject;

    .line 175
    .line 176
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 177
    .line 178
    .line 179
    :goto_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 180
    .line 181
    .line 182
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    iget-object v7, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 184
    .line 185
    if-eqz v4, :cond_3

    .line 186
    .line 187
    :try_start_1
    iget-object v4, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 190
    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_3
    iget-object v4, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 200
    .line 201
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 204
    .line 205
    .line 206
    :goto_1
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 207
    .line 208
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 209
    .line 210
    iget-object v4, v4, Ll/dkb;->t3:Ll/wyd0;

    .line 211
    .line 212
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    invoke-virtual {v4, v6}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 220
    .line 221
    .line 222
    const/16 v1, 0x16

    .line 223
    .line 224
    invoke-static {v1, v5}, Ll/pzi0;->x(II)Z

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    if-eqz v1, :cond_4

    .line 229
    .line 230
    const-string v3, "[\u665a\u5b89]"

    .line 231
    .line 232
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 233
    .line 234
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    .line 236
    .line 237
    const-string v1, "e_chat_guide"

    .line 238
    .line 239
    const-string v4, "p_messages_view"

    .line 240
    .line 241
    const-string v5, "chat_guide_button"

    .line 242
    .line 243
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 244
    .line 245
    .line 246
    move-result-object v5

    .line 247
    const-string v6, "chat_guide_uid"

    .line 248
    .line 249
    new-instance v7, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 252
    .line 253
    .line 254
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 255
    .line 256
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 257
    .line 258
    invoke-virtual {v8}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 259
    .line 260
    .line 261
    move-result-object v8

    .line 262
    iget-object v8, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    const-string v8, ","

    .line 268
    .line 269
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    iget-object v8, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 273
    .line 274
    iget-object v8, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v7

    .line 283
    invoke-static {v6, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 284
    .line 285
    .line 286
    move-result-object v6

    .line 287
    filled-new-array {v5, v6}, [Ll/pf60;

    .line 288
    .line 289
    .line 290
    move-result-object v5

    .line 291
    invoke-static {v1, v4, v5}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 292
    .line 293
    .line 294
    new-instance v1, Ll/ub6;

    .line 295
    .line 296
    invoke-direct {v1, v3, p1, v0, v2}, Ll/ub6;-><init>(Ljava/lang/String;Ll/sj6;Ljava/util/HashSet;Ljava/util/HashSet;)V

    .line 297
    .line 298
    .line 299
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->o1()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 303
    .line 304
    .line 305
    :catch_0
    :cond_5
    :goto_2
    return-void
.end method

.method public y0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/ue6;->Y(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget v2, Lcom/p1/mobile/putong/core/R$string;->lp:I

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/sb6;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/sb6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->f:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p1, 0x1

    .line 19
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->d:Lv/VImage;

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->c:Lv/VText;

    .line 29
    .line 30
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->b:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget p2, Lcom/p1/mobile/putong/core/R$string;->gj:I

    .line 40
    .line 41
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
