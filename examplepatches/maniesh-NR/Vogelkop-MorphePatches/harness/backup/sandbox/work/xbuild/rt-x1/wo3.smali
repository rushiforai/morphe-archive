.class public final Lwo3;
.super Li93;
.source "SourceFile"


# static fields
.field public static final K:Lpsp;

.field public static final synthetic L:[Lxtb;


# instance fields
.field public final A:Lkze;

.field public final B:Lxj;

.field public final C:Lzyk;

.field public final D:Lzyk;

.field public final E:Lzyk;

.field public final F:Lwf;

.field public final G:Lwf;

.field public H:Lt79;

.field public I:Lnp1;

.field public J:Litd;

.field public final t:Lcom/opera/android/settings/SettingsManager;

.field public final u:Lru9;

.field public final v:Lz77;

.field public final w:Lorm;

.field public final x:Lfw3;

.field public final y:Lktl;

.field public final z:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lwo3;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentBottomBarSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lwo3;->L:[Lxtb;

    new-instance v0, Lpsp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwo3;->K:Lpsp;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lru9;Lz77;Lorm;Lfw3;Lk6l;)V
    .registers 24

    move-object/from16 v1, p0

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v2, 0x7f140523

    invoke-virtual {v0, v2}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const v2, 0x7f10000f

    iput v2, v0, Litl;->b:I

    new-instance v2, Ldxh;

    const v3, 0x7f0402f0

    invoke-direct {v2, v3}, Ldxh;-><init>(I)V

    iput-object v2, v0, Litl;->g:Ldxh;

    const/4 v8, 0x1

    invoke-direct {v1, v0, v8}, Li93;-><init>(Litl;Z)V

    move-object/from16 v0, p1

    iput-object v0, v1, Lwo3;->t:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v0, p2

    iput-object v0, v1, Lwo3;->u:Lru9;

    move-object/from16 v0, p3

    iput-object v0, v1, Lwo3;->v:Lz77;

    move-object/from16 v0, p4

    iput-object v0, v1, Lwo3;->w:Lorm;

    move-object/from16 v0, p5

    iput-object v0, v1, Lwo3;->x:Lfw3;

    new-instance v0, Lqp2;

    const/16 v2, 0x10

    invoke-direct {v0, v2}, Lqp2;-><init>(B)V

    invoke-virtual {v1, v0}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object v0

    iput-object v0, v1, Lwo3;->y:Lktl;

    new-instance v0, Lt2;

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v1, Lwo3;->z:Lzyk;

    new-instance v9, Lkze;

    sget-object v0, Luj7;->a:Luj7;

    invoke-direct {v9, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v9, v1, Lwo3;->A:Lkze;

    new-instance v10, Lxj;

    const/16 v11, 0x15

    move-object/from16 v0, p6

    invoke-direct {v10, v1, v0, v11}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v10, v1, Lwo3;->B:Lxj;

    new-instance v0, Lso3;

    const/4 v12, 0x0

    invoke-direct {v0, v1, v12}, Lso3;-><init>(Lwo3;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v1, Lwo3;->C:Lzyk;

    new-instance v0, Lso3;

    invoke-direct {v0, v1, v8}, Lso3;-><init>(Lwo3;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v1, Lwo3;->D:Lzyk;

    new-instance v0, Lso3;

    const/4 v13, 0x2

    invoke-direct {v0, v1, v13}, Lso3;-><init>(Lwo3;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, v1, Lwo3;->E:Lzyk;

    new-instance v14, Lwf;

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/16 v7, 0xc

    const/4 v1, 0x1

    const-class v2, Lwo3;

    const-string v4, "isViableDropTarget"

    const-string v5, "isViableDropTarget(Lcom/opera/android/action/ActionButton;)Z"

    move-object v3, v2

    move-object/from16 v2, p0

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v7, v0

    move-object v1, v2

    move-object v2, v3

    new-instance v15, Lso3;

    const/4 v0, 0x3

    invoke-direct {v15, v1, v0}, Lso3;-><init>(Lwo3;B)V

    new-instance v0, Lli;

    const/4 v5, 0x0

    const/16 v6, 0xa

    const-string v3, "activeDragHandler"

    const-string v4, "getActiveDragHandler()Lcom/opera/android/settings/bottom_bar/ActiveItemDragHandler;"

    invoke-direct/range {v0 .. v6}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v6, v0

    move-object v0, v1

    move-object/from16 v16, v2

    invoke-direct {v14, v12}, Lwf;-><init>(B)V

    invoke-virtual {v14, v8}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance v1, Luf;

    move-object v3, v7

    const/4 v7, 0x0

    move-object v2, v9

    move-object v4, v10

    move-object v5, v15

    invoke-direct/range {v1 .. v7}, Luf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v7, v4

    new-instance v2, Lmc8;

    invoke-direct {v2, v11}, Lmc8;-><init>(B)V

    new-instance v3, La3j;

    const/4 v9, 0x4

    invoke-direct {v3, v9}, La3j;-><init>(B)V

    const-class v4, Lvf;

    invoke-virtual {v14, v4, v1, v2, v3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    iput-object v14, v0, Lwo3;->F:Lwf;

    new-instance v10, Lwf;

    new-instance v11, Lso3;

    invoke-direct {v11, v0, v9}, Lso3;-><init>(Lwo3;B)V

    new-instance v0, Lli;

    const/4 v5, 0x0

    const/16 v6, 0xb

    const-string v3, "availableDragHandler"

    const-string v4, "getAvailableDragHandler()Lcom/opera/android/settings/bottom_bar/AvailableItemDragHandler;"

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct/range {v0 .. v6}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v10, v13}, Lwf;-><init>(B)V

    invoke-virtual {v10, v8}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance v2, La32;

    invoke-direct {v2, v7, v11, v0, v13}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lqp2;

    const/4 v3, 0x7

    invoke-direct {v0, v3}, Lqp2;-><init>(B)V

    new-instance v3, La3j;

    invoke-direct {v3, v9}, La3j;-><init>(B)V

    const-class v4, Lkv2;

    invoke-virtual {v10, v4, v2, v0, v3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    iput-object v10, v1, Lwo3;->G:Lwf;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lwo3;->z:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyo3;

    return-object p0
.end method

.method public final H0()V
    .registers 12

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object v0

    iget-object v2, v0, Lel9;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v0, v1}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v0, v3

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    sub-int/2addr v0, v3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f0700a1

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    int-to-float v5, v0

    int-to-float v6, v3

    div-float/2addr v5, v6

    float-to-int v5, v5

    const/4 v10, 0x1

    if-ge v5, v10, :cond_31

    move v5, v10

    :cond_31
    mul-int/2addr v3, v5

    mul-int v6, v4, v5

    sub-int/2addr v6, v10

    add-int/2addr v6, v3

    if-le v6, v0, :cond_3c

    if-le v5, v10, :cond_3c

    add-int/lit8 v5, v5, -0x1

    :cond_3c
    move v8, v5

    new-instance v3, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v3, v8}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v5

    new-instance v1, Lt79;

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v9}, Lt79;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V

    iput-object v1, p0, Lwo3;->H:Lt79;

    iget-object p0, v2, Landroidx/recyclerview/widget/RecyclerView;->p:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, v10

    :goto_61
    const/4 v0, -0x1

    if-ge v0, p0, :cond_72

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->X(I)Liph;

    move-result-object v0

    instance-of v0, v0, Li4a;

    if-eqz v0, :cond_6f

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->r0(I)V

    :cond_6f
    add-int/lit8 p0, p0, -0x1

    goto :goto_61

    :cond_72
    new-instance p0, Li4a;

    invoke-direct {p0, v1}, Li4a;-><init>(Lk8;)V

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    return-void
.end method

.method public final I0()V
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object v1

    iget-object v1, v1, Lel9;->d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v0, :cond_18

    move v4, v3

    goto :goto_19

    :cond_18
    move v4, v2

    :goto_19
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object p0

    iget-object p0, p0, Lel9;->e:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-nez v0, :cond_25

    move v2, v3

    :cond_25
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final J0()Lel9;
    .registers 3

    sget-object v0, Lwo3;->L:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lwo3;->y:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lel9;

    return-object p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Lwo3;->I0()V

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object p1

    iget-object p1, p1, Lel9;->c:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Lto3;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lto3;-><init>(Lwo3;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p1, Lnp1;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-interface {p2}, Lndc;->getLifecycle()Ltcc;

    move-result-object p2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Luo3;->b:Luo3;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_31

    const-string v4, "entry_point"

    const/4 v5, -0x1

    invoke-virtual {v0, v4, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v5, :cond_31

    if-ltz v0, :cond_31

    invoke-static {}, Luo3;->values()[Luo3;

    move-result-object v4

    array-length v4, v4

    sub-int/2addr v4, v2

    if-gt v0, v4, :cond_31

    invoke-static {}, Luo3;->values()[Luo3;

    move-result-object v4

    aget-object v0, v4, v0

    goto :goto_32

    :cond_31
    move-object v0, v3

    :goto_32
    if-eqz v0, :cond_35

    move-object v1, v0

    :cond_35
    iget-object v0, p0, Lwo3;->w:Lorm;

    invoke-direct {p1, p2, v1, v0}, Lnp1;-><init>(Ltcc;Luo3;Lorm;)V

    iput-object p1, p0, Lwo3;->I:Lnp1;

    iget-object p1, p0, Lwo3;->u:Lru9;

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object p2, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast p2, Landroid/content/SharedPreferences$Editor;

    const-string v0, "customize_toolbar_ui_shown"

    invoke-interface {p2, v0, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    invoke-virtual {p0}, Lwo3;->I0()V

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object p1

    iget-object p1, p1, Lel9;->b:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v0, 0x5

    invoke-direct {p2, v0}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p2, p0, Lwo3;->F:Lwf;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iput-boolean v2, p1, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    new-instance p2, Ldg;

    invoke-direct {p2}, Lk56;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object p1

    iget-object p1, p1, Lel9;->c:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Lto3;

    invoke-direct {p2, p0, v2}, Lto3;-><init>(Lwo3;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lwo3;->D:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfg;

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object p2

    iget-object p2, p2, Lel9;->b:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p1, Lskb;->h:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Lflb;

    invoke-direct {v0, p1}, Lflb;-><init>(Lblb;)V

    invoke-virtual {v0, p2}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object v0, p1, Lskb;->g:Lflb;

    iget-object p1, p0, Lwo3;->E:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmv2;

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object p2

    iget-object p2, p2, Lel9;->c:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p1, Lskb;->h:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Lflb;

    invoke-direct {v0, p1}, Lflb;-><init>(Lblb;)V

    invoke-virtual {v0, p2}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object v0, p1, Lskb;->g:Lflb;

    iget-object p1, p0, Lwo3;->z:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyo3;

    iget-object p1, p1, Lyo3;->d:Lami;

    iget-object p1, p1, Lami;->f:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object v0

    iget-object v0, v0, Lel9;->a:Landroid/widget/LinearLayout;

    new-instance v1, Lpb;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2, v0, v3, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 4

    iput-object p1, p0, Lwo3;->J:Litd;

    const v0, 0x7f0a08db

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_22

    const v0, 0x7f0a08d8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_22

    new-instance v0, Lgf;

    const/16 v1, 0x1a

    invoke-direct {v0, p0, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_22
    return-void
.end method
