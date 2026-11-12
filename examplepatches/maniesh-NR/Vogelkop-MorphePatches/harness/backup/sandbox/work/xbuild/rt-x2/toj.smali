.class public final Ltoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:[Lkag;

.field public final synthetic b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final synthetic c:Luoj;


# direct methods
.method public constructor <init>(Luoj;[Lkag;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltoj;->a:[Lkag;

    iput-object p3, p0, Ltoj;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p1, p0, Ltoj;->c:Luoj;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 14

    iget-object p1, p0, Ltoj;->c:Luoj;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Leog;->i0(Landroid/content/Context;)Lpyc;

    move-result-object v1

    iget-object v2, v1, Ltim;->a:Luim;

    check-cast v2, Leog;

    new-instance v3, Lsoj;

    iget-object v4, p0, Ltoj;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v5, p0, Ltoj;->a:[Lkag;

    invoke-direct {v3, p0, v5, v4}, Lsoj;-><init>(Ltoj;[Lkag;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iput-object v3, v2, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    iget-object p0, v2, Leog;->d:Lps5;

    sget-object v2, Ls9g;->h:Ls9g;

    iget-object v3, p1, Luoj;->t:Llag;

    iget-object v2, v2, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v2

    const/4 v4, 0x0

    move v6, v4

    :goto_2f
    const/4 v7, 0x3

    const/4 v8, 0x1

    if-ge v6, v7, :cond_4d

    aget-object v7, v5, v6

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v9

    aget-object v10, v5, v6

    const/4 v11, 0x0

    invoke-static {v9, v3, v10, v11}, Lui6;->R(Landroid/content/Context;Llag;Lkag;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v6, v4, v9}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v9

    if-eq v7, v2, :cond_47

    move v8, v4

    :cond_47
    invoke-virtual {v9, v8}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    add-int/lit8 v6, v6, 0x1

    goto :goto_2f

    :cond_4d
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v3}, Lui6;->S(Landroid/content/Context;Llag;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lps5;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    invoke-virtual {p0, v8, v8, v8}, Lbud;->setGroupCheckable(IZZ)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
