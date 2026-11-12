.class public final synthetic Lnqc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpqc;


# direct methods
.method public synthetic constructor <init>(Lpqc;B)V
    .registers 3

    iput-byte p2, p0, Lnqc;->a:B

    iput-object p1, p0, Lnqc;->b:Lpqc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lnqc;->a:B

    iget-object p0, p0, Lnqc;->b:Lpqc;

    check-cast p1, Landroid/view/View;

    check-cast p2, Lef;

    packed-switch v0, :pswitch_data_32

    new-instance p2, Ldd;

    iget-object p0, p0, Lpqc;->d:Lfd;

    invoke-direct {p2, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {p2, p1}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18
    iget-object p1, p0, Lpqc;->f:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrnc;

    iget-object p2, p0, Lpqc;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p2}, Lrnc;->a(Lndc;)Ltn;

    move-result-object p1

    iget-object p0, p0, Lpqc;->a:Lcom/opera/android/BrowserActivity;

    sget-object p2, Lhqc;->b:Lhqc;

    const/4 v0, 0x0

    invoke-virtual {p1, p0, p2, v0}, Ltn;->D(Landroid/content/Context;Ltc2;Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
