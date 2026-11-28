.class final Le/e/a/AmbientSettings$Entry;
.super Landroid/preference/Preference;
.source "AmbientSettings.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/AmbientSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation


# instance fields
.field private final prefs:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/SharedPreferences;)V
    .registers 3

    .line 58
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 59
    iput-object p2, p0, Le/e/a/AmbientSettings$Entry;->prefs:Landroid/content/SharedPreferences;

    const/4 p1, 0x0

    .line 60
    invoke-virtual {p0, p1}, Le/e/a/AmbientSettings$Entry;->setPersistent(Z)V

    .line 61
    invoke-virtual {p0}, Le/e/a/AmbientSettings$Entry;->summary()V

    .line 62
    invoke-interface {p2, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    if-eqz p2, :cond_0

    .line 70
    const-string p1, "nicoid_ambient_enabled"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Le/e/a/AmbientSettings$Entry;->summary()V

    return-void
.end method

.method summary()V
    .registers 6

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/AmbientSettings$Entry;->prefs:Landroid/content/SharedPreferences;

    invoke-static {v1}, Le/e/a/AmbientLight;->enabled(Landroid/content/SharedPreferences;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ON"

    goto :goto_0

    :cond_0
    const-string v1, "OFF"

    :goto_0
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Le/e/a/AmbientSettings$Entry;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 67
    const-string v2, ": Softly lights the area around the video using its colors."

    const-string/jumbo v3, "\uff1a\u4f9d\u5f71\u7247\u8272\u5f69\u67d4\u548c\u7167\u4eae\u5f71\u7247\u5468\u570d"

    .line 66
    const-string/jumbo v4, "\uff1a\u52d5\u753b\u306e\u8272\u306b\u5408\u308f\u305b\u3066\u3001\u6620\u50cf\u306e\u5468\u308a\u3092\u3084\u308f\u3089\u304b\u304f\u7167\u3089\u3057\u307e\u3059"

    invoke-static {v1, v4, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Le/e/a/AmbientSettings$Entry;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method
