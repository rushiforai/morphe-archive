.class public Ll/tnk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tnk$a;,
        Ll/tnk$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/rnk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VRecyclerView;

.field public final c:Lcom/p1/mobile/android/app/Act;

.field public d:Ll/tnk$b;

.field public e:Ll/rnk;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/tnk;->f:Ljava/util/List;

    .line 6
    .line 7
    iput-object v0, p0, Ll/tnk;->g:Ljava/util/List;

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/tnk;->h:Ljava/util/List;

    .line 15
    .line 16
    iput-object p1, p0, Ll/tnk;->c:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/tnk;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tnk;->l(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/tnk;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnk;->c:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/tnk;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnk;->h:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/tnk;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnk;->f:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/tnk;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnk;->g:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/tnk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnk;->a:Lv/VText;

    return-void
.end method

.method public static bridge synthetic i(Ll/tnk;Lv/VRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnk;->b:Lv/VRecyclerView;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tnk;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rnk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tnk;->k(Ll/rnk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tnk;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tnk$a;->a(Ll/tnk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/rnk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnk;->e:Ll/rnk;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V
    .locals 2

    .line 1
    iput-object p2, p0, Ll/tnk;->f:Ljava/util/List;

    .line 2
    .line 3
    iput-object p3, p0, Ll/tnk;->g:Ljava/util/List;

    .line 4
    .line 5
    iget-object p1, p0, Ll/tnk;->h:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Ll/tnk;->c:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->S:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v0, p0, Ll/tnk;->h:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/jek$a;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/jek$a;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {p2, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/tnk;->h:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Ll/tnk;->d:Ll/tnk$b;

    .line 49
    .line 50
    iget-object p2, p0, Ll/tnk;->h:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    invoke-static {p1, p2}, Ll/tnk$b;->J(Ll/tnk$b;I)V

    .line 57
    .line 58
    .line 59
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_1

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string p2, "\u7fa4\u6210\u5458"

    .line 70
    .line 71
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 72
    .line 73
    iget-object p2, p0, Ll/tnk;->h:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    new-instance p1, Ll/jek$a;

    .line 79
    .line 80
    invoke-direct {p1}, Ll/jek$a;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {p3, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/tnk;->h:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {p1, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 89
    .line 90
    .line 91
    :cond_1
    iget-object p1, p0, Ll/tnk;->h:Ljava/util/List;

    .line 92
    .line 93
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iget-object p2, p0, Ll/tnk;->a:Lv/VText;

    .line 98
    .line 99
    const/4 p3, 0x0

    .line 100
    const/4 v0, 0x1

    .line 101
    if-eqz p1, :cond_2

    .line 102
    .line 103
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/tnk;->b:Lv/VRecyclerView;

    .line 107
    .line 108
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/tnk;->b:Lv/VRecyclerView;

    .line 116
    .line 117
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Ll/tnk;->d:Ll/tnk$b;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/snk;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/snk;-><init>(Ll/tnk;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2, v0}, Ll/jek;->v(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/util/List;Ll/jek$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/tnk;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 4
    .line 5
    iget-object v2, p0, Ll/tnk;->c:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    invoke-direct {v1, v2, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/tnk$b;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-direct {v0, p0, v1}, Ll/tnk$b;-><init>(Ll/tnk;Ll/aok;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/tnk;->d:Ll/tnk$b;

    .line 22
    .line 23
    iget-object p0, p0, Ll/tnk;->b:Lv/VRecyclerView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
