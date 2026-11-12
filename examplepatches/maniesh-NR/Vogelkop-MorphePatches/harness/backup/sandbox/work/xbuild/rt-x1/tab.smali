.class public final Ltab;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Filterable;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:I

.field public final c:Ljava/util/HashMap;

.field public d:Ljava/util/List;

.field public e:Ljava/util/List;

.field public final f:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 3

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Ltab;->a:Landroid/content/Context;

    iput p2, p0, Ltab;->b:I

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ltab;->c:Ljava/util/HashMap;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Ltab;->d:Ljava/util/List;

    iput-object p1, p0, Ltab;->e:Ljava/util/List;

    new-instance p1, Lq4b;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ltab;->f:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lzt1;)Landroid/graphics/drawable/Drawable;
    .registers 7

    if-eqz p1, :cond_4c

    instance-of v0, p1, Lwt1;

    iget v1, p0, Ltab;->b:I

    iget-object v2, p0, Ltab;->a:Landroid/content/Context;

    if-eqz v0, :cond_41

    check-cast p1, Lwt1;

    iget-object v0, p1, Lwt1;->c:Ljava/lang/String;

    iget-object p0, p0, Ltab;->c:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_40

    iget-object p1, p1, Lwt1;->a:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/content/pm/PackageItemInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1, v1, v1}, Lscd;->l0(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object p1

    div-int/lit8 v3, v1, 0x2

    sget-object v4, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v4, Lp8i;

    invoke-direct {v4, v1, v3, v2, p1}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    const p1, 0x7f04021b

    const v1, 0x7f06063b

    invoke-static {p1, v2, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {v4, p1}, Lp8i;->a(I)V

    invoke-virtual {p0, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v4

    :cond_40
    return-object v3

    :cond_41
    instance-of p0, p1, Lyt1;

    if-eqz p0, :cond_4c

    check-cast p1, Lyt1;

    invoke-virtual {p1, v1, v2}, Lyt1;->a(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_4c
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final getCount()I
    .registers 1

    iget-object p0, p0, Ltab;->e:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public final getFilter()Landroid/widget/Filter;
    .registers 1

    iget-object p0, p0, Ltab;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsab;

    return-object p0
.end method

.method public final getItem(I)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Ltab;->e:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzt1;

    return-object p0
.end method

.method public final getItemId(I)J
    .registers 2

    int-to-long p0, p1

    return-wide p0
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6

    instance-of v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    goto :goto_9

    :cond_8
    move-object p2, v1

    :goto_9
    if-nez p2, :cond_23

    const p2, 0x7f0d0221

    const/4 v0, 0x0

    invoke-static {p3, p2, p3, v0}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_1d

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/16 p3, 0x10

    invoke-virtual {p2, p3}, Landroid/view/View;->setFocusable(I)V

    goto :goto_23

    :cond_1d
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1

    :cond_23
    :goto_23
    iget-object p3, p0, Ltab;->e:Ljava/util/List;

    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzt1;

    invoke-interface {p1}, Lzt1;->getName()Ljava/lang/String;

    move-result-object p3

    new-instance v0, Lqxh;

    invoke-direct {v0, p3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    invoke-virtual {p0, p1}, Ltab;->a(Lzt1;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    new-instance p1, Lmxh;

    invoke-direct {p1, p0}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-object p2
.end method
