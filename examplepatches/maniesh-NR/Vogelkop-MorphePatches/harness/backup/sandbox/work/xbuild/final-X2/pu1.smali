.class public final Lpu1;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic y:[Lxtb;


# instance fields
.field public final t:Lua7;

.field public final u:Lktl;

.field public final v:Lzyk;

.field public final w:Lbv1;

.field public final x:Ldt1;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lpu1;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentAppearanceSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lpu1;->y:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 5

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f140f6e

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lpu1;->t:Lua7;

    new-instance p1, Lt40;

    const/16 v0, 0xf

    invoke-direct {p1, v0}, Lt40;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lpu1;->u:Lktl;

    new-instance p1, Lt2;

    const/16 v0, 0x9

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lpu1;->v:Lzyk;

    new-instance p1, Lbv1;

    new-instance v0, Lmu1;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lmu1;-><init>(Lpu1;B)V

    invoke-direct {p1, v0}, Lbv1;-><init>(Lmu1;)V

    iput-object p1, p0, Lpu1;->w:Lbv1;

    new-instance p1, Ldt1;

    new-instance v0, Lmu1;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lmu1;-><init>(Lpu1;B)V

    invoke-direct {p1, v0}, Ldt1;-><init>(Lmu1;)V

    iput-object p1, p0, Lpu1;->x:Ldt1;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lcl9;
    .registers 3

    sget-object v0, Lpu1;->y:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lpu1;->u:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lcl9;

    return-object p0
.end method

.method public final I0()Ldv1;
    .registers 1

    iget-object p0, p0, Lpu1;->v:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldv1;

    return-object p0
.end method

.method public final onDestroy()V
    .registers 5

    invoke-super {p0}, Lryl;->onDestroy()V

    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object v0, p0, Ldv1;->i:Lyu1;

    invoke-virtual {v0}, Lyu1;->b()Le7j;

    move-result-object v1

    iget-object v2, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v3

    if-eq v1, v3, :cond_1e

    const-string v3, "app_layout"

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-virtual {v2, v1, v3}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_1e
    invoke-virtual {v0}, Lyu1;->a()Lb7j;

    move-result-object v0

    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v1

    if-eq v0, v1, :cond_31

    const-string v1, "addressbar_position"

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-virtual {v2, v0, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_31
    iget-object p0, p0, Ldv1;->g:Lev1;

    const/4 v0, 0x0

    iput-object v0, p0, Lev1;->a:Le7j;

    iput-object v0, p0, Lev1;->b:Lb7j;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->n:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p0, Lpu1;->w:Lbv1;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance p2, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v0, 0x3

    const/4 v1, 0x1

    invoke-direct {p2, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(II)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    new-instance v3, Lou1;

    const/4 v4, 0x0

    invoke-direct {v3, v4, p2}, Lou1;-><init>(BI)V

    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->m:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p0, Lpu1;->x:Ldt1;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p2, v4, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {v2, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    new-instance v2, Lou1;

    invoke-direct {v2, v4, p2}, Lou1;-><init>(BI)V

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->p:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Llu1;

    const/4 v2, 0x5

    invoke-direct {p2, p0, v2}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Llu1;

    const/16 v2, 0x9

    invoke-direct {p2, p0, v2}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Llu1;

    invoke-direct {p2, p0, v4}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->k:Landroid/widget/FrameLayout;

    new-instance p2, Llu1;

    invoke-direct {p2, p0, v1}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Llu1;

    const/4 v2, 0x2

    invoke-direct {p2, p0, v2}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lmu1;

    invoke-direct {p2, p0, v4}, Lmu1;-><init>(Lpu1;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lmu1;

    invoke-direct {p2, p0, v1}, Lmu1;-><init>(Lpu1;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lmu1;

    invoke-direct {p2, p0, v2}, Lmu1;-><init>(Lpu1;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Llu1;

    invoke-direct {p2, p0, v0}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->o:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Llu1;

    const/4 v0, 0x4

    invoke-direct {p2, p0, v0}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->b:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance p2, Llu1;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->h:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance p2, Llu1;

    const/4 v0, 0x7

    invoke-direct {p2, p0, v0}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Llu1;

    const/16 v0, 0x8

    invoke-direct {p2, p0, v0}, Llu1;-><init>(Lpu1;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object p1

    iget-object p1, p1, Lcl9;->m:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Lnu1;

    invoke-direct {p2, v4}, Lnu1;-><init>(B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p1

    iget-object p1, p1, Ldv1;->i:Lyu1;

    iget-object p1, p1, Lyu1;->g:Lv9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lpu1;->H0()Lcl9;

    move-result-object v1

    iget-object v1, v1, Lcl9;->a:Landroid/widget/LinearLayout;

    new-instance v2, Lk9;

    invoke-direct {v2, p0, v0}, Lk9;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v1, p0, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lpu1;->t:Lua7;

    return-object p0
.end method
