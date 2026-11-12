.class public final Lalj;
.super Leog;
.source "SourceFile"


# instance fields
.field public final i:Lzkj;

.field public final j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lzkj;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Luim;-><init>()V

    iput-object p1, p0, Lalj;->i:Lzkj;

    iput-object p2, p0, Lalj;->j:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 13

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    new-instance v0, Lps5;

    invoke-direct {v0, p1}, Lbud;-><init>(Landroid/content/Context;)V

    iput-object p0, v0, Lbud;->c:Leog;

    iput-object p0, v0, Lps5;->e:Leog;

    iget-object v1, p0, Lalj;->i:Lzkj;

    invoke-interface {v1}, Lzkj;->t()Llrf;

    move-result-object v2

    invoke-interface {v2}, Llrf;->getValue()I

    move-result v2

    invoke-interface {v1}, Lzkj;->c()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v3, 0x0

    move v4, v3

    :goto_24
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_77

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llrf;

    add-int/lit8 v7, v4, 0x1

    invoke-interface {v5}, Llrf;->getDescription()I

    move-result v8

    if-nez v8, :cond_42

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-interface {v5, v8}, Llrf;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v8

    goto :goto_5a

    :cond_42
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v8

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-interface {v5, v9}, Llrf;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5}, Llrf;->getDescription()I

    move-result v10

    invoke-virtual {p0, v10}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lm5h;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    move-result-object v8

    :goto_5a
    invoke-virtual {v0, v6, v4, v3, v8}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v4

    invoke-interface {v5}, Llrf;->getValue()I

    move-result v8

    if-eq v8, v2, :cond_65

    move v6, v3

    :cond_65
    invoke-virtual {v4, v6}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    invoke-interface {v5}, Llrf;->getIcon()I

    move-result v5

    if-eqz v5, :cond_75

    invoke-static {v5, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lqtd;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    :cond_75
    move v4, v7

    goto :goto_24

    :cond_77
    iget-object p1, p0, Lalj;->j:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lps5;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    invoke-virtual {v0, v6, v6, v6}, Lbud;->setGroupCheckable(IZZ)V

    iput-object v0, p0, Leog;->d:Lps5;

    new-instance p1, Laxe;

    invoke-direct {p1, p0, v6}, Laxe;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-void
.end method
