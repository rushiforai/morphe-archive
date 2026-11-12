.class public final synthetic Lrt5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltt5;


# direct methods
.method public synthetic constructor <init>(Ltt5;B)V
    .registers 3

    iput-byte p2, p0, Lrt5;->a:B

    iput-object p1, p0, Lrt5;->b:Ltt5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lrt5;->a:B

    iget-object p0, p0, Lrt5;->b:Ltt5;

    packed-switch v0, :pswitch_data_26

    check-cast p1, Lj8f;

    iget-object p0, p0, Ltt5;->i:Ls6h;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ls6h;->N(Lj8f;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p0, p0, Ltt5;->n:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lcu5;

    invoke-virtual {p0, p1}, Lcu5;->b0(I)Landroid/view/View;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
