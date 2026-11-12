.class public final Lz1n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw1n;


# instance fields
.field public final synthetic a:B

.field public final b:Lesk;


# direct methods
.method public synthetic constructor <init>(Lesk;B)V
    .registers 3

    iput-byte p2, p0, Lz1n;->a:B

    iput-object p1, p0, Lz1n;->b:Lesk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(I)V
    .registers 8

    iget-byte v0, p0, Lz1n;->a:B

    const/4 v1, 0x0

    const-string v2, "manual_wallpaper_first_occurrence"

    const-string v3, "wallpaper_current"

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object p0, p0, Lz1n;->b:Lesk;

    packed-switch v0, :pswitch_data_168

    check-cast p0, Ltt3;

    if-lez p1, :cond_3b

    const v0, 0x71a60e20

    if-ge p1, v0, :cond_3b

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lru9;

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "privacy_settings.promotion.can_show"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3b

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v0, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_3b
    return-void

    :pswitch_3c
    const v0, 0x71a8fc20

    if-lt p1, v0, :cond_5b

    const v0, 0x71a91b60

    if-ge p1, v0, :cond_5b

    check-cast p0, Ltt3;

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    const-string v0, "darken_websites"

    invoke-virtual {p0, v0, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-interface {p1, p0, v0}, Ly9j;->n(ILjava/lang/String;)V

    :cond_5b
    return-void

    :pswitch_5c
    check-cast p0, Ltt3;

    if-eqz p1, :cond_81

    const v0, 0x71c92e50

    if-ge p1, v0, :cond_81

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p1, v2}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_81

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p1, v3}, Ly9j;->d(Ljava/lang/String;)Z

    move-result p1

    xor-int/lit8 v5, p1, 0x1

    :cond_81
    if-eqz v5, :cond_96

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    invoke-virtual {p0, v3, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "THEME_WALLPAPER"

    invoke-interface {p1, v0, p0}, Ly9j;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_96
    return-void

    :pswitch_97
    check-cast p0, Ltt3;

    if-lez p1, :cond_ce

    const v0, 0x71c179a8

    if-ge p1, v0, :cond_ce

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const/4 v0, -0x1

    const-string v2, "app_theme_accent"

    invoke-interface {p1, v2, v0}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-ltz p1, :cond_b7

    invoke-static {}, Lg7j;->values()[Lg7j;

    move-result-object v0

    aget-object v1, v0, p1

    :cond_b7
    if-eqz v1, :cond_c5

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string p1, "app_theme_accent_changed_by_user"

    invoke-virtual {p0, v4, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_ce

    :cond_c5
    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v5, v2}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    :cond_ce
    :goto_ce
    return-void

    :pswitch_cf
    check-cast p0, Ltt3;

    if-lez p1, :cond_f2

    const v0, 0x71b6cf30

    if-ge p1, v0, :cond_f2

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p1, v2}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_f2

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p1, v3}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v5

    :cond_f2
    if-eqz v5, :cond_ff

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/opera/android/settings/SettingsManager;->W(JLjava/lang/String;)V

    :cond_ff
    return-void

    :pswitch_100
    check-cast p0, Ltt3;

    if-lez p1, :cond_120

    const v0, 0x71a794c0

    if-ge p1, v0, :cond_120

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v0, "personalized_news"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p0

    const-string v0, "process_news_topics"

    invoke-virtual {p1, p0, v0}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    :cond_120
    return-void

    :pswitch_121
    if-lez p1, :cond_146

    const v0, 0x71dcf4d0

    if-ge p1, v0, :cond_146

    check-cast p0, Ltt3;

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_frequently_visited_sites"

    const-string v0, "enable_suggested_speed_dials"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {p0, v1, p1}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    iget-object p1, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    invoke-virtual {p0, v0, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-interface {p1, p0, v0}, Ly9j;->n(ILjava/lang/String;)V

    :cond_146
    return-void

    :pswitch_147
    if-lez p1, :cond_166

    const v0, 0x71a473f8

    if-ge p1, v0, :cond_166

    check-cast p0, Ltt3;

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "main.menu.wallet.before.offline_pages"

    invoke-interface {p1, v0, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_166
    return-void

    nop

    :pswitch_data_168
    .packed-switch 0x0
        :pswitch_147
        :pswitch_121
        :pswitch_100
        :pswitch_cf
        :pswitch_97
        :pswitch_5c
        :pswitch_3c
    .end packed-switch
.end method
