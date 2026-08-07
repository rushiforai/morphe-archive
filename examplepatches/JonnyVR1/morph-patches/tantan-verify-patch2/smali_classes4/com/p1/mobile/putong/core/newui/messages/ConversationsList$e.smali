.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;
.super Ll/dq1;
.source "SourceFile"

# interfaces
.implements Ll/u46;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
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

.field public d:Lcom/p1/mobile/putong/core/newui/messages/a;

.field public e:Z

.field public f:Lcom/p1/mobile/putong/data/Links;

.field public g:Z

.field public final h:Ll/dpr;

.field public final i:I

.field public final j:I

.field public final synthetic k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->e:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->g:Z

    .line 14
    .line 15
    new-instance v0, Ll/dpr;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 18
    .line 19
    new-instance v1, Ll/tq6;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/tq6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x4

    .line 25
    invoke-direct {v0, p1, v1, v2}, Ll/dpr;-><init>(Landroid/widget/ListView;Ll/y20;I)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->h:Ll/dpr;

    .line 29
    .line 30
    const-string p1, "#4c4c4c"

    .line 31
    .line 32
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->i:I

    .line 37
    .line 38
    const-string p1, "#999999"

    .line 39
    .line 40
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->j:I

    .line 45
    .line 46
    return-void
.end method

