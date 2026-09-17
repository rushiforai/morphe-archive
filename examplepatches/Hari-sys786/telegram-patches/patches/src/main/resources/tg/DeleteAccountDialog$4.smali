.class Lorg/telegram/ui/DeleteAccountDialog$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;

# Runnable that performs logout on the UI thread

# instance fields
.field final synthetic val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;

# direct methods
.method constructor <init>(Lorg/telegram/ui/ActionBar/BaseFragment;)V
    .registers 2
    iput-object p1, p0, Lorg/telegram/ui/DeleteAccountDialog$4;->val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# virtual methods
.method public run()V
    .registers 3
    iget-object v0, p0, Lorg/telegram/ui/DeleteAccountDialog$4;->val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;
    invoke-virtual {v0}, Lorg/telegram/ui/ActionBar/BaseFragment;->getMessagesController()Lorg/telegram/messenger/MessagesController;
    move-result-object v0
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Lorg/telegram/messenger/MessagesController;->performLogout(I)V
    return-void
.end method
