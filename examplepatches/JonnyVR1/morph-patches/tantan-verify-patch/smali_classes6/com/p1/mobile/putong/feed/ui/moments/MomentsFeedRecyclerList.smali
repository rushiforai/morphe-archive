.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;
.super Lv/VRecyclerView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;,
        Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;
    }
.end annotation


# instance fields
.field public c:I

.field public d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

.field public e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Landroid/widget/RelativeLayout;

.field public i:I

.field public j:I

.field public k:Z

.field public l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

.field public m:Z

.field public n:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->c:I

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->j:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->k:Z

    .line 14
    .line 15
    new-instance p1, Ll/ex00;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Ll/ex00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->n:Ll/y20;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, 0x7fffffff

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->c:I

    const/4 p1, -0x1

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->j:I

    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->k:Z

    .line 27
    new-instance p1, Ll/ex00;

    invoke-direct {p1, p0}, Ll/ex00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->n:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p1, 0x7fffffff

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->c:I

    const/4 p1, -0x1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->j:I

    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->k:Z

    .line 32
    new-instance p1, Ll/ex00;

    invoke-direct {p1, p0}, Ll/ex00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->n:Ll/y20;

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->R([I)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->Q(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;Lcom/p1/mobile/putong/data/Banners;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->S(Lcom/p1/mobile/putong/data/Banners;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->g:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->f:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)Landroid/widget/RelativeLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->h:Landroid/widget/RelativeLayout;

    return-object p0
.end method


# virtual methods
.method public M()Lcom/p1/mobile/putong/app/PutongAct;
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

.method public N(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {p0, v1, p1, v2, v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->X1(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public O(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->i(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P(Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->e(Ljava/lang/String;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Q(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->O4(Z)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->i:I

    .line 15
    .line 16
    if-eqz p1, :cond_4

    .line 17
    .line 18
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->j:I

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    if-eq p1, v1, :cond_1

    .line 22
    .line 23
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->m:Z

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->j:I

    .line 32
    .line 33
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->m:Z

    .line 34
    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->m:Z

    .line 38
    .line 39
    :cond_3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->i:I

    .line 46
    .line 47
    iget v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->j:I

    .line 48
    .line 49
    const/high16 v3, 0x41f00000    # 30.0f

    .line 50
    .line 51
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    sub-int/2addr v2, v3

    .line 56
    invoke-virtual {p1, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 57
    .line 58
    .line 59
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->P4()V

    .line 62
    .line 63
    .line 64
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->i:I

    .line 65
    .line 66
    return-void
.end method

.method public final synthetic R([I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->g:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget p1, p1, v0

    .line 5
    .line 6
    const/high16 v0, 0x43480000    # 200.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sub-int/2addr p1, v0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/data/Banners;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->h:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget v2, Ll/k9c0;->p0:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->h:Landroid/widget/RelativeLayout;

    .line 25
    .line 26
    invoke-static {v0, v1, p1}, Ll/orb0;->C(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Banners;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/orb0;->K(Lcom/p1/mobile/putong/data/Banners;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public U(IILandroid/content/Intent;)Z
    .locals 3

    .line 1
    const/16 v0, 0x48

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->c()V

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    const/16 v0, 0x32

    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    if-ne p1, v0, :cond_3

    .line 16
    .line 17
    if-ne p2, v2, :cond_2

    .line 18
    .line 19
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p2, "moment"

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 38
    .line 39
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->j(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->k:Z

    .line 43
    .line 44
    :cond_2
    return v1

    .line 45
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 46
    .line 47
    instance-of p3, p3, Lcom/p1/mobile/putong/feed/ui/moments/a;

    .line 48
    .line 49
    if-eqz p3, :cond_5

    .line 50
    .line 51
    const/16 p3, 0x16

    .line 52
    .line 53
    if-ne p1, p3, :cond_5

    .line 54
    .line 55
    if-ne p2, v2, :cond_4

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->U4(Z)V

    .line 60
    .line 61
    .line 62
    :cond_4
    return v1

    .line 63
    :cond_5
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public V()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->a()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public W(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;ZLcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 4
    .line 5
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->h(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->m:Z

    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/tec0;->u4:I

    .line 17
    .line 18
    invoke-virtual {v1, v2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->g:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1, p0}, Ll/mrb0;->n(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/widget/RelativeLayout;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->h:Landroid/widget/RelativeLayout;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->g:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    sget v3, Ll/k9c0;->T:I

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->g:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    sget v3, Ll/k9c0;->T:I

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->g:Landroid/view/View;

    .line 65
    .line 66
    sget v2, Ll/hdc0;->S1:I

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lv/VText;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    sget v3, Ll/k9c0;->m0:I

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    .line 90
    .line 91
    new-instance v1, Ll/fx00;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/fx00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    .line 94
    .line 95
    .line 96
    invoke-static {p0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v2, Ll/tec0;->z0:I

    .line 108
    .line 109
    invoke-virtual {v1, v2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->f:Landroid/view/View;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    sget v2, Ll/k9c0;->T:I

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 126
    .line 127
    .line 128
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 129
    .line 130
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    .line 131
    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 134
    .line 135
    invoke-static {}, Ll/j4h;->g()Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_0

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v1, "moment_feed"

    .line 146
    .line 147
    invoke-static {v1}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {v1}, Ll/orb0;->l(Lcom/p1/mobile/putong/data/BannerLoc;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    new-instance v1, Ll/gx00;

    .line 160
    .line 161
    invoke-direct {v1, p0}, Ll/gx00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    .line 162
    .line 163
    .line 164
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 169
    .line 170
    .line 171
    :cond_0
    return-void
.end method

.method public setFoldLimit(I)V
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->c:I

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "must be positive"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
