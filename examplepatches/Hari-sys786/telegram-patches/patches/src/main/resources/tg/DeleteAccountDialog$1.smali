.class Lorg/telegram/ui/DeleteAccountDialog$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/telegram/ui/ActionBar/AlertDialog$OnButtonClickListener;

# Performs: delete all dialogs, then account.deleteAccount(REASON), then logout (via $3/$4)

# instance fields
.field final synthetic val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;

# direct methods
.method constructor <init>(Lorg/telegram/ui/ActionBar/BaseFragment;)V
    .registers 2
    iput-object p1, p0, Lorg/telegram/ui/DeleteAccountDialog$1;->val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# virtual methods
.method public onClick(Lorg/telegram/ui/ActionBar/AlertDialog;I)V
    .registers 16

    iget-object v0, p0, Lorg/telegram/ui/DeleteAccountDialog$1;->val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;

    invoke-virtual {v0}, Lorg/telegram/ui/ActionBar/BaseFragment;->getMessagesController()Lorg/telegram/messenger/MessagesController;
    move-result-object v1

    invoke-virtual {v1}, Lorg/telegram/messenger/MessagesController;->getAllDialogs()Ljava/util/ArrayList;
    move-result-object v2
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
    move-result-object v2

    :loop
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :end_loop

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lorg/telegram/tgnet/TLRPC$Dialog;

    instance-of v5, v4, Lorg/telegram/tgnet/TLRPC$TL_dialogFolder;
    if-nez v5, :skip_dialog

    iget-wide v6, v4, Lorg/telegram/tgnet/TLRPC$Dialog;->id:J
    const/4 v8, 0x0
    const/4 v9, 0x1
    invoke-virtual {v1, v6, v7, v8, v9}, Lorg/telegram/messenger/MessagesController;->deleteDialog(JIZ)V

    :skip_dialog
    goto :loop

    :end_loop

    new-instance v2, Lorg/telegram/tgnet/tl/TL_account$deleteAccount;
    invoke-direct {v2}, Lorg/telegram/tgnet/tl/TL_account$deleteAccount;-><init>()V

    const-string v3, "Gogram is Gay"
    iput-object v3, v2, Lorg/telegram/tgnet/tl/TL_account$deleteAccount;->reason:Ljava/lang/String;

    invoke-virtual {v0}, Lorg/telegram/ui/ActionBar/BaseFragment;->getConnectionsManager()Lorg/telegram/tgnet/ConnectionsManager;
    move-result-object v0

    new-instance v1, Lorg/telegram/ui/DeleteAccountDialog$3;
    iget-object v3, p0, Lorg/telegram/ui/DeleteAccountDialog$1;->val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;
    invoke-direct {v1, v3}, Lorg/telegram/ui/DeleteAccountDialog$3;-><init>(Lorg/telegram/ui/ActionBar/BaseFragment;)V

    invoke-virtual {v0, v2, v1}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I

    return-void
.end method
