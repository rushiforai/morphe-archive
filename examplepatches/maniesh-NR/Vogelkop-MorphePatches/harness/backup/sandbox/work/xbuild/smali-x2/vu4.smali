.class public final Lvu4;
.super Lmqk;
.source "SourceFile"


# instance fields
.field public final synthetic j:B

.field public final k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Liv7;Lqde;Lndc;Lnqi;Libf;)V
    .registers 16

    const/4 v0, 0x1

    iput-byte v0, p0, Lvu4;->j:B

    .line 19
    sget-object v2, Lkqk;->r:Lkqk;

    .line 20
    const-string v3, "enable_suggested_speed_dials"

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move-object v8, p5

    .line 21
    invoke-direct/range {v1 .. v8}, Lmqk;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;)V

    .line 22
    iput-object p6, v1, Lvu4;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Liv7;Lqde;Lndc;Lnqi;Lwih;)V
    .registers 16

    const/4 v0, 0x0

    iput-byte v0, p0, Lvu4;->j:B

    sget-object v2, Lkqk;->o:Lkqk;

    const-string v3, "enable_suggestion_provider_ai_prompts"

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move-object v8, p5

    invoke-direct/range {v1 .. v8}, Lmqk;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;)V

    iput-object p6, v1, Lvu4;->k:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 5

    iget-byte v0, p0, Lvu4;->j:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lvu4;->k:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3c

    check-cast v3, Libf;

    const/16 v0, 0x800

    invoke-virtual {v3, v0}, Libf;->a(I)Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-super {p0}, Lmqk;->a()Z

    move-result p0

    if-eqz p0, :cond_1a

    move v1, v2

    :cond_1a
    return v1

    :pswitch_1b
    invoke-super {p0}, Lmqk;->a()Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object p0, p0, Lmqk;->d:Liv7;

    invoke-virtual {p0}, Liv7;->b()Z

    move-result p0

    if-eqz p0, :cond_3a

    check-cast v3, Lwih;

    iget-object p0, v3, Lwih;->b:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_3a

    move v1, v2

    :cond_3a
    return v1

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method

.method public final b()Z
    .registers 2

    iget-byte v0, p0, Lvu4;->j:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0}, Lmqk;->b()Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x1

    return p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final d()Z
    .registers 2

    iget-byte v0, p0, Lvu4;->j:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0}, Lmqk;->d()Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x0

    return p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final f()V
    .registers 5

    iget-byte v0, p0, Lvu4;->j:B

    packed-switch v0, :pswitch_data_26

    invoke-super {p0}, Lmqk;->f()V

    return-void

    :pswitch_9
    invoke-super {p0}, Lmqk;->f()V

    iget-object v0, p0, Lvu4;->k:Ljava/lang/Object;

    check-cast v0, Lwih;

    iget-object v0, v0, Lwih;->b:Lpde;

    new-instance v1, Lbo3;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lt7d;

    const/16 v3, 0x16

    invoke-direct {v2, v1, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object p0, p0, Lmqk;->f:Lndc;

    invoke-virtual {v0, p0, v2}, Lekc;->j(Lndc;Lf7f;)V

    return-void

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
