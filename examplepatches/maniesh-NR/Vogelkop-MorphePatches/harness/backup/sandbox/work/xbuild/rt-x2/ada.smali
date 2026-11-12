.class public final synthetic Lada;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lada;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    iget-byte p0, p0, Lada;->a:B

    packed-switch p0, :pswitch_data_1a

    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    return-void

    :pswitch_a
    new-instance p0, Lm35;

    new-instance p1, Lrl;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Lrl;-><init>(B)V

    const/4 p2, 0x1

    invoke-direct {p0, p2, p1}, Lm35;-><init>(ZLjava/lang/Runnable;)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
