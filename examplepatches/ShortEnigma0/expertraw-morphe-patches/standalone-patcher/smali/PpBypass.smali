.class public final Lcom/samsung/android/app/galaxyraw/mod/PpBypass;
.super Ljava/lang/Object;
.source "PpBypass.java"


# static fields
.field public static final KEY:Ljava/lang/String; = "disable_post_processing"

.field public static final PREFS:Ljava/lang/String; = "graw_mod_prefs"

.field public static final TAG:Ljava/lang/String; = "GrawMod"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static forceSingleFrame(Landroid/content/Context;)Z
    .registers 2

    .line 40
    invoke-static {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->isEnabled(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return p0

    .line 41
    :cond_8
    const-string p0, "GrawMod"

    const-string v0, "post-processing bypass ON: forcing single-frame capture (no multi-frame merge)"

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    const/4 p0, 0x1

    return p0
.end method

.method public static isEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 23
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 25
    :cond_4
    :try_start_4
    const-string v1, "graw_mod_prefs"

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "disable_post_processing"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0
    :try_end_10
    .catchall {:try_start_4 .. :try_end_10} :catchall_11

    return p0

    .line 26
    :catchall_11
    move-exception p0

    .line 27
    return v0
.end method

.method public static safeCutout(Landroid/app/SemActivityTaskManager;ILjava/lang/String;)I
    .registers 3

    .line 48
    :try_start_0
    invoke-virtual {p0, p1, p2}, Landroid/app/SemActivityTaskManager;->getCameraCutoutSetting(ILjava/lang/String;)I

    move-result p0
    :try_end_4
    .catchall {:try_start_0 .. :try_end_4} :catchall_5

    return p0

    .line 49
    :catchall_5
    move-exception p0

    .line 50
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "getCameraCutoutSetting denied: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "GrawMod"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    const/4 p0, 0x0

    return p0
.end method

.method public static set(Landroid/content/Context;Z)V
    .registers 4

    .line 32
    if-nez p0, :cond_3

    return-void

    .line 33
    :cond_3
    const-string v0, "graw_mod_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 34
    const-string v0, "disable_post_processing"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 35
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "disable_post_processing set to "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "GrawMod"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    return-void
.end method
