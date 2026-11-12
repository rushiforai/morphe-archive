.class public final synthetic Ls9;
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

    iput-byte p2, p0, Ls9;->a:B

    iput-object p1, p0, Ls9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 12

    iget-byte v0, p0, Ls9;->a:B

    const-string v1, "toolbar_bottom_actions"

    const v2, 0x63b14c2d

    const-string v3, "ai_assistant_menu_shortcut"

    const v4, 0x47ca946e

    const-string v5, "ongoing_installation_location_reset"

    const-string v6, "enable_newsfeed"

    const-string v7, "eula_accepted.gdpr"

    const-string v8, "recommendations_language_region"

    const/4 v9, 0x0

    iget-object p0, p0, Ls9;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_33a

    check-cast p0, Ltlg;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x51ead70f

    if-ne v0, v1, :cond_30

    const-string v0, "speed_dial.plus_button"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    invoke-virtual {p0}, Ltlg;->S()V

    :cond_30
    return-void

    :pswitch_31
    check-cast p0, Lkcg;

    iget-object v0, p0, Lkcg;->g:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_48

    iget-object p1, p0, Lkcg;->c:Lxb;

    iget-object p1, p1, Lxb;->d:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lipf;

    invoke-virtual {p0, p1}, Lkcg;->a(Lipf;)V

    :cond_48
    return-void

    :pswitch_49
    check-cast p0, Lk6g;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x552a5829

    if-eq v0, v1, :cond_65

    const v1, 0x2b0c7522

    if-ne v0, v1, :cond_94

    const-string v0, "password_manager_autosave"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_94

    invoke-virtual {p0}, Lk6g;->a()V

    goto :goto_94

    :cond_65
    const-string v0, "enable_sync"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_94

    iget-object p1, p0, Lk6g;->k:Lj6g;

    new-instance v0, Li6g;

    invoke-virtual {p1}, Lj6g;->a()Z

    move-result v1

    iget-object v2, p1, Lj6g;->c:Lzwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x3

    invoke-static {v2}, Lzwk;->c(I)Z

    move-result v2

    invoke-direct {v0, v1, v2}, Li6g;-><init>(ZZ)V

    iget-object v1, p1, Lj6g;->e:Li6g;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_91

    iput-object v0, p1, Lj6g;->e:Li6g;

    iget-object p1, p1, Lj6g;->d:Le6g;

    invoke-virtual {p1}, Le6g;->invoke()Ljava/lang/Object;

    :cond_91
    invoke-virtual {p0}, Lk6g;->a()V

    :cond_94
    :goto_94
    return-void

    :pswitch_95
    check-cast p0, Ld3f;

    sget-object v0, Lxsk;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a2

    invoke-virtual {p0}, Ld3f;->g()V

    :cond_a2
    return-void

    :pswitch_a3
    check-cast p0, Lfue;

    const-string v0, "news_is_blocked_by_personalization_change"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b0

    invoke-virtual {p0}, Lfue;->d()V

    :cond_b0
    return-void

    :pswitch_b1
    check-cast p0, Lwte;

    iget-object v0, p0, Lwte;->h:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d0

    invoke-virtual {p1, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_cd

    invoke-virtual {p0}, Lwte;->a()Z

    move-result p1

    if-nez p1, :cond_cd

    iget-object p0, p0, Lwte;->l:Lute;

    invoke-virtual {p0}, Lute;->e()V

    goto :goto_d0

    :cond_cd
    invoke-virtual {p0}, Lwte;->b()V

    :cond_d0
    :goto_d0
    return-void

    :pswitch_d1
    check-cast p0, Lhge;

    const-string v0, "my_flow_visible"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_de

    invoke-virtual {p0}, Lhge;->a()V

    :cond_de
    return-void

    :pswitch_df
    check-cast p0, Lfrd;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x4a1f794a    # 2612818.5f

    if-ne v0, v1, :cond_113

    const-string v0, "media_background_play"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_113

    iget-object p1, p0, Lfrd;->g:Lnak;

    new-instance v1, Lerd;

    iget-object v2, p0, Lfrd;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v2, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-object v2, p0, Lfrd;->e:Lj3i;

    invoke-virtual {v2}, Lj3i;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-boolean p0, p0, Lfrd;->f:Z

    invoke-direct {v1, v0, v2, p0}, Lerd;-><init>(ZZZ)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v9, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_113
    return-void

    :pswitch_114
    check-cast p0, Liyc;

    iget-object v0, p0, Liyc;->f:Loml;

    if-nez v0, :cond_12b

    const-string v0, "process_location"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_128

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_12b

    :cond_128
    invoke-virtual {p0}, Liyc;->a()V

    :cond_12b
    return-void

    :pswitch_12c
    check-cast p0, Lvpc;

    invoke-virtual {p1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_137

    invoke-virtual {p0}, Lvpc;->b()V

    :cond_137
    return-void

    :pswitch_138
    check-cast p0, Lj1c;

    iget-object v0, p0, Lj1c;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_147

    invoke-virtual {p0}, Lj1c;->k()V

    :cond_147
    return-void

    :pswitch_148
    check-cast p0, Lp0c;

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_153

    invoke-virtual {p0}, Lp0c;->a()V

    :cond_153
    return-void

    :pswitch_154
    check-cast p0, Lx79;

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_160

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lx79;->P(Z)V

    :cond_160
    return-void

    :pswitch_161
    check-cast p0, Lh0a;

    const-string v0, "enable_google_ai_mode"

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_16e

    invoke-virtual {p0}, Lh0a;->a()V

    :cond_16e
    return-void

    :pswitch_16f
    check-cast p0, Lwj9;

    iget-object p0, p0, Lwj9;->b:Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    return-void

    :pswitch_177
    check-cast p0, Lwjh;

    iget-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_198

    invoke-virtual {v0, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_198

    iget-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p1, Lo59;

    if-eqz p1, :cond_198

    iget-object p1, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p1, Ls9;

    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iput-object v9, p0, Lwjh;->f:Ljava/lang/Object;

    :cond_198
    return-void

    :pswitch_199
    check-cast p0, Le29;

    const-string v0, "offline_pages_location"

    const-string v1, "downloads_location"

    const-string v2, "concurrent_downloads"

    const-string v3, "ask_before_downloading"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1f8

    iget-object p1, p0, Le29;->e:Lnak;

    new-instance v0, Ld29;

    iget-object v1, p0, Le29;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object v4

    iget-object p0, p0, Le29;->b:Lv61;

    iget-object v5, p0, Lv61;->a:Landroid/content/Context;

    invoke-static {v5, v4}, Lv61;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "~/"

    invoke-static {v5, v4}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->O()Z

    move-result v6

    if-eqz v6, :cond_1d2

    sget-object p0, Ls8f;->m:Ls8f;

    goto :goto_1e7

    :cond_1d2
    new-instance v6, Lt8f;

    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Lcom/opera/android/settings/SettingsManager;->t(Z)Landroid/net/Uri;

    move-result-object v7

    iget-object p0, p0, Lv61;->a:Landroid/content/Context;

    invoke-static {p0, v7}, Lv61;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v5, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v6, p0}, Lt8f;-><init>(Ljava/lang/String;)V

    move-object p0, v6

    :goto_1e7
    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    invoke-direct {v0, v4, p0, v2, v1}, Ld29;-><init>(Ljava/lang/String;Lwxe;IZ)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v9, v0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_1f8
    return-void

    :pswitch_1f9
    check-cast p0, Lyk6;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x1aa04c7

    if-eq v0, v1, :cond_20d

    if-ne v0, v4, :cond_218

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_215

    goto :goto_218

    :cond_20d
    const-string v0, "ai_assistant_ask_aria"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_218

    :cond_215
    invoke-virtual {p0}, Lyk6;->e()V

    :cond_218
    :goto_218
    return-void

    :pswitch_219
    check-cast p0, Ligi;

    const-string v0, "compression"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_226

    invoke-virtual {p0}, Ligi;->A0()V

    :cond_226
    return-void

    :pswitch_227
    check-cast p0, Lp35;

    const-string v0, "exit_dialog_enabled"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_247

    iget-object p1, p0, Lp35;->u:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p0, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-object p1, p0, Lp35;->u:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Ljl4;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Ljl4;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    :cond_247
    return-void

    :pswitch_248
    check-cast p0, Ldl4;

    const-string v0, "automatic_card_save_ask"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_259

    invoke-virtual {p0}, Ldl4;->g()V

    :cond_259
    return-void

    :pswitch_25a
    check-cast p0, Lny3;

    const-string v0, "tab_disposition"

    const-string v1, "tab_auto_grouping"

    const-string v2, "startup_mode"

    filled-new-array {v2, v0, v1, v5}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_273

    invoke-virtual {p0}, Lny3;->c()V

    :cond_273
    return-void

    :pswitch_274
    check-cast p0, Ltah;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    if-ne v0, v2, :cond_29c

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_29c

    iget-object p1, p0, Ltah;->h:Ljava/lang/Object;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object p1, p0, Ltah;->k:Ljava/lang/Object;

    check-cast p1, Lhd;

    iget-object v0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast p0, Lfw3;

    invoke-static {v0, p0}, Lvtp;->I(Lcom/opera/android/settings/SettingsManager;Lfw3;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1, p0}, Lhd;->x(Ljava/util/List;)V

    :cond_29c
    return-void

    :pswitch_29d
    check-cast p0, Lami;

    iget-object v0, p0, Lami;->h:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2ac

    invoke-virtual {p0}, Lami;->E()V

    :cond_2ac
    return-void

    :pswitch_2ad
    check-cast p0, Lqb7;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    if-ne v0, v2, :cond_2be

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2be

    invoke-virtual {p0}, Lqb7;->z()V

    :cond_2be
    return-void

    :pswitch_2bf
    check-cast p0, Ligi;

    iget-object v0, p0, Ligi;->g:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2ce

    invoke-virtual {p0}, Ligi;->F0()V

    :cond_2ce
    return-void

    :pswitch_2cf
    check-cast p0, Lzw1;

    invoke-virtual {v7, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2e2

    iget-object p1, p0, Lzw1;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2e2

    invoke-virtual {p0}, Lzw1;->a()V

    :cond_2e2
    return-void

    :pswitch_2e3
    check-cast p0, Lyu1;

    const-string v7, "night_mode"

    const-string v8, "app_font"

    const-string v0, "app_theme"

    const-string v1, "app_theme_accent"

    const-string v2, "darken_websites_dark_theme"

    const-string v3, "app_layout"

    const-string v4, "toolbar_disposition_classic"

    const-string v5, "toolbar_disposition_tablet"

    const-string v6, "addressbar_position"

    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_308

    invoke-virtual {p0}, Lyu1;->c()V

    :cond_308
    return-void

    :pswitch_309
    check-cast p0, Lhv0;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    if-ne v0, v4, :cond_31c

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31c

    iget-object p0, p0, Lhv0;->c:Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    :cond_31c
    return-void

    :pswitch_31d
    check-cast p0, Lt9;

    const-string v0, "force_enable_zoom"

    const-string v1, "user_agent"

    const-string v2, "text_wrap"

    const-string v3, "default_webpage_zoom"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_338

    invoke-virtual {p0}, Lt9;->h()V

    :cond_338
    return-void

    nop

    :pswitch_data_33a
    .packed-switch 0x0
        :pswitch_31d
        :pswitch_309
        :pswitch_2e3
        :pswitch_2cf
        :pswitch_2bf
        :pswitch_2ad
        :pswitch_29d
        :pswitch_274
        :pswitch_25a
        :pswitch_248
        :pswitch_227
        :pswitch_219
        :pswitch_1f9
        :pswitch_199
        :pswitch_177
        :pswitch_16f
        :pswitch_161
        :pswitch_154
        :pswitch_148
        :pswitch_138
        :pswitch_12c
        :pswitch_114
        :pswitch_df
        :pswitch_d1
        :pswitch_b1
        :pswitch_a3
        :pswitch_95
        :pswitch_49
        :pswitch_31
    .end packed-switch
.end method
