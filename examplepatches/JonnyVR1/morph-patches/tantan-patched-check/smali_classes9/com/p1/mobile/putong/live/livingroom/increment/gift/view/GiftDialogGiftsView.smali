.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/ImageView;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lcom/google/android/material/tabs/TabLayout;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;

.field public i:Lv/VPager;

.field public j:Landroid/view/ViewStub;

.field public k:I

.field public l:I

.field public m:Ll/nvj;

.field public n:Ll/bjs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bjs<",
            "*>;"
        }
    .end annotation
.end field

.field public o:Ll/eoj;

.field public p:I

.field public final q:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public r:Z

.field public s:Z

.field public t:Landroid/view/View;

.field public u:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->k:I

    .line 6
    .line 7
    const/4 p1, -0x1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->l:I

    .line 9
    .line 10
    new-instance p1, Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q:Ljava/util/Set;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->s:Z

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->k:I

    const/4 p1, -0x1

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->l:I

    .line 24
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q:Ljava/util/Set;

    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->s:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->k:I

    const/4 p1, -0x1

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->l:I

    .line 29
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q:Ljava/util/Set;

    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->s:Z

    return-void
.end method

.method private synthetic E0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->o:Ll/eoj;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/eoj;->e0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic G0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->o:Ll/eoj;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/eoj;->e0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private N0(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->X0(Lcom/google/android/material/tabs/TabLayout$Tab;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private T0(Ljava/util/List;IIZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;IIZ)V"
        }
    .end annotation

    .line 1
    if-eqz p4, :cond_1

    .line 2
    .line 3
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->r:Z

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->n:Ll/bjs;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-le p2, p3, :cond_0

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->n:Ll/bjs;

    .line 18
    .line 19
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ll/hzj;

    .line 24
    .line 25
    invoke-virtual {p2, p3, p1}, Ll/bjs;->M5(ILl/hzj;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 29
    .line 30
    invoke-virtual {p0, p3}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-static {p1, p2}, Ll/cpj;->y(Ljava/util/List;I)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->p:I

    .line 39
    .line 40
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->r:Z

    .line 41
    .line 42
    if-nez p2, :cond_2

    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->n:Ll/bjs;

    .line 45
    .line 46
    if-eqz p2, :cond_2

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    iget p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->p:I

    .line 53
    .line 54
    if-le p2, p3, :cond_2

    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->n:Ll/bjs;

    .line 57
    .line 58
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Ll/hzj;

    .line 63
    .line 64
    invoke-virtual {p2, p3, p1}, Ll/bjs;->M5(ILl/hzj;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 68
    .line 69
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->p:I

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private U0(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->t:Landroid/view/View;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->j:Landroid/view/ViewStub;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->t:Landroid/view/View;

    .line 14
    .line 15
    sget v0, Ll/mdc0;->a5:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/fqj;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/fqj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->t:Landroid/view/View;

    .line 30
    .line 31
    sget v0, Ll/mdc0;->r1:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lv/VImage;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->u:Lv/VImage;

    .line 40
    .line 41
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->t:Landroid/view/View;

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->u:Lv/VImage;

    .line 48
    .line 49
    sget p1, Ll/obc0;->p2:I

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    if-nez p1, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->t:Landroid/view/View;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->t:Landroid/view/View;

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->u:Lv/VImage;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method private X0(Lcom/google/android/material/tabs/TabLayout$Tab;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->u0(Lcom/google/android/material/tabs/TabLayout$Tab;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;->setSelect(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private Z0(Ll/zxj;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/zxj;->f()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Ll/zxj;->e()Ll/xxj$a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/xxj$a;->a()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/xxj$a;->c()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x1

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->m:Ll/nvj;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/nvj;->getCount()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-gtz p1, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void

    .line 40
    :cond_1
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->U0(Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->U0(Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    const/4 p1, 0x0

    .line 49
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->U0(Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->I0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->H0()V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->E0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->G0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Ll/bjs;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->D0(Ll/bjs;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->k:I

    return p0
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q:Ljava/util/Set;

    return-object p0
.end method

.method public static bridge synthetic o0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->k:I

    return-void
.end method

.method public static bridge synthetic p0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Ll/bjs;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->K0(Ll/bjs;)V

    return-void
.end method

.method public static bridge synthetic q0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->N0(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    return-void
.end method

.method public static bridge synthetic r0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->setIndicatorPager(I)V

    return-void
.end method

.method public static bridge synthetic s0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Lcom/google/android/material/tabs/TabLayout$Tab;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->X0(Lcom/google/android/material/tabs/TabLayout$Tab;Z)V

    return-void
.end method

.method private setIndicatorPager(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->v0(I)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->G0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private u0(Lcom/google/android/material/tabs/TabLayout$Tab;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_1
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;

    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_2
    return-object p0
.end method

.method private w0(Ljava/util/List;IIZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;IIZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->m:Ll/nvj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nvj;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->n:Ll/bjs;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/nvj;-><init>(Ll/bjs;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->m:Ll/nvj;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->m:Ll/nvj;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/nvj;->v(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->y0(Ljava/util/List;IIZ)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private y0(Ljava/util/List;IIZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;IIZ)V"
        }
    .end annotation

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-static {p1, p2}, Ll/cpj;->y(Ljava/util/List;I)I

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    :goto_0
    const/4 p2, 0x0

    .line 9
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 14
    .line 15
    if-ge p2, p4, :cond_2

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    if-nez p4, :cond_1

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 25
    .line 26
    invoke-static {v0}, Ll/yrj;->c(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ll/hzj;

    .line 35
    .line 36
    invoke-virtual {v0, v1, p4, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;->j0(Ll/hzj;Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    .line 37
    .line 38
    .line 39
    :goto_2
    add-int/lit8 p2, p2, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public B0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic D0(Ll/bjs;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;->i0(Ll/bjs;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->getCurrentPageView()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->G0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic I0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->n:Ll/bjs;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ll/bjs;->T5(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public J0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->getCurrentPageView()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->y0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final K0(Ll/bjs;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->getCurrentPageView()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->y0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->getTabEntrance()Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->P0(Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->m:Ll/nvj;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->r:Z

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->k:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/nvj;->u(I)Ll/hzj;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v1, v0}, Ll/bjs;->M5(ILl/hzj;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->l:I

    .line 35
    .line 36
    const/4 v0, -0x1

    .line 37
    if-ne p1, v0, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 41
    .line 42
    invoke-static {p0, p1}, Ll/i0k;->a(Landroidx/viewpager/widget/ViewPager;I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    instance-of p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->w0()V

    .line 53
    .line 54
    .line 55
    :cond_3
    :goto_0
    return-void
.end method

.method public L0()V
    .locals 1

    .line 1
    new-instance v0, Ll/kqj;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kqj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public O0()V
    .locals 1

    .line 1
    new-instance v0, Ll/gqj;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gqj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P0(Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Q0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ll/hzj;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/hzj;->e()Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public R0(Ll/zxj;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->Z0(Ll/zxj;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/zxj;->f()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1}, Ll/zxj;->e()Ll/xxj$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1}, Ll/zxj;->f()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1}, Ll/xxj$a;->b()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-static {v2, v3}, Ll/cpj;->F(Ljava/util/List;Z)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {p1}, Ll/cpj;->z(Ll/zxj;)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v1}, Ll/xxj$a;->b()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-direct {p0, v2, v3, v0, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->w0(Ljava/util/List;IIZ)V

    .line 46
    .line 47
    .line 48
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-nez v4, :cond_1

    .line 53
    .line 54
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 55
    .line 56
    const/4 v5, 0x1

    .line 57
    invoke-static {v4, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 61
    .line 62
    invoke-static {v4, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_1
    invoke-virtual {v1}, Ll/xxj$a;->b()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-direct {p0, v2, v3, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->T0(Ljava/util/List;IIZ)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ll/zxj;->f()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->Q0(Ljava/util/List;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->O0()V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_0
    return-void
.end method

.method public S0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public V0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;->k0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q:Ljava/util/Set;

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_3

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q:Ljava/util/Set;

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->v0(I)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->r:Z

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    const/4 v3, 0x1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    move v1, v3

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v1, v2

    .line 47
    :goto_0
    iget-boolean v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->r:Z

    .line 48
    .line 49
    if-nez v4, :cond_1

    .line 50
    .line 51
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    if-eqz v1, :cond_2

    .line 59
    .line 60
    :goto_1
    move v2, v3

    .line 61
    :cond_2
    if-eqz v0, :cond_3

    .line 62
    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->H0()V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method public a1(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->m:Ll/nvj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/nvj;->w(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->p:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->q:Ljava/util/Set;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->s:Z

    .line 26
    .line 27
    return-void
.end method

.method public getCurrentPageView()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/i0k;->a(Landroidx/viewpager/widget/ViewPager;I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->t0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setIgnoreFirstTrackMs(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public final t0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mqj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final v0(I)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    instance-of v3, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->getTabIndex()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-ne v3, p1, :cond_0

    .line 27
    .line 28
    return-object v2

    .line 29
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public z0(Ll/bjs;Ll/eoj;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;",
            "Ll/eoj;",
            "Z)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->n:Ll/bjs;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->o:Ll/eoj;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->r:Z

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$a;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Ll/bjs;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;

    .line 18
    .line 19
    new-instance v0, Ll/hqj;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/hqj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Ll/bjs;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->d:Landroid/widget/ImageView;

    .line 28
    .line 29
    new-instance p2, Ll/iqj;

    .line 30
    .line 31
    invoke-direct {p2, p0}, Ll/iqj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->e:Landroid/view/View;

    .line 38
    .line 39
    new-instance p2, Ll/jqj;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Ll/jqj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->d:Landroid/widget/ImageView;

    .line 48
    .line 49
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->e:Landroid/view/View;

    .line 53
    .line 54
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
