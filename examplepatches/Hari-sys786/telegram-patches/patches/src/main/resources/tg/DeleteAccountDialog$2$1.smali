.class Lorg/telegram/ui/DeleteAccountDialog$2$1;
.super Landroid/os/CountDownTimer;
.source "SourceFile"

# CountDownTimer subclass: 20s countdown, button shows "(N)", re-enables on finish

# instance fields
.field final synthetic val$button:Landroid/widget/TextView;

# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .registers 6
    iput-object p1, p0, Lorg/telegram/ui/DeleteAccountDialog$2$1;->val$button:Landroid/widget/TextView;
    const-wide/16 v0, 0x4e20
    const-wide/16 v2, 0x64
    invoke-direct {p0, v0, v1, v2, v3}, Landroid/os/CountDownTimer;-><init>(JJ)V
    return-void
.end method

# virtual methods
.method public onTick(J)V
    .registers 12
    iget-object v0, p0, Lorg/telegram/ui/DeleteAccountDialog$2$1;->val$button:Landroid/widget/TextView;
    const-wide/16 v6, 0x3e8
    div-long/2addr v10, v6
    const-wide/16 v6, 0x1
    add-long/2addr v10, v6
    long-to-int v1, v10
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "Deactivate ("
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v1, ")"
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    return-void
.end method

.method public onFinish()V
    .registers 2
    iget-object v0, p0, Lorg/telegram/ui/DeleteAccountDialog$2$1;->val$button:Landroid/widget/TextView;
    const-string v1, "Deactivate"
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V
    return-void
.end method
