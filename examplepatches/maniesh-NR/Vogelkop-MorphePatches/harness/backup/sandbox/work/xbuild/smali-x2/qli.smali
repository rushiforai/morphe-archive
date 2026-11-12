.class public final synthetic Lqli;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/qr/ScanQrCodeActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/qr/ScanQrCodeActivity;B)V
    .registers 3

    iput-byte p2, p0, Lqli;->a:B

    iput-object p1, p0, Lqli;->b:Lcom/opera/android/qr/ScanQrCodeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lqli;->a:B

    iget-object p0, p0, Lqli;->b:Lcom/opera/android/qr/ScanQrCodeActivity;

    packed-switch v0, :pswitch_data_20

    sget v0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    const v0, 0x7f140800

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    sget v0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
