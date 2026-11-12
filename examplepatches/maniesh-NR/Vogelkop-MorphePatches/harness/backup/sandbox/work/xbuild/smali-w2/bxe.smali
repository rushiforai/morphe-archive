.class public Lbxe;
.super Leog;
.source "SourceFile"


# instance fields
.field public i:I

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Luim;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lbxe;->i:I

    const-string v0, ""

    iput-object v0, p0, Lbxe;->j:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 11

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const/4 v0, 0x3

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v1

    const-string v2, "option"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    aget v1, v1, v2

    iput v1, p0, Lbxe;->i:I

    const-string v1, "title"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lbxe;->j:Ljava/lang/String;

    new-instance p1, Lps5;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Lbud;-><init>(Landroid/content/Context;)V

    iput-object p0, p1, Lbud;->c:Leog;

    iput-object p0, p1, Lps5;->e:Leog;

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v1

    array-length v2, v1

    move v4, v3

    :goto_34
    const/4 v5, 0x1

    if-ge v4, v2, :cond_64

    aget v6, v1, v4

    invoke-static {v6}, Lvep;->A(I)I

    move-result v7

    if-eq v6, v5, :cond_4e

    const/4 v8, 0x2

    if-eq v6, v8, :cond_4a

    if-ne v6, v0, :cond_48

    const v8, 0x7f141035

    goto :goto_51

    :cond_48
    const/4 p0, 0x0

    throw p0

    :cond_4a
    const v8, 0x7f141030

    goto :goto_51

    :cond_4e
    const v8, 0x7f141034

    :goto_51
    invoke-virtual {p0, v8}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v5, v7, v3, v8}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v7

    iget v8, p0, Lbxe;->i:I

    if-eq v6, v8, :cond_5e

    move v5, v3

    :cond_5e
    invoke-virtual {v7, v5}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    add-int/lit8 v4, v4, 0x1

    goto :goto_34

    :cond_64
    iget-object v0, p0, Lbxe;->j:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lps5;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    invoke-virtual {p1, v5, v5, v5}, Lbud;->setGroupCheckable(IZZ)V

    iput-object p1, p0, Leog;->d:Lps5;

    new-instance p1, Laxe;

    invoke-direct {p1, p0, v3}, Laxe;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-void
.end method
