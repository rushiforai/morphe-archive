.class public final Lmu5;
.super Ltjf;
.source "SourceFile"


# instance fields
.field public final synthetic j:B


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lx1p;Lkotlin/jvm/functions/Function1;B)V
    .registers 5

    iput-byte p4, p0, Lmu5;->j:B

    invoke-direct {p0, p1, p2, p3}, Ltjf;-><init>(Landroid/view/View;Lx1p;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method


# virtual methods
.method public final f()Z
    .registers 2

    iget-byte v0, p0, Lmu5;->j:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0}, Ltjf;->f()Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x1

    return p0

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
