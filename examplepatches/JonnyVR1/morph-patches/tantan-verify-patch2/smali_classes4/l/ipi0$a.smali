.class public Ll/ipi0$a;
.super Ll/dq1;
.source "SourceFile"

# interfaces
.implements Ll/u46;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ipi0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;",
        "Ll/u46;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Ll/ipi0;


# direct methods
.method public constructor <init>(Ll/ipi0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ipi0$a;->d:Ll/ipi0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 7
    .line 8
    iput-object p1, p0, Ll/ipi0$a;->c:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic p()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ipi0$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ipi0$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ipi0$a;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ipi0$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return p1

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, -0x1

    .line 23
    sparse-switch v0, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :sswitch_0
    const-string v0, "fake_conversation_profile_like_enter"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v1, 0x5

    .line 37
    goto :goto_0

    .line 38
    :sswitch_1
    const-string v0, "fake_conversation_oof_pick"

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const/4 v1, 0x4

    .line 48
    goto :goto_0

    .line 49
    :sswitch_2
    const-string v0, "fake_conversation_profile_featured"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_3

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    const/4 v1, 0x3

    .line 59
    goto :goto_0

    .line 60
    :sswitch_3
    const-string v0, "fake_conversation_surprise_gift_box"

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_4

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    const/4 v1, 0x2

    .line 70
    goto :goto_0

    .line 71
    :sswitch_4
    const-string v0, "fake_conversation_blindbox_enter"

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_5

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    const/4 v1, 0x1

    .line 81
    goto :goto_0

    .line 82
    :sswitch_5
    const-string v0, "fake_conversation_oof_enter"

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-nez p0, :cond_6

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_6
    move v1, p1

    .line 92
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 93
    .line 94
    .line 95
    return p1

    .line 96
    :pswitch_0
    const/16 p0, 0x26

    .line 97
    .line 98
    return p0

    .line 99
    :pswitch_1
    const/16 p0, 0x1e

    .line 100
    .line 101
    return p0

    .line 102
    :pswitch_2
    const/16 p0, 0x25

    .line 103
    .line 104
    return p0

    .line 105
    :pswitch_3
    const/16 p0, 0x24

    .line 106
    .line 107
    return p0

    .line 108
    :pswitch_4
    const/16 p0, 0x22

    .line 109
    .line 110
    return p0

    .line 111
    :pswitch_5
    const/16 p0, 0x1f

    .line 112
    .line 113
    return p0

    .line 114
    nop

    .line 115
    :sswitch_data_0
    .sparse-switch
        -0x63787cb3 -> :sswitch_5
        -0x61b08eff -> :sswitch_4
        0x17db1840 -> :sswitch_3
        0x434adad6 -> :sswitch_2
        0x4f64210c -> :sswitch_1
        0x75dab8d8 -> :sswitch_0
    .end sparse-switch

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    const/16 p0, 0x31

    .line 2
    .line 3
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ipi0$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ipi0$a;->s(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ipi0$a;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    packed-switch p2, :pswitch_data_0

    .line 3
    .line 4
    .line 5
    :pswitch_0
    iget-object p0, p0, Ll/ipi0$a;->d:Ll/ipi0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ipi0;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0, p1, v0}, Ll/ue6;->Z(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :pswitch_1
    sget p2, Ll/kec0;->O1:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :pswitch_2
    sget p2, Ll/kec0;->Q1:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :pswitch_3
    sget p2, Ll/kec0;->I1:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :pswitch_4
    sget p2, Ll/kec0;->J1:I

    .line 26
    .line 27
    :goto_0
    iget-object p0, p0, Ll/ipi0$a;->d:Ll/ipi0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ipi0;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x1e
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_1
    .end packed-switch
.end method

.method public o()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V
    .locals 7

    .line 1
    if-eqz p3, :cond_3

    .line 2
    .line 3
    const/16 p4, 0x22

    .line 4
    .line 5
    if-eq p3, p4, :cond_2

    .line 6
    .line 7
    const/16 p4, 0x1e

    .line 8
    .line 9
    if-eq p3, p4, :cond_1

    .line 10
    .line 11
    const/16 p4, 0x1f

    .line 12
    .line 13
    if-eq p3, p4, :cond_0

    .line 14
    .line 15
    packed-switch p3, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_0
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;

    .line 20
    .line 21
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->i(Lcom/p1/mobile/putong/core/data/Conversation;Ll/pol;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->q(Ll/dq1;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_2
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemSurpriseBoxEntrance;

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemSurpriseBoxEntrance;->f(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->o(Ll/dq1;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->p(Ll/dq1;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->e(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    move-object v0, p1

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 63
    .line 64
    new-instance v3, Ll/hpi0;

    .line 65
    .line 66
    invoke-direct {v3}, Ll/hpi0;-><init>()V

    .line 67
    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    const/4 v6, 0x0

    .line 71
    move-object v1, p0

    .line 72
    move-object v2, p2

    .line 73
    move v5, p4

    .line 74
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->h4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ZILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    nop

    .line 79
    :pswitch_data_0
    .packed-switch 0x24
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public t(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/ipi0$a;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    iget-object p0, p0, Ll/dkb;->C5:Ll/byd0;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 31
    .line 32
    double-to-long v0, v0

    .line 33
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->A2()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public v()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