.method private synthetic G(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItem(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 21
    .line 22
    invoke-static {}, Ll/gra;->V1()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-static {p0}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 58
    .line 59
    invoke-static {p0}, Ll/vx6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->G(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->H(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic t(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->F(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A()I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->C(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public B()Lcom/p1/mobile/putong/core/newui/messages/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public C(Lcom/p1/mobile/putong/core/data/Conversation;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-nez v0, :cond_c

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->k()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    move v2, v0

    .line 27
    move v3, v1

    .line 28
    move v4, v3

    .line 29
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getCount()I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-ge v2, v5, :cond_9

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItemViewType(I)I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    if-eqz v5, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItemViewType(I)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    const/16 v6, 0x10

    .line 46
    .line 47
    if-eq v5, v6, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItemViewType(I)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    const/16 v6, 0xb

    .line 54
    .line 55
    if-eq v5, v6, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItemViewType(I)I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    const/16 v6, 0x17

    .line 62
    .line 63
    if-ne v5, v6, :cond_b

    .line 64
    .line 65
    :cond_1
    sub-int v5, v2, v0

    .line 66
    .line 67
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    check-cast v5, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    if-eqz v6, :cond_2

    .line 80
    .line 81
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v7, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v6

    .line 89
    if-eqz v6, :cond_2

    .line 90
    .line 91
    move v4, v2

    .line 92
    :cond_2
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 93
    .line 94
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    if-nez v6, :cond_3

    .line 99
    .line 100
    iget-boolean v6, v5, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 101
    .line 102
    if-eqz v6, :cond_7

    .line 103
    .line 104
    :cond_3
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 105
    .line 106
    const-string v7, "conversation_feed_state"

    .line 107
    .line 108
    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-eqz v6, :cond_4

    .line 113
    .line 114
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    if-eqz v6, :cond_7

    .line 121
    .line 122
    :cond_4
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    const-string v7, "conversation_feed_interaction"

    .line 125
    .line 126
    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v6

    .line 130
    if-eqz v6, :cond_5

    .line 131
    .line 132
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 133
    .line 134
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    if-eqz v6, :cond_7

    .line 139
    .line 140
    :cond_5
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 141
    .line 142
    const-string v7, "conversation_feed_featured"

    .line 143
    .line 144
    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    if-eqz v6, :cond_6

    .line 149
    .line 150
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 151
    .line 152
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    if-eqz v6, :cond_7

    .line 157
    .line 158
    :cond_6
    iget v5, v5, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 159
    .line 160
    if-lez v5, :cond_b

    .line 161
    .line 162
    :cond_7
    if-gez v3, :cond_8

    .line 163
    .line 164
    move v3, v2

    .line 165
    :cond_8
    if-nez p1, :cond_a

    .line 166
    .line 167
    :cond_9
    move v2, v1

    .line 168
    goto :goto_2

    .line 169
    :cond_a
    if-le v2, v4, :cond_b

    .line 170
    .line 171
    if-ltz v4, :cond_b

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_b
    add-int/lit8 v2, v2, 0x1

    .line 175
    .line 176
    goto/16 :goto_1

    .line 177
    .line 178
    :cond_c
    move v2, v1

    .line 179
    move v3, v2

    .line 180
    :goto_2
    if-ltz v2, :cond_d

    .line 181
    .line 182
    return v2

    .line 183
    :cond_d
    if-ltz v3, :cond_e

    .line 184
    .line 185
    return v3

    .line 186
    :cond_e
    return v1
.end method

.method public final D()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public E()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->G0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->j1:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->j1:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 20
    .line 21
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->j1:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->F()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->g:Z

    .line 38
    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final synthetic F(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->j1:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->j1:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getCurrentSortType()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getCurrentSortType()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->g0(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->y(ILjava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic H(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 6
    .line 7
    iget-boolean v0, v0, Ll/p560;->a:Z

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 12
    .line 13
    instance-of v1, v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v1, Ll/wq6;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/wq6;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-ltz p1, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->v2()V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_0
    return-void
.end method

.method public final I()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v2, 0x0

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 34
    .line 35
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1:Z

    .line 36
    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return v2

    .line 41
    :cond_1
    :goto_0
    return v1
.end method

.method public final J()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v2, 0x0

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 34
    .line 35
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1:Z

    .line 36
    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return v2

    .line 41
    :cond_1
    :goto_0
    return v1
.end method

.method public K(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/vq6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/vq6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public L(Ljava/util/List;ZI)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;ZI)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->g:Z

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getCurrentSortType()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 20
    .line 21
    new-instance v2, Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 22
    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 24
    .line 25
    invoke-direct {v2, v3, p0, p3}, Lcom/p1/mobile/putong/core/newui/messages/a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;I)V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 29
    .line 30
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 31
    .line 32
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->M0:Lrx/subjects/a;

    .line 33
    .line 34
    sget-object v2, Ll/uxj0;->a:Ll/uxj0;

    .line 35
    .line 36
    invoke-virtual {p3, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    const/4 p3, 0x6

    .line 40
    const/4 v2, 0x1

    .line 41
    if-eq v1, p3, :cond_1

    .line 42
    .line 43
    const/4 p3, 0x7

    .line 44
    if-eq v1, p3, :cond_1

    .line 45
    .line 46
    const/16 p3, 0x8

    .line 47
    .line 48
    if-eq v1, p3, :cond_1

    .line 49
    .line 50
    const/16 p3, 0xb

    .line 51
    .line 52
    if-eq v1, p3, :cond_1

    .line 53
    .line 54
    move p3, v2

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    move p3, v0

    .line 57
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 58
    .line 59
    invoke-virtual {v1, p3}, Lcom/p1/mobile/putong/core/newui/messages/a;->s(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 63
    .line 64
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 69
    .line 70
    if-eqz v1, :cond_2

    .line 71
    .line 72
    iget-object v1, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setFooterDividersEnabled(Z)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    iget-object v0, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->I()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    xor-int/2addr v1, v2

    .line 85
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setFooterDividersEnabled(Z)V

    .line 86
    .line 87
    .line 88
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 89
    .line 90
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->g1:Z

    .line 91
    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    sub-int/2addr p1, v2

    .line 99
    sput p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->r1:I

    .line 100
    .line 101
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->h:Ll/dpr;

    .line 102
    .line 103
    invoke-virtual {p1}, Ll/dpr;->f()V

    .line 104
    .line 105
    .line 106
    if-nez p3, :cond_4

    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 109
    .line 110
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_4

    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->C2()V

    .line 119
    .line 120
    .line 121
    :cond_4
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 127
    .line 128
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->i0(Z)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public M(Ljava/util/List;Z)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->g:Z

    .line 3
    .line 4
    invoke-static {}, Ll/gra;->w3()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->t()V

    .line 13
    .line 14
    .line 15
    :cond_0
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance p2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 29
    .line 30
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->v2()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final N(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setFooterDividersEnabled(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getCurrentSortType()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Lcom/p1/mobile/putong/core/R$string;->x1:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v2, Ll/adc0;->X4:I

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lv/VImage;

    .line 40
    .line 41
    sget v3, Ll/dbc0;->f6:I

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 44
    .line 45
    .line 46
    const/4 v2, 0x7

    .line 47
    if-ne v0, v2, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget v0, Lcom/p1/mobile/putong/core/R$string;->bk:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const/16 v2, 0x8

    .line 67
    .line 68
    if-ne v0, v2, :cond_1

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget v0, Lcom/p1/mobile/putong/core/R$string;->ck:I

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    goto :goto_0

    .line 87
    :cond_1
    const/16 p0, 0xb

    .line 88
    .line 89
    if-ne v0, p0, :cond_2

    .line 90
    .line 91
    const-string v1, "\u5f53\u524d\u6ca1\u6709\u5f02\u5e38\u7684\u4f1a\u8bdd"

    .line 92
    .line 93
    :cond_2
    :goto_0
    sget p0, Ll/adc0;->Z4:I

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Lv/VText;

    .line 100
    .line 101
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_3

    .line 106
    .line 107
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    :cond_3
    return-void
.end method

.method public final O(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setFooterDividersEnabled(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getCurrentSortType()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sget v2, Ll/adc0;->y3:I

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 24
    .line 25
    sget v3, Ll/adc0;->B3:I

    .line 26
    .line 27
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lv/VText;

    .line 32
    .line 33
    sget v4, Ll/adc0;->L0:I

    .line 34
    .line 35
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lv/VText;

    .line 40
    .line 41
    const/4 v4, 0x2

    .line 42
    const-string v5, "p_messages_view"

    .line 43
    .line 44
    if-ne v0, v4, :cond_0

    .line 45
    .line 46
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 47
    .line 48
    sget v4, Ll/dbc0;->nf:I

    .line 49
    .line 50
    invoke-virtual {v0, v2, v4}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 51
    .line 52
    .line 53
    const-string v0, "\u597d\u53cb\u5747\u672a\u5728\u7ebf"

    .line 54
    .line 55
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    const-string v0, "\u67e5\u770b\u5168\u90e8\u914d\u5bf9"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$a;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    const-string p0, "e_all_match_click"

    .line 75
    .line 76
    invoke-static {p0, v5}, Ll/sfj0;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_0
    const/4 v4, 0x6

    .line 81
    if-ne v0, v4, :cond_1

    .line 82
    .line 83
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 84
    .line 85
    sget v4, Ll/dbc0;->mf:I

    .line 86
    .line 87
    invoke-virtual {v0, v2, v4}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 88
    .line 89
    .line 90
    const-string v0, "\u4f60\u8fd8\u6ca1\u6709\u52a0\u5165\u6216\u521b\u5efa\u7fa4\u804a"

    .line 91
    .line 92
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    const-string v0, "\u53d1\u73b0\u66f4\u591a\u7fa4\u804a"

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$b;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    const-string p0, "e_more_groups_click"

    .line 112
    .line 113
    invoke-static {p0, v5}, Ll/sfj0;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    return-void
.end method

.method public final P(Landroid/view/View;)V
    .locals 5

    .line 1
    sget v0, Ll/adc0;->X4:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VImage;

    .line 8
    .line 9
    sget v1, Ll/adc0;->a5:I

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lv/VText;

    .line 16
    .line 17
    sget v2, Ll/adc0;->Z4:I

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lv/VText;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->i:I

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->j:I

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    sget v3, Ll/dbc0;->Vq:I

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 55
    .line 56
    .line 57
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 60
    .line 61
    .line 62
    sget v3, Lcom/p1/mobile/putong/core/R$string;->wr:I

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 65
    .line 66
    .line 67
    sget v3, Lcom/p1/mobile/putong/core/R$string;->vr:I

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    sget v3, Ll/dbc0;->qu:I

    .line 74
    .line 75
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 76
    .line 77
    .line 78
    sget v3, Lcom/p1/mobile/putong/core/R$string;->g2:I

    .line 79
    .line 80
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 81
    .line 82
    .line 83
    sget v3, Lcom/p1/mobile/putong/core/R$string;->f2:I

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 86
    .line 87
    .line 88
    :goto_0
    sget v3, Ll/adc0;->Y4:I

    .line 89
    .line 90
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Lv/VText;

    .line 95
    .line 96
    sget v4, Ll/adc0;->Dd:I

    .line 97
    .line 98
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    check-cast p1, Lv/VFrame;

    .line 103
    .line 104
    const/4 v4, 0x0

    .line 105
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->J()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->J()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->J()Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    :cond_2
    :goto_1
    return-void
.end method

.method public Q(Ll/vg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->g:Z

    .line 10
    .line 11
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 14
    .line 15
    iget-object v1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    :cond_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->e:Z

    .line 47
    .line 48
    iget-object v0, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const/4 p1, 0x0

    .line 62
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->f:Lcom/p1/mobile/putong/data/Links;

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->h:Ll/dpr;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/dpr;->f()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->h:Ll/dpr;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/dpr;->e(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-lez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    sub-int/2addr v0, p1

    .line 44
    const/4 p1, 0x1

    .line 45
    if-gt v0, p1, :cond_1

    .line 46
    .line 47
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->e:Z

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->f:Lcom/p1/mobile/putong/data/Links;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->f:Lcom/p1/mobile/putong/data/Links;

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->fn(Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 66
    .line 67
    .line 68
    :cond_1
    :goto_0
    return-void
.end method

.method public getCount()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {}, Ll/gra;->w3()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/a;->k()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    add-int/2addr v0, p0

    .line 46
    :cond_1
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getCurrentSortType()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/4 v2, 0x6

    .line 70
    if-eq v0, v2, :cond_3

    .line 71
    .line 72
    const/4 v2, 0x7

    .line 73
    if-eq v0, v2, :cond_3

    .line 74
    .line 75
    const/16 v2, 0x8

    .line 76
    .line 77
    if-eq v0, v2, :cond_3

    .line 78
    .line 79
    const/16 v2, 0xb

    .line 80
    .line 81
    if-ne v0, v2, :cond_4

    .line 82
    .line 83
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    add-int/2addr v0, p0

    .line 96
    return v0

    .line 97
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_5

    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->k()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    goto :goto_0

    .line 112
    :cond_5
    const/4 v0, 0x0

    .line 113
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    add-int/2addr v0, v2

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->I()Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-eqz p0, :cond_6

    .line 125
    .line 126
    add-int/2addr v0, v1

    .line 127
    :cond_6
    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Ll/gra;->w3()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return-object v1

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-ge p1, v0, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_2
    return-object v1

    .line 54
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->k()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    goto :goto_0

    .line 69
    :cond_4
    const/4 v0, 0x0

    .line 70
    :goto_0
    if-ge p1, v0, :cond_5

    .line 71
    .line 72
    return-object v1

    .line 73
    :cond_5
    sub-int/2addr p1, v0

    .line 74
    if-ltz p1, :cond_6

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-ge p1, v0, :cond_6

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_6
    return-object v1
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    return v1

    .line 22
    :cond_0
    const/16 p0, 0x9

    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-static {}, Ll/gra;->w3()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/16 v2, 0x2a

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->k()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    :cond_2
    return v2

    .line 56
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getCurrentSortType()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 65
    .line 66
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    const/4 v3, 0x0

    .line 71
    if-eqz v2, :cond_5

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    invoke-static {}, Ll/gra;->w3()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_5

    .line 84
    .line 85
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 86
    .line 87
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/a;->k()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    goto :goto_0

    .line 92
    :cond_5
    move v2, v3

    .line 93
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 94
    .line 95
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    const/16 v5, 0xb

    .line 100
    .line 101
    const/4 v6, 0x7

    .line 102
    if-eqz v4, :cond_7

    .line 103
    .line 104
    if-nez p1, :cond_7

    .line 105
    .line 106
    const/4 v4, 0x6

    .line 107
    if-eq v0, v4, :cond_6

    .line 108
    .line 109
    if-eq v0, v6, :cond_6

    .line 110
    .line 111
    if-eq v0, v5, :cond_6

    .line 112
    .line 113
    if-ne v0, v1, :cond_7

    .line 114
    .line 115
    :cond_6
    const/16 p0, 0xc

    .line 116
    .line 117
    return p0

    .line 118
    :cond_7
    if-ltz p1, :cond_8

    .line 119
    .line 120
    if-ge p1, v2, :cond_8

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/a;->l(I)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    return p0

    .line 129
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->I()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_9

    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getCount()I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    add-int/lit8 v0, v0, -0x1

    .line 140
    .line 141
    if-ne p1, v0, :cond_9

    .line 142
    .line 143
    const/4 p0, 0x3

    .line 144
    return p0

    .line 145
    :cond_9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItem(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    instance-of v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 150
    .line 151
    if-eqz v0, :cond_1e

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItem(I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 160
    .line 161
    const-string v0, "dismissed"

    .line 162
    .line 163
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-eqz p1, :cond_a

    .line 168
    .line 169
    return v6

    .line 170
    :cond_a
    invoke-static {p0}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-eqz p1, :cond_b

    .line 175
    .line 176
    return v5

    .line 177
    :cond_b
    invoke-static {p0}, Ll/fcp;->k(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-eqz p1, :cond_c

    .line 182
    .line 183
    const/16 p0, 0xa

    .line 184
    .line 185
    return p0

    .line 186
    :cond_c
    const-string p1, "feedstate"

    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 189
    .line 190
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-eqz p1, :cond_d

    .line 195
    .line 196
    const/16 p0, 0x10

    .line 197
    .line 198
    return p0

    .line 199
    :cond_d
    const-string p1, "virtualvoice"

    .line 200
    .line 201
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_e

    .line 208
    .line 209
    const/16 p0, 0x17

    .line 210
    .line 211
    return p0

    .line 212
    :cond_e
    const-string p1, "fakeReceiveLikeGuideSVip"

    .line 213
    .line 214
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 215
    .line 216
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    if-eqz p1, :cond_f

    .line 221
    .line 222
    const/16 p0, 0x1b

    .line 223
    .line 224
    return p0

    .line 225
    :cond_f
    const-string p1, "liveactivites"

    .line 226
    .line 227
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    if-eqz p1, :cond_10

    .line 234
    .line 235
    const/16 p0, 0x1d

    .line 236
    .line 237
    return p0

    .line 238
    :cond_10
    const-string p1, "fakeIntlReceiveLikeGuideSVip"

    .line 239
    .line 240
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 241
    .line 242
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    if-eqz p1, :cond_11

    .line 247
    .line 248
    const/16 p0, 0x29

    .line 249
    .line 250
    return p0

    .line 251
    :cond_11
    const-string p1, "local_instant_chat_guide"

    .line 252
    .line 253
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 254
    .line 255
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_12

    .line 260
    .line 261
    const/16 p0, 0x2d

    .line 262
    .line 263
    return p0

    .line 264
    :cond_12
    const-string p1, "fake_conversation_oof_pick"

    .line 265
    .line 266
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 267
    .line 268
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    if-eqz p1, :cond_13

    .line 273
    .line 274
    const/16 p0, 0x1e

    .line 275
    .line 276
    return p0

    .line 277
    :cond_13
    const-string p1, "fake_conversation_oof_enter"

    .line 278
    .line 279
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 280
    .line 281
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    if-eqz p1, :cond_14

    .line 286
    .line 287
    const/16 p0, 0x1f

    .line 288
    .line 289
    return p0

    .line 290
    :cond_14
    const-string p1, "fake_conversation_profile_featured"

    .line 291
    .line 292
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 293
    .line 294
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    if-eqz p1, :cond_15

    .line 299
    .line 300
    const/16 p0, 0x25

    .line 301
    .line 302
    return p0

    .line 303
    :cond_15
    invoke-static {p0}, Ll/ue6;->C0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    if-eqz p1, :cond_16

    .line 308
    .line 309
    const/16 p0, 0x20

    .line 310
    .line 311
    return p0

    .line 312
    :cond_16
    const-string p1, "fake_conversation_blindbox_enter"

    .line 313
    .line 314
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 315
    .line 316
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 317
    .line 318
    .line 319
    move-result p1

    .line 320
    if-eqz p1, :cond_17

    .line 321
    .line 322
    const/16 p0, 0x22

    .line 323
    .line 324
    return p0

    .line 325
    :cond_17
    const-string p1, "fake_conversation_surprise_gift_box"

    .line 326
    .line 327
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 328
    .line 329
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    if-eqz p1, :cond_18

    .line 334
    .line 335
    const/16 p0, 0x24

    .line 336
    .line 337
    return p0

    .line 338
    :cond_18
    const-string p1, "fake_conversation_local_summary_marriage_conversation"

    .line 339
    .line 340
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 341
    .line 342
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 343
    .line 344
    .line 345
    move-result p1

    .line 346
    if-eqz p1, :cond_19

    .line 347
    .line 348
    const/16 p0, 0x28

    .line 349
    .line 350
    return p0

    .line 351
    :cond_19
    const-string p1, "fake_conversation_profile_like_enter"

    .line 352
    .line 353
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 354
    .line 355
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 356
    .line 357
    .line 358
    move-result p1

    .line 359
    if-eqz p1, :cond_1a

    .line 360
    .line 361
    const/16 p0, 0x26

    .line 362
    .line 363
    return p0

    .line 364
    :cond_1a
    const-string p1, "fake_conversation_fold_conversation"

    .line 365
    .line 366
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 367
    .line 368
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 369
    .line 370
    .line 371
    move-result p1

    .line 372
    if-eqz p1, :cond_1b

    .line 373
    .line 374
    const/16 p0, 0x27

    .line 375
    .line 376
    return p0

    .line 377
    :cond_1b
    const-string p1, "fake_conversation_weaken_conversation"

    .line 378
    .line 379
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 380
    .line 381
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 382
    .line 383
    .line 384
    move-result p1

    .line 385
    if-eqz p1, :cond_1c

    .line 386
    .line 387
    const/16 p0, 0x2e

    .line 388
    .line 389
    return p0

    .line 390
    :cond_1c
    const-string p1, "fake_conversation_local_team_group_conversation"

    .line 391
    .line 392
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 393
    .line 394
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 395
    .line 396
    .line 397
    move-result p1

    .line 398
    if-eqz p1, :cond_1d

    .line 399
    .line 400
    const/16 p0, 0x2b

    .line 401
    .line 402
    return p0

    .line 403
    :cond_1d
    const-string p1, "fake_conversation_local_limited_trial_see_fold"

    .line 404
    .line 405
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 406
    .line 407
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 408
    .line 409
    .line 410
    move-result p0

    .line 411
    if-eqz p0, :cond_1e

    .line 412
    .line 413
    const/16 p0, 0x2c

    .line 414
    .line 415
    return p0

    .line 416
    :cond_1e
    return v3
.end method

.method public getViewTypeCount()I
    .locals 0

    const/16 p0, 0x31

    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->y(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/gra;->w3()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->d:Lcom/p1/mobile/putong/core/newui/messages/a;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/a;->k()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    return v1
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 11
    .line 12
    const/16 v2, 0x8

    .line 13
    .line 14
    if-ne p2, v2, :cond_0

    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget p2, Ll/kec0;->wc:I

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 29
    .line 30
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0, p1}, Ll/ue6;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    const/16 v0, 0x1c

    .line 45
    .line 46
    if-ne p2, v0, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    sget p2, Ll/kec0;->U1:I

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 63
    .line 64
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_2
    const/16 v0, 0xc

    .line 70
    .line 71
    if-ne p2, v0, :cond_3

    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sget p2, Ll/kec0;->F3:I

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 88
    .line 89
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0

    .line 94
    :cond_3
    const/4 v0, 0x3

    .line 95
    if-ne p2, v0, :cond_5

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 98
    .line 99
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1:Z

    .line 100
    .line 101
    if-nez p2, :cond_4

    .line 102
    .line 103
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    sget p2, Ll/kec0;->k:I

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 116
    .line 117
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0

    .line 122
    :cond_4
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    sget p2, Ll/kec0;->l:I

    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 135
    .line 136
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0

    .line 141
    :cond_5
    const/4 v0, 0x1

    .line 142
    if-eq p2, v0, :cond_1e

    .line 143
    .line 144
    const/16 v2, 0xe

    .line 145
    .line 146
    if-ne p2, v2, :cond_6

    .line 147
    .line 148
    goto/16 :goto_1

    .line 149
    .line 150
    :cond_6
    const/16 v2, 0x30

    .line 151
    .line 152
    if-ne p2, v2, :cond_7

    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 155
    .line 156
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    sget p2, Ll/kec0;->B4:I

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 169
    .line 170
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0

    .line 175
    :cond_7
    const/16 v2, 0xd

    .line 176
    .line 177
    if-ne p2, v2, :cond_8

    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 180
    .line 181
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {p0, p1}, Ll/ue6;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    return-object p0

    .line 190
    :cond_8
    const/16 v2, 0xf

    .line 191
    .line 192
    if-ne p2, v2, :cond_9

    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 195
    .line 196
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    sget p2, Ll/kec0;->K1:I

    .line 205
    .line 206
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 209
    .line 210
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    return-object p0

    .line 215
    :cond_9
    const/16 v2, 0x10

    .line 216
    .line 217
    if-ne p2, v2, :cond_a

    .line 218
    .line 219
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 220
    .line 221
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    sget p2, Ll/kec0;->S1:I

    .line 230
    .line 231
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 232
    .line 233
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 234
    .line 235
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    return-object p0

    .line 240
    :cond_a
    const/16 v2, 0x11

    .line 241
    .line 242
    if-ne p2, v2, :cond_b

    .line 243
    .line 244
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 245
    .line 246
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 251
    .line 252
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 253
    .line 254
    invoke-static {p1, p0}, Ll/ue6;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    return-object p0

    .line 259
    :cond_b
    const/16 v2, 0x17

    .line 260
    .line 261
    if-ne p2, v2, :cond_c

    .line 262
    .line 263
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 264
    .line 265
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    sget p2, Ll/kec0;->T1:I

    .line 274
    .line 275
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 276
    .line 277
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 278
    .line 279
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    return-object p0

    .line 284
    :cond_c
    const/16 v2, 0x1e

    .line 285
    .line 286
    if-eq p2, v2, :cond_1d

    .line 287
    .line 288
    const/16 v2, 0x1f

    .line 289
    .line 290
    if-eq p2, v2, :cond_1d

    .line 291
    .line 292
    const/16 v2, 0x25

    .line 293
    .line 294
    if-ne p2, v2, :cond_d

    .line 295
    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :cond_d
    const/16 v2, 0x2b

    .line 299
    .line 300
    if-ne p2, v2, :cond_e

    .line 301
    .line 302
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 303
    .line 304
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    sget p2, Ll/kec0;->R1:I

    .line 313
    .line 314
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 315
    .line 316
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 317
    .line 318
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    return-object p0

    .line 323
    :cond_e
    const/16 v2, 0x1b

    .line 324
    .line 325
    if-ne p2, v2, :cond_f

    .line 326
    .line 327
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 328
    .line 329
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    sget p2, Ll/kec0;->P1:I

    .line 338
    .line 339
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 340
    .line 341
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 342
    .line 343
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    return-object p0

    .line 348
    :cond_f
    const/16 v2, 0x29

    .line 349
    .line 350
    if-ne p2, v2, :cond_10

    .line 351
    .line 352
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 353
    .line 354
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    sget p2, Ll/kec0;->M1:I

    .line 363
    .line 364
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 365
    .line 366
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 367
    .line 368
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    return-object p0

    .line 373
    :cond_10
    const/16 v2, 0x2d

    .line 374
    .line 375
    if-ne p2, v2, :cond_11

    .line 376
    .line 377
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 378
    .line 379
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    sget p2, Ll/kec0;->L1:I

    .line 388
    .line 389
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 390
    .line 391
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 392
    .line 393
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    return-object p0

    .line 398
    :cond_11
    const/16 v2, 0x20

    .line 399
    .line 400
    if-ne p2, v2, :cond_12

    .line 401
    .line 402
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 403
    .line 404
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    invoke-static {p0, p1}, Ll/ue6;->G(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 409
    .line 410
    .line 411
    move-result-object p0

    .line 412
    return-object p0

    .line 413
    :cond_12
    const/16 v2, 0x21

    .line 414
    .line 415
    if-ne p2, v2, :cond_13

    .line 416
    .line 417
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 418
    .line 419
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 420
    .line 421
    .line 422
    move-result-object p1

    .line 423
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    sget p2, Ll/kec0;->N1:I

    .line 428
    .line 429
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 430
    .line 431
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 432
    .line 433
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    return-object p0

    .line 438
    :cond_13
    const/16 v2, 0x22

    .line 439
    .line 440
    if-ne p2, v2, :cond_14

    .line 441
    .line 442
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 443
    .line 444
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 445
    .line 446
    .line 447
    move-result-object p1

    .line 448
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    sget p2, Ll/kec0;->I1:I

    .line 453
    .line 454
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 455
    .line 456
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 457
    .line 458
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    return-object p0

    .line 463
    :cond_14
    const/16 v2, 0x24

    .line 464
    .line 465
    if-ne p2, v2, :cond_15

    .line 466
    .line 467
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 468
    .line 469
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 470
    .line 471
    .line 472
    move-result-object p1

    .line 473
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 474
    .line 475
    .line 476
    move-result-object p1

    .line 477
    sget p2, Ll/kec0;->Q1:I

    .line 478
    .line 479
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 480
    .line 481
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 482
    .line 483
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 484
    .line 485
    .line 486
    move-result-object p0

    .line 487
    return-object p0

    .line 488
    :cond_15
    const/16 v2, 0x26

    .line 489
    .line 490
    if-ne p2, v2, :cond_16

    .line 491
    .line 492
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 493
    .line 494
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 495
    .line 496
    .line 497
    move-result-object p1

    .line 498
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 499
    .line 500
    .line 501
    move-result-object p1

    .line 502
    sget p2, Ll/kec0;->O1:I

    .line 503
    .line 504
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 505
    .line 506
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 507
    .line 508
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 509
    .line 510
    .line 511
    move-result-object p0

    .line 512
    return-object p0

    .line 513
    :cond_16
    const/16 v2, 0x27

    .line 514
    .line 515
    if-ne p2, v2, :cond_17

    .line 516
    .line 517
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 518
    .line 519
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 520
    .line 521
    .line 522
    move-result-object p1

    .line 523
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 524
    .line 525
    .line 526
    move-result-object p1

    .line 527
    sget p2, Ll/kec0;->Z1:I

    .line 528
    .line 529
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 530
    .line 531
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 532
    .line 533
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 534
    .line 535
    .line 536
    move-result-object p0

    .line 537
    return-object p0

    .line 538
    :cond_17
    const/16 v2, 0x2e

    .line 539
    .line 540
    if-ne p2, v2, :cond_18

    .line 541
    .line 542
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 543
    .line 544
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 545
    .line 546
    .line 547
    move-result-object p1

    .line 548
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 549
    .line 550
    .line 551
    move-result-object p1

    .line 552
    sget p2, Ll/kec0;->b2:I

    .line 553
    .line 554
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 555
    .line 556
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 557
    .line 558
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 559
    .line 560
    .line 561
    move-result-object p0

    .line 562
    return-object p0

    .line 563
    :cond_18
    const/16 v2, 0x2a

    .line 564
    .line 565
    if-ne p2, v2, :cond_19

    .line 566
    .line 567
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 568
    .line 569
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 570
    .line 571
    .line 572
    move-result-object p1

    .line 573
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 574
    .line 575
    .line 576
    move-result-object p1

    .line 577
    sget p2, Ll/kec0;->W1:I

    .line 578
    .line 579
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 580
    .line 581
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 582
    .line 583
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 584
    .line 585
    .line 586
    move-result-object p0

    .line 587
    return-object p0

    .line 588
    :cond_19
    const/16 v2, 0x2c

    .line 589
    .line 590
    if-ne p2, v2, :cond_1a

    .line 591
    .line 592
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 593
    .line 594
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 595
    .line 596
    .line 597
    move-result-object p0

    .line 598
    invoke-static {p0, p1}, Ll/ue6;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 599
    .line 600
    .line 601
    move-result-object p0

    .line 602
    return-object p0

    .line 603
    :cond_1a
    const/16 v2, 0x2f

    .line 604
    .line 605
    if-ne p2, v2, :cond_1b

    .line 606
    .line 607
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 608
    .line 609
    .line 610
    move-result-object p1

    .line 611
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 612
    .line 613
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 614
    .line 615
    .line 616
    move-result-object p2

    .line 617
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 618
    .line 619
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->d1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 620
    .line 621
    .line 622
    move-result-object p0

    .line 623
    invoke-interface {p1, p2, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ms(Lcom/p1/mobile/android/app/Act;Ll/dq1;)Ll/csp;

    .line 624
    .line 625
    .line 626
    move-result-object p0

    .line 627
    invoke-interface {p0}, Ll/csp;->getView()Landroid/view/View;

    .line 628
    .line 629
    .line 630
    move-result-object p0

    .line 631
    return-object p0

    .line 632
    :cond_1b
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 633
    .line 634
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 635
    .line 636
    .line 637
    move-result-object p0

    .line 638
    const/16 v2, 0xb

    .line 639
    .line 640
    if-ne p2, v2, :cond_1c

    .line 641
    .line 642
    move v1, v0

    .line 643
    :cond_1c
    invoke-static {p0, p1, v1}, Ll/ue6;->Z(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 644
    .line 645
    .line 646
    move-result-object p0

    .line 647
    return-object p0

    .line 648
    :cond_1d
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 649
    .line 650
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 651
    .line 652
    .line 653
    move-result-object p1

    .line 654
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 655
    .line 656
    .line 657
    move-result-object p1

    .line 658
    sget p2, Ll/kec0;->J1:I

    .line 659
    .line 660
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 661
    .line 662
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 663
    .line 664
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 665
    .line 666
    .line 667
    move-result-object p0

    .line 668
    return-object p0

    .line 669
    :cond_1e
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 670
    .line 671
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 672
    .line 673
    .line 674
    move-result-object p1

    .line 675
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 676
    .line 677
    .line 678
    move-result-object p1

    .line 679
    sget p2, Ll/kec0;->c0:I

    .line 680
    .line 681
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 682
    .line 683
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 684
    .line 685
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 686
    .line 687
    .line 688
    move-result-object p0

    .line 689
    return-object p0
.end method

.method public o()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E0:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getCurrentSortType()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, -0x1

    .line 13
    return p0
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->v2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->e1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->e1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public y(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V
    .locals 10

    .line 1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Z

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    const/4 v4, -0x1

    .line 8
    const/high16 v5, 0x43aa0000    # 340.0f

    .line 9
    .line 10
    if-eqz v3, :cond_1

    .line 11
    .line 12
    const/16 v3, 0x8

    .line 13
    .line 14
    if-ne p3, v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 21
    .line 22
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 27
    .line 28
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    sub-int/2addr v3, v4

    .line 33
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setFooterDividersEnabled(Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    move-object v0, p1

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    const/4 v5, 0x0

    .line 52
    move-object v1, p0

    .line 53
    move-object v2, p2

    .line 54
    move v4, p4

    .line 55
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->u4(Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    const/16 v3, 0x1c

    .line 60
    .line 61
    const/4 v6, 0x2

    .line 62
    const/high16 v7, 0x42300000    # 44.0f

    .line 63
    .line 64
    if-ne p3, v3, :cond_4

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 71
    .line 72
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    iget-object v3, v3, Ll/dkb;->k3:Ll/vxd0;

    .line 77
    .line 78
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Ljava/lang/Integer;

    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-eqz v3, :cond_3

    .line 89
    .line 90
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 93
    .line 94
    iget-object v3, v3, Ll/dkb;->l3:Ll/vxd0;

    .line 95
    .line 96
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-nez v3, :cond_2

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 112
    .line 113
    iget-object v3, v3, Ll/dkb;->k3:Ll/vxd0;

    .line 114
    .line 115
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Ljava/lang/Integer;

    .line 120
    .line 121
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 128
    .line 129
    iget-object v4, v4, Ll/dkb;->l3:Ll/vxd0;

    .line 130
    .line 131
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    check-cast v4, Ljava/lang/Integer;

    .line 136
    .line 137
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    sub-int/2addr v3, v4

    .line 142
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    sub-int/2addr v3, v4

    .line 147
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_3
    :goto_0
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 155
    .line 156
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    sub-int/2addr v3, v4

    .line 161
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 162
    .line 163
    :goto_1
    sget v3, Ll/adc0;->x7:I

    .line 164
    .line 165
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Lv/VLinear;

    .line 170
    .line 171
    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 172
    .line 173
    const v5, 0x43828000    # 261.0f

    .line 174
    .line 175
    .line 176
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    sub-int/2addr v4, v5

    .line 181
    div-int/2addr v4, v6

    .line 182
    int-to-double v4, v4

    .line 183
    iget v6, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 184
    .line 185
    int-to-double v6, v6

    .line 186
    const-wide v8, 0x3fb999999999999aL    # 0.1

    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    mul-double/2addr v6, v8

    .line 192
    sub-double/2addr v4, v6

    .line 193
    double-to-int v4, v4

    .line 194
    invoke-static {v3, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->O(Landroid/view/View;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_4
    const/16 v3, 0xc

    .line 205
    .line 206
    if-ne p3, v3, :cond_5

    .line 207
    .line 208
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 213
    .line 214
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 219
    .line 220
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    sub-int/2addr v3, v4

    .line 225
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 226
    .line 227
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->N(Landroid/view/View;)V

    .line 231
    .line 232
    .line 233
    return-void

    .line 234
    :cond_5
    const/16 v3, 0x2a

    .line 235
    .line 236
    const/4 v8, 0x1

    .line 237
    if-ne p3, v3, :cond_8

    .line 238
    .line 239
    sget v2, Ll/adc0;->z3:I

    .line 240
    .line 241
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 249
    .line 250
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 251
    .line 252
    iget-object v3, v3, Ll/dkb;->k3:Ll/vxd0;

    .line 253
    .line 254
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    check-cast v3, Ljava/lang/Integer;

    .line 259
    .line 260
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    if-eqz v3, :cond_7

    .line 265
    .line 266
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 267
    .line 268
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 269
    .line 270
    iget-object v3, v3, Ll/dkb;->l3:Ll/vxd0;

    .line 271
    .line 272
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    check-cast v3, Ljava/lang/Integer;

    .line 277
    .line 278
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 279
    .line 280
    .line 281
    move-result v3

    .line 282
    if-nez v3, :cond_6

    .line 283
    .line 284
    goto :goto_3

    .line 285
    :cond_6
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 286
    .line 287
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 288
    .line 289
    iget-object v3, v3, Ll/dkb;->k3:Ll/vxd0;

    .line 290
    .line 291
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    check-cast v3, Ljava/lang/Integer;

    .line 296
    .line 297
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 298
    .line 299
    .line 300
    move-result v3

    .line 301
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 302
    .line 303
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 304
    .line 305
    iget-object v4, v4, Ll/dkb;->l3:Ll/vxd0;

    .line 306
    .line 307
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v4

    .line 311
    check-cast v4, Ljava/lang/Integer;

    .line 312
    .line 313
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 314
    .line 315
    .line 316
    move-result v4

    .line 317
    sub-int/2addr v3, v4

    .line 318
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 319
    .line 320
    .line 321
    move-result v4

    .line 322
    :goto_2
    sub-int/2addr v3, v4

    .line 323
    goto :goto_4

    .line 324
    :cond_7
    :goto_3
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 325
    .line 326
    .line 327
    move-result-object v3

    .line 328
    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 329
    .line 330
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 331
    .line 332
    .line 333
    move-result v4

    .line 334
    goto :goto_2

    .line 335
    :goto_4
    invoke-static {v2, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 336
    .line 337
    .line 338
    sget v2, Ll/adc0;->w3:I

    .line 339
    .line 340
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    check-cast v2, Landroid/widget/TextView;

    .line 345
    .line 346
    const-string v3, "\u91cd\u7f6e\u7b5b\u9009"

    .line 347
    .line 348
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 349
    .line 350
    .line 351
    new-instance v3, Ll/uq6;

    .line 352
    .line 353
    invoke-direct {v3, p0}, Ll/uq6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V

    .line 354
    .line 355
    .line 356
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 357
    .line 358
    .line 359
    sget v1, Ll/adc0;->C3:I

    .line 360
    .line 361
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    check-cast v0, Landroid/widget/TextView;

    .line 366
    .line 367
    const-string v1, "\u6ca1\u6709\u627e\u5230\u7b26\u5408\u6761\u4ef6\u7684\u6d88\u606f\n\u4f60\u53ef\u4ee5\u51cf\u5c11\u7b5b\u9009\u9879\u8bd5\u8bd5"

    .line 368
    .line 369
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 370
    .line 371
    .line 372
    return-void

    .line 373
    :cond_8
    const/4 v7, 0x3

    .line 374
    if-ne p3, v7, :cond_9

    .line 375
    .line 376
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 377
    .line 378
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1:Z

    .line 379
    .line 380
    if-nez v2, :cond_2a

    .line 381
    .line 382
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->P(Landroid/view/View;)V

    .line 383
    .line 384
    .line 385
    return-void

    .line 386
    :cond_9
    const/16 v9, 0xa

    .line 387
    .line 388
    if-eq p3, v8, :cond_28

    .line 389
    .line 390
    const/16 v3, 0xe

    .line 391
    .line 392
    if-ne p3, v3, :cond_a

    .line 393
    .line 394
    goto/16 :goto_5

    .line 395
    .line 396
    :cond_a
    const/16 v3, 0x30

    .line 397
    .line 398
    if-ne p3, v3, :cond_b

    .line 399
    .line 400
    move-object v0, p1

    .line 401
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;

    .line 402
    .line 403
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 404
    .line 405
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    invoke-virtual {v0, v2, p0}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->m0(Ll/ner;Ll/dq1;)V

    .line 410
    .line 411
    .line 412
    goto/16 :goto_6

    .line 413
    .line 414
    :cond_b
    if-ne p3, v6, :cond_c

    .line 415
    .line 416
    goto/16 :goto_6

    .line 417
    .line 418
    :cond_c
    if-nez p3, :cond_d

    .line 419
    .line 420
    :try_start_0
    move-object v0, p1

    .line 421
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 422
    .line 423
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 424
    .line 425
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->k1:Ll/x20;

    .line 426
    .line 427
    iget-boolean v4, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->g1:Z

    .line 428
    .line 429
    const/4 v6, 0x0

    .line 430
    move-object v1, p0

    .line 431
    move-object v2, p2

    .line 432
    move v5, p4

    .line 433
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->h4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ZILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 434
    .line 435
    .line 436
    goto/16 :goto_6

    .line 437
    .line 438
    :catch_0
    move-exception v0

    .line 439
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 440
    .line 441
    .line 442
    goto/16 :goto_6

    .line 443
    .line 444
    :cond_d
    const/16 v3, 0xb

    .line 445
    .line 446
    if-ne p3, v3, :cond_e

    .line 447
    .line 448
    move-object v0, p1

    .line 449
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 450
    .line 451
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 452
    .line 453
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->k1:Ll/x20;

    .line 454
    .line 455
    iget-boolean v4, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->g1:Z

    .line 456
    .line 457
    const/4 v6, 0x0

    .line 458
    move-object v1, p0

    .line 459
    move-object v2, p2

    .line 460
    move v5, p4

    .line 461
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->l4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ZILjava/lang/String;)V

    .line 462
    .line 463
    .line 464
    goto/16 :goto_6

    .line 465
    .line 466
    :cond_e
    const/4 v3, 0x5

    .line 467
    if-ne p3, v3, :cond_f

    .line 468
    .line 469
    goto/16 :goto_6

    .line 470
    .line 471
    :cond_f
    const/4 v3, 0x7

    .line 472
    if-ne p3, v3, :cond_10

    .line 473
    .line 474
    move-object v0, p1

    .line 475
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 476
    .line 477
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 478
    .line 479
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->k1:Ll/x20;

    .line 480
    .line 481
    const/4 v5, 0x0

    .line 482
    move-object v1, p0

    .line 483
    move-object v2, p2

    .line 484
    move v4, p4

    .line 485
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->u4(Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ILjava/lang/String;)V

    .line 486
    .line 487
    .line 488
    goto/16 :goto_6

    .line 489
    .line 490
    :cond_10
    if-ne p3, v9, :cond_11

    .line 491
    .line 492
    move-object v0, p1

    .line 493
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 494
    .line 495
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->n4(Ll/u46;)V

    .line 496
    .line 497
    .line 498
    goto/16 :goto_6

    .line 499
    .line 500
    :cond_11
    const/16 v4, 0xd

    .line 501
    .line 502
    if-ne p3, v4, :cond_12

    .line 503
    .line 504
    move-object v0, p1

    .line 505
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 506
    .line 507
    invoke-virtual {v0, p0, p4}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->q4(Ll/u46;I)V

    .line 508
    .line 509
    .line 510
    goto/16 :goto_6

    .line 511
    .line 512
    :cond_12
    const/16 v4, 0xf

    .line 513
    .line 514
    if-ne p3, v4, :cond_13

    .line 515
    .line 516
    move-object v0, p1

    .line 517
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;

    .line 518
    .line 519
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 520
    .line 521
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 522
    .line 523
    .line 524
    move-result-object v2

    .line 525
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 526
    .line 527
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->g1:Z

    .line 528
    .line 529
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;->c(Lcom/p1/mobile/putong/app/PutongAct;Z)V

    .line 530
    .line 531
    .line 532
    goto/16 :goto_6

    .line 533
    .line 534
    :cond_13
    const/16 v4, 0x10

    .line 535
    .line 536
    if-ne p3, v4, :cond_14

    .line 537
    .line 538
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 539
    .line 540
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 541
    .line 542
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 543
    .line 544
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->i1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;)V

    .line 545
    .line 546
    .line 547
    move-object v0, p1

    .line 548
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;

    .line 549
    .line 550
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 551
    .line 552
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 553
    .line 554
    .line 555
    move-result-object v2

    .line 556
    invoke-virtual {v0, v2, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 557
    .line 558
    .line 559
    goto/16 :goto_6

    .line 560
    .line 561
    :cond_14
    const/16 v4, 0x11

    .line 562
    .line 563
    if-ne p3, v4, :cond_15

    .line 564
    .line 565
    move-object v0, p1

    .line 566
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 567
    .line 568
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 569
    .line 570
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 571
    .line 572
    .line 573
    move-result-object v2

    .line 574
    invoke-virtual {v0, p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->v4(Ll/u46;Lcom/p1/mobile/android/app/Act;)V

    .line 575
    .line 576
    .line 577
    goto/16 :goto_6

    .line 578
    .line 579
    :cond_15
    const/16 v4, 0x17

    .line 580
    .line 581
    if-ne p3, v4, :cond_16

    .line 582
    .line 583
    move-object v0, p1

    .line 584
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

    .line 585
    .line 586
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 587
    .line 588
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 589
    .line 590
    .line 591
    move-result-object v2

    .line 592
    invoke-virtual {v0, v2, p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->E0(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;I)V

    .line 593
    .line 594
    .line 595
    goto/16 :goto_6

    .line 596
    .line 597
    :cond_16
    const/16 v4, 0x1e

    .line 598
    .line 599
    if-ne p3, v4, :cond_17

    .line 600
    .line 601
    move-object v0, p1

    .line 602
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

    .line 603
    .line 604
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 605
    .line 606
    invoke-virtual {v0, p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->p(Ll/dq1;Ljava/lang/String;)V

    .line 607
    .line 608
    .line 609
    goto/16 :goto_6

    .line 610
    .line 611
    :cond_17
    const/16 v4, 0x1f

    .line 612
    .line 613
    if-ne p3, v4, :cond_18

    .line 614
    .line 615
    move-object v0, p1

    .line 616
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

    .line 617
    .line 618
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 619
    .line 620
    invoke-virtual {v0, p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->o(Ll/dq1;Ljava/lang/String;)V

    .line 621
    .line 622
    .line 623
    goto/16 :goto_6

    .line 624
    .line 625
    :cond_18
    const/16 v4, 0x25

    .line 626
    .line 627
    if-ne p3, v4, :cond_19

    .line 628
    .line 629
    move-object v0, p1

    .line 630
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

    .line 631
    .line 632
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 633
    .line 634
    invoke-virtual {v0, p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->q(Ll/dq1;Ljava/lang/String;)V

    .line 635
    .line 636
    .line 637
    goto/16 :goto_6

    .line 638
    .line 639
    :cond_19
    const/16 v4, 0x1b

    .line 640
    .line 641
    if-ne p3, v4, :cond_1a

    .line 642
    .line 643
    move-object v0, p1

    .line 644
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;

    .line 645
    .line 646
    invoke-virtual {v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->k(Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 647
    .line 648
    .line 649
    goto/16 :goto_6

    .line 650
    .line 651
    :cond_1a
    const/16 v4, 0x29

    .line 652
    .line 653
    if-ne p3, v4, :cond_1b

    .line 654
    .line 655
    :try_start_1
    move-object v0, p1

    .line 656
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;

    .line 657
    .line 658
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k(Lcom/p1/mobile/putong/core/data/Conversation;)V
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_1

    .line 659
    .line 660
    .line 661
    goto/16 :goto_6

    .line 662
    .line 663
    :catch_1
    move-exception v0

    .line 664
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 665
    .line 666
    .line 667
    goto/16 :goto_6

    .line 668
    .line 669
    :cond_1b
    const/16 v4, 0x2d

    .line 670
    .line 671
    if-ne p3, v4, :cond_1c

    .line 672
    .line 673
    move-object v0, p1

    .line 674
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;

    .line 675
    .line 676
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 677
    .line 678
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 679
    .line 680
    .line 681
    move-result-object v2

    .line 682
    invoke-virtual {v0, v2, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 683
    .line 684
    .line 685
    goto/16 :goto_6

    .line 686
    .line 687
    :cond_1c
    const/16 v4, 0x20

    .line 688
    .line 689
    if-ne p3, v4, :cond_1d

    .line 690
    .line 691
    move-object v0, p1

    .line 692
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 693
    .line 694
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 695
    .line 696
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->k1:Ll/x20;

    .line 697
    .line 698
    iget-boolean v4, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->g1:Z

    .line 699
    .line 700
    const/4 v6, 0x0

    .line 701
    move-object v1, p0

    .line 702
    move-object v2, p2

    .line 703
    move v5, p4

    .line 704
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->k4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ZILjava/lang/String;)V

    .line 705
    .line 706
    .line 707
    goto/16 :goto_6

    .line 708
    .line 709
    :cond_1d
    const/16 v4, 0x21

    .line 710
    .line 711
    if-ne p3, v4, :cond_1e

    .line 712
    .line 713
    move-object v0, p1

    .line 714
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;

    .line 715
    .line 716
    invoke-virtual {v0, p0, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;->q(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;I)V

    .line 717
    .line 718
    .line 719
    goto/16 :goto_6

    .line 720
    .line 721
    :cond_1e
    const/16 v4, 0x23

    .line 722
    .line 723
    if-ne p3, v4, :cond_1f

    .line 724
    .line 725
    move-object v0, p1

    .line 726
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 727
    .line 728
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 729
    .line 730
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 731
    .line 732
    .line 733
    move-result-object v2

    .line 734
    invoke-virtual {v0, p0, p2, v2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->j4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/android/app/Act;)V

    .line 735
    .line 736
    .line 737
    goto/16 :goto_6

    .line 738
    .line 739
    :cond_1f
    const/16 v4, 0x22

    .line 740
    .line 741
    if-ne p3, v4, :cond_20

    .line 742
    .line 743
    move-object v0, p1

    .line 744
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;

    .line 745
    .line 746
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->e(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 747
    .line 748
    .line 749
    goto/16 :goto_6

    .line 750
    .line 751
    :cond_20
    const/16 v4, 0x24

    .line 752
    .line 753
    if-ne p3, v4, :cond_21

    .line 754
    .line 755
    move-object v0, p1

    .line 756
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemSurpriseBoxEntrance;

    .line 757
    .line 758
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemSurpriseBoxEntrance;->f(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 759
    .line 760
    .line 761
    goto/16 :goto_6

    .line 762
    .line 763
    :cond_21
    const/16 v4, 0x28

    .line 764
    .line 765
    if-ne p3, v4, :cond_22

    .line 766
    .line 767
    move-object v0, p1

    .line 768
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 769
    .line 770
    invoke-virtual {v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->r4(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 771
    .line 772
    .line 773
    goto :goto_6

    .line 774
    :cond_22
    const/16 v4, 0x26

    .line 775
    .line 776
    if-ne p3, v4, :cond_23

    .line 777
    .line 778
    move-object v0, p1

    .line 779
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;

    .line 780
    .line 781
    invoke-virtual {v0, p2, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->i(Lcom/p1/mobile/putong/core/data/Conversation;Ll/pol;)V

    .line 782
    .line 783
    .line 784
    goto :goto_6

    .line 785
    :cond_23
    const/16 v4, 0x27

    .line 786
    .line 787
    if-ne p3, v4, :cond_24

    .line 788
    .line 789
    move-object v0, p1

    .line 790
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;

    .line 791
    .line 792
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 793
    .line 794
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 795
    .line 796
    .line 797
    move-result-object v2

    .line 798
    invoke-virtual {v0, v2, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->T(Lcom/p1/mobile/android/app/Act;Ll/u46;)V

    .line 799
    .line 800
    .line 801
    goto :goto_6

    .line 802
    :cond_24
    const/16 v4, 0x2e

    .line 803
    .line 804
    if-ne p3, v4, :cond_25

    .line 805
    .line 806
    move-object v0, p1

    .line 807
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;

    .line 808
    .line 809
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 810
    .line 811
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 812
    .line 813
    .line 814
    move-result-object v2

    .line 815
    invoke-virtual {v0, v2, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->d0(Lcom/p1/mobile/android/app/Act;Ll/u46;)V

    .line 816
    .line 817
    .line 818
    goto :goto_6

    .line 819
    :cond_25
    const/16 v4, 0x2b

    .line 820
    .line 821
    if-ne p3, v4, :cond_26

    .line 822
    .line 823
    move-object v0, p1

    .line 824
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;

    .line 825
    .line 826
    invoke-virtual {v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->o(Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 827
    .line 828
    .line 829
    goto :goto_6

    .line 830
    :cond_26
    const/16 v3, 0x2c

    .line 831
    .line 832
    if-ne p3, v3, :cond_27

    .line 833
    .line 834
    move-object v0, p1

    .line 835
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 836
    .line 837
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 838
    .line 839
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->g1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Ljava/util/List;

    .line 840
    .line 841
    .line 842
    move-result-object v2

    .line 843
    invoke-virtual {v0, p0, p4, v2}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->p4(Ll/u46;ILjava/util/List;)V

    .line 844
    .line 845
    .line 846
    goto :goto_6

    .line 847
    :cond_27
    const/16 v3, 0x2f

    .line 848
    .line 849
    if-ne p3, v3, :cond_29

    .line 850
    .line 851
    move-object v0, p1

    .line 852
    check-cast v0, Ll/csp;

    .line 853
    .line 854
    invoke-interface {v0, p4}, Ll/csp;->z(I)V

    .line 855
    .line 856
    .line 857
    goto :goto_6

    .line 858
    :cond_28
    :goto_5
    move-object v0, p1

    .line 859
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 860
    .line 861
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 862
    .line 863
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 864
    .line 865
    .line 866
    move-result-object v2

    .line 867
    invoke-virtual {v0, v2, p0}, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->i0(Ll/ner;Ll/dq1;)V

    .line 868
    .line 869
    .line 870
    :cond_29
    :goto_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->E()Z

    .line 871
    .line 872
    .line 873
    move-result v0

    .line 874
    if-eqz v0, :cond_2a

    .line 875
    .line 876
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 877
    .line 878
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 879
    .line 880
    .line 881
    move-result v0

    .line 882
    sub-int/2addr v0, v7

    .line 883
    if-lt p4, v0, :cond_2a

    .line 884
    .line 885
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->c:Ljava/util/List;

    .line 886
    .line 887
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 888
    .line 889
    .line 890
    move-result v0

    .line 891
    if-le v0, v9, :cond_2a

    .line 892
    .line 893
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 894
    .line 895
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->j1:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 896
    .line 897
    invoke-virtual {v0, p0, v8}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Z)V

    .line 898
    .line 899
    .line 900
    :cond_2a
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->k:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->j1:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->A(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
