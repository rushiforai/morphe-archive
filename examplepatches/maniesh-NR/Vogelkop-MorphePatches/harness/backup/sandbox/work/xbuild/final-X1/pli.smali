.class public final synthetic Lpli;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/qr/ScanQrCodeActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/qr/ScanQrCodeActivity;B)V
    .registers 3

    iput-byte p2, p0, Lpli;->a:B

    iput-object p1, p0, Lpli;->b:Lcom/opera/android/qr/ScanQrCodeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lpli;->a:B

    iget-object p0, p0, Lpli;->b:Lcom/opera/android/qr/ScanQrCodeActivity;

    packed-switch v0, :pswitch_data_70

    check-cast p1, Lhmi;

    sget v0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "raw-value"

    iget-object v3, p1, Lhmi;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "value-type"

    iget v3, p1, Lhmi;->b:I

    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    iget-object p1, p1, Lhmi;->c:Lgmi;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const-string v2, "format"

    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "scan-result"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    const/4 p1, -0x1

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3d
    check-cast p1, Lgfh;

    instance-of v0, p1, Lcfh;

    if-eqz v0, :cond_6b

    sget v0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    check-cast p1, Lcfh;

    iget-object p1, p1, Lcfh;->a:Lbfh;

    invoke-static {p1}, Lmfh;->q(Lbfh;)Lrxh;

    move-result-object p1

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "error-message"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_6d

    :cond_6b
    sget p0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    :goto_6d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_3d
    .end packed-switch
.end method
