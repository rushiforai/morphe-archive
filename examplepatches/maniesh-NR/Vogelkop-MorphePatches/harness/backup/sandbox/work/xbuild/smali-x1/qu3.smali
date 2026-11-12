.class public final synthetic Lqu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwh;
.implements Ldkj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpqh;


# direct methods
.method public synthetic constructor <init>(Lpqh;B)V
    .registers 3

    iput-byte p2, p0, Lqu3;->a:B

    iput-object p1, p0, Lqu3;->b:Lpqh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Lqu3;->a:B

    iget-object p0, p0, Lqu3;->b:Lpqh;

    packed-switch v0, :pswitch_data_12

    sget-object v0, Lpkj;->b:Lpkj;

    iput-object v0, p0, Lpqh;->a:Ljava/lang/Object;

    return-void

    :pswitch_c
    sget-object v0, Lpkj;->a:Lpkj;

    iput-object v0, p0, Lpqh;->a:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_c
    .end packed-switch
.end method

.method public final f(Lo93;)V
    .registers 2

    iget-object p0, p0, Lqu3;->b:Lpqh;

    iget-object p0, p0, Lpqh;->a:Ljava/lang/Object;

    check-cast p0, Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->f:Lwci;

    invoke-virtual {p0, p1}, Lwci;->e(Lo93;)V

    return-void
.end method
