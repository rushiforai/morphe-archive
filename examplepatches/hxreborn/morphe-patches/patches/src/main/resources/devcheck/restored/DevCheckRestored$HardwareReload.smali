.class final LDevCheckRestored$HardwareReload;
.super Ljava/lang/Object;

.implements Ljava/lang/Runnable;

.annotation system Ldalvik/annotation/EnclosingClass;
    value = LDevCheckRestored;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HardwareReload"
.end annotation

.field private final fragment:Lstub/HardwareFragment;

.method constructor <init>(Lstub/HardwareFragment;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LDevCheckRestored$HardwareReload;->fragment:Lstub/HardwareFragment;

    return-void
.end method

.method public run()V
    .registers 2

    iget-object v0, p0, LDevCheckRestored$HardwareReload;->fragment:Lstub/HardwareFragment;

    invoke-virtual {v0}, Lstub/HardwareFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, LDevCheckRestored$HardwareReload;->fragment:Lstub/HardwareFragment;

    iget-object p0, p0, Lstub/HardwareFragment;->viewModel:Lstub/HardwareViewModel;

    invoke-virtual {p0}, Lstub/HardwareViewModel;->reload()V

    :cond_0
    return-void
.end method
