.class public Ll/mok;
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
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/hpk;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/hpk;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    iput-object v0, p0, Ll/mok;->d:Ljava/util/List;

    .line 7
    .line 8
    iput-object p1, p0, Ll/mok;->c:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    iput-object p2, p0, Ll/mok;->e:Ll/hpk;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic E(Ll/mok;Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/mok;->H(Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;Landroid/view/View;)V

    return-void
.end method

.method private synthetic H(Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p4, p0, Ll/mok;->c:Lcom/p1/mobile/android/app/Act;

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
    iget-object p0, p0, Ll/mok;->e:Ll/hpk;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/hpk;->pageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p4, "group_name"

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string p4, "group_order_id"

    .line 28
    .line 29
    invoke-static {p4, p2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v2

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
    move-result-object v3

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
    move-result-object v4

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
    move-result-object v5

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
    move-result-object v6

    .line 71
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-string p2, "e_group_chat_list"

    .line 76
    .line 77
    invoke-static {p2, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private J(Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v0, "\u6682\u65f6\u6ca1\u6709\u65b0\u7684\u5185\u5bb9"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;->a:Landroid/widget/ImageView;

    .line 9
    .line 10
    const/high16 p1, 0x43300000    # 176.0f

    .line 11
    .line 12
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/mok;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatGroup;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mok;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/mok;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/mok;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x2

    .line 5
    if-ne p2, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

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
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

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

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatGroup;II)V
    .locals 9

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/mok;->J(Lcom/p1/mobile/putong/core/ui/view/CoreImEmptyView;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    if-ne p3, v0, :cond_4

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

    .line 14
    .line 15
    new-instance p3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    move v2, v1

    .line 22
    :goto_0
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-ge v2, v3, :cond_2

    .line 29
    .line 30
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;

    .line 37
    .line 38
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->name:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    sub-int/2addr v3, v0

    .line 50
    if-eq v2, v3, :cond_1

    .line 51
    .line 52
    const-string v3, ":"

    .line 53
    .line 54
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object v0, p0, Ll/mok;->e:Ll/hpk;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/hpk;->pageId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1, v0, p2, v1}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->j(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Z)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object v0, p0, Ll/mok;->e:Ll/hpk;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/hpk;->pageId()Ljava/lang/String;

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
    filled-new-array/range {v3 .. v8}, [Ll/sfj0$a;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    const-string v2, "e_group_chat_list"

    .line 135
    .line 136
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 137
    .line 138
    .line 139
    :cond_3
    new-instance v0, Ll/lok;

    .line 140
    .line 141
    invoke-direct {v0, p0, p2, p4, p3}, Ll/lok;-><init>(Ll/mok;Lcom/p1/mobile/putong/core/data/ChatGroup;ILjava/lang/StringBuilder;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 145
    .line 146
    .line 147
    :cond_4
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mok;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/mok;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 18
    .line 19
    return-object p0
.end method

.method public I(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/mok;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mok;->e:Ll/hpk;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hpk;->A0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/mok;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/mok;->d:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sub-int/2addr v0, p1

    .line 24
    const/4 p1, 0x2

    .line 25
    if-ge v0, p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/mok;->e:Ll/hpk;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/hpk;->r()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mok;->G(I)Lcom/p1/mobile/putong/core/data/ChatGroup;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mok;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method
