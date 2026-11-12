.class public final synthetic Lyol;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld37;


# direct methods
.method public synthetic constructor <init>(Ld37;B)V
    .registers 3

    iput-byte p2, p0, Lyol;->a:B

    iput-object p1, p0, Lyol;->b:Ld37;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lyol;->a:B

    iget-object p0, p0, Lyol;->b:Ld37;

    packed-switch v0, :pswitch_data_48

    check-cast p1, Ljava/lang/Boolean;

    iget-object p1, p0, Ld37;->h:Ljava/lang/Object;

    check-cast p1, Lh42;

    invoke-virtual {p0}, Ld37;->B()Lehc;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    check-cast p1, Lm18;

    iget-object p1, p0, Ld37;->h:Ljava/lang/Object;

    check-cast p1, Lh42;

    invoke-virtual {p0}, Ld37;->B()Lehc;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27
    check-cast p1, Ljava/lang/Boolean;

    iget-object p1, p0, Ld37;->h:Ljava/lang/Object;

    check-cast p1, Lh42;

    invoke-virtual {p0}, Ld37;->B()Lehc;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_37
    check-cast p1, Lpv0;

    iget-object p1, p0, Ld37;->h:Ljava/lang/Object;

    check-cast p1, Lh42;

    invoke-virtual {p0}, Ld37;->B()Lehc;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_37
        :pswitch_27
        :pswitch_17
    .end packed-switch
.end method
