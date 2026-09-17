.class public Lorg/telegram/ui/DeleteAccountDialog;
.super Ljava/lang/Object;
.source "SourceFile"

# Ported faithfully from Cherrygram DeleteAccountDialog.java (GPL v2)
# Usage: DeleteAccountDialog.showDeleteAccountDialog(fragment)
# 20s red countdown on Deactivate -> delete dialogs -> account.deleteAccount -> performLogout (UI thread)

.method public constructor <init>()V
    .registers 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# public static void showDeleteAccountDialog(BaseFragment fragment)
.method public static showDeleteAccountDialog(Lorg/telegram/ui/ActionBar/BaseFragment;)V
    .registers 6

    invoke-virtual {p0}, Lorg/telegram/ui/ActionBar/BaseFragment;->getParentActivity()Landroid/app/Activity;
    move-result-object v0
    if-eqz v0, :return

    new-instance v1, Lorg/telegram/ui/ActionBar/AlertDialog$Builder;
    invoke-direct {v1, v0}, Lorg/telegram/ui/ActionBar/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "If you proceed, your Telegram account will be permanently deleted. You cannot undo this."
    invoke-virtual {v1, v2}, Lorg/telegram/ui/ActionBar/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lorg/telegram/ui/ActionBar/AlertDialog$Builder;

    const-string v2, "Delete Account"
    invoke-virtual {v1, v2}, Lorg/telegram/ui/ActionBar/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Lorg/telegram/ui/ActionBar/AlertDialog$Builder;

    new-instance v2, Lorg/telegram/ui/DeleteAccountDialog$1;
    invoke-direct {v2, p0}, Lorg/telegram/ui/DeleteAccountDialog$1;-><init>(Lorg/telegram/ui/ActionBar/BaseFragment;)V
    const-string v3, "Deactivate"
    invoke-virtual {v1, v3, v2}, Lorg/telegram/ui/ActionBar/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Lorg/telegram/ui/ActionBar/AlertDialog$OnButtonClickListener;)Lorg/telegram/ui/ActionBar/AlertDialog$Builder;

    const-string v2, "Cancel"
    const/4 v3, 0x0
    invoke-virtual {v1, v2, v3}, Lorg/telegram/ui/ActionBar/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Lorg/telegram/ui/ActionBar/AlertDialog$OnButtonClickListener;)Lorg/telegram/ui/ActionBar/AlertDialog$Builder;

    invoke-virtual {v1}, Lorg/telegram/ui/ActionBar/AlertDialog$Builder;->create()Lorg/telegram/ui/ActionBar/AlertDialog;
    move-result-object v1

    new-instance v2, Lorg/telegram/ui/DeleteAccountDialog$2;
    invoke-direct {v2, p0, v1}, Lorg/telegram/ui/DeleteAccountDialog$2;-><init>(Lorg/telegram/ui/ActionBar/BaseFragment;Lorg/telegram/ui/ActionBar/AlertDialog;)V
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p0, v1}, Lorg/telegram/ui/ActionBar/BaseFragment;->showDialog(Landroid/app/Dialog;)Landroid/app/Dialog;

    :return
    return-void
.end method
