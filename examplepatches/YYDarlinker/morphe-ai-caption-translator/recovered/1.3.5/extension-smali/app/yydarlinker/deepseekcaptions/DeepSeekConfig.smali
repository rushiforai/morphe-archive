.class final Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;
.super Ljava/lang/Object;
.source "DeepSeekConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;
    }
.end annotation


# static fields
.field private static final BACKGROUND_OPACITY:Ljava/lang/String; = "background_opacity"

.field private static final BASE_URL:Ljava/lang/String; = "base_url"

.field private static final CAPTION_TEXT_SIZE:Ljava/lang/String; = "caption_text_size"

.field private static final CONTEXTUAL_UNIT_CORE:Ljava/lang/String; = "contextual_unit_core"

.field static final DEFAULT_BACKGROUND_OPACITY:I = 0x46

.field static final DEFAULT_BASE_URL:Ljava/lang/String; = "https://api.deepseek.com"

.field static final DEFAULT_CAPTION_TEXT_SIZE:I = 0xd

.field static final DEFAULT_CONTEXTUAL_UNIT_CORE:Z = true

.field static final DEFAULT_DISPLAY_TEXT_DEBUG:Z = false

.field static final DEFAULT_MODEL:Ljava/lang/String; = "deepseek-v4-flash"

.field static final DEFAULT_PROMPT:Ljava/lang/String; = "\u5fe0\u5b9e\u3001\u81ea\u7136\u3001\u7b80\u6d01\uff1b\u4f18\u5148\u7b26\u5408\u76ee\u6807\u8bed\u8a00\u7684\u6bcd\u8bed\u8868\u8fbe\u4e60\u60ef\uff1b\u4fdd\u7559\u4eba\u540d\u3001\u4e13\u6709\u540d\u8bcd\u3001\u6570\u5b57\u3001\u8bed\u6c14\u548c\u5fc5\u8981\u7684\u6807\u70b9\uff1b\u4e0d\u8981\u589e\u52a0\u539f\u6587\u6ca1\u6709\u7684\u89e3\u91ca\u3002"

.field private static final DISPLAY_TEXT_DEBUG:Ljava/lang/String; = "display_text_debug"

.field private static final ENABLED:Ljava/lang/String; = "enabled"

.field private static final LEGACY_CHINESE_PROMPT:Ljava/lang/String; = "\u5fe0\u5b9e\u3001\u81ea\u7136\u3001\u7b80\u6d01\u5730\u7ffb\u8bd1\u6210\u7b80\u4f53\u4e2d\u6587\uff1b\u4f18\u5148\u7b26\u5408\u4e2d\u6587\u8868\u8fbe\u4e60\u60ef\uff1b\u4fdd\u7559\u4eba\u540d\u3001\u4e13\u6709\u540d\u8bcd\u3001\u6570\u5b57\u3001\u8bed\u6c14\u548c\u5fc5\u8981\u7684\u6807\u70b9\uff1b\u4e0d\u8981\u589e\u52a0\u539f\u6587\u6ca1\u6709\u7684\u89e3\u91ca\u3002"

.field static final MAX_CAPTION_TEXT_SIZE:I = 0xf

.field static final MIN_CAPTION_TEXT_SIZE:I = 0x8

.field private static final MODEL:Ljava/lang/String; = "model"

.field private static final POSITION_LANDSCAPE_Y:Ljava/lang/String; = "position_landscape_y"

.field private static final POSITION_PORTRAIT_Y:Ljava/lang/String; = "position_portrait_y"

.field private static final PREFS:Ljava/lang/String; = "deepseek_caption_translator"

.field private static final PROMPT:Ljava/lang/String; = "prompt"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static captionPositionY(Landroid/content/Context;Z)F
    .registers 3

    if-eqz p1, :cond_5

    .line 158
    const-string v0, "position_landscape_y"

    goto :goto_7

    :cond_5
    const-string v0, "position_portrait_y"

    .line 159
    :goto_7
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    if-eqz p1, :cond_11

    const p1, 0x3f4ccccd    # 0.8f

    goto :goto_14

    :cond_11
    const p1, 0x3f51eb85    # 0.82f

    :goto_14
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampPosition(F)F

    move-result p0

    return p0
