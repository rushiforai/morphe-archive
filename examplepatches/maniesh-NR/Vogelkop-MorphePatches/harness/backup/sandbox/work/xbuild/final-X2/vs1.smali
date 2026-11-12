.class public final synthetic Lvs1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lat1;


# direct methods
.method public synthetic constructor <init>(Lat1;B)V
    .registers 3

    iput-byte p2, p0, Lvs1;->a:B

    iput-object p1, p0, Lvs1;->b:Lat1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lvs1;->a:B

    iget-object p0, p0, Lvs1;->b:Lat1;

    packed-switch v0, :pswitch_data_22

    check-cast p1, Lm18;

    iget-object p1, p0, Lat1;->m:Lr2i;

    iget-object p1, p1, Lr2i;->h:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lat1;->i(Ljava/util/List;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_19
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lat1;->i(Ljava/util/List;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
