.class public Lcom/p1/mobile/putong/account/ui/camera/adapter/b;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:I

.field public g:Z

.field public h:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
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
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->f:I

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/account/ui/camera/adapter/b;ILcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->I(ILcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Landroid/view/View;)V

    return-void
.end method

.method private N(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->c:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->F(Landroid/view/View;Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

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
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/hec0;->f:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;II)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupItemView;

    .line 2
    .line 3
    iget p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p4, p3, :cond_0

    .line 7
    .line 8
    move p3, v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p3, 0x0

    .line 11
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->isNone()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupItemView;->c(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Z)V

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->f:I

    .line 22
    .line 23
    iget-boolean v2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->g:Z

    .line 24
    .line 25
    if-ne v1, v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p1, p2, p3, v2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupItemView;->e(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;ZZ)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    invoke-virtual {p1, p2, p3, v2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupItemView;->d(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;ZZ)V

    .line 32
    .line 33
    .line 34
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupItemView;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupItemView;

    .line 35
    .line 36
    new-instance p3, Ll/ur;

    .line 37
    .line 38
    invoke-direct {p3, p0, p4, p2}, Ll/ur;-><init>(Lcom/p1/mobile/putong/account/ui/camera/adapter/b;ILcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public G()Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 2
    .line 3
    if-ltz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 21
    .line 22
    if-le v0, v1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->none()Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->none()Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public H(I)Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic I(ILcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 2
    .line 3
    if-ne p1, p3, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->h:Ll/a30;

    .line 7
    .line 8
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->N(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->h:Ll/a30;

    .line 18
    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-interface {p0, p2, p1, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public J(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public K(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->h:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public L(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->N(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->h:Ll/a30;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->e:I

    .line 22
    .line 23
    if-ltz v0, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->h:Ll/a30;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 34
    .line 35
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-interface {v1, p0, p1, v0}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public M(Landroid/content/Context;Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iput-boolean p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->g:Z

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->c:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->H(I)Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
