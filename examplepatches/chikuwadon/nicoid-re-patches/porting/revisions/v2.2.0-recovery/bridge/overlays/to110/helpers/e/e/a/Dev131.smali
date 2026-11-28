.class public final Le/e/a/Dev131;
.super Ljava/lang/Object;
.source "Dev131.java"


# static fields
.field public static final KEY:Ljava/lang/String; = "nicoid_audio_focus_enabled"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyToPlayer(Landroid/view/View;)V
    .registers 9
    .param p0, "video"    # Landroid/view/View;

    .line 59
    if-nez p0, :cond_0

    return-void

    .line 60
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 61
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Le/e/a/Dev131;->enabled(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-static {v0}, Le/e/a/Dev131;->ownedByService(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 63
    .local v1, "handle":Z
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "setHandleAudioFocus"

    new-array v6, v2, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v3

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 64
    .local v4, "setter":Ljava/lang/reflect/Method;
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v5, v2, v3

    invoke-virtual {v4, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    nop

    .end local v4    # "setter":Ljava/lang/reflect/Method;
    goto :goto_1

    .line 65
    :catch_0
    move-exception v2

    .line 66
    .local v2, "error":Ljava/lang/ReflectiveOperationException;
    const-string v3, "nicoid-audio-focus"

    const-string v4, "Video focus option unavailable"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 68
    .end local v2    # "error":Ljava/lang/ReflectiveOperationException;
    :goto_1
    return-void
.end method

.method public static enabled(Landroid/content/Context;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .line 22
    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 23
    const-string v2, "nicoid_audio_focus_enabled"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 22
    :goto_0
    return v0
.end method

.method public static installSettings(Landroid/preference/PreferenceActivity;)V
    .registers 6
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 27
    if-eqz p0, :cond_2

    const-string v0, "nicoid_audio_focus_enabled"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 28
    :cond_0
    const-string v1, "nicoid_content_filter"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 29
    .local v1, "group":Landroid/preference/Preference;
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_1

    return-void

    .line 30
    :cond_1
    new-instance v2, Landroid/preference/CheckBoxPreference;

    invoke-direct {v2, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .line 31
    .local v2, "item":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 32
    const-string v0, "Audio focus"

    const-string/jumbo v3, "\u97f3\u8a0a\u7126\u9ede"

    const-string v4, "\u30aa\u30fc\u30c7\u30a3\u30aa\u30d5\u30a9\u30fc\u30ab\u30b9"

    invoke-static {p0, v4, v0, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 36
    const-string v0, "When on, coordinate audio playback with other apps"

    const-string/jumbo v3, "\u958b\u555f\u5f8c\uff0c\u64ad\u653e\u5f71\u7247\u6642\u6703\u5354\u8abf\u8207\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u7684\u97f3\u8a0a\u64ad\u653e"

    const-string v4, "ON\u306e\u5834\u5408\u3001\u52d5\u753b\u518d\u751f\u6642\u306b\u4ed6\u306e\u30a2\u30d7\u30ea\u3068\u306e\u97f3\u58f0\u518d\u751f\u3092\u8abf\u6574\u3057\u307e\u3059"

    invoke-static {p0, v4, v0, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 40
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 41
    move-object v0, v1

    check-cast v0, Landroid/preference/PreferenceGroup;

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setOrder(I)V

    .line 42
    move-object v0, v1

    check-cast v0, Landroid/preference/PreferenceGroup;

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 43
    return-void

    .line 27
    .end local v1    # "group":Landroid/preference/Preference;
    .end local v2    # "item":Landroid/preference/CheckBoxPreference;
    :cond_2
    :goto_0
    return-void
.end method

.method private static ownedByService(Landroid/content/Context;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .line 47
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    const/4 v1, 0x0

    if-eqz p0, :cond_3

    const/16 v2, 0x8

    if-ge v0, v2, :cond_3

    .line 48
    instance-of v2, p0, Landroid/app/Service;

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    return v1

    .line 49
    :cond_0
    instance-of v2, p0, Landroid/content/ContextWrapper;

    if-nez v2, :cond_1

    return v1

    .line 50
    :cond_1
    move-object v2, p0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    .line 51
    .local v2, "base":Landroid/content/Context;
    if-ne v2, p0, :cond_2

    return v1

    .line 52
    :cond_2
    move-object p0, v2

    .line 47
    .end local v2    # "base":Landroid/content/Context;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 54
    .end local v0    # "n":I
    :cond_3
    return v1
.end method

.method public static requestServiceFocus(Landroid/content/Context;Landroid/media/AudioManager;Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "manager"    # Landroid/media/AudioManager;
    .param p2, "listener"    # Landroid/media/AudioManager$OnAudioFocusChangeListener;
    .param p3, "streamType"    # I
    .param p4, "duration"    # I

    .line 73
    invoke-static {p0}, Le/e/a/Dev131;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    invoke-virtual {p1, p2, p3, p4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v0

    return v0

    .line 74
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method
