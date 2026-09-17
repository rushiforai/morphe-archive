.class Lorg/telegram/ui/DeleteAccountDialog$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/telegram/tgnet/RequestDelegate;

# On TL_boolTrue -> AndroidUtilities.runOnUIThread(new DeleteAccountDialog$4(fragment))

# instance fields
.field final synthetic val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;

# direct methods
.method constructor <init>(Lorg/telegram/ui/ActionBar/BaseFragment;)V
    .registers 2
    iput-object p1, p0, Lorg/telegram/ui/DeleteAccountDialog$3;->val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# virtual methods
.method public run(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/TLRPC$TL_error;)V
    .registers 4

    instance-of v0, p1, Lorg/telegram/tgnet/TLRPC$TL_boolTrue;
    if-eqz v0, :not_success

    iget-object v0, p0, Lorg/telegram/ui/DeleteAccountDialog$3;->val$fragment:Lorg/telegram/ui/ActionBar/BaseFragment;

    new-instance v1, Lorg/telegram/ui/DeleteAccountDialog$4;
    invoke-direct {v1, v0}, Lorg/telegram/ui/DeleteAccountDialog$4;-><init>(Lorg/telegram/ui/ActionBar/BaseFragment;)V

    invoke-static {v1}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;)V

    :not_success
    return-void
.end method
