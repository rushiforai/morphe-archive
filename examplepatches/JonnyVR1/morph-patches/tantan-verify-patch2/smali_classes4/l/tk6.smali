.class public Ll/tk6;
.super Ll/jic0;
.source "SourceFile"

# interfaces
.implements Ll/u46;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tk6$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;",
        "Ll/u46;"
    }
.end annotation


# instance fields
.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public final o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

.field public p:Ljava/lang/String;

.field public q:I

.field public r:Z

.field public final s:Ll/tk6$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;IZLl/tk6$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/tk6;->c:I

    .line 6
    .line 7
    iput v0, p0, Ll/tk6;->d:I

    .line 8
    .line 9
    iput v0, p0, Ll/tk6;->e:I

    .line 10
    .line 11
    iput v0, p0, Ll/tk6;->f:I

    .line 12
    .line 13
    iput v0, p0, Ll/tk6;->g:I

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/tk6;->h:Ljava/util/List;

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/tk6;->i:Ljava/util/List;

    .line 28
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/tk6;->j:Ljava/util/List;

    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/tk6;->k:Ljava/util/List;

    .line 42
    .line 43
    new-instance v0, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/tk6;->l:Ljava/util/List;

    .line 49
    .line 50
    new-instance v0, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/tk6;->m:Ljava/util/List;

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/tk6;->n:Ljava/util/List;

    .line 63
    .line 64
    iput-object p1, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 65
    .line 66
    iput p2, p0, Ll/tk6;->q:I

    .line 67
    .line 68
    iput-boolean p3, p0, Ll/tk6;->r:Z

    .line 69
    .line 70
    iput-object p4, p0, Ll/tk6;->s:Ll/tk6$a;

    .line 71
    .line 72
    return-void
.end method

