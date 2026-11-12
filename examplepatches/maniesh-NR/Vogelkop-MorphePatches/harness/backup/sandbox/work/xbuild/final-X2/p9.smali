.class public final Lp9;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic w:[Lxtb;

.field public static final x:Lixh;


# instance fields
.field public final t:Lua7;

.field public final u:Lktl;

.field public final v:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lp9;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentAccessibilitySettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lp9;->w:[Lxtb;

    new-instance v0, Lixh;

    const/high16 v1, 0x43840000    # 264.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lp9;->x:Lixh;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 5

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f140f48

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lp9;->t:Lua7;

    new-instance p1, Lmc8;

    const/16 v0, 0x12

    invoke-direct {p1, v0}, Lmc8;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lp9;->u:Lktl;

    new-instance p1, Lt2;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lp9;->v:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lp9;->I0()Lt9;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lvk9;
    .registers 3

    sget-object v0, Lp9;->w:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lp9;->u:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lvk9;

    return-object p0
.end method

.method public final I0()Lt9;
    .registers 1

    iget-object p0, p0, Lp9;->v:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9;

    return-object p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ll9;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ll9;-><init>(Lp9;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->o:Lcom/google/android/material/slider/Slider;

    new-instance p2, Lm9;

    invoke-direct {p2, p0, v0}, Lm9;-><init>(Lndc;B)V

    invoke-virtual {p1, p2}, Lcom/google/android/material/slider/Slider;->t0(Lw73;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->o:Lcom/google/android/material/slider/Slider;

    new-instance p2, Lo9;

    invoke-direct {p2, p0}, Lo9;-><init>(Lp9;)V

    invoke-virtual {p1, p2}, Lcom/google/android/material/slider/Slider;->u0(Lx73;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->g:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p2, Ln9;

    invoke-direct {p2, p0, v0}, Ln9;-><init>(Lp9;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->h:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p2, Ln9;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Ln9;-><init>(Lp9;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ln9;

    const/4 v2, 0x2

    invoke-direct {p2, p0, v2}, Ln9;-><init>(Lp9;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ll9;

    invoke-direct {p2, p0, v1}, Ll9;-><init>(Lp9;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ln9;

    const/4 v1, 0x3

    invoke-direct {p2, p0, v1}, Ln9;-><init>(Lp9;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object p1

    iget-object p1, p1, Lvk9;->o:Lcom/google/android/material/slider/Slider;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    invoke-virtual {p0}, Lp9;->I0()Lt9;

    move-result-object p1

    iget-object p1, p1, Lt9;->e:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-virtual {p0}, Lp9;->H0()Lvk9;

    move-result-object v2

    iget-object v2, v2, Lvk9;->a:Landroid/widget/LinearLayout;

    new-instance v3, Lk9;

    invoke-direct {v3, p0, v0}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v1, v2, p2, v3}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lp9;->t:Lua7;

    return-object p0
.end method
