.class public Luii;
.super Leog;
.source "SourceFile"


# instance fields
.field public final i:Lcom/opera/android/autofill/PasswordManager;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Luim;-><init>()V

    new-instance v0, Lcom/opera/android/autofill/PasswordManager;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Luii;->i:Lcom/opera/android/autofill/PasswordManager;

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    new-instance v1, Lps5;

    invoke-direct {v1, p1}, Lbud;-><init>(Landroid/content/Context;)V

    iput-object p0, v1, Lbud;->c:Leog;

    iput-object p0, v1, Lps5;->e:Leog;

    const p1, 0x7f141069

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v3, p1}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object p1

    const v4, 0x7f14106a

    invoke-virtual {p0, v4}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v2, v3, v4}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v4

    const v5, 0x7f14106b

    invoke-virtual {p0, v5}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {v1, v2, v6, v3, v5}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v3

    iget-object v5, p0, Luii;->i:Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MaxktGXn()Z

    move-result v5

    if-eqz v5, :cond_5b

    const-string v3, "password_manager_autosave"

    invoke-virtual {v0, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_57

    invoke-virtual {p1, v2}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_5e

    :cond_57
    invoke-virtual {v4, v2}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_5e

    :cond_5b
    invoke-virtual {v3, v2}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    :goto_5e
    const p1, 0x7f141096

    invoke-virtual {v1, p1}, Lps5;->setHeaderTitle(I)Landroid/view/ContextMenu;

    invoke-virtual {v1, v2, v2, v2}, Lbud;->setGroupCheckable(IZZ)V

    iput-object v1, p0, Leog;->d:Lps5;

    new-instance p1, Ltii;

    invoke-direct {p1, p0}, Ltii;-><init>(Luii;)V

    iput-object p1, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-void
.end method
