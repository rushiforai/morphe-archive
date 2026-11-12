.class public final synthetic Lsz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    .line 11
    iput-byte p1, p0, Lsz3;->a:B

    iput-boolean p3, p0, Lsz3;->b:Z

    iput-object p2, p0, Lsz3;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ltz3;Z)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lsz3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsz3;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lsz3;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lsz3;->a:B

    iget-object v1, p0, Lsz3;->c:Ljava/lang/Object;

    iget-boolean p0, p0, Lsz3;->b:Z

    packed-switch v0, :pswitch_data_42

    check-cast v1, Ljava/lang/String;

    if-eqz p0, :cond_15

    invoke-static {v1}, LJ/N;->MFRS03S8(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_15

    const/4 p0, 0x1

    goto :goto_16

    :cond_15
    const/4 p0, 0x0

    :goto_16
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1b
    check-cast v1, Lkg9;

    if-eqz p0, :cond_22

    invoke-static {v1}, Lkg9;->a(Lkg9;)V

    :cond_22
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    check-cast v1, Lt71;

    if-eqz p0, :cond_36

    invoke-virtual {v1}, Lt71;->i()Lxee;

    move-result-object p0

    if-eqz p0, :cond_36

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    check-cast p0, Ljdj;

    invoke-virtual {p0, v0}, Ljdj;->i(Ljava/lang/Object;)Z

    :cond_36
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_39
    check-cast v1, Ltz3;

    invoke-virtual {v1, p0}, Ltz3;->b(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_39
        :pswitch_25
        :pswitch_1b
    .end packed-switch
.end method
