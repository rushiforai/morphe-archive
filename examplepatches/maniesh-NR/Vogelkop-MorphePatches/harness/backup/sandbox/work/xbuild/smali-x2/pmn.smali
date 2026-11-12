.class public final Lpmn;
.super Lqmn;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lpmn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lnmn;)V
    .registers 2

    iget-byte p0, p0, Lpmn;->a:B

    packed-switch p0, :pswitch_data_e

    invoke-interface {p1}, Lnmn;->e()V

    return-void

    :pswitch_9
    invoke-interface {p1}, Lnmn;->d()V

    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
