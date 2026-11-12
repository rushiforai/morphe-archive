.class public final synthetic Lfb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lfb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 3

    iget-byte p0, p0, Lfb;->a:B

    packed-switch p0, :pswitch_data_16

    check-cast p1, Ljava/lang/Integer;

    return-void

    :pswitch_8
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    const/16 p1, 0x32

    const-string v0, "Signin.AndroidNumberOfDeviceAccounts"

    invoke-static {p0, p1, v0}, Lioh;->y(IILjava/lang/String;)V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
