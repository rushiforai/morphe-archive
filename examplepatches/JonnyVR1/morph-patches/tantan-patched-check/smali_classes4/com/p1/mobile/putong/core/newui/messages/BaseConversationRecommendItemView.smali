.class public abstract Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;,
        Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public c:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static B(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/vx6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public C()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->s()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public E(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    return-void
.end method

.method public F()V
    .locals 0

    .line 1
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Z)V
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "index"

    .line 4
    .line 5
    const-string v2, "liveId"

    .line 6
    .line 7
    const-string v3, "anchorId"

    .line 8
    .line 9
    const-string v4, "p_messages_view"

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->e:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v3, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->h:I

    .line 26
    .line 27
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    const-string v1, "profile_user_id"

    .line 36
    .line 37
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v9

    .line 43
    const-string v1, "audio_card_type"

    .line 44
    .line 45
    const-string v2, "message_new_match"

    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v10

    .line 51
    const-string v1, "audio_room_type"

    .line 52
    .line 53
    const-string v2, "normal_audio"

    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v11

    .line 59
    const-string v1, "audio_tab_id"

    .line 60
    .line 61
    const-string v2, "NA"

    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v12

    .line 67
    const-string v1, "topic_id"

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->k:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v13

    .line 75
    filled-new-array/range {v6 .. v13}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, "e_live_audio_room_enter"

    .line 80
    .line 81
    invoke-static {v1, v4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_0
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v2, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->h:I

    .line 98
    .line 99
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    const-string v1, "show_label"

    .line 108
    .line 109
    const-string v2, ""

    .line 110
    .line 111
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v9

    .line 115
    const-string v1, "module"

    .line 116
    .line 117
    const-string v3, "new_match"

    .line 118
    .line 119
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object v10

    .line 123
    const-string v1, "live_room_live_type"

    .line 124
    .line 125
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->v(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object v11

    .line 133
    const-string v0, "trace_id"

    .line 134
    .line 135
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object v12

    .line 139
    const-string v0, "right_recommend_type"

    .line 140
    .line 141
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v13

    .line 145
    const-string v0, "live_status"

    .line 146
    .line 147
    const-string v1, "on"

    .line 148
    .line 149
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 150
    .line 151
    .line 152
    move-result-object v14

    .line 153
    const-string v0, "liveRecommendCategory"

    .line 154
    .line 155
    const-string v1, "basic"

    .line 156
    .line 157
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object v15

    .line 161
    filled-new-array/range {v6 .. v15}, [Ll/pf60;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const-string v1, "e_live_room_enter"

    .line 166
    .line 167
    invoke-static {v1, v4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Z)V
    .locals 10

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->d:Ljava/util/Set;

    .line 8
    .line 9
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->d:Ljava/util/Set;

    .line 20
    .line 21
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    const-string v0, "moments_user_id"

    .line 27
    .line 28
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v0, "profile_photo_number"

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->w(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {v0, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string p1, "chat_recommend_reason"

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->u(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 62
    .line 63
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v0, ""

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v1, "recommend_photo_distance"

    .line 78
    .line 79
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    if-eqz p3, :cond_2

    .line 84
    .line 85
    const-string v0, "audio_avatar_frame"

    .line 86
    .line 87
    :cond_2
    const-string p1, "equipment_type"

    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    iget p1, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 94
    .line 95
    const/16 p3, 0x15

    .line 96
    .line 97
    if-ne p1, p3, :cond_3

    .line 98
    .line 99
    const-string p1, "1"

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    const-string p1, "0"

    .line 103
    .line 104
    :goto_0
    const-string p3, "is_female_new_recommend"

    .line 105
    .line 106
    invoke-static {p3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    const-string p1, "is_close_friend"

    .line 111
    .line 112
    iget p2, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->v:I

    .line 113
    .line 114
    invoke-static {p1, p2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 115
    .line 116
    .line 117
    move-result-object v8

    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 121
    .line 122
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 123
    .line 124
    invoke-static {p0, p1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string p1, "user_active_time"

    .line 129
    .line 130
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    filled-new-array/range {v2 .. v9}, [Ll/sfj0$a;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    const-string p1, "e_current_online_photo"

    .line 139
    .line 140
    const-string p2, "p_messages_view"

    .line 141
    .line 142
    invoke-static {p1, p2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 143
    .line 144
    .line 145
    :cond_4
    :goto_1
    return-void
.end method

.method public p()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public s()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 12
    .line 13
    const-string v1, "dismissed"

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 24
    .line 25
    const-string v1, "local_fake"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 36
    .line 37
    const-string v1, "blocked"

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 48
    .line 49
    const-string v1, "removed"

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 60
    .line 61
    const-string v1, "invisible"

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 72
    .line 73
    const-string v0, "deleted"

    .line 74
    .line 75
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_1

    .line 80
    .line 81
    :cond_0
    const/4 p0, 0x1

    .line 82
    return p0

    .line 83
    :cond_1
    const/4 p0, 0x0

    .line 84
    return p0
.end method

.method public u(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 13
    .line 14
    const/4 p1, 0x3

    .line 15
    if-eq p0, p1, :cond_4

    .line 16
    .line 17
    const/4 p1, 0x4

    .line 18
    if-eq p0, p1, :cond_3

    .line 19
    .line 20
    const/4 p1, 0x5

    .line 21
    if-eq p0, p1, :cond_2

    .line 22
    .line 23
    const/4 p1, 0x6

    .line 24
    if-eq p0, p1, :cond_1

    .line 25
    .line 26
    const-string p0, ""

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    const-string p0, "new_match"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    const-string p0, "nearby"

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    const-string p0, "recent_contact"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_4
    const-string p0, "active"

    .line 39
    .line 40
    return-object p0
.end method

.method public v(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Dr(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public w(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->L()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_2

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {p0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    add-int/lit8 p1, p1, -0x1

    .line 29
    .line 30
    :cond_1
    return p1

    .line 31
    :cond_2
    :goto_0
    const/4 p0, -0x1

    .line 32
    return p0
.end method

.method public z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->i:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-static {}, Ll/gra;->k2()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 32
    .line 33
    const-string v0, "blocked"

    .line 34
    .line 35
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_2

    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    invoke-static {}, Ll/pzi0;->o()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    long-to-double v0, v0

    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 57
    .line 58
    iget-wide v2, p2, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 59
    .line 60
    sub-double/2addr v0, v2

    .line 61
    const-wide v2, 0x41124f8000000000L    # 300000.0

    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    cmpg-double p2, v0, v2

    .line 67
    .line 68
    if-gez p2, :cond_2

    .line 69
    .line 70
    const-string p0, "\u5f53\u524d\u5728\u7ebf"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_2
    iget p2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 74
    .line 75
    const/4 v0, 0x3

    .line 76
    if-eq p2, v0, :cond_9

    .line 77
    .line 78
    const/4 v0, 0x4

    .line 79
    if-eq p2, v0, :cond_8

    .line 80
    .line 81
    const/4 v0, 0x5

    .line 82
    if-eq p2, v0, :cond_5

    .line 83
    .line 84
    const/4 v0, 0x6

    .line 85
    if-eq p2, v0, :cond_4

    .line 86
    .line 87
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->c:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-nez p2, :cond_3

    .line 94
    .line 95
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->c:Ljava/lang/String;

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 101
    .line 102
    return-object p0

    .line 103
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    sget p1, Lcom/p1/mobile/putong/core/R$string;->e2:I

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0

    .line 114
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 115
    .line 116
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 117
    .line 118
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 119
    .line 120
    const/16 p2, 0x3e8

    .line 121
    .line 122
    if-ge p1, p2, :cond_6

    .line 123
    .line 124
    new-instance p1, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 132
    .line 133
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 134
    .line 135
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string p0, " m"

    .line 139
    .line 140
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    return-object p0

    .line 148
    :cond_6
    const/16 v0, 0x1388

    .line 149
    .line 150
    if-le p1, v0, :cond_7

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Dh:I

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0

    .line 163
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 171
    .line 172
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 173
    .line 174
    div-int/2addr p0, p2

    .line 175
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string p0, " km"

    .line 179
    .line 180
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    return-object p0

    .line 188
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    sget p1, Lcom/p1/mobile/putong/core/R$string;->i1:I

    .line 193
    .line 194
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    return-object p0

    .line 199
    :cond_9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 200
    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 202
    .line 203
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 204
    .line 205
    invoke-static {p0, p1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    return-object p0
.end method
