.class public final synthetic Lbii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltj9;
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpii;


# direct methods
.method public synthetic constructor <init>(Lpii;B)V
    .registers 3

    iput-byte p2, p0, Lbii;->a:B

    iput-object p1, p0, Lbii;->b:Lpii;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d(I)V
    .registers 3

    iget-byte v0, p0, Lbii;->a:B

    iget-object p0, p0, Lbii;->b:Lpii;

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Lpii;->D:Lcom/google/android/material/textfield/TextInputLayout;

    if-nez p1, :cond_e

    const/16 p1, 0x8

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Lpii;->N0()V

    return-void

    :pswitch_17
    invoke-virtual {p0}, Lpii;->N0()V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_17
        :pswitch_13
    .end packed-switch
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lbii;->b:Lpii;

    if-eqz p1, :cond_25

    new-instance p1, Landroid/print/PageRange;

    const/4 v0, 0x0

    const/16 v1, 0x64

    invoke-direct {p1, v0, v1}, Landroid/print/PageRange;-><init>(II)V

    filled-new-array {p1}, [Landroid/print/PageRange;

    move-result-object p1

    iget-object v0, p0, Lpii;->u:Lqji;

    iget-object v1, p0, Lpii;->I:Landroid/os/ParcelFileDescriptor;

    new-instance v2, Llld;

    const/16 v3, 0x16

    invoke-direct {v2, p0, v3}, Llld;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, p1, v2}, Lqji;->h(Landroid/os/ParcelFileDescriptor;[Landroid/print/PageRange;Lpji;)V

    goto :goto_30

    :cond_25
    iget-object p1, p0, Lpii;->G:Llii;

    invoke-interface {p1}, Llii;->a()Z

    move-result p1

    if-eqz p1, :cond_30

    invoke-virtual {p0}, Lpii;->L0()V

    :cond_30
    :goto_30
    const/4 p0, 0x0

    return-object p0
.end method
