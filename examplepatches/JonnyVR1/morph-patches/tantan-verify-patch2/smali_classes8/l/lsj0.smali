.class public Ll/lsj0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/DislikedUsers;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/DislikedUsers;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/ctj0;

.field public e:Z


# direct methods
.method public constructor <init>(Ll/ctj0;)V
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
    iput-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Ll/lsj0;Landroid/view/View;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;Lcom/p1/mobile/putong/core/data/DislikedUsers;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/lsj0;->L(Landroid/view/View;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;Lcom/p1/mobile/putong/core/data/DislikedUsers;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic F(Ll/lsj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lsj0;->K()V

    return-void
.end method

.method public static synthetic G(Ll/lsj0;Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lsj0;->J(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    return-void
.end method

.method private synthetic K()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lsj0;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 7
    .line 8
    const-string v0, "p_navigation_disliked,card_button_pull"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/ctj0;->F0(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/DislikedUsers;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/lsj0;->H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/DislikedUsers;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

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
    return p0

    .line 11
    :cond_0
    iget-boolean v0, p0, Ll/lsj0;->e:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/16 v1, 0x32

    .line 22
    .line 23
    if-le v0, v1, :cond_1

    .line 24
    .line 25
    const/16 p0, 0x33

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    iget-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/16 v1, 0x1f4

    .line 35
    .line 36
    if-le v0, v1, :cond_2

    .line 37
    .line 38
    const/16 p0, 0x1f5

    .line 39
    .line 40
    return p0

    .line 41
    :cond_2
    iget-object p0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    add-int/lit8 p0, p0, 0x1

    .line 48
    .line 49
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/pec0;->c0:I

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget p2, Ll/pec0;->O1:I

    .line 30
    .line 31
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/DislikedUsers;II)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_1

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;

    .line 5
    .line 6
    iget-boolean p3, p0, Ll/lsj0;->e:Z

    .line 7
    .line 8
    if-nez p3, :cond_0

    .line 9
    .line 10
    const/16 p3, 0xa

    .line 11
    .line 12
    if-le p4, p3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    new-instance p3, Ll/isj0;

    .line 17
    .line 18
    invoke-direct {p3, p0, p1, p2}, Ll/isj0;-><init>(Ll/lsj0;Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    .line 19
    .line 20
    .line 21
    new-instance p4, Ll/jsj0;

    .line 22
    .line 23
    invoke-direct {p4, p0}, Ll/jsj0;-><init>(Ll/lsj0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2, v0, p3, p4}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->h(Lcom/p1/mobile/putong/core/data/DislikedUsers;ZLl/x20;Ll/x20;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    if-nez p3, :cond_2

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserHeaderView;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserHeaderView;->c()V

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/core/data/DislikedUsers;
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    add-int/lit8 p1, p1, -0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/DislikedUsers;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ctj0;->b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_undo_button"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/lsj0;->P(Landroid/view/View;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic L(Landroid/view/View;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;Lcom/p1/mobile/putong/core/data/DislikedUsers;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ctj0;->r0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    if-nez p4, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 17
    .line 18
    const-string p4, "p_navigation_disliked,card_button_pull"

    .line 19
    .line 20
    invoke-virtual {p0, p4}, Ll/ctj0;->F0(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p5

    .line 34
    const/4 v0, 0x1

    .line 35
    if-ne p5, v0, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 38
    .line 39
    invoke-virtual {p1, p4}, Ll/ctj0;->E0(Lcom/p1/mobile/putong/core/data/DislikedUsers;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 46
    .line 47
    invoke-virtual {p0, p4}, Ll/ctj0;->D0(Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void

    .line 51
    :cond_2
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public M(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lsj0;->e:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/lsj0;->e:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/core/data/DislikedUsers;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr v0, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    :goto_0
    if-eq v0, v1, :cond_2

    .line 21
    .line 22
    iget-object v1, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-lez p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 40
    .line 41
    .line 42
    :goto_1
    return v2

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public O(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/DislikedUsers;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Ll/lsj0;->e:Z

    .line 2
    .line 3
    iget-object p2, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final P(Landroid/view/View;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/pec0;->N1:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    move-object v5, v0

    .line 19
    check-cast v5, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;

    .line 20
    .line 21
    iget-object v0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 22
    .line 23
    iget-object v0, v0, Ll/ctj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    move-object v4, v0

    .line 34
    check-cast v4, Landroid/view/ViewGroup;

    .line 35
    .line 36
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    const/4 v1, -0x1

    .line 39
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v5, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Ll/ksj0;

    .line 46
    .line 47
    move-object v2, p0

    .line 48
    move-object v3, p1

    .line 49
    move-object v6, p2

    .line 50
    invoke-direct/range {v1 .. v6}, Ll/ksj0;-><init>(Ll/lsj0;Landroid/view/View;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v5, v1}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;->setAnimCallback(Ll/y20;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5, v3, v6}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;->j(Landroid/view/View;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public Q()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x2

    .line 16
    .line 17
    if-ne p1, v0, :cond_3

    .line 18
    .line 19
    iget-object p1, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/ctj0;->q0()Lcom/p1/mobile/putong/data/Links;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/ctj0;->q0()Lcom/p1/mobile/putong/data/Links;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-boolean p1, p0, Ll/lsj0;->e:Z

    .line 43
    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Ll/lsj0;->c:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    const/16 v0, 0x32

    .line 53
    .line 54
    if-lt p1, v0, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object p1, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 58
    .line 59
    iget-object p1, p1, Ll/ctj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    iget-object p0, p0, Ll/lsj0;->d:Ll/ctj0;

    .line 68
    .line 69
    const/4 p1, 0x1

    .line 70
    invoke-virtual {p0, p1}, Ll/ctj0;->C0(Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->F:I

    .line 75
    .line 76
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 77
    .line 78
    .line 79
    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lsj0;->I(I)Lcom/p1/mobile/putong/core/data/DislikedUsers;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method
