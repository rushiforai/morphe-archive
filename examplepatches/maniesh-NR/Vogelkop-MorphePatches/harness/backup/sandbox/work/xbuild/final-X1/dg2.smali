.class public final synthetic Ldg2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgg2;


# direct methods
.method public synthetic constructor <init>(Lgg2;B)V
    .registers 3

    iput-byte p2, p0, Ldg2;->a:B

    iput-object p1, p0, Ldg2;->b:Lgg2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ldg2;->a:B

    iget-object p0, p0, Ldg2;->b:Lgg2;

    packed-switch v0, :pswitch_data_24

    sget-object v0, Lei7;->a:Lei7;

    new-instance v1, Lx2;

    const/16 v2, 0x18

    invoke-direct {v1, p0, v0, v2}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lgg2;->h(Lkotlin/jvm/functions/Function0;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_16
    new-instance v0, Lvk1;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lvk1;-><init>(B)V

    invoke-virtual {p0, v0}, Lgg2;->h(Lkotlin/jvm/functions/Function0;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
