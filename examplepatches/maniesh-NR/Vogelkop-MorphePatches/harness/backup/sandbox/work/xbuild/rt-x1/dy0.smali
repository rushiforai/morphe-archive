.class public final Ldy0;
.super Lmqk;
.source "SourceFile"


# instance fields
.field public final synthetic j:B


# direct methods
.method public synthetic constructor <init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;B)V
    .registers 9

    iput-byte p8, p0, Ldy0;->j:B

    invoke-direct/range {p0 .. p7}, Lmqk;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-byte v0, p0, Ldy0;->j:B

    sparse-switch v0, :sswitch_data_3c

    invoke-super {p0}, Lmqk;->a()Z

    move-result p0

    return p0

    :sswitch_a
    invoke-super {p0}, Lmqk;->a()Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object p0, p0, Lmqk;->d:Liv7;

    invoke-virtual {p0}, Liv7;->b()Z

    move-result p0

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    return p0

    :sswitch_1c
    invoke-super {p0}, Lmqk;->a()Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lmqk;->d:Liv7;

    invoke-virtual {v0}, Liv7;->b()Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object p0, p0, Lmqk;->e:Likc;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_3a

    const/4 p0, 0x1

    goto :goto_3b

    :cond_3a
    const/4 p0, 0x0

    :goto_3b
    return p0

    :sswitch_data_3c
    .sparse-switch
        0x0 -> :sswitch_1c
        0xa -> :sswitch_a
    .end sparse-switch
.end method

.method public final b()Z
    .registers 2

    iget-byte v0, p0, Ldy0;->j:B

    sparse-switch v0, :sswitch_data_c

    invoke-super {p0}, Lmqk;->b()Z

    move-result p0

    return p0

    :sswitch_a
    const/4 p0, 0x1

    return p0

    :sswitch_data_c
    .sparse-switch
        0x0 -> :sswitch_a
        0x1 -> :sswitch_a
        0x4 -> :sswitch_a
        0x6 -> :sswitch_a
        0xa -> :sswitch_a
    .end sparse-switch
.end method

.method public final c()Z
    .registers 2

    iget-byte v0, p0, Ldy0;->j:B

    sparse-switch v0, :sswitch_data_c

    invoke-super {p0}, Lmqk;->c()Z

    move-result p0

    return p0

    :sswitch_a
    const/4 p0, 0x1

    return p0

    :sswitch_data_c
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_a
    .end sparse-switch
.end method

.method public final d()Z
    .registers 2

    iget-byte v0, p0, Ldy0;->j:B

    sparse-switch v0, :sswitch_data_c

    invoke-super {p0}, Lmqk;->d()Z

    move-result p0

    return p0

    :sswitch_a
    const/4 p0, 0x0

    return p0

    :sswitch_data_c
    .sparse-switch
        0x0 -> :sswitch_a
        0x1 -> :sswitch_a
        0x4 -> :sswitch_a
        0x6 -> :sswitch_a
        0xa -> :sswitch_a
        0xb -> :sswitch_a
        0xc -> :sswitch_a
        0xf -> :sswitch_a
    .end sparse-switch
.end method
