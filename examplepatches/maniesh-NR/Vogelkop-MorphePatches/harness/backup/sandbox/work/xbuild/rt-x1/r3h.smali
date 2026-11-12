.class public final Lr3h;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public synthetic v:Ll99;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public synthetic constructor <init>(Lmt5;Lcom/opera/android/settings/SettingsManager;B)V
    .registers 4

    iput-byte p3, p0, Lr3h;->t:B

    iput-object p2, p0, Lr3h;->x:Lcom/opera/android/settings/SettingsManager;

    const/4 p2, 0x3

    invoke-direct {p0, p2, p1}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lr3h;->t:B

    check-cast p1, Ll99;

    check-cast p3, Lmt5;

    packed-switch v0, :pswitch_data_30

    new-instance v0, Lr3h;

    iget-object p0, p0, Lr3h;->x:Lcom/opera/android/settings/SettingsManager;

    const/4 v1, 0x1

    invoke-direct {v0, p3, p0, v1}, Lr3h;-><init>(Lmt5;Lcom/opera/android/settings/SettingsManager;B)V

    iput-object p1, v0, Lr3h;->v:Ll99;

    iput-object p2, v0, Lr3h;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lr3h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1c
    new-instance v0, Lr3h;

    iget-object p0, p0, Lr3h;->x:Lcom/opera/android/settings/SettingsManager;

    const/4 v1, 0x0

    invoke-direct {v0, p3, p0, v1}, Lr3h;-><init>(Lmt5;Lcom/opera/android/settings/SettingsManager;B)V

    iput-object p1, v0, Lr3h;->v:Ll99;

    iput-object p2, v0, Lr3h;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lr3h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lr3h;->t:B

    iget-object v1, p0, Lr3h;->x:Lcom/opera/android/settings/SettingsManager;

    const/4 v2, 0x7

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_9c

    iget-object v0, p0, Lr3h;->v:Ll99;

    iget-object v6, p0, Lr3h;->w:Ljava/lang/Object;

    sget-object v7, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lr3h;->u:Z

    if-eqz v8, :cond_20

    if-ne v8, v4, :cond_1c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_51

    :cond_1c
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_53

    :cond_20
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_33

    new-instance p1, Lxd6;

    sget-object v1, Lcpn;->a:Lcpn;

    invoke-direct {p1, v1, v2}, Lxd6;-><init>(Ljava/lang/Object;B)V

    goto :goto_43

    :cond_33
    const-string p1, "enable_weather"

    sget-object v2, Lwe5;->w:Lwe5;

    invoke-static {v1, p1, v2}, Luyg;->d(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)Lf99;

    move-result-object p1

    new-instance v1, Lyc1;

    const/16 v2, 0x1a

    invoke-direct {v1, p1, v2}, Lyc1;-><init>(Lf99;B)V

    move-object p1, v1

    :goto_43
    iput-object v5, p0, Lr3h;->v:Ll99;

    iput-object v5, p0, Lr3h;->w:Ljava/lang/Object;

    iput-boolean v4, p0, Lr3h;->u:Z

    invoke-static {v0, p1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v7, :cond_51

    move-object v5, v7

    goto :goto_53

    :cond_51
    :goto_51
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_53
    return-object v5

    :pswitch_54
    iget-object v0, p0, Lr3h;->v:Ll99;

    iget-object v6, p0, Lr3h;->w:Ljava/lang/Object;

    sget-object v7, Lpx5;->a:Lpx5;

    iget-boolean v8, p0, Lr3h;->u:Z

    if-eqz v8, :cond_68

    if-ne v8, v4, :cond_64

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_98

    :cond_64
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_9a

    :cond_68
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v6, Lf3h;

    invoke-virtual {v6}, Lf3h;->b()Z

    move-result p1

    if-eqz p1, :cond_83

    const-string p1, "enable_product_suggestion"

    sget-object v2, Lwe5;->t:Lwe5;

    invoke-static {v1, p1, v2}, Luyg;->d(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)Lf99;

    move-result-object p1

    new-instance v1, Lyc1;

    const/16 v2, 0x15

    invoke-direct {v1, p1, v2}, Lyc1;-><init>(Lf99;B)V

    goto :goto_8a

    :cond_83
    new-instance v1, Lxd6;

    sget-object p1, Lp3h;->a:Lp3h;

    invoke-direct {v1, p1, v2}, Lxd6;-><init>(Ljava/lang/Object;B)V

    :goto_8a
    iput-object v5, p0, Lr3h;->v:Ll99;

    iput-object v5, p0, Lr3h;->w:Ljava/lang/Object;

    iput-boolean v4, p0, Lr3h;->u:Z

    invoke-static {v0, v1, p0}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v7, :cond_98

    move-object v5, v7

    goto :goto_9a

    :cond_98
    :goto_98
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_9a
    return-object v5

    nop

    :pswitch_data_9c
    .packed-switch 0x0
        :pswitch_54
    .end packed-switch
.end method
