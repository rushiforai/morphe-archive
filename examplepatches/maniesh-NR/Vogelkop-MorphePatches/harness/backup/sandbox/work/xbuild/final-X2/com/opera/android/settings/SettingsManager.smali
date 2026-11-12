.class public final Lcom/opera/android/settings/SettingsManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lw6f;"
    }
.end annotation


# instance fields
.field public final a:Ly9j;

.field public final b:Le7j;

.field public final c:Landroid/os/Bundle;

.field public final d:Lorg/chromium/base/CommandLine;

.field public final e:Ljava/util/concurrent/CopyOnWriteArraySet;

.field public final f:Lii;

.field public final g:Lcom/opera/android/settings/SystemSettings;

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Ly9j;Landroid/content/Context;Lorg/chromium/base/CommandLine;Lumi;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/opera/android/settings/SettingsManager;->e:Ljava/util/concurrent/CopyOnWriteArraySet;

    new-instance v0, Lii;

    const/16 v1, 0x16

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/settings/SettingsManager;->f:Lii;

    iput-object p1, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-nez v0, :cond_24

    invoke-static {p2}, Lcom/opera/android/utilities/DisplayUtil;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_24

    sget-object v0, Le7j;->c:Le7j;

    goto :goto_26

    :cond_24
    sget-object v0, Le7j;->d:Le7j;

    :goto_26
    iput-object v0, p0, Lcom/opera/android/settings/SettingsManager;->b:Le7j;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "eula_accepted.gdpr"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "version_code"

    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "app_layout"

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "app_icon"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "app_font"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "app_theme"

    const/4 v2, 0x2

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "app_theme_accent"

    const/4 v4, 0x6

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "addressbar_position"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "compression"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "ad_blocking"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "accept_cookies"

    const/4 v4, 0x1

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "startup_mode"

    invoke-static {}, Li0l;->g()Z

    move-result v5

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "javascript"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "image_mode"

    const/4 v5, 0x3

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "user_agent"

    invoke-static {}, Li0l;->g()Z

    move-result v5

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "block_popups"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "tab_disposition"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "tab_auto_grouping"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "text_wrap"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "force_enable_zoom"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "default_webpage_zoom"

    const/16 v5, 0x64

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "installation_id"

    const-string v6, ""

    invoke-virtual {v1, v0, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "welcome_dialog_dismissed"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "turbo_client_id"

    invoke-virtual {v1, v0, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "turbo_suggested_server"

    invoke-virtual {v1, v0, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "obml_text_size"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "obml_single_column_view"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "obml_protocol"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "branding"

    invoke-virtual {v1, v0, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ga_usage_statistics"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "background_sync_permission_defualt"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "periodic_background_sync_permission_default"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "location_permission_defualt"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "notifications_permission_defualt"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "camera_permission_defualt"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "permission_permission_defualt"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-static {p2}, Lcom/opera/android/utilities/DisplayUtil;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_ff

    sget-object v0, Lo7j;->e:Lo7j;

    goto :goto_101

    :cond_ff
    sget-object v0, Lo7j;->c:Lo7j;

    :goto_101
    const-string v7, "enable_reading_mode_as_default"

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-virtual {v1, v7, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-static {p2}, Lcom/opera/android/utilities/DisplayUtil;->a(Landroid/content/Context;)Z

    move-result v0

    xor-int/2addr v0, v4

    const-string v7, "enable_newsfeed"

    invoke-virtual {v1, v7, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "hide_bottombar"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-static {}, Li0l;->g()Z

    move-result v0

    const-string v7, "toolbar_disposition_tablet"

    const-string v8, "toolbar_disposition_classic"

    if-eqz v0, :cond_12a

    invoke-virtual {v1, v8, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v1, v7, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    goto :goto_130

    :cond_12a
    invoke-virtual {v1, v8, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v1, v7, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :goto_130
    const-string v0, "toolbar_bottom_actions"

    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "is_pre_news_user"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "recommendations_language_region"

    invoke-virtual {v1, v0, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v8, 0x7f050010

    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    const-string v8, "speed_dial.large_icons"

    invoke-virtual {v1, v8, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "speed_dial.shape"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "speed_dial.enabled"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "speed_dial.plus_button"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "autocomplete_omnibar"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggested_speed_dials"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggested_speed_dials_on_start_page"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_frequently_visited_sites"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_trending_searches"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_recent_searches"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggestion_provider_clipboard"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggestion_provider_bookmarks"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggestion_provider_history"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggestion_provider_recommendations"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggestion_provider_speeddials"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggestion_provider_ai_prompts"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_suggestion_provider_ai_recent_activity"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    sget-object v0, Lb3c;->b:Lb3c;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const-string v8, "tabui_layout_mode"

    invoke-virtual {v1, v8, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "night_mode"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "night_mode_dimming"

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "night_mode_temperature"

    const/16 v5, 0x12c

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "night_mode_overlay_keyboard"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "night_mode_switch_theme"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "night_mode_schedule"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "night_mode_schedule_start"

    const-wide/32 v8, 0x4b87f00

    invoke-virtual {v1, v0, v8, v9}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "night_mode_schedule_end"

    const-wide/32 v8, 0x1b77400

    invoke-virtual {v1, v0, v8, v9}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "enable_sync"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_google_ai_mode"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "password_manager_autosave"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "external_apps_permission_default"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "camera_pan_tilt_zoom__permission_default"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "protected_media_identifier_permission_default"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "automatic_downloads_permission_default"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "local_network_permission_default"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "show_conflicting_settings_warning"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "wallpaper_current"

    const-string v5, "NETWORK_529"

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "manual_wallpaper_first_occurrence"

    const-wide/16 v8, 0x0

    invoke-virtual {v1, v0, v8, v9}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "automatic_card_save_ask"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "banner_blocker"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "vpn_search_bypass"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "personalized_default"

    const/4 v5, -0x1

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "inside_eea"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "news_is_blocked_by_personalization_change"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "darken_websites"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "darken_websites_dark_theme"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "my_flow_visible"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "collect_website_categories"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "collect_partner_visits"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "process_news_topics"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "process_location"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "exit_dialog_enabled"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    new-instance v0, Lq25;

    invoke-direct {v0, v3}, Lq25;-><init>(B)V

    new-instance v8, Lz25;

    invoke-direct {v8, v3}, Lz25;-><init>(B)V

    new-array v2, v2, [Lr25;

    aput-object v0, v2, v3

    aput-object v8, v2, v4

    invoke-static {v2}, Lz4o;->r([Lr25;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "exit_clear_data_categories"

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "tracker_blocker"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "tab_switch_swipe_gesture_enabled"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "LGE"

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    xor-int/2addr v0, v4

    const-string v2, "main_menu_swipe_gesture_enabled"

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "thumb_scroller_enabled"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "dns_over_https_enabled"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "dns_over_https_mode"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "dns_over_https_custom_server_template"

    invoke-virtual {v1, v0, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "enable_start_page_customize_button"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_start_page_opera_logo"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_continue_booking"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_search_shortcuts"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_search_shortcuts_tablet"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_weather"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    sget-object v0, Lz4m;->b:Lz4m;

    const-string v0, "translation_source"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "translate_web_pages_enabled"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "translate_web_pages_backup_translation_method_enabled"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "safe_browsing_enabled"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "live_scores_enabled"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "live_scores_odds_enabled"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "page_menu_show_open_in_external_app"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "ai_assistant_menu_shortcut"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "wallpaper_rotation_category"

    const-string v2, "most_popular"

    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "wallpaper_rotation_enabled"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "lock_password_manager"

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "ai_assistant_ask_aria"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "has_waited_for_startup_dependencies"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "vpn_pro_in_app_notification"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "wallpaper_in_app_notification"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "feedback_in_app_notification"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "product_and_service_in_app_notification"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "feature_tips_notification"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "rewards_notifications"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "esim_notifications"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "ongoing_installation_location_reset"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "ask_before_downloading"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "concurrent_downloads"

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "ad_blocking_mode"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "ad_blocking_mode.selected_custom_lists"

    invoke-virtual {v1, v0, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "onboarding_deleted"

    invoke-virtual {v1, v0, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_rewards"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "media_background_play"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_product_suggestion"

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "reader_mode_zoom_level"

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "reader_mode_text_wrap"

    invoke-virtual {v1, v0, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    iput-object p3, p0, Lcom/opera/android/settings/SettingsManager;->d:Lorg/chromium/base/CommandLine;

    new-instance p3, Lcom/opera/android/settings/SystemSettings;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-direct {p3, p2, p4}, Lcom/opera/android/settings/SystemSettings;-><init>(Landroid/content/ContentResolver;Lumi;)V

    iput-object p3, p0, Lcom/opera/android/settings/SettingsManager;->g:Lcom/opera/android/settings/SystemSettings;

    new-instance p2, Lezg;

    invoke-direct {p2, p0, v4}, Lezg;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, p2}, Ly9j;->a(Lezg;)V

    return-void
.end method

.method public static B(Lne6;)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "sync_data_type_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lne6;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static K(Llag;)Z
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x2

    if-eq p0, v0, :cond_c

    const/4 v0, 0x3

    if-eq p0, v0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    const/4 p0, 0x1

    return p0
.end method

.method public static S(Llag;)Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_22

    const/4 p0, 0x0

    return-object p0

    :pswitch_9
    const-string p0, "local_network_permission_default"

    return-object p0

    :pswitch_c
    const-string p0, "automatic_downloads_permission_default"

    return-object p0

    :pswitch_f
    const-string p0, "external_apps_permission_default"

    return-object p0

    :pswitch_12
    const-string p0, "camera_permission_defualt"

    return-object p0

    :pswitch_15
    const-string p0, "permission_permission_defualt"

    return-object p0

    :pswitch_18
    const-string p0, "protected_media_identifier_permission_default"

    return-object p0

    :pswitch_1b
    const-string p0, "location_permission_defualt"

    return-object p0

    :pswitch_1e
    const-string p0, "notifications_permission_defualt"

    return-object p0

    nop

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
        :pswitch_9
    .end packed-switch
.end method

.method public static o(Z)Landroid/net/Uri;
    .registers 5

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-static {v2}, Lorg/chromium/base/PathUtils;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    const-string v3, "saved_pages"

    invoke-static {v1, v2, v3}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    if-eqz p0, :cond_27

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_27

    sget-object p0, Ls29;->a:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_27
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final A(Lxnh;)Z
    .registers 3

    const-string v0, "enable_suggested_speed_dials_on_start_page"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_18

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/high16 p1, 0x8000000

    invoke-virtual {p0, p1}, Lwnh;->a(I)Z

    move-result p0

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public final C()Lq7j;
    .registers 3

    invoke-static {}, Lq7j;->values()[Lq7j;

    move-result-object v0

    const-string v1, "tab_disposition"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public final D(Le7j;)Lr7j;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_15

    const/4 v0, 0x1

    if-ne p1, v0, :cond_10

    const-string p1, "toolbar_disposition_tablet"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    goto :goto_1b

    :cond_10
    invoke-static {}, Lh9o;->e()V

    const/4 p0, 0x0

    return-object p0

    :cond_15
    const-string p1, "toolbar_disposition_classic"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    :goto_1b
    invoke-static {}, Lr7j;->values()[Lr7j;

    move-result-object p1

    aget-object p0, p1, p0

    return-object p0
.end method

.method public final E()Lz4m;
    .registers 2

    const-string v0, "translation_source"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    invoke-static {}, Lz4m;->values()[Lz4m;

    move-result-object v0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lp5j;

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public final G()Z
    .registers 3

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v0, "inside_eea"

    const/4 v1, -0x1

    invoke-interface {p0, v0, v1}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-eq p0, v1, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lp5j;

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method

.method public final I()Z
    .registers 3

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v0, "personalized_default"

    const/4 v1, -0x1

    invoke-interface {p0, v0, v1}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-eq p0, v1, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public final J()Z
    .registers 2

    const-string v0, "version_code"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final M()Z
    .registers 2

    const-string v0, "personalized_news"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, "process_news_topics"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final N()Z
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v0

    if-nez v0, :cond_13

    const-string v0, "version_code"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    const v0, 0x71de74d2

    if-eq p0, v0, :cond_13

    const/4 p0, 0x1

    return p0

    :cond_13
    const/4 p0, 0x0

    return p0
.end method

.method public final O()Z
    .registers 3

    const-string v0, "offline_pages_location"

    const/4 v1, 0x0

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p0, v0, v1}, Ly9j;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_13

    const/4 p0, 0x1

    return p0

    :cond_13
    const/4 p0, 0x0

    return p0
.end method

.method public final P(Lnzk;)Z
    .registers 4

    sget-object v0, Lowe;->c:Lowe;

    iget-object v0, v0, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_13

    const-string v0, "night_mode_switch_theme"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_30

    :cond_13
    const-string v0, "app_theme"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    invoke-static {}, Lf7j;->values()[Lf7j;

    move-result-object v0

    aget-object p0, v0, p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eq p0, v1, :cond_30

    const/4 v0, 0x2

    if-ne p0, v0, :cond_2e

    if-eqz p1, :cond_2e

    iget-boolean p0, p1, Lnzk;->a:Z

    if-nez p0, :cond_30

    :cond_2e
    const/4 p0, 0x0

    return p0

    :cond_30
    return v1
.end method

.method public final Q(Ljava/lang/String;)V
    .registers 3

    new-instance v0, Lq5j;

    invoke-direct {v0, p0, p1}, Lq5j;-><init>(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;)V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->e:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lp5j;

    invoke-interface {v0, p1}, Lp5j;->M(Ljava/lang/String;)V

    goto :goto_e

    :cond_1e
    return-void
.end method

.method public final R(ILjava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p0, p1, v0, p2}, Ly9j;->o(IILjava/lang/String;)V

    return-void
.end method

.method public final T(Lp5j;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->e:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final U(Lg7j;Z)V
    .registers 4

    const-string v0, "app_theme_accent"

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    if-eqz p2, :cond_11

    const-string p1, "app_theme_accent_changed_by_user"

    const/4 p2, 0x1

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_11
    return-void
.end method

.method public final V(ILjava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p0, p1, v0, p2}, Ly9j;->q(IILjava/lang/String;)V

    return-void
.end method

.method public final W(JLjava/lang/String;)V
    .registers 13

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, p3, v1, v2}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    iget-object v3, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    move-wide v4, p1

    move-object v8, p3

    invoke-interface/range {v3 .. v8}, Ly9j;->i(JJLjava/lang/String;)V

    return-void
.end method

.method public final X(I)V
    .registers 7

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v0, 0x0

    const-string v1, "night_mode_schedule"

    const-string v2, "night_mode"

    const/4 v3, 0x1

    if-eqz p1, :cond_27

    if-eq p1, v3, :cond_23

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1c

    const/4 v4, 0x3

    if-eq p1, v4, :cond_15

    return-void

    :cond_15
    invoke-virtual {p0, v3, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :cond_1c
    invoke-virtual {p0, v3, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0, v3, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :cond_23
    invoke-virtual {p0, v0, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :cond_27
    invoke-virtual {p0, v3, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method

.method public final Y(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p0, p1, p2, v0}, Ly9j;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final Z()Z
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object p0

    sget-object v0, Le7j;->d:Le7j;

    if-ne p0, v0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final a(Lp5j;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->e:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()La7j;
    .registers 6

    const-string v0, "ad_blocking_mode"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    invoke-static {}, La7j;->values()[La7j;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v1, :cond_1a

    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-ne v4, p0, :cond_17

    return-object v3

    :cond_17
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_1a
    sget-object p0, La7j;->a:La7j;

    return-object p0
.end method

.method public final c()Lb7j;
    .registers 3

    invoke-static {}, Lb7j;->values()[Lb7j;

    move-result-object v0

    const-string v1, "addressbar_position"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public final e()Ld7j;
    .registers 2

    const-string v0, "app_icon"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ld7j;->d(I)Ld7j;

    move-result-object p0

    return-object p0
.end method

.method public final f()Le7j;
    .registers 3

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->d:Lorg/chromium/base/CommandLine;

    const-string v1, "force-tablet-ui"

    invoke-virtual {v0, v1}, Lorg/chromium/base/CommandLine;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object p0, Le7j;->d:Le7j;

    return-object p0

    :cond_d
    const-string v0, "app_layout"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_23

    invoke-static {}, Le7j;->values()[Le7j;

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_23

    invoke-static {}, Le7j;->values()[Le7j;

    move-result-object p0

    aget-object p0, p0, v0

    return-object p0

    :cond_23
    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->b:Le7j;

    return-object p0
.end method

.method public final g()Lg7j;
    .registers 2

    const-string v0, "app_theme_accent"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    invoke-static {}, Lg7j;->values()[Lg7j;

    move-result-object v0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public final getAdBlocking()Z
    .registers 2

    const-string v0, "ad_blocking"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getBlockPopupsInt()I
    .registers 2

    const-string v0, "block_popups"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public final getCompression()Z
    .registers 2

    const-string v0, "compression"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getCookiesInt()I
    .registers 3

    const-string v0, "accept_cookies"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    iget-boolean p0, p0, Lcom/opera/android/settings/SettingsManager;->i:Z

    if-eqz p0, :cond_f

    const/4 p0, 0x2

    return p0

    :cond_f
    return v0
.end method

.method public final getDefaultWebpageZoom()I
    .registers 2

    const-string v0, "default_webpage_zoom"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public final getForceEnableZoom()Z
    .registers 2

    const-string v0, "force_enable_zoom"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getJavaScript()Z
    .registers 2

    const-string v0, "javascript"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getMediaBackgroundPlay()Z
    .registers 2

    const-string v0, "media_background_play"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getPersonalizedAds()Z
    .registers 2

    const-string v0, "personalized_ads"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getReaderModeTextWrap()Ljava/lang/Boolean;
    .registers 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const-string v0, "reader_mode_text_wrap"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_b

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_b
    if-lez p0, :cond_10

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_10
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getReaderModeZoomLevel()Ljava/lang/Integer;
    .registers 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const-string v0, "reader_mode_zoom_level"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    const/4 v0, -0x1

    if-ne p0, v0, :cond_b

    const/4 p0, 0x0

    return-object p0

    :cond_b
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final getSafeBrowsingEnabled()Z
    .registers 2

    const-string v0, "safe_browsing_enabled"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_20

    sget-object p0, Lt8;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    invoke-static {p0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/16 v0, 0x2000

    invoke-virtual {p0, v0}, Lwnh;->b(I)Z

    move-result p0

    if-eqz p0, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public final getSendUsageStatistics()Z
    .registers 2

    const-string v0, "ga_usage_statistics"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getTextWrap()Z
    .registers 2

    const-string v0, "text_wrap"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final getTurboClientId()Ljava/lang/String;
    .registers 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const-string v0, "turbo_client_id"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTurboDeviceId()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object p0
.end method

.method public final getTurboImageQualityMode()I
    .registers 4

    const-string v0, "image_mode"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eq p0, v1, :cond_17

    const/4 v2, 0x3

    if-eq p0, v0, :cond_16

    const/4 v0, 0x4

    if-eq p0, v2, :cond_15

    if-eq p0, v0, :cond_13

    return v1

    :cond_13
    const/4 p0, 0x5

    return p0

    :cond_15
    return v0

    :cond_16
    return v2

    :cond_17
    return v0
.end method

.method public final getTurboSuggestedServer()Ljava/lang/String;
    .registers 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const-string v0, "turbo_suggested_server"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getUseDesktopUserAgent()Z
    .registers 2

    const-string v0, "user_agent"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_a

    return v0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final h()Z
    .registers 2

    const-string v0, "ad_blocking"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, "banner_blocker"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final hasDarkThemedUi()Z
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->P(Lnzk;)Z

    move-result p0

    return p0
.end method

.method public final i(Ljava/lang/String;)Z
    .registers 2

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final j(Ljava/lang/String;)Lh7j;
    .registers 4

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v0, p1}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    sget-object v0, Lop0;->d:Lop0;

    goto :goto_16

    :cond_b
    invoke-interface {v0, p1}, Ly9j;->d(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    sget-object v0, Lop0;->c:Lop0;

    goto :goto_16

    :cond_14
    sget-object v0, Lop0;->b:Lop0;

    :goto_16
    new-instance v1, Lh7j;

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-direct {v1, p0, v0}, Lh7j;-><init>(ZLop0;)V

    return-object v1
.end method

.method public final k(Llag;)Lkag;
    .registers 4

    invoke-static {p1}, Lcom/opera/android/settings/SettingsManager;->S(Llag;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    goto :goto_c

    :cond_b
    const/4 p0, -0x1

    :goto_c
    const/4 v0, 0x2

    sget-object v1, Lkag;->d:Lkag;

    if-ne p0, v0, :cond_12

    return-object v1

    :cond_12
    if-nez p0, :cond_1e

    invoke-static {p1}, Lcom/opera/android/settings/SettingsManager;->K(Llag;)Z

    move-result p0

    if-nez p0, :cond_1b

    return-object v1

    :cond_1b
    sget-object p0, Lkag;->b:Lkag;

    return-object p0

    :cond_1e
    sget-object p0, Lkag;->c:Lkag;

    return-object p0
.end method

.method public final l()Ll7j;
    .registers 2

    const-string v0, "dns_over_https_mode"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    invoke-static {}, Ll7j;->values()[Ll7j;

    move-result-object v0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public final m()Landroid/net/Uri;
    .registers 4

    const-string v0, "downloads_location"

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v2, v0, v1}, Ly9j;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_10
    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->f:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public final n(Ljava/lang/String;)I
    .registers 4

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p0, p1, v0}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public final p()Ln7j;
    .registers 6

    const-string v0, "lock_password_manager"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    invoke-static {}, Ln7j;->values()[Ln7j;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v1, :cond_17

    aget-object v3, v0, v2

    iget v4, v3, Ln7j;->d:I

    if-eq v4, p0, :cond_18

    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_17
    const/4 v3, 0x0

    :cond_18
    if-nez v3, :cond_1d

    sget-object p0, Ln7j;->e:Ln7j;

    return-object p0

    :cond_1d
    return-object v3
.end method

.method public final q(Ljava/lang/String;)J
    .registers 5

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p0, p1, v0, v1}, Ly9j;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public final r(Lbf9;)Z
    .registers 3

    const-string v0, "my_flow_visible"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {p1}, Lbf9;->t()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {p1}, Lbf9;->r()I

    move-result p0

    const/4 p1, 0x2

    if-lt p0, p1, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    const/4 p0, 0x0

    return p0
.end method

.method public final s()I
    .registers 3

    const-string v0, "night_mode"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_19

    const-string v0, "night_mode_schedule"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_17

    if-eq p0, v1, :cond_15

    return v0

    :cond_15
    const/4 p0, 0x4

    return p0

    :cond_17
    const/4 p0, 0x3

    return p0

    :cond_19
    return v1
.end method

.method public final setTurboClientId(Ljava/lang/String;)V
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-string v0, "turbo_client_id"

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final setTurboSuggestedServer(Ljava/lang/String;)V
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-string v0, "turbo_suggested_server"

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final shouldDetectLanguageAutomatically()Z
    .registers 2

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, "translate_web_pages_enabled"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final t(Z)Landroid/net/Uri;
    .registers 5

    const-string v0, "offline_pages_location"

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v2, v0, v1}, Ly9j;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_16

    invoke-static {p1}, Lcom/opera/android/settings/SettingsManager;->o(Z)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_16
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_1b
    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->f:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    const-string v1, "Offline pages"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, p1}, Ls29;->f(Ljava/io/File;Z)Ljava/io/File;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public final u(Ljava/lang/String;)Z
    .registers 5

    const-string v0, "personalized_default"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_c

    move v0, v2

    goto :goto_d

    :cond_c
    move v0, v1

    :goto_d
    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p0, p1, v0}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-eqz p0, :cond_16

    return v2

    :cond_16
    return v1
.end method

.method public final v()Ll0c;
    .registers 4

    const-string v0, "recommendations_language_region"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_15

    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    :cond_15
    const/4 p0, 0x0

    return-object p0

    :cond_17
    new-instance v1, Ll0c;

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, v2, p0}, Ll0c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public final x()Lp7j;
    .registers 3

    invoke-static {}, Lp7j;->values()[Lp7j;

    move-result-object v0

    const-string v1, "speed_dial.shape"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public final y()I
    .registers 3

    const/4 v0, 0x3

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v0

    const-string v1, "startup_mode"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p0

    aget p0, v0, p0

    return p0
.end method

.method public final z(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    const-string v0, ""

    :cond_a
    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {p0, p1, v0}, Ly9j;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
