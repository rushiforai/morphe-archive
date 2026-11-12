.class public final synthetic Lnx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/settings/SettingsManager;B)V
    .registers 3

    iput-byte p2, p0, Lnx3;->a:B

    iput-object p1, p0, Lnx3;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lnx3;->a:B

    iget-object p0, p0, Lnx3;->b:Lcom/opera/android/settings/SettingsManager;

    packed-switch v0, :pswitch_data_28

    const-string v0, "night_mode_overlay_keyboard"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    :goto_d
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_12
    const-string v0, "night_mode_switch_theme"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    goto :goto_d

    :pswitch_19
    const-string v0, "darken_websites"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    goto :goto_d

    :pswitch_20
    const-string v0, "tab_auto_grouping"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    goto :goto_d

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_20
        :pswitch_19
        :pswitch_12
    .end packed-switch
.end method
