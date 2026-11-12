.class public final Lxhe;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lbie;


# direct methods
.method public synthetic constructor <init>(Lbie;B)V
    .registers 3

    iput-byte p2, p0, Lxhe;->i:B

    iput-object p1, p0, Lxhe;->j:Lbie;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lxhe;->i:B

    iget-object p0, p0, Lxhe;->j:Lbie;

    packed-switch v0, :pswitch_data_16

    sget-object v0, Lzhe;->b:Lzhe;

    invoke-virtual {p0, v0}, Lbie;->a(Lkotlin/jvm/functions/Function1;)Lqhe;

    move-result-object p0

    return-object p0

    :pswitch_e
    sget-object v0, Lwhe;->b:Lwhe;

    invoke-virtual {p0, v0}, Lbie;->a(Lkotlin/jvm/functions/Function1;)Lqhe;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
