.class public final Luxk;
.super Li93;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Luxk;",
        "Li93;",
        "<init>",
        "()V",
        "el7",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic w:[Lxtb;


# instance fields
.field public final t:Lktl;

.field public final u:Lzyk;

.field public v:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Luxk;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentSyncSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Luxk;->w:[Lxtb;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    const v0, 0x7f10001d

    const/4 v1, 0x4

    const v2, 0x7f1411e6

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    new-instance v0, Lgpk;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lgpk;-><init>(B)V

    invoke-virtual {p0, v0}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object v0

    iput-object v0, p0, Luxk;->t:Lktl;

    new-instance v0, Lyse;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Luxk;->u:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lwm9;
    .registers 3

    sget-object v0, Luxk;->w:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Luxk;->t:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lwm9;

    return-object p0
.end method

.method public final I0()Ldyk;
    .registers 1

    iget-object p0, p0, Luxk;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldyk;

    return-object p0
.end method

.method public final h0(Landroidx/fragment/app/w;)V
    .registers 3

    invoke-static {p1}, Lgge;->G0(Landroidx/fragment/app/w;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-super {p0, p1}, Lk24;->h0(Landroidx/fragment/app/w;)V

    return-void
.end method

.method public final onResume()V
    .registers 7

    invoke-super {p0}, Lltl;->onResume()V

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_15

    move v0, v1

    goto :goto_16

    :cond_15
    move v0, v2

    :goto_16
    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v3

    iget-object v3, v3, Lwm9;->f:Lcom/google/android/material/button/MaterialButton;

    const/16 v4, 0x8

    if-eqz v0, :cond_22

    move v5, v2

    goto :goto_23

    :cond_22
    move v5, v4

    :goto_23
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v3

    iget-object v3, v3, Lwm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-nez v0, :cond_2f

    move v2, v4

    :cond_2f
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object v0, p0, Ldyk;->f:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object p0, p0, Ldyk;->e:Lzxk;

    iget-object v0, p0, Lzxk;->j:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_60

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_60

    iget-object v0, p0, Lzxk;->c:Ldb;

    new-instance v2, Lqlk;

    const/16 v3, 0xf

    invoke-direct {v2, p0, v3}, Lqlk;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lzzh;

    const/16 v4, 0x13

    invoke-direct {v3, p0, v4}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2, v3}, Ldb;->g(ZLjava/lang/Runnable;Lcom/opera/api/Callback;)Landroid/os/CancellationSignal;

    move-result-object v0

    iput-object v0, p0, Lzxk;->j:Landroid/os/CancellationSignal;

    :cond_60
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->g:Llwk;

    iget-object p1, p1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    iget-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p2, p2, Lei;->f:Ljava/lang/Object;

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->c()V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->f:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lsxk;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Lsxk;-><init>(Luxk;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ltxk;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ltxk;-><init>(Luxk;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ltxk;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ltxk;-><init>(Luxk;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lsxk;

    const/4 v1, 0x6

    invoke-direct {p2, p0, v1}, Lsxk;-><init>(Luxk;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->e:Llwk;

    iget-object p1, p1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance p2, Lsxk;

    const/4 v1, 0x7

    invoke-direct {p2, p0, v1}, Lsxk;-><init>(Luxk;B)V

    iget-object p1, p1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p1, p1, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->e:Llwk;

    iget-object p1, p1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance p2, Lsxk;

    invoke-direct {p2, p0, v0}, Lsxk;-><init>(Luxk;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->i:Llwk;

    iget-object p1, p1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance p2, Lsxk;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lsxk;-><init>(Luxk;B)V

    iget-object p1, p1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p1, p1, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->i:Llwk;

    iget-object p1, p1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance p2, Lsxk;

    const/4 v1, 0x3

    invoke-direct {p2, p0, v1}, Lsxk;-><init>(Luxk;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object p1

    iget-object p1, p1, Lwm9;->g:Llwk;

    iget-object p1, p1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance p2, Lsxk;

    const/4 v1, 0x4

    invoke-direct {p2, p0, v1}, Lsxk;-><init>(Luxk;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p1

    iget-object p1, p1, Ldyk;->n:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v1, Ln6k;

    const/16 v2, 0x11

    invoke-direct {v1, p0, v2}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lw4i;

    const/16 v3, 0x13

    invoke-direct {v2, v1, v3}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v2}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p1

    iget-object p1, p1, Ldyk;->e:Lzxk;

    iget-object p1, p1, Lzxk;->f:Lv9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Luxk;->H0()Lwm9;

    move-result-object v1

    iget-object v1, v1, Lwm9;->a:Landroid/widget/LinearLayout;

    new-instance v2, Lel7;

    invoke-direct {v2, p0, v0}, Lel7;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lqzg;

    const/16 v3, 0x1a

    invoke-direct {v0, p0, v3}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p1, p2, v1, p0, v0}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 4

    const v0, 0x7f0a0035

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_17

    const v0, 0x7f0a0b1e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    goto :goto_18

    :cond_17
    const/4 p1, 0x0

    :goto_18
    iput-object p1, p0, Luxk;->v:Landroid/widget/ImageView;

    if-eqz p1, :cond_25

    new-instance v0, Lsxk;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lsxk;-><init>(Luxk;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_25
    return-void
.end method
