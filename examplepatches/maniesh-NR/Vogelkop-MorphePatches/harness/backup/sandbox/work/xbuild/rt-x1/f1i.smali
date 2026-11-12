.class public final synthetic Lf1i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld8e;

.field public final synthetic c:Ld1i;


# direct methods
.method public synthetic constructor <init>(Ld8e;Ld1i;B)V
    .registers 4

    iput-byte p3, p0, Lf1i;->a:B

    iput-object p1, p0, Lf1i;->b:Ld8e;

    iput-object p2, p0, Lf1i;->c:Ld1i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lf1i;->a:B

    iget-object v1, p0, Lf1i;->c:Ld1i;

    iget-object p0, p0, Lf1i;->b:Ld8e;

    packed-switch v0, :pswitch_data_4e

    invoke-virtual {p0}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_1a

    iget-object p0, v1, Ld1i;->a:Lrdc;

    invoke-static {p0}, Lvtp;->B(Lrdc;)V

    :cond_1a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d
    invoke-virtual {p0}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_2e

    iget-object p0, v1, Ld1i;->a:Lrdc;

    invoke-static {p0}, Lvtp;->Z(Lrdc;)V

    :cond_2e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31
    invoke-virtual {p0}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_4a

    iget-object p0, v1, Ld1i;->a:Lrdc;

    iget-object v0, p0, Lrdc;->c:Ljava/lang/Object;

    check-cast v0, Lpcc;

    sget-object v1, Lpcc;->e:Lpcc;

    if-ne v0, v1, :cond_4a

    invoke-virtual {p0}, Lrdc;->onPause()V

    :cond_4a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_31
        :pswitch_1d
    .end packed-switch
.end method
