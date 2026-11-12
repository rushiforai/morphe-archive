.class public final Lqyc;
.super Leog;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final i:Lcom/opera/android/settings/SettingsManager;

.field public final j:Lt02;

.field public k:Ln7j;

.field public l:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lt02;)V
    .registers 3

    invoke-direct {p0}, Luim;-><init>()V

    iput-object p1, p0, Lqyc;->i:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lqyc;->j:Lt02;

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lps5;

    invoke-direct {v0, p1}, Lbud;-><init>(Landroid/content/Context;)V

    iput-object p0, v0, Lbud;->c:Leog;

    iput-object p0, v0, Lps5;->e:Leog;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget-object v2, Ln7j;->f:Ln7j;

    invoke-virtual {v2, v1}, Ln7j;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4, v1}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget-object v6, Ln7j;->g:Ln7j;

    invoke-virtual {v6, v5}, Ln7j;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v0, v2, v6, v4, v5}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v5

    sget-object v6, Ln7j;->e:Ln7j;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {v6, p1}, Ln7j;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v2, v2, v4, p1}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object p1

    iget-object v4, p0, Lqyc;->i:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->p()Ln7j;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_54

    if-eq v4, v2, :cond_55

    if-ne v4, v3, :cond_50

    move-object v1, v5

    goto :goto_55

    :cond_50
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_54
    move-object v1, p1

    :cond_55
    :goto_55
    invoke-virtual {v1, v2}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    const p1, 0x7f141060

    invoke-virtual {v0, p1}, Lps5;->setHeaderTitle(I)Landroid/view/ContextMenu;

    invoke-virtual {v0, v2, v2, v2}, Lbud;->setGroupCheckable(IZZ)V

    iput-object v0, p0, Leog;->d:Lps5;

    iput-object p0, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Luim;->onDestroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-void
.end method

.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onDismiss(Landroid/content/DialogInterface;)V

    iget-boolean p1, p0, Lqyc;->l:Z

    if-nez p1, :cond_13

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqyc;->l:Z

    iget-object p1, p0, Lqyc;->k:Ln7j;

    if-eqz p1, :cond_13

    iget-object p0, p0, Lqyc;->j:Lt02;

    invoke-virtual {p0, p1}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_13
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 10

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-static {}, Ln7j;->values()[Ln7j;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_b
    const/4 v4, 0x0

    if-ge v3, v1, :cond_17

    aget-object v5, v0, v3

    iget-byte v6, v5, Ln7j;->a:B

    if-eq v6, p1, :cond_18

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_17
    move-object v5, v4

    :cond_18
    if-nez v5, :cond_1c

    sget-object v5, Ln7j;->e:Ln7j;

    :cond_1c
    sget-object p1, Ln7j;->f:Ln7j;

    const/4 v0, 0x1

    if-ne v5, p1, :cond_7d

    new-instance p1, Llqh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lrxh;

    const v3, 0x7f141062

    invoke-direct {v1, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lmt2;

    const/4 v5, 0x2

    invoke-direct {v3, p1, v5}, Lmt2;-><init>(Llqh;B)V

    new-instance v5, Lmt2;

    const/4 v6, 0x3

    invoke-direct {v5, p1, v6}, Lmt2;-><init>(Llqh;B)V

    new-instance v6, Lz0c;

    const/4 v7, 0x5

    invoke-direct {v6, p1, p0, v7}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lgkj;

    invoke-direct {p1, v2, v2}, Lnz0;-><init>(ZZ)V

    iput-object v4, p1, Lgkj;->a:Ljava/lang/String;

    iput-object v4, p1, Lgkj;->b:Ljava/lang/String;

    iput-object v4, p1, Lgkj;->c:Ljava/lang/String;

    iput-object v4, p1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v4, p1, Lgkj;->e:Lekj;

    iput-object v6, p1, Lgkj;->f:Lfkj;

    iput-object v4, p1, Lgkj;->g:Lqp2;

    iput-object v3, p1, Lgkj;->h:Ldkj;

    iput-object v5, p1, Lgkj;->i:Ldkj;

    iput-object v4, p1, Lgkj;->j:Lql;

    const v2, 0x7f141063

    iput v2, p1, Lgkj;->k:I

    const v2, 0x7f1403bf

    iput v2, p1, Lgkj;->l:I

    const v2, 0x7f141064

    iput v2, p1, Lgkj;->m:I

    iput-boolean v0, p1, Lgkj;->n:Z

    iput-object v1, p1, Lgkj;->o:Lpxh;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    return v0

    :cond_7d
    iget-object p1, p0, Lqyc;->i:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "lock_password_manager"

    iget v2, v5, Ln7j;->d:I

    invoke-virtual {p1, v2, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iput-object v5, p0, Lqyc;->k:Ln7j;

    return v0
.end method
