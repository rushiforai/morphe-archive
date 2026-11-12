.class public final Lhcg;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic x:[Lxtb;


# instance fields
.field public final t:Ld7h;

.field public final u:Lua7;

.field public final v:Lktl;

.field public final w:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lhcg;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentPersonalDataSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lhcg;->x:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;Ld7h;)V
    .registers 6

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f141073

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    iput-object p2, p0, Lhcg;->t:Ld7h;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lhcg;->u:Lua7;

    new-instance p1, Lodf;

    const/16 p2, 0x11

    invoke-direct {p1, p2}, Lodf;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lhcg;->v:Lktl;

    new-instance p1, Lyse;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhcg;->w:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lhcg;->I0()Llcg;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lkm9;
    .registers 3

    sget-object v0, Lhcg;->x:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lhcg;->v:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lkm9;

    return-object p0
.end method

.method public final I0()Llcg;
    .registers 1

    iget-object p0, p0, Lhcg;->w:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llcg;

    return-object p0
.end method

.method public final J0(Lcom/opera/android/widget/MenuSettingsListItem;I)V
    .registers 5

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f12005c

    invoke-virtual {p0, v1, p2, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object p1

    iget-object p1, p1, Lkm9;->d:Landroid/widget/ImageView;

    new-instance p2, Lkkf;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lkkf;->a(Landroid/view/View;)V

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object p1

    iget-object p1, p1, Lkm9;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p2, Lgcg;

    const/4 v1, 0x0

    invoke-direct {p2, p0, v1}, Lgcg;-><init>(Lhcg;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object p1

    iget-object p1, p1, Lkm9;->k:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance p2, Lgcg;

    invoke-direct {p2, p0, v0}, Lgcg;-><init>(Lhcg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object p1

    iget-object p1, p1, Lkm9;->j:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance p2, Lgcg;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lgcg;-><init>(Lhcg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object p1

    iget-object p1, p1, Lkm9;->h:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance p2, Lgcg;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lgcg;-><init>(Lhcg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object p1

    iget-object p1, p1, Lkm9;->g:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance p2, Lgcg;

    const/4 v0, 0x4

    invoke-direct {p2, p0, v0}, Lgcg;-><init>(Lhcg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object p1

    iget-object p1, p1, Lkm9;->i:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance p2, Lgcg;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Lgcg;-><init>(Lhcg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lhcg;->I0()Llcg;

    move-result-object p1

    iget-object p1, p1, Llcg;->f:Lkcg;

    iget-object p1, p1, Lkcg;->f:Lv9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object v0

    iget-object v0, v0, Lkm9;->a:Landroid/widget/LinearLayout;

    new-instance v1, Ld8d;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Ld8d;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lhcg;->u:Lua7;

    return-object p0
.end method
