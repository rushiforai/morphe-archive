.class public final Lt48;
.super Ltim;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Luim;Ljava/lang/Runnable;B)V
    .registers 4

    iput-byte p3, p0, Lt48;->b:B

    iput-object p2, p0, Lt48;->c:Ljava/lang/Runnable;

    invoke-direct {p0, p1}, Ltim;-><init>(Luim;)V

    return-void
.end method


# virtual methods
.method public final onFinished(Lhjm;)V
    .registers 2

    iget-byte p1, p0, Lt48;->b:B

    iget-object p0, p0, Lt48;->c:Ljava/lang/Runnable;

    packed-switch p1, :pswitch_data_14

    if-eqz p0, :cond_c

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_c
    return-void

    :pswitch_d
    if-eqz p0, :cond_12

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_12
    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
