.class public final synthetic Lxu8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcv8;


# direct methods
.method public synthetic constructor <init>(Lcv8;B)V
    .registers 3

    iput-byte p2, p0, Lxu8;->a:B

    iput-object p1, p0, Lxu8;->b:Lcv8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lxu8;->a:B

    iget-object p0, p0, Lxu8;->b:Lcv8;

    packed-switch v0, :pswitch_data_38

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p0, p0, Lcv8;->w:Lijc;

    iget-object p0, p0, Lijc;->h:Ljava/lang/Object;

    check-cast p0, Ljde;

    invoke-virtual {p0, p1}, Ljde;->e(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmv8;

    if-nez p0, :cond_1d

    sget-object p0, Liv8;->a:Liv8;

    :cond_1d
    return-object p0

    :pswitch_1e
    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lcv8;->a:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "speed_dial.plus_button"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    :goto_28
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2d
    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lcv8;->a:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "speed_dial.enabled"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    goto :goto_28

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_1e
    .end packed-switch
.end method
