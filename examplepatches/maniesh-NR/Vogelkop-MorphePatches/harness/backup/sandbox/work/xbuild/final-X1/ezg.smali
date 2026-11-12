.class public final synthetic Lezg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lezg;->a:B

    iput-object p1, p0, Lezg;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 8

    iget-byte v0, p0, Lezg;->a:B

    const-string v1, "wallpaper_current"

    iget-object p0, p0, Lezg;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_19c

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    const-string v0, "app_theme_accent"

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_18

    invoke-virtual {p0}, Lhjf;->C()V

    :cond_18
    return-void

    :pswitch_19
    check-cast p0, Lqln;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2a

    new-instance p1, Loln;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Loln;-><init>(Lqln;B)V

    invoke-virtual {p0, p1, v0}, Lqln;->a(Lcom/opera/api/Callback;I)V

    :cond_2a
    return-void

    :pswitch_2b
    check-cast p0, Lqkn;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_36

    invoke-virtual {p0}, Lqkn;->d()Z

    :cond_36
    return-void

    :pswitch_37
    check-cast p0, Lt6n;

    const-string v0, "wallpaper_rotation_category"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    const-string v0, "wallpaper_rotation_enabled"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_52

    :cond_49
    iget-object p1, p0, Lt6n;->c:Ltjn;

    invoke-interface {p1}, Ltjn;->d()Z

    move-result p1

    invoke-virtual {p0, p1}, Lt6n;->U(Z)V

    :cond_52
    return-void

    :pswitch_53
    check-cast p0, Lr4m;

    const-string v0, "translation_source"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lr4m;->g:Lv3m;

    iget-object v0, v0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object v0

    iget-boolean v0, v0, Lz4m;->a:Z

    if-nez v0, :cond_6c

    invoke-virtual {p0}, Lr4m;->b0()V

    :cond_6c
    iget-object p0, p0, Lr4m;->b:Ly4m;

    iget-object v0, p0, Ly4m;->d:Lv3m;

    const-string v1, "translate_web_pages_enabled"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_82

    invoke-virtual {v0}, Lv3m;->g()Z

    move-result p1

    iput-boolean p1, p0, Ly4m;->j:Z

    invoke-virtual {p0}, Ln1;->v0()V

    goto :goto_b6

    :cond_82
    const-string v1, "translate_web_pages_to_language"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b6

    iget-object p1, p0, Ly4m;->i:Lszb;

    invoke-virtual {v0}, Lv3m;->d()Lszb;

    move-result-object v0

    iput-object v0, p0, Ly4m;->i:Lszb;

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_b6

    iget-object p1, p0, Ly4m;->f:Lr4m;

    iget-object v0, p1, Lr4m;->d:Lh5m;

    iget-object v0, v0, Lh5m;->h:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld5m;

    invoke-virtual {v0}, Ld5m;->b()Z

    move-result v0

    if-eqz v0, :cond_b3

    new-instance v0, Lo4m;

    const/4 v1, 0x2

    invoke-direct {v0, p1, v1}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {p1, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    :cond_b3
    invoke-virtual {p0}, Ln1;->v0()V

    :cond_b6
    :goto_b6
    return-void

    :pswitch_b7
    check-cast p0, Lctl;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x123e81c9

    if-ne v0, v1, :cond_cd

    const-string v0, "addressbar_position"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_cd

    invoke-virtual {p0}, Lctl;->c()V

    :cond_cd
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x3f930708

    if-ne v0, v1, :cond_e1

    const-string v0, "app_layout"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e1

    invoke-virtual {p0}, Lctl;->c()V

    :cond_e1
    return-void

    :pswitch_e2
    check-cast p0, Lk8k;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x21a51ae

    if-ne v0, v1, :cond_f8

    const-string v0, "enable_search_shortcuts"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f8

    invoke-virtual {p0}, Lu5k;->A()V

    :cond_f8
    return-void

    :pswitch_f9
    check-cast p0, Li7k;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x46022cf3

    if-ne v0, v1, :cond_10f

    const-string v0, "enable_search_shortcuts_tablet"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10f

    invoke-virtual {p0}, Lu5k;->A()V

    :cond_10f
    return-void

    :pswitch_110
    check-cast p0, Lne5;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x68eb6585

    if-ne v0, v1, :cond_126

    const-string v0, "enable_start_page_customize_button"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_126

    invoke-virtual {p0}, Lne5;->V()V

    :cond_126
    return-void

    :pswitch_127
    check-cast p0, Lw6j;

    iget-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_136

    invoke-virtual {p0}, Lw6j;->t()V

    :cond_136
    return-void

    :pswitch_137
    check-cast p0, Lgyj;

    const-string v0, "speed_dial.plus_button"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_156

    iget-object p1, p0, Lgyj;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    iget-boolean v0, p0, Lgyj;->e:Z

    if-eq v0, p1, :cond_156

    iput-boolean p1, p0, Lgyj;->e:Z

    iget-object p0, p0, Lgyj;->c:Ldg7;

    iget-object p0, p0, Ldg7;->b:Ljava/lang/Object;

    check-cast p0, Ls9i;

    invoke-virtual {p0, p1}, Ls9i;->k0(Z)V

    :cond_156
    return-void

    :pswitch_157
    check-cast p0, Ldaj;

    const-string v0, "tracker_blocker"

    const-string v1, "night_mode"

    const-string v2, "ai_assistant_menu_shortcut"

    const-string v3, "compression"

    const-string v4, "ad_blocking"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_174

    invoke-virtual {p0}, Ldaj;->g()V

    :cond_174
    return-void

    :pswitch_175
    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    return-void

    :pswitch_17b
    check-cast p0, Lhzg;

    const-string v4, "exit_clear_data_categories"

    const-string v5, "exit_dialog_enabled"

    const-string v0, "ad_blocking"

    const-string v1, "tracker_blocker"

    const-string v2, "accept_cookies"

    const-string v3, "block_popups"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_19a

    invoke-virtual {p0}, Lhzg;->g()V

    :cond_19a
    return-void

    nop

    :pswitch_data_19c
    .packed-switch 0x0
        :pswitch_17b
        :pswitch_175
        :pswitch_157
        :pswitch_137
        :pswitch_127
        :pswitch_110
        :pswitch_f9
        :pswitch_e2
        :pswitch_b7
        :pswitch_53
        :pswitch_37
        :pswitch_2b
        :pswitch_19
    .end packed-switch
.end method
