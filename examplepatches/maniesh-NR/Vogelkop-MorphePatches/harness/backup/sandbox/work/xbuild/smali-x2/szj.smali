.class public final Lszj;
.super Li93;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lszj;",
        "Li93;",
        "<init>",
        "()V",
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

.field public final v:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lszj;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentSpeedDialSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lszj;->w:[Lxtb;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f141173

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    new-instance v0, La3j;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, La3j;-><init>(B)V

    invoke-virtual {p0, v0}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object v0

    iput-object v0, p0, Lszj;->t:Lktl;

    new-instance v0, Lyse;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lszj;->u:Lzyk;

    new-instance v0, Ldnj;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lszj;->v:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lszj;->I0()Lwzj;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lrm9;
    .registers 3

    sget-object v0, Lszj;->w:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lszj;->t:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lrm9;

    return-object p0
.end method

.method public final I0()Lwzj;
    .registers 1

    iget-object p0, p0, Lszj;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwzj;

    return-object p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p1, Llld;

    const/16 p2, 0x1d

    invoke-direct {p1, p0, p2}, Llld;-><init>(Ljava/lang/Object;B)V

    iget-object p2, p0, Lszj;->v:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_18
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    iput-object p1, v0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->q:Llld;

    goto :goto_18

    :cond_27
    invoke-virtual {p0}, Lszj;->H0()Lrm9;

    move-result-object p1

    iget-object p1, p1, Lrm9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lszj;->I0()Lwzj;

    move-result-object p2

    new-instance v0, Lyhe;

    const/16 v1, 0x17

    invoke-direct {v0, p2, v1}, Lyhe;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lszj;->H0()Lrm9;

    move-result-object p1

    iget-object p1, p1, Lrm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lszj;->I0()Lwzj;

    move-result-object p2

    new-instance v0, Lqie;

    invoke-direct {v0, p2, v1}, Lqie;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lszj;->H0()Lrm9;

    move-result-object p1

    iget-object p1, p1, Lrm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lszj;->I0()Lwzj;

    move-result-object p2

    new-instance v0, Li4d;

    const/16 v1, 0x1c

    invoke-direct {v0, p2, v1}, Li4d;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lszj;->I0()Lwzj;

    move-result-object p1

    iget-object p1, p1, Lwzj;->e:Lw6j;

    iget-object p1, p1, Lw6j;->c:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lszj;->H0()Lrm9;

    move-result-object v0

    iget-object v0, v0, Lrm9;->a:Landroid/widget/LinearLayout;

    new-instance v1, Lw4i;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lw4i;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method
