.class public Lcom/p1/mobile/putong/core/newui/loveletter/a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/loveletter/a$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/newui/loveletter/a$b;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ll/few;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/loveletter/a$b;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Z

.field public final g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/newui/loveletter/a$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/few;Lv/VRecyclerView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->f:Z

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->g:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-interface {p1}, Ll/few;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->c:Ll/few;

    .line 28
    .line 29
    new-instance p1, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/a;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/newui/loveletter/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->P(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/newui/loveletter/a$b;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static synthetic G(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/loveletter/a$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic H(Lcom/p1/mobile/putong/core/newui/loveletter/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->O(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/newui/loveletter/a$b;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/core/newui/loveletter/a;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->g:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/core/newui/loveletter/a;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->f:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->L(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/loveletter/a$b;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

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
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->B6:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 v0, 0x2

    .line 19
    if-ne p2, v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p2, Ll/kec0;->D6:I

    .line 28
    .line 29
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    const/4 v0, 0x3

    .line 37
    if-ne p2, v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget p2, Ll/kec0;->z6:I

    .line 44
    .line 45
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget p2, Ll/kec0;->E6:I

    .line 55
    .line 56
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public L(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/loveletter/a$b;II)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->c:Ll/few;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->d:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 9
    .line 10
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->a(Ll/few;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x2

    .line 15
    if-ne p3, v0, :cond_1

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterSearchLayout;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->c:Ll/few;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterSearchLayout;->b(Ll/few;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 v0, 0x3

    .line 26
    if-ne p3, v0, :cond_2

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEmptyLayout;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->c:Ll/few;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEmptyLayout;->b(Ll/few;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    move-object v1, p1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->c:Ll/few;

    .line 40
    .line 41
    iget-object v4, p2, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->b:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v5, Ll/hew;

    .line 44
    .line 45
    invoke-direct {v5, p0}, Ll/hew;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/a;)V

    .line 46
    .line 47
    .line 48
    move-object v2, p0

    .line 49
    move v6, p4

    .line 50
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->g(Ll/jic0;Ll/few;Ljava/lang/String;Ll/y20;I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    sub-int/2addr p0, v0

    .line 60
    if-lt v6, p0, :cond_3

    .line 61
    .line 62
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    const/16 p1, 0xa

    .line 69
    .line 70
    if-le p0, p1, :cond_3

    .line 71
    .line 72
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/loveletter/a;->c:Ll/few;

    .line 73
    .line 74
    invoke-interface {p0}, Ll/few;->r()V

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void
.end method

.method public M(I)Lcom/p1/mobile/putong/core/newui/loveletter/a$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public N(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->M(I)Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->c:I

    .line 6
    .line 7
    return p0
.end method

.method public final synthetic O(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/lew;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/lew;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->f:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->g:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final P(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    new-instance v0, Ll/iew;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Ll/iew;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/a;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public Q(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/loveletter/a$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public R(Ljava/util/List;)V
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
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/kew;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/kew;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public S(Ljava/util/List;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iput-object p2, v0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->d:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-nez p2, :cond_1

    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a;->d:Ljava/util/List;

    .line 51
    .line 52
    new-instance v0, Ll/jew;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/jew;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->M(I)Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->M(I)Lcom/p1/mobile/putong/core/newui/loveletter/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$b;->a:I

    .line 6
    .line 7
    return p0
.end method
