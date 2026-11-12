.class public final synthetic Lq6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lq6o;->a:B

    iput-object p1, p0, Lq6o;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lq6o;->a:B

    const-string v1, ""

    const-string v2, "Authorization"

    const-string v3, "GET"

    iget-object p0, p0, Lq6o;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_5a

    check-cast p0, Lweo;

    check-cast p1, Lspa;

    sget-object v0, Lapa;->b:Lapa;

    invoke-static {v3}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v0

    iput-object v0, p1, Lspa;->b:Lapa;

    iget-object v0, p1, Lspa;->a:Ltgm;

    iget-object p0, p0, Lweo;->a:Ljava/lang/String;

    const-string v3, "api/v1/market/products"

    invoke-static {p0, v3, v0}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    sget-object p0, Lvpa;->a:Ljf2;

    iget-object p0, p1, Lspa;->c:Lg9a;

    invoke-virtual {p0, v2, v1}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Accept-Language"

    invoke-virtual {p0, p1, v1}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31
    check-cast p0, Lfeo;

    check-cast p1, Lspa;

    sget-object v0, Lapa;->b:Lapa;

    invoke-static {v3}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v0

    iput-object v0, p1, Lspa;->b:Lapa;

    iget-object v0, p1, Lspa;->a:Ltgm;

    iget-object p0, p0, Lfeo;->a:Ljava/lang/String;

    const-string v3, "api/v2/token/cashout/config"

    invoke-static {p0, v3, v0}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    sget-object p0, Lvpa;->a:Ljf2;

    iget-object p0, p1, Lspa;->c:Lg9a;

    invoke-virtual {p0, v2, v1}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_50
    check-cast p0, Lw6o;

    check-cast p1, Ljava/lang/Throwable;

    const/4 p1, 0x0

    iput-object p1, p0, Lw6o;->o:Ls6o;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_50
        :pswitch_31
    .end packed-switch
.end method