.end method

.method private static clampOpacity(I)I
    .registers 2

    const/16 v0, 0x64

    .line 154
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static clampPosition(F)F
    .registers 2

    .line 187
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-static {p0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_1c

    :cond_d
    const v0, 0x3f75c28f    # 0.96f

    .line 188
    invoke-static {v0, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const v0, 0x3d23d70a    # 0.04f

    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0

    :cond_1c
    :goto_1c
    const/high16 p0, 0x3f000000    # 0.5f

    return p0
.end method

.method private static clampTextSize(I)I
    .registers 2

    const/16 v0, 0xf

    .line 150
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/16 v0, 0x8

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method static contextualUnitCoreEnabled(Landroid/content/Context;)Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method static defaultPrompt(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    .line 107
    const-string v0, "default_prompt"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static defaultTargetLanguage(Landroid/content/Context;)Ljava/lang/String;
    .registers 1

    .line 130
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->language()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_11
    const-string p0, ""

    return-object p0
.end method

.method static displayStyle(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;
    .registers 9

    .line 46
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 47
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    const-string v1, "enabled"

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const-string v2, "caption_text_size"

    const/16 v3, 0xd

    .line 48
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampTextSize(I)I

    move-result v5

    const-string v2, "background_opacity"

    const/16 v3, 0x46

    .line 49
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampOpacity(I)I

    move-result v6

    const-string v7, ""

    const-string v2, ""

    const-string v3, ""

    const-string v4, ""

    invoke-direct/range {v0 .. v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    return-object v0
.end method

.method static displayTextDebugEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 84
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "display_text_debug"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static enabled(Landroid/content/Context;)Z
    .registers 3

    .line 44
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "enabled"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static flyoutMenuEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 42
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "flyout_menu"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static hasCaptionPosition(Landroid/content/Context;Z)Z
    .registers 2

    .line 163
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    if-eqz p1, :cond_9

    .line 164
    const-string p1, "position_landscape_y"

    goto :goto_b

    :cond_9
    const-string p1, "position_portrait_y"

    .line 165
    :goto_b
    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static hasShortsPosition(Landroid/content/Context;)Z
    .registers 2

    .line 176
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "shorts_y"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static isReady(Landroid/content/Context;)Z
    .registers 1

    .line 134
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object p0

    .line 135
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->ready()Z

    move-result p0

    return p0
.end method

.method static load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;
    .registers 13

    .line 52
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 53
    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 54
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 55
    const-string v3, "prompt"

    const-string v4, ""

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2f

    .line 57
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2f

    const-string v4, "\u5fe0\u5b9e\u3001\u81ea\u7136\u3001\u7b80\u6d01\u5730\u7ffb\u8bd1\u6210\u7b80\u4f53\u4e2d\u6587\uff1b\u4f18\u5148\u7b26\u5408\u4e2d\u6587\u8868\u8fbe\u4e60\u60ef\uff1b\u4fdd\u7559\u4eba\u540d\u3001\u4e13\u6709\u540d\u8bcd\u3001\u6570\u5b57\u3001\u8bed\u6c14\u548c\u5fc5\u8981\u7684\u6807\u70b9\uff1b\u4e0d\u8981\u589e\u52a0\u539f\u6587\u6ca1\u6709\u7684\u89e3\u91ca\u3002"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2f

    const-string v4, "\u5fe0\u5b9e\u3001\u81ea\u7136\u3001\u7b80\u6d01\uff1b\u4f18\u5148\u7b26\u5408\u76ee\u6807\u8bed\u8a00\u7684\u6bcd\u8bed\u8868\u8fbe\u4e60\u60ef\uff1b\u4fdd\u7559\u4eba\u540d\u3001\u4e13\u6709\u540d\u8bcd\u3001\u6570\u5b57\u3001\u8bed\u6c14\u548c\u5fc5\u8981\u7684\u6807\u70b9\uff1b\u4e0d\u8981\u589e\u52a0\u539f\u6587\u6ca1\u6709\u7684\u89e3\u91ca\u3002"

    .line 58
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    :cond_2f
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultPrompt(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    :cond_33
    move-object v8, v3

    .line 59
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    const-string v3, "enabled"

    const/4 v5, 0x0

    .line 60
    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    const-string v3, "base_url"

    const-string v6, "https://api.deepseek.com"

    .line 61
    invoke-interface {v0, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "https://api.deepseek.com"

    invoke-static {v3, v6}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->safe(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v3, "model"

    const-string v7, "deepseek-v4-flash"

    .line 62
    invoke-interface {v0, v3, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "caption_text_size"

    const/16 v3, 0xd

    .line 64
    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampTextSize(I)I

    move-result v9

    const-string v0, "background_opacity"

    const/16 v3, 0x46

    .line 65
    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampOpacity(I)I

    move-result v10

    .line 66
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->load(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    invoke-direct/range {v4 .. v11}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    monitor-exit v1

    return-object v4

    :catchall_74
    move-exception v0

    move-object p0, v0

    .line 68
    monitor-exit v1
    :try_end_77
    .catchall {:try_start_3 .. :try_end_77} :catchall_74

    throw p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 36
    const-string v0, "deepseek_caption_translator"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static resetCaptionPositions(Landroid/content/Context;)V
    .registers 2

    .line 179
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "shorts_y"

    .line 180
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "position_portrait_y"

    .line 181
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "position_landscape_y"

    .line 182
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 183
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private static safe(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    if-eqz p0, :cond_12

    .line 146
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_12

    :cond_d
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_12
    :goto_12
    return-object p1
.end method

.method static saveBackgroundOpacity(Landroid/content/Context;I)V
    .registers 3

    .line 126
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "background_opacity"

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampOpacity(I)I

    move-result p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static saveBaseUrl(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    if-nez p1, :cond_5

    .line 93
    const-string p1, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 94
    :goto_9
    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_22

    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    goto :goto_22

    .line 95
    :cond_1a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "API \u5730\u5740\u5fc5\u987b\u4ee5 https:// \u6216 http:// \u5f00\u5934"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 97
    :cond_22
    :goto_22
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_25
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/ProviderEndpoint;->validate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->bindLegacyOrigin(Landroid/content/Context;)V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "base_url"

    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v0

    return-void

    :catchall_3f
    move-exception p0

    monitor-exit v0
    :try_end_41
    .catchall {:try_start_25 .. :try_end_41} :catchall_3f

    throw p0
.end method

.method static saveCaptionPosition(Landroid/content/Context;ZF)V
    .registers 3

    if-eqz p1, :cond_5

    .line 169
    const-string p1, "position_landscape_y"

    goto :goto_7

    :cond_5
    const-string p1, "position_portrait_y"

    .line 170
    :goto_7
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 171
    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampPosition(F)F

    move-result p2

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 172
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static saveCaptionTextSize(Landroid/content/Context;I)V
    .registers 3

    .line 122
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "caption_text_size"

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampTextSize(I)I

    move-result p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static saveContextualUnitCoreEnabled(Landroid/content/Context;Z)V
    .registers 3

    .line 80
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "contextual_unit_core"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static saveDisplayTextDebugEnabled(Landroid/content/Context;Z)V
    .registers 4

    .line 88
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "display_text_debug"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-nez p1, :cond_16

    .line 89
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionQualityTrace;->clear(Landroid/content/Context;)V

    :cond_16
    return-void
.end method

.method static saveEnabled(Landroid/content/Context;Z)V
    .registers 3

    .line 72
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "enabled"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static saveFlyoutMenuEnabled(Landroid/content/Context;Z)V
    .registers 3

    .line 43
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "flyout_menu"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static saveModel(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    if-nez p1, :cond_5

    .line 101
    const-string p1, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 102
    :goto_9
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_28

    .line 103
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_12
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "model"

    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v0

    return-void

    :catchall_25
    move-exception p0

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_12 .. :try_end_27} :catchall_25

    throw p0

    .line 102
    :cond_28
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u6a21\u578b\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static savePrompt(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    if-nez p1, :cond_5

    .line 111
    const-string p1, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 112
    :goto_9
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 113
    :try_start_c
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 114
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3b

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultPrompt(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b

    const-string p0, "\u5fe0\u5b9e\u3001\u81ea\u7136\u3001\u7b80\u6d01\uff1b\u4f18\u5148\u7b26\u5408\u76ee\u6807\u8bed\u8a00\u7684\u6bcd\u8bed\u8868\u8fbe\u4e60\u60ef\uff1b\u4fdd\u7559\u4eba\u540d\u3001\u4e13\u6709\u540d\u8bcd\u3001\u6570\u5b57\u3001\u8bed\u6c14\u548c\u5fc5\u8981\u7684\u6807\u70b9\uff1b\u4e0d\u8981\u589e\u52a0\u539f\u6587\u6ca1\u6709\u7684\u89e3\u91ca\u3002"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b

    const-string p0, "\u5fe0\u5b9e\u3001\u81ea\u7136\u3001\u7b80\u6d01\u5730\u7ffb\u8bd1\u6210\u7b80\u4f53\u4e2d\u6587\uff1b\u4f18\u5148\u7b26\u5408\u4e2d\u6587\u8868\u8fbe\u4e60\u60ef\uff1b\u4fdd\u7559\u4eba\u540d\u3001\u4e13\u6709\u540d\u8bcd\u3001\u6570\u5b57\u3001\u8bed\u6c14\u548c\u5fc5\u8981\u7684\u6807\u70b9\uff1b\u4e0d\u8981\u589e\u52a0\u539f\u6587\u6ca1\u6709\u7684\u89e3\u91ca\u3002"

    .line 115
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_35

    goto :goto_3b

    .line 116
    :cond_35
    const-string p0, "prompt"

    invoke-interface {v1, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_40

    .line 115
    :cond_3b
    :goto_3b
    const-string p0, "prompt"

    invoke-interface {v1, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 117
    :goto_40
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 118
    monitor-exit v0

    return-void

    :catchall_45
    move-exception p0

    monitor-exit v0
    :try_end_47
    .catchall {:try_start_c .. :try_end_47} :catchall_45

    throw p0
.end method

.method static saveShortsFlyoutMenuEnabled(Landroid/content/Context;Z)V
    .registers 3

    .line 41
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "shorts_flyout_menu"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static saveShortsPosition(Landroid/content/Context;F)V
    .registers 3

    .line 177
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "shorts_y"

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampPosition(F)F

    move-result p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static shortsFlyoutMenuEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 40
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "shorts_flyout_menu"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static shortsPosition(Landroid/content/Context;)F
    .registers 3

    .line 175
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "shorts_y"

    const v1, 0x3f3851ec    # 0.72f

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->clampPosition(F)F

    move-result p0

    return p0
.end method

.method static statusSummary(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .line 139
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object p0

    .line 140
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-nez v0, :cond_b

    const-string p0, "\u672a\u542f\u7528 \u00b7 \u70b9\u51fb\u914d\u7f6e\u7ffb\u8bd1 API"

    return-object p0

    .line 141
    :cond_b
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_16

    const-string p0, "\u5df2\u542f\u7528\uff0c\u4f46\u5c1a\u672a\u586b\u5199 API Key"

    return-object p0

    .line 142
    :cond_16
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u5df2\u542f\u7528 \u00b7 "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->model:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " \u00b7 \u591a\u8bed\u8a00\u52a8\u6001 AI \u5b57\u5e55"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
