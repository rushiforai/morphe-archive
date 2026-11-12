.class public final Ltii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Luii;


# direct methods
.method public constructor <init>(Luii;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltii;->a:Luii;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    iget-object p0, p0, Ltii;->a:Luii;

    iget-object v0, p0, Luii;->i:Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const-string v1, "password_manager_autosave"

    const/4 v2, 0x1

    if-eqz p1, :cond_35

    const/4 v3, 0x0

    if-eq p1, v2, :cond_2b

    const/4 p0, 0x2

    if-eq p1, p0, :cond_24

    return v2

    :cond_24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, LJ/N;->MQtjLg8W(Z)V

    return v2

    :cond_2b
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, LJ/N;->MQtjLg8W(Z)V

    invoke-virtual {p0, v3, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return v2

    :cond_35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, LJ/N;->MQtjLg8W(Z)V

    invoke-virtual {p0, v2, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return v2
.end method
