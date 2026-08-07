.class public Ll/pkk;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/ChatGroup;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    iput-object v0, p0, Ll/pkk;->d:Ljava/util/List;

    .line 7
    .line 8
    iput-object v0, p0, Ll/pkk;->e:Ljava/util/List;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/pkk;->f:Z

    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    iput-object v0, p0, Ll/pkk;->g:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic E(Ll/pkk;Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pkk;->K(Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/pkk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkk;->M(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic G(Ll/pkk;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkk;->L(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic H(Ll/pkk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkk;->N(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pkk;->I(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatGroup;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/pkk;->f:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/pkk;->e:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    add-int/2addr p0, v1

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/pkk;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    iget-object p0, p0, Ll/pkk;->d:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ne p2, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/qec0;->K0:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p2, Ll/qec0;->i:I

    .line 23
    .line 24
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public I(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatGroup;II)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    move-object v1, p1

    .line 5
    check-cast v1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/pkk;->Q(Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-nez p3, :cond_5

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

    .line 13
    .line 14
    new-instance p3, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v1, v2, :cond_2

    .line 27
    .line 28
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroupTag;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->name:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    sub-int/2addr v2, v0

    .line 48
    if-eq v1, v2, :cond_1

    .line 49
    .line 50
    const-string v2, ":"

    .line 51
    .line 52
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    iget-object v0, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->pageId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-boolean v1, p0, Ll/pkk;->f:Z

    .line 65
    .line 66
    invoke-virtual {p1, v0, p2, v1}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->j(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Z)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    iget-object v0, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->pageId()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v1, "group_name"

    .line 79
    .line 80
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    const-string v1, "group_order_id"

    .line 87
    .line 88
    invoke-static {v1, p4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    const-string v1, "group_tag"

    .line 93
    .line 94
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    const-string v1, "groupchat_id"

    .line 103
    .line 104
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->name:Ljava/lang/String;

    .line 113
    .line 114
    const-string v2, "groupchat_type"

    .line 115
    .line 116
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    const-string v1, "is_anonymou_group"

    .line 121
    .line 122
    invoke-static {p2}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    invoke-static {v1, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 127
    .line 128
    .line 129
    move-result-object v8

    .line 130
    iget-boolean v1, p0, Ll/pkk;->f:Z

    .line 131
    .line 132
    if-eqz v1, :cond_3

    .line 133
    .line 134
    const-string v1, "search_empty"

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_3
    const-string v1, "search_no_empty"

    .line 138
    .line 139
    :goto_1
    const-string v2, "which_page"

    .line 140
    .line 141
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    filled-new-array/range {v3 .. v9}, [Ll/sfj0$a;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    const-string v2, "e_group_chat_list"

    .line 150
    .line 151
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 152
    .line 153
    .line 154
    :cond_4
    new-instance v0, Ll/lkk;

    .line 155
    .line 156
    invoke-direct {v0, p0, p2, p4, p3}, Ll/lkk;-><init>(Ll/pkk;Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;)V

    .line 157
    .line 158
    .line 159
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ll/pkk;->C()I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    add-int/lit8 p1, p1, -0x3

    .line 167
    .line 168
    if-lt p4, p1, :cond_5

    .line 169
    .line 170
    iget-object p0, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 171
    .line 172
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->Z1()Ll/mlk;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0}, Ll/mlk;->u0()V

    .line 177
    .line 178
    .line 179
    :cond_5
    return-void
.end method

.method public J(I)Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pkk;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pkk;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-boolean v0, p0, Ll/pkk;->f:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    if-lez p1, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/pkk;->e:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/pkk;->e:Ljava/util/List;

    .line 33
    .line 34
    add-int/lit8 p1, p1, -0x1

    .line 35
    .line 36
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object p4, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {p4, v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;->a2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Z)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p4, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    iget-object p4, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 14
    .line 15
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->pageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    const-string v0, "group_name"

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v0, "group_order_id"

    .line 28
    .line 29
    invoke-static {v0, p2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-string p2, "group_tag"

    .line 34
    .line 35
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-static {p2, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string p2, "groupchat_id"

    .line 44
    .line 45
    iget-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p2, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->name:Ljava/lang/String;

    .line 54
    .line 55
    const-string p3, "groupchat_type"

    .line 56
    .line 57
    invoke-static {p3, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    const-string p2, "is_anonymou_group"

    .line 62
    .line 63
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-static {p2, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    iget-boolean p0, p0, Ll/pkk;->f:Z

    .line 72
    .line 73
    if-eqz p0, :cond_0

    .line 74
    .line 75
    const-string p0, "search_empty"

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    const-string p0, "search_no_empty"

    .line 79
    .line 80
    :goto_0
    const-string p1, "which_page"

    .line 81
    .line 82
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    filled-new-array/range {v2 .. v8}, [Ll/sfj0$a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "e_group_chat_list"

    .line 91
    .line 92
    invoke-static {p1, p4, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic L(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;->b2(Ljava/util/List;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/GroupCreateTypeAct;->a2(Landroid/content/Context;Ljava/util/List;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->O0:I

    .line 23
    .line 24
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic M(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-boolean v0, p0, Ll/pkk;->f:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "search_empty"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "search_no_empty"

    .line 15
    .line 16
    :goto_0
    const-string v1, "which_page"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "e_create_group"

    .line 27
    .line 28
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 32
    .line 33
    invoke-static {p1}, Ll/jek;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object p1, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 41
    .line 42
    const-string v0, ""

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/pkk;->c:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->N6()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/nkk;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/nkk;-><init>(Ll/pkk;)V

    .line 65
    .line 66
    .line 67
    new-instance v1, Ll/okk;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/okk;-><init>(Ll/pkk;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public O(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/pkk;->f:Z

    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/pkk;->g:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/pkk;->d:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method

.method public P(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/pkk;->f:Z

    .line 9
    .line 10
    iput-object p3, p0, Ll/pkk;->g:Ljava/lang/String;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p3, 0x0

    .line 14
    iput-boolean p3, p0, Ll/pkk;->f:Z

    .line 15
    .line 16
    const-string p3, ""

    .line 17
    .line 18
    iput-object p3, p0, Ll/pkk;->g:Ljava/lang/String;

    .line 19
    .line 20
    :goto_0
    iput-object p1, p0, Ll/pkk;->d:Ljava/util/List;

    .line 21
    .line 22
    iput-object p2, p0, Ll/pkk;->e:Ljava/util/List;

    .line 23
    .line 24
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->a:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->b:Landroid/widget/TextView;

    .line 8
    .line 9
    const/high16 v2, 0x41600000    # 14.0f

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->b:Landroid/widget/TextView;

    .line 15
    .line 16
    const-string v2, "#d0d0d0"

    .line 17
    .line 18
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->a:Landroid/widget/ImageView;

    .line 26
    .line 27
    const/high16 v2, 0x41e80000    # 29.0f

    .line 28
    .line 29
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    iget-boolean v0, p0, Ll/pkk;->f:Z

    .line 37
    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->c:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    const/4 v3, 0x1

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->b:Landroid/widget/TextView;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->d:Landroid/widget/TextView;

    .line 52
    .line 53
    iget-object v1, p0, Ll/pkk;->g:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->e:Landroid/widget/TextView;

    .line 59
    .line 60
    new-instance v1, Ll/mkk;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/mkk;-><init>(Ll/pkk;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->b:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->b:Landroid/widget/TextView;

    .line 78
    .line 79
    const-string v1, "\u6ca1\u6709\u7b26\u5408\u8981\u6c42\u7684\u7fa4"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->f:Landroid/widget/TextView;

    .line 85
    .line 86
    iget-object p0, p0, Ll/pkk;->e:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    xor-int/2addr p0, v3

    .line 93
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkk;->J(I)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
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
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/pkk;->f:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    return v1

    .line 11
    :cond_1
    iget-object p0, p0, Ll/pkk;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    return v1
.end method
