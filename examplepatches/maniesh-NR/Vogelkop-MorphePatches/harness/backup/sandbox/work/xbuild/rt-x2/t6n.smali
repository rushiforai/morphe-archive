.class public final Lt6n;
.super Lz6n;
.source "SourceFile"

# interfaces
.implements Lh4a;


# instance fields
.field public final b:Lfbl;

.field public final c:Ltjn;


# direct methods
.method public constructor <init>(Lfbl;Ltjn;Lcom/opera/android/settings/SettingsManager;)V
    .registers 9

    iget-object v0, p1, Lfbl;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lt6n;->b:Lfbl;

    iput-object p2, p0, Lt6n;->c:Ltjn;

    iget-object v1, p1, Lfbl;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    new-instance v2, Ln6n;

    const/4 v3, 0x1

    invoke-direct {v2, p2, v3}, Ln6n;-><init>(Ltjn;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p1, Lfbl;->c:Landroid/view/View;

    check-cast v1, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    new-instance v2, Ln6n;

    const/4 v4, 0x2

    invoke-direct {v2, p2, v4}, Ln6n;-><init>(Ltjn;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p1, Lfbl;->f:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    new-instance v2, Lpkm;

    const/4 v4, 0x3

    invoke-direct {v2, p0, v4}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Lfbl;->e:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-interface {p2}, Ltjn;->d()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    if-eqz p3, :cond_58

    new-instance p1, Lezg;

    const/16 p2, 0xa

    invoke-direct {p1, p0, p2}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Ls6n;

    const/4 p2, 0x0

    invoke-direct {p0, p3, p1, p2}, Ls6n;-><init>(Lcom/opera/android/settings/SettingsManager;Lezg;B)V

    new-instance p2, Ls6n;

    invoke-direct {p2, p3, p1, v3}, Ls6n;-><init>(Lcom/opera/android/settings/SettingsManager;Lezg;B)V

    new-instance p1, Ltu4;

    const/4 p3, 0x7

    invoke-direct {p1, p0, p2, p3}, Ltu4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, p1}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_58
    return-void
.end method


# virtual methods
.method public final U(Z)V
    .registers 4

    iget-object v0, p0, Lt6n;->b:Lfbl;

    iget-object v1, v0, Lfbl;->e:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object v0, v0, Lfbl;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz p1, :cond_21

    iget-object p0, p0, Lt6n;->c:Ltjn;

    invoke-interface {p0}, Ltjn;->f()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lam2;->a(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Lam2;->b(I)I

    move-result p0

    invoke-static {p0, v0}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-void

    :cond_21
    const p0, 0x7f141443

    invoke-static {p0, v0}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-void
.end method

.method public final l(Landroid/graphics/Rect;)V
    .registers 2

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    return-void
.end method
