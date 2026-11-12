.class public final synthetic Ls99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/settings/SettingsManager;B)V
    .registers 3

    iput-byte p2, p0, Ls99;->a:B

    iput-object p1, p0, Ls99;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ls99;->a:B

    iget-object p0, p0, Ls99;->b:Lcom/opera/android/settings/SettingsManager;

    packed-switch v0, :pswitch_data_2a

    new-instance v0, Lsul;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lsul;-><init>(B)V

    const-string v1, "enable_weather"

    invoke-static {p0, v1, v0}, Luyg;->d(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)Lf99;

    move-result-object p0

    return-object p0

    :pswitch_15
    const-string v0, "tab_auto_grouping"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_20
    const/4 v0, 0x1

    const-string v1, "speed_dial.enabled"

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_20
        :pswitch_15
    .end packed-switch
.end method
