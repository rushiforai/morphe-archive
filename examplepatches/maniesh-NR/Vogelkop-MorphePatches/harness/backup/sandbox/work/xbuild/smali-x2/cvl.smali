.class public final synthetic Lcvl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpr;


# direct methods
.method public synthetic constructor <init>(Lpr;B)V
    .registers 3

    iput-byte p2, p0, Lcvl;->a:B

    iput-object p1, p0, Lcvl;->b:Lpr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lcvl;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lcvl;->b:Lpr;

    packed-switch v0, :pswitch_data_3a

    check-cast p1, Lavl;

    iget-object p1, p0, Lpr;->c:Ljava/lang/Object;

    check-cast p1, Lbvl;

    invoke-interface {p1}, Lbvl;->getState()Lpde;

    move-result-object p1

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lavl;

    iget p1, p1, Lavl;->c:I

    if-lez p1, :cond_2b

    new-instance v1, Ldvl;

    iget-object v0, p0, Lpr;->b:Ljava/lang/Object;

    check-cast v0, Lmt3;

    invoke-virtual {v0}, Lmt3;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bar/TopToolbarContainer;

    invoke-direct {v1, v0, p1}, Ldvl;-><init>(Lcom/opera/android/bar/TopToolbarContainer;I)V

    :cond_2b
    invoke-virtual {p0, v1}, Lpr;->C(Ldvl;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31
    check-cast p1, Lndc;

    invoke-virtual {p0, v1}, Lpr;->C(Ldvl;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_31
    .end packed-switch
.end method
