.class final LDevCheckRestored$BluetoothMessage;
.super Ljava/lang/Object;

.implements Ljava/lang/Runnable;

.annotation system Ldalvik/annotation/EnclosingClass;
    value = LDevCheckRestored;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BluetoothMessage"
.end annotation

.field private final activity:Lstub/BluetoothActivity;

.field private final message:Ljava/lang/String;

.method constructor <init>(Lstub/BluetoothActivity;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LDevCheckRestored$BluetoothMessage;->activity:Lstub/BluetoothActivity;

    iput-object p2, p0, LDevCheckRestored$BluetoothMessage;->message:Ljava/lang/String;

    return-void
.end method

.method public run()V
    .registers 3

    iget-object v0, p0, LDevCheckRestored$BluetoothMessage;->activity:Lstub/BluetoothActivity;

    iget-object v0, v0, Lstub/BluetoothActivity;->emptyView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, LDevCheckRestored$BluetoothMessage;->activity:Lstub/BluetoothActivity;

    iget-object v0, v0, Lstub/BluetoothActivity;->emptyText:Landroid/widget/TextView;

    iget-object p0, p0, LDevCheckRestored$BluetoothMessage;->message:Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
