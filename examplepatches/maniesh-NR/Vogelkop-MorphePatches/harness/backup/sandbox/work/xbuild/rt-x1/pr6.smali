.class public final Lpr6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Z

.field public synthetic v:Z


# direct methods
.method public synthetic constructor <init>(ILmt5;B)V
    .registers 4

    iput-byte p3, p0, Lpr6;->t:B

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte p0, p0, Lpr6;->t:B

    const/4 v0, 0x3

    check-cast p1, Ljava/lang/Boolean;

    packed-switch p0, :pswitch_data_60

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p3, Lmt5;

    new-instance p2, Lpr6;

    const/4 v1, 0x2

    invoke-direct {p2, v0, p3, v1}, Lpr6;-><init>(ILmt5;B)V

    iput-boolean p0, p2, Lpr6;->u:Z

    iput-boolean p1, p2, Lpr6;->v:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p2, p0}, Lpr6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_25
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p3, Lmt5;

    new-instance p2, Lpr6;

    const/4 v1, 0x1

    invoke-direct {p2, v0, p3, v1}, Lpr6;-><init>(ILmt5;B)V

    iput-boolean p0, p2, Lpr6;->u:Z

    iput-boolean p1, p2, Lpr6;->v:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p2, p0}, Lpr6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_42
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p3, Lmt5;

    new-instance p2, Lpr6;

    const/4 v1, 0x0

    invoke-direct {p2, v0, p3, v1}, Lpr6;-><init>(ILmt5;B)V

    iput-boolean p0, p2, Lpr6;->u:Z

    iput-boolean p1, p2, Lpr6;->v:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p2, p0}, Lpr6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_42
        :pswitch_25
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lpr6;->t:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_3c

    iget-boolean v0, p0, Lpr6;->u:Z

    iget-boolean p0, p0, Lpr6;->v:Z

    sget-object v1, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Ln2f;

    invoke-direct {p1, v0, p0}, Ln2f;-><init>(ZZ)V

    return-object p1

    :pswitch_16
    iget-boolean v0, p0, Lpr6;->u:Z

    iget-boolean p0, p0, Lpr6;->v:Z

    sget-object v3, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz v0, :cond_24

    if-eqz p0, :cond_24

    move v1, v2

    :cond_24
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_29
    iget-boolean v0, p0, Lpr6;->u:Z

    iget-boolean p0, p0, Lpr6;->v:Z

    sget-object v3, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz v0, :cond_37

    if-eqz p0, :cond_37

    move v1, v2

    :cond_37
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_29
        :pswitch_16
    .end packed-switch
.end method
