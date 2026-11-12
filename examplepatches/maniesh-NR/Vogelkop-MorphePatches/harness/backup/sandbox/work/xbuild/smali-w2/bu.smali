.class public final Lbu;
.super Leu;
.source "SourceFile"

# interfaces
.implements Lh4a;
.implements Lp87;


# instance fields
.field public final c:Lkf;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 4

    const v0, 0x7f0d0032

    const/4 v1, 0x0

    invoke-static {p1, v0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_18

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    new-instance v0, Lkf;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1, p1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lbu;->c:Lkf;

    return-void

    :cond_18
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final U(Ljs;)V
    .registers 3

    check-cast p1, Lgs;

    iget-object p0, p0, Lbu;->c:Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object p1, p1, Lgs;->c:Lrxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final l(Landroid/graphics/Rect;)V
    .registers 2

    const/4 p0, 0x0

    invoke-virtual {p1, p0, p0, p0, p0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method
