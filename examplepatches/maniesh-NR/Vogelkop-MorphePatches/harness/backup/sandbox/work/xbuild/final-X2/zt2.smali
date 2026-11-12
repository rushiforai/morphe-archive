.class public final Lzt2;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"

# interfaces
.implements Lh4g;


# instance fields
.field public final b:Ljt;

.field public final c:Lwth;

.field public final d:Lw4g;

.field public final e:I

.field public f:Ljava/lang/Integer;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lwth;Lw4g;)V
    .registers 7

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0087

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_2e

    new-instance v0, Ljt;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/4 v1, 0x2

    invoke-direct {v0, p1, v1}, Ljt;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;B)V

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lzt2;->b:Ljt;

    iput-object p2, p0, Lzt2;->c:Lwth;

    iput-object p3, p0, Lzt2;->d:Lw4g;

    sget p1, Lvmj;->g:I

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ltmj;->i(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lzt2;->e:I

    return-void

    :cond_2e
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final P(ILjava/lang/String;)Z
    .registers 4

    iget-object v0, p0, Lzt2;->f:Ljava/lang/Integer;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_14

    iget-object p0, p0, Lzt2;->g:Ljava/lang/String;

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final s()V
    .registers 8

    sget v0, Lvmj;->g:I

    iget-object v0, p0, Lzt2;->b:Ljt;

    iget-object v0, v0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lzt2;->h:Ljava/lang/String;

    if-nez v2, :cond_10

    iget-object v2, p0, Lzt2;->g:Ljava/lang/String;

    :cond_10
    if-nez v2, :cond_14

    const-string v2, ""

    :cond_14
    const/4 v5, 0x0

    const/16 v6, 0x3c

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object p0

    new-instance v1, Lmxh;

    invoke-direct {v1, p0}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-void
.end method

.method public final w(Landroid/graphics/Bitmap;)V
    .registers 6

    iget v0, p0, Lzt2;->e:I

    div-int/lit8 v1, v0, 0x2

    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v3, Lp8i;

    invoke-direct {v3, v0, v1, v2, p1}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->s(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v3, p1}, Lp8i;->a(I)V

    iget-object p0, p0, Lzt2;->b:Ljt;

    iget-object p0, p0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p1, Lmxh;

    invoke-direct {p1, v3}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-void
.end method
