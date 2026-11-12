.class public final synthetic Lz4d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lz4d;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .registers 4

    iget-byte p0, p0, Lz4d;->a:B

    const-string v0, "Prerender operation failed"

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_2e

    check-cast p1, Ljava/lang/String;

    sget p0, Ly9p;->v:I

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/String;

    sget-object p0, Lito;->a:[Lito;

    return-void

    :pswitch_12
    check-cast p1, Ljava/lang/Throwable;

    new-instance p0, Llv0;

    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_1a
    check-cast p1, Ljava/lang/Void;

    throw v1

    :pswitch_1d
    check-cast p1, Ljava/lang/Throwable;

    new-instance p0, Llv0;

    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_25
    check-cast p1, Ljava/lang/Void;

    throw v1

    :pswitch_28
    check-cast p1, Ljava/lang/String;

    sget p0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_28
        :pswitch_25
        :pswitch_1d
        :pswitch_1a
        :pswitch_12
        :pswitch_d
    .end packed-switch
.end method
