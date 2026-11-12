.class public final La3f;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final w:Li06;

.field public static final synthetic x:[Lxtb;


# instance fields
.field public final t:Lua7;

.field public final u:Lzyk;

.field public final v:Lktl;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, La3f;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentNotificationsSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, La3f;->x:[Lxtb;

    new-instance v0, Li06;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Li06;-><init>(B)V

    sput-object v0, La3f;->w:Li06;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 5

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f141131

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, La3f;->t:Lua7;

    new-instance p1, Lyse;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, La3f;->u:Lzyk;

    new-instance p1, Lrqd;

    const/16 v0, 0x18

    invoke-direct {p1, v0}, Lrqd;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, La3f;->v:Lktl;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, La3f;->I0()Ld3f;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lfm9;
    .registers 3

    sget-object v0, La3f;->x:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, La3f;->v:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lfm9;

    return-object p0
.end method

.method public final I0()Ld3f;
    .registers 1

    iget-object p0, p0, La3f;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3f;

    return-object p0
.end method

.method public final onResume()V
    .registers 6

    invoke-super {p0}, Lltl;->onResume()V

    invoke-virtual {p0}, La3f;->I0()Ld3f;

    move-result-object p0

    iget-object p0, p0, Ld3f;->d:Lx0f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iget-object v1, p0, Lx0f;->a:Landroid/content/Context;

    const-string v2, "notification"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    invoke-virtual {v1}, Landroid/app/NotificationManager;->getNotificationChannels()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_39

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationChannel;

    invoke-virtual {v2}, Landroid/app/NotificationChannel;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_25

    :cond_39
    iget-object v1, p0, Lx0f;->c:Lqie;

    iget-object v2, p0, Lx0f;->b:Lumi;

    new-instance v3, Lu0f;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v4}, Lu0f;-><init>(Lx0f;B)V

    invoke-virtual {v2, v3}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v2

    new-instance v3, Lu0f;

    const/4 v4, 0x3

    invoke-direct {v3, p0, v4}, Lu0f;-><init>(Lx0f;B)V

    invoke-virtual {v2, v3}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    invoke-virtual {v1, p0, v0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p1

    iget-object p1, p1, Lfm9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lzvd;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p1

    iget-object p1, p1, Lfm9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ly2f;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Ly2f;-><init>(La3f;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p1

    iget-object p1, p1, Lfm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ly2f;

    const/4 v1, 0x2

    invoke-direct {p2, p0, v1}, Ly2f;-><init>(La3f;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p1

    iget-object p1, p1, Lfm9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ly2f;

    const/4 v1, 0x3

    invoke-direct {p2, p0, v1}, Ly2f;-><init>(La3f;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p1

    iget-object p1, p1, Lfm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ly2f;

    const/4 v1, 0x4

    invoke-direct {p2, p0, v1}, Ly2f;-><init>(La3f;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p1

    iget-object p1, p1, Lfm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ly2f;

    const/4 v1, 0x5

    invoke-direct {p2, p0, v1}, Ly2f;-><init>(La3f;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p1

    iget-object p1, p1, Lfm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ly2f;

    invoke-direct {p2, p0, v0}, Ly2f;-><init>(La3f;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p1

    iget-object p1, p1, Lfm9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ly2f;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ly2f;-><init>(La3f;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, La3f;->I0()Ld3f;

    move-result-object p1

    iget-object p1, p1, Ld3f;->h:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Lzbe;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lzbe;-><init>(B)V

    new-instance v2, Liwa;

    const/16 v3, 0xd

    invoke-direct {v2, v0, v3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v2}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {p0}, La3f;->I0()Ld3f;

    move-result-object p1

    iget-object p1, p1, Ld3f;->f:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object v0

    iget-object v0, v0, Lfm9;->a:Landroid/widget/LinearLayout;

    new-instance v2, Ld8d;

    invoke-direct {v2, p0, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    const p1, 0x7f1401b7

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, La3f;->H0()Lfm9;

    move-result-object p2

    iget-object p2, p2, Lfm9;->b:Lcom/opera/android/widget/FaqItemView;

    const v0, 0x7f140b6c

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const v2, 0x7f140b6d

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "\n\n"

    invoke-static {v0, p1, p0}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p2, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    if-eqz p1, :cond_d5

    move-object v1, p1

    :cond_d5
    iget-object p1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, La3f;->t:Lua7;

    return-object p0
.end method
