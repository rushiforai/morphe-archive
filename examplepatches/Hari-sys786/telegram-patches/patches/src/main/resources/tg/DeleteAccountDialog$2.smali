.class Lorg/telegram/ui/DeleteAccountDialog$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;

# On show: make Deactivate button RED + disabled, start 20s CountDownTimer

# instance fields
.field final synthetic val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;
.field final synthetic val$dialog:Lorg/telegram/ui/ActionBar/AlertDialog;

# direct methods
.method constructor <init>(Lorg/telegram/ui/ActionBar/BaseFragment;Lorg/telegram/ui/ActionBar/AlertDialog;)V
    .registers 3
    iput-object p1, p0, Lorg/telegram/ui/DeleteAccountDialog$2;->val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;
    iput-object p2, p0, Lorg/telegram/ui/DeleteAccountDialog$2;->val$dialog:Lorg/telegram/ui/ActionBar/AlertDialog;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .registers 4

    iget-object v0, p0, Lorg/telegram/ui/DeleteAccountDialog$2;->val$dialog:Lorg/telegram/ui/ActionBar/AlertDialog;

    const/4 v1, -0x1
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AlertDialog;->getButton(I)Landroid/view/View;
    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    const/high16 v1, -0x10000
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v1, Lorg/telegram/ui/DeleteAccountDialog$2$1;
    invoke-direct {v1, v0}, Lorg/telegram/ui/DeleteAccountDialog$2$1;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v1}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    return-void
.end method
