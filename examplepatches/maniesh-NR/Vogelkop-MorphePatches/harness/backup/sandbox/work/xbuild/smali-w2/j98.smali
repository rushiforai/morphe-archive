.class public final Lj98;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Ll98;


# direct methods
.method public synthetic constructor <init>(Ll98;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lj98;->t:B

    iput-object p1, p0, Lj98;->v:Ll98;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lj98;->t:B

    iget-object p0, p0, Lj98;->v:Ll98;

    packed-switch v0, :pswitch_data_24

    new-instance p1, Lj98;

    const/4 v0, 0x2

    invoke-direct {p1, p0, p2, v0}, Lj98;-><init>(Ll98;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance v0, Lj98;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lj98;-><init>(Ll98;Lmt5;B)V

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    iput-boolean p0, v0, Lj98;->u:Z

    return-object v0

    :pswitch_1d
    new-instance p1, Lj98;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lj98;-><init>(Ll98;Lmt5;B)V

    return-object p1

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lj98;->t:B

    packed-switch v0, :pswitch_data_44

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lj98;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lj98;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lj98;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Lmt5;

    new-instance v0, Lj98;

    iget-object p0, p0, Lj98;->v:Ll98;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lj98;-><init>(Ll98;Lmt5;B)V

    iput-boolean p1, v0, Lj98;->u:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lj98;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2f
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lj98;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lj98;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lj98;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lj98;->t:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    iget-object v3, p0, Lj98;->v:Ll98;

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_74

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lj98;->u:Z

    if-eqz v5, :cond_1b

    if-ne v5, v4, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_28

    :cond_17
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2a

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lj98;->u:Z

    invoke-virtual {v3, p0}, Ll98;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_28

    move-object v1, v0

    goto :goto_2a

    :cond_28
    :goto_28
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2a
    return-object v1

    :pswitch_2b
    iget-boolean p0, p0, Lj98;->u:Z

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget p1, Lcom/opera/android/esim/EsimTimeZoneChangeReceiver;->a:I

    iget-object p1, v3, Ll98;->a:Lcom/opera/android/BrowserActivity;

    if-eqz p0, :cond_3a

    move p0, v4

    goto :goto_3b

    :cond_3a
    const/4 p0, 0x2

    :goto_3b
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/opera/android/esim/EsimTimeZoneChangeReceiver;

    invoke-direct {v0, p1, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p1, v0, p0, v4}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4c
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lj98;->u:Z

    if-eqz v5, :cond_60

    if-ne v5, v4, :cond_5c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_71

    :cond_5c
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_73

    :cond_60
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v3, Ll98;->c:Lot6;

    iget-object v1, v3, Ll98;->a:Lcom/opera/android/BrowserActivity;

    iput-boolean v4, p0, Lj98;->u:Z

    invoke-virtual {p1, v1, p0}, Lot6;->a(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_71

    move-object v1, v0

    goto :goto_73

    :cond_71
    :goto_71
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_73
    return-object v1

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_2b
    .end packed-switch
.end method
