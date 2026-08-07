.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Landroid/view/View;

.field public k:Landroid/view/View;

.field public l:Landroidx/recyclerview/widget/RecyclerView;

.field public m:Landroidx/constraintlayout/widget/Group;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

.field public q:Ll/yuk;

.field public r:Ll/juk;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private B0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/g2t;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->z0(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->r:Ll/juk;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->r:Ll/juk;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/juk;->G(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public static synthetic h0(Ll/yuk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yuk;->I4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->v0(Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;)V

    return-void
.end method

.method public static synthetic j0(Ll/ats;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ats;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->w0(ZZ)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->u0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->s0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "onlineGuard"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "potentialGuard"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private z0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->m:Landroidx/constraintlayout/widget/Group;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->n:Lv/VImage;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/obc0;->F2:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->o:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->U9:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final D0(ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->h:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/hm0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/hm0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;ZZ)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lm0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->o0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p0(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final q0(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;ZZ)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 4
    .line 5
    invoke-static {p3, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 13
    .line 14
    const-string p3, "potentialGuard"

    .line 15
    .line 16
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->D0(ZZ)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->g:Lv/VText;

    .line 24
    .line 25
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    invoke-virtual {p2, p3}, Landroid/view/View;->setSelected(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->h:Lv/VText;

    .line 33
    .line 34
    const-string p3, "onlineGuard"

    .line 35
    .line 36
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    invoke-virtual {p2, p3}, Landroid/view/View;->setSelected(Z)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->q:Ll/yuk;

    .line 44
    .line 45
    invoke-virtual {p2, p1}, Ll/yuk;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->B0(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public r0(Ll/yuk;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->q:Ll/yuk;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->h:Lv/VText;

    .line 4
    .line 5
    new-instance v1, Ll/im0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/im0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->g:Lv/VText;

    .line 14
    .line 15
    new-instance v1, Ll/jm0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/jm0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->i:Lv/VImage;

    .line 24
    .line 25
    new-instance v0, Ll/km0;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/km0;-><init>(Ll/yuk;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic u0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->q:Ll/yuk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yuk;->N4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v0(Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->q:Ll/yuk;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->l:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->r:Ll/juk;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->q:Ll/yuk;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/yuk;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->B0(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const/4 p1, 0x1

    .line 43
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->z0(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic w0(ZZ)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->h:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Ll/bnl0$g;->a:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->g:Lv/VText;

    .line 10
    .line 11
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v1, v1, Ll/bnl0$g;->a:I

    .line 16
    .line 17
    sub-int/2addr v0, v1

    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    move v0, v1

    .line 22
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->k:Landroid/view/View;

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 27
    .line 28
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 29
    .line 30
    .line 31
    int-to-float p0, v0

    .line 32
    const/4 p1, 0x1

    .line 33
    new-array v9, p1, [F

    .line 34
    .line 35
    aput p0, v9, v1

    .line 36
    .line 37
    const-string v3, "translationX"

    .line 38
    .line 39
    const-wide/16 v4, 0x0

    .line 40
    .line 41
    const-wide/16 v6, 0x64

    .line 42
    .line 43
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    int-to-float p0, v0

    .line 52
    invoke-virtual {v2, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public y0(Ll/ats;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/ats;->B()Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 8
    .line 9
    check-cast v0, Ll/yuk;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->r0(Ll/yuk;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->f:Lv/VImage;

    .line 15
    .line 16
    new-instance v1, Ll/em0;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Ll/em0;-><init>(Ll/ats;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const-string v1, "anchorGuard"

    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    :cond_0
    const-string v0, "potentialGuard"

    .line 37
    .line 38
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;ZZ)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/juk;

    .line 52
    .line 53
    new-instance v1, Ll/fm0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/fm0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;)V

    .line 56
    .line 57
    .line 58
    invoke-direct {v0, v1}, Ll/juk;-><init>(Ll/y20;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->r:Ll/juk;

    .line 62
    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 64
    .line 65
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 72
    .line 73
    check-cast p1, Ll/yuk;

    .line 74
    .line 75
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 76
    .line 77
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/hiv;

    .line 82
    .line 83
    iget-object v0, v0, Ll/hiv;->f:Lrx/subjects/a;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ll/hj2;->J3(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const/4 v0, 0x2

    .line 90
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v0, Ll/gm0;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Ll/gm0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void
.end method