.method public static synthetic E(Ll/tk6;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tk6;->J(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tk6;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tk6;->h:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    if-eq p2, v0, :cond_5

    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    if-eq p2, v0, :cond_5

    .line 6
    .line 7
    const/4 v0, 0x7

    .line 8
    if-ne p2, v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/16 v0, 0x9

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-ne p2, v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p2, Ll/kec0;->T1:I

    .line 23
    .line 24
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    const/4 v0, 0x5

    .line 30
    if-eq p2, v0, :cond_4

    .line 31
    .line 32
    const/16 v0, 0x8

    .line 33
    .line 34
    if-ne p2, v0, :cond_2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    iget-object p0, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 38
    .line 39
    const/4 v0, 0x2

    .line 40
    if-ne p2, v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    :cond_3
    invoke-static {p0, p1, v1}, Ll/ue6;->Z(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_4
    :goto_0
    iget-object p0, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 49
    .line 50
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget p2, Ll/kec0;->B1:I

    .line 55
    .line 56
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_5
    :goto_1
    new-instance p1, Landroid/widget/TextView;

    .line 62
    .line 63
    iget-object p0, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 64
    .line 65
    invoke-direct {p1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 66
    .line 67
    .line 68
    const/high16 p0, 0x41700000    # 15.0f

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 71
    .line 72
    .line 73
    const-string p0, "#66000000"

    .line 74
    .line 75
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    .line 81
    .line 82
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 83
    .line 84
    const/4 p2, -0x1

    .line 85
    const/4 v0, -0x2

    .line 86
    invoke-direct {p0, p2, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 87
    .line 88
    .line 89
    sget p2, Ll/qa00;->o:I

    .line 90
    .line 91
    iput p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 92
    .line 93
    sget p2, Ll/qa00;->e:I

    .line 94
    .line 95
    iput p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 96
    .line 97
    sget p2, Ll/qa00;->j:I

    .line 98
    .line 99
    iput p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 100
    .line 101
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    .line 103
    .line 104
    return-object p1
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V
    .locals 10

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 5
    .line 6
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Z1:I

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p1, Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x6

    .line 19
    if-ne p3, v0, :cond_1

    .line 20
    .line 21
    const-string p0, "\u63a2\u63a2ID\u641c\u7d22"

    .line 22
    .line 23
    check-cast p1, Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const/4 v0, 0x7

    .line 30
    if-ne p3, v0, :cond_2

    .line 31
    .line 32
    check-cast p1, Landroid/widget/TextView;

    .line 33
    .line 34
    iget-object p0, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 35
    .line 36
    sget p2, Lcom/p1/mobile/putong/core/R$string;->F1:I

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    const/4 v0, 0x5

    .line 47
    if-eq p3, v0, :cond_f

    .line 48
    .line 49
    const/16 v1, 0x8

    .line 50
    .line 51
    if-ne p3, v1, :cond_3

    .line 52
    .line 53
    goto/16 :goto_3

    .line 54
    .line 55
    :cond_3
    const/16 v0, 0x9

    .line 56
    .line 57
    if-ne p3, v0, :cond_4

    .line 58
    .line 59
    move-object v0, p1

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

    .line 61
    .line 62
    iget-object v1, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 63
    .line 64
    invoke-virtual {v0, v1, p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->E0(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;I)V

    .line 65
    .line 66
    .line 67
    :cond_4
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 68
    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    goto/16 :goto_2

    .line 72
    .line 73
    :cond_5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 74
    .line 75
    iget v0, p0, Ll/tk6;->f:I

    .line 76
    .line 77
    sub-int v0, p4, v0

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    sub-int/2addr v0, v1

    .line 81
    const/4 v2, 0x0

    .line 82
    if-ltz v0, :cond_6

    .line 83
    .line 84
    iget-object v3, p0, Ll/tk6;->m:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-ge v0, v3, :cond_6

    .line 91
    .line 92
    move v3, v1

    .line 93
    goto :goto_0

    .line 94
    :cond_6
    move v3, v2

    .line 95
    :goto_0
    iget v4, p0, Ll/tk6;->q:I

    .line 96
    .line 97
    sget v5, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->o:I

    .line 98
    .line 99
    const-string v6, ""

    .line 100
    .line 101
    const/4 v7, 0x0

    .line 102
    const-wide/16 v8, 0x0

    .line 103
    .line 104
    if-ne v4, v5, :cond_a

    .line 105
    .line 106
    iget-object v4, p0, Ll/tk6;->i:Ljava/util/List;

    .line 107
    .line 108
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-nez v4, :cond_9

    .line 113
    .line 114
    iget v4, p0, Ll/tk6;->e:I

    .line 115
    .line 116
    if-le p4, v4, :cond_9

    .line 117
    .line 118
    iget v5, p0, Ll/tk6;->f:I

    .line 119
    .line 120
    if-ltz v5, :cond_7

    .line 121
    .line 122
    if-ge p4, v5, :cond_9

    .line 123
    .line 124
    :cond_7
    iget-object v0, p0, Ll/tk6;->i:Ljava/util/List;

    .line 125
    .line 126
    sub-int v2, p4, v4

    .line 127
    .line 128
    sub-int/2addr v2, v1

    .line 129
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    move-object v7, v0

    .line 134
    check-cast v7, Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    move v2, v1

    .line 137
    :cond_8
    move-object v3, v6

    .line 138
    move-object v4, v3

    .line 139
    goto :goto_1

    .line 140
    :cond_9
    iget v4, p0, Ll/tk6;->f:I

    .line 141
    .line 142
    if-ltz v4, :cond_8

    .line 143
    .line 144
    if-le p4, v4, :cond_8

    .line 145
    .line 146
    if-eqz v3, :cond_8

    .line 147
    .line 148
    iget-object v3, p0, Ll/tk6;->m:Ljava/util/List;

    .line 149
    .line 150
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 155
    .line 156
    iget-object v6, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 159
    .line 160
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 161
    .line 162
    iget-wide v8, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_a
    sget v5, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->n:I

    .line 166
    .line 167
    if-ne v4, v5, :cond_8

    .line 168
    .line 169
    if-eqz v3, :cond_8

    .line 170
    .line 171
    iget-object v3, p0, Ll/tk6;->m:Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 178
    .line 179
    iget-object v6, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 180
    .line 181
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 182
    .line 183
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 184
    .line 185
    iget-wide v8, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 186
    .line 187
    :goto_1
    new-instance v0, Ll/sj6;

    .line 188
    .line 189
    invoke-direct {v0, p1, p0, p2}, Ll/sj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 190
    .line 191
    .line 192
    iput-object v6, v0, Ll/sj6;->p:Ljava/lang/String;

    .line 193
    .line 194
    iput-object v3, v0, Ll/sj6;->q:Ljava/lang/String;

    .line 195
    .line 196
    iput-object v4, v0, Ll/sj6;->r:Ljava/lang/String;

    .line 197
    .line 198
    iput-wide v8, v0, Ll/sj6;->s:D

    .line 199
    .line 200
    iget-object v3, p0, Ll/tk6;->p:Ljava/lang/String;

    .line 201
    .line 202
    iput-object v3, v0, Ll/sj6;->t:Ljava/lang/String;

    .line 203
    .line 204
    iget-boolean v4, p0, Ll/tk6;->r:Z

    .line 205
    .line 206
    iput-boolean v4, v0, Ll/sj6;->u:Z

    .line 207
    .line 208
    iput-boolean v1, v0, Ll/sj6;->o:Z

    .line 209
    .line 210
    iput-object p2, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 211
    .line 212
    iput-boolean v1, v0, Ll/sj6;->e:Z

    .line 213
    .line 214
    iput p4, v0, Ll/sj6;->g:I

    .line 215
    .line 216
    iput-object v3, v0, Ll/sj6;->y:Ljava/lang/String;

    .line 217
    .line 218
    iput-boolean v2, v0, Ll/sj6;->v:Z

    .line 219
    .line 220
    iput-object v7, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 221
    .line 222
    if-nez p3, :cond_b

    .line 223
    .line 224
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->i4(Ll/sj6;)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_b
    const/4 p2, 0x2

    .line 229
    if-ne p3, p2, :cond_c

    .line 230
    .line 231
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->m4(Ll/sj6;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :cond_c
    if-ne p3, v1, :cond_d

    .line 236
    .line 237
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->t4(Ll/sj6;)V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :cond_d
    const/4 p2, 0x3

    .line 242
    if-ne p3, p2, :cond_e

    .line 243
    .line 244
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->n4(Ll/u46;)V

    .line 245
    .line 246
    .line 247
    :cond_e
    :goto_2
    return-void

    .line 248
    :cond_f
    :goto_3
    sget p2, Ll/adc0;->y8:I

    .line 249
    .line 250
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 251
    .line 252
    .line 253
    move-result-object p2

    .line 254
    check-cast p2, Landroid/widget/TextView;

    .line 255
    .line 256
    iget-object p4, p0, Ll/tk6;->o:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 257
    .line 258
    if-ne p3, v0, :cond_10

    .line 259
    .line 260
    sget v0, Lcom/p1/mobile/putong/core/R$string;->tj:I

    .line 261
    .line 262
    invoke-virtual {p4, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 263
    .line 264
    .line 265
    move-result-object p4

    .line 266
    goto :goto_4

    .line 267
    :cond_10
    sget v0, Lcom/p1/mobile/putong/core/R$string;->sj:I

    .line 268
    .line 269
    invoke-virtual {p4, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 270
    .line 271
    .line 272
    move-result-object p4

    .line 273
    :goto_4
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    .line 275
    .line 276
    new-instance p2, Ll/sk6;

    .line 277
    .line 278
    invoke-direct {p2, p0, p3}, Ll/sk6;-><init>(Ll/tk6;I)V

    .line 279
    .line 280
    .line 281
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tk6;->h:Ljava/util/List;

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
    iget-object p0, p0, Ll/tk6;->h:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final H(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/tk6;->I()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x4

    .line 9
    const/4 v2, 0x3

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, -0x1

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iput v3, p0, Ll/tk6;->c:I

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-le v0, v2, :cond_0

    .line 21
    .line 22
    move v0, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v4

    .line 25
    :goto_0
    iput v0, p0, Ll/tk6;->d:I

    .line 26
    .line 27
    move v0, v3

    .line 28
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-ge v0, v5, :cond_1

    .line 37
    .line 38
    iget-object v5, p0, Ll/tk6;->j:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    check-cast v6, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 45
    .line 46
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_4

    .line 57
    .line 58
    iget v0, p0, Ll/tk6;->c:I

    .line 59
    .line 60
    if-ne v0, v4, :cond_2

    .line 61
    .line 62
    move v0, v3

    .line 63
    goto :goto_2

    .line 64
    :cond_2
    iget v0, p0, Ll/tk6;->d:I

    .line 65
    .line 66
    if-ne v0, v4, :cond_3

    .line 67
    .line 68
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    :goto_2
    iput v0, p0, Ll/tk6;->e:I

    .line 75
    .line 76
    move v0, v3

    .line 77
    :goto_3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-ge v0, v5, :cond_4

    .line 82
    .line 83
    iget-object v5, p0, Ll/tk6;->k:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    add-int/lit8 v0, v0, 0x1

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_4
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_9

    .line 100
    .line 101
    iget v0, p0, Ll/tk6;->e:I

    .line 102
    .line 103
    if-ne v0, v4, :cond_7

    .line 104
    .line 105
    iget p2, p0, Ll/tk6;->c:I

    .line 106
    .line 107
    if-ne p2, v4, :cond_5

    .line 108
    .line 109
    move p1, v3

    .line 110
    goto :goto_4

    .line 111
    :cond_5
    iget p2, p0, Ll/tk6;->d:I

    .line 112
    .line 113
    if-ne p2, v4, :cond_6

    .line 114
    .line 115
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    add-int/lit8 p1, p1, 0x1

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_6
    add-int/lit8 p1, p2, 0x1

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_7
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    add-int/2addr v0, p1

    .line 130
    add-int/lit8 p1, v0, 0x1

    .line 131
    .line 132
    :goto_4
    iput p1, p0, Ll/tk6;->f:I

    .line 133
    .line 134
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    if-le p2, v2, :cond_8

    .line 147
    .line 148
    iget p2, p0, Ll/tk6;->f:I

    .line 149
    .line 150
    add-int/lit8 v4, p2, 0x4

    .line 151
    .line 152
    :cond_8
    iput v4, p0, Ll/tk6;->g:I

    .line 153
    .line 154
    :goto_5
    if-ge v3, p1, :cond_9

    .line 155
    .line 156
    iget-object p2, p0, Ll/tk6;->l:Ljava/util/List;

    .line 157
    .line 158
    invoke-interface {p3, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 163
    .line 164
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    add-int/lit8 v3, v3, 0x1

    .line 168
    .line 169
    goto :goto_5

    .line 170
    :cond_9
    return-void
.end method

.method public final I()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/tk6;->c:I

    .line 3
    .line 4
    iput v0, p0, Ll/tk6;->d:I

    .line 5
    .line 6
    iput v0, p0, Ll/tk6;->e:I

    .line 7
    .line 8
    iput v0, p0, Ll/tk6;->f:I

    .line 9
    .line 10
    iput v0, p0, Ll/tk6;->g:I

    .line 11
    .line 12
    return-void
.end method

.method public final synthetic J(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/tk6;->s:Ll/tk6$a;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/tk6;->s:Ll/tk6$a;

    .line 10
    .line 11
    const/4 p2, 0x5

    .line 12
    if-ne p1, p2, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :goto_0
    invoke-interface {p0, p1}, Ll/tk6$a;->a(Z)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public K(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tk6;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/tk6;->j:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/tk6;->k:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/tk6;->l:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/tk6;->m:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/tk6;->m:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0, p4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    iget p4, p0, Ll/tk6;->q:I

    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->o:I

    .line 34
    .line 35
    if-ne p4, v0, :cond_5

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2, p3}, Ll/tk6;->H(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    iget p1, p0, Ll/tk6;->c:I

    .line 41
    .line 42
    const/4 p3, -0x1

    .line 43
    if-eq p1, p3, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    invoke-interface {p1, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 55
    .line 56
    iget-object p4, p0, Ll/tk6;->j:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p1, p4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    iget p1, p0, Ll/tk6;->d:I

    .line 62
    .line 63
    if-eq p1, p3, :cond_1

    .line 64
    .line 65
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 68
    .line 69
    .line 70
    move-result-object p4

    .line 71
    invoke-interface {p1, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :cond_1
    iget p1, p0, Ll/tk6;->e:I

    .line 75
    .line 76
    if-eq p1, p3, :cond_2

    .line 77
    .line 78
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 81
    .line 82
    .line 83
    move-result-object p4

    .line 84
    invoke-interface {p1, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-object p1, p0, Ll/tk6;->i:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 90
    .line 91
    .line 92
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-nez p1, :cond_3

    .line 97
    .line 98
    iget-object p1, p0, Ll/tk6;->i:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 101
    .line 102
    .line 103
    :cond_3
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 104
    .line 105
    iget-object p2, p0, Ll/tk6;->k:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 108
    .line 109
    .line 110
    iget p1, p0, Ll/tk6;->f:I

    .line 111
    .line 112
    if-eq p1, p3, :cond_4

    .line 113
    .line 114
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    :cond_4
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 124
    .line 125
    iget-object p2, p0, Ll/tk6;->l:Ljava/util/List;

    .line 126
    .line 127
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 128
    .line 129
    .line 130
    iget p1, p0, Ll/tk6;->g:I

    .line 131
    .line 132
    if-eq p1, p3, :cond_7

    .line 133
    .line 134
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 135
    .line 136
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_5
    sget p2, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->m:I

    .line 145
    .line 146
    if-ne p4, p2, :cond_6

    .line 147
    .line 148
    iput-object p1, p0, Ll/tk6;->j:Ljava/util/List;

    .line 149
    .line 150
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-nez p1, :cond_7

    .line 155
    .line 156
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 157
    .line 158
    iget-object p2, p0, Ll/tk6;->j:Ljava/util/List;

    .line 159
    .line 160
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_6
    sget p1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->n:I

    .line 165
    .line 166
    if-ne p4, p1, :cond_7

    .line 167
    .line 168
    iput-object p3, p0, Ll/tk6;->l:Ljava/util/List;

    .line 169
    .line 170
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-nez p1, :cond_7

    .line 175
    .line 176
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    const/4 p1, 0x0

    .line 186
    iput p1, p0, Ll/tk6;->f:I

    .line 187
    .line 188
    iget-object p1, p0, Ll/tk6;->h:Ljava/util/List;

    .line 189
    .line 190
    iget-object p2, p0, Ll/tk6;->l:Ljava/util/List;

    .line 191
    .line 192
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 193
    .line 194
    .line 195
    :cond_7
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public L(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tk6;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tk6;->G(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget v0, p0, Ll/tk6;->q:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->o:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_4

    .line 6
    .line 7
    iget v0, p0, Ll/tk6;->c:I

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x4

    .line 12
    return p0

    .line 13
    :cond_0
    iget v0, p0, Ll/tk6;->d:I

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x5

    .line 18
    return p0

    .line 19
    :cond_1
    iget v0, p0, Ll/tk6;->e:I

    .line 20
    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    const/4 p0, 0x6

    .line 24
    return p0

    .line 25
    :cond_2
    iget v0, p0, Ll/tk6;->f:I

    .line 26
    .line 27
    if-ne p1, v0, :cond_3

    .line 28
    .line 29
    const/4 p0, 0x7

    .line 30
    return p0

    .line 31
    :cond_3
    iget v0, p0, Ll/tk6;->g:I

    .line 32
    .line 33
    if-ne p1, v0, :cond_4

    .line 34
    .line 35
    const/16 p0, 0x8

    .line 36
    .line 37
    return p0

    .line 38
    :cond_4
    invoke-virtual {p0, p1}, Ll/tk6;->G(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-eqz p0, :cond_8

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 45
    .line 46
    const-string v0, "dismissed"

    .line 47
    .line 48
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :cond_5
    invoke-static {p0}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_6

    .line 61
    .line 62
    const/4 p0, 0x2

    .line 63
    return p0

    .line 64
    :cond_6
    invoke-static {p0}, Ll/fcp;->k(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_7

    .line 69
    .line 70
    const/4 p0, 0x3

    .line 71
    return p0

    .line 72
    :cond_7
    const-string p1, "virtualvoice"

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_8

    .line 81
    .line 82
    const/16 p0, 0x9

    .line 83
    .line 84
    return p0

    .line 85
    :cond_8
    const/4 p0, 0x0

    .line 86
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tk6;->h:Ljava/util/List;

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
    iget-object p0, p0, Ll/tk6;->h:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
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
