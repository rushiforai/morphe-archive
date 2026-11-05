.class final Le/e/a/SettingsTools$VisibilityPreference;
.super Landroid/preference/Preference;
.source "SettingsTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SettingsTools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "VisibilityPreference"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 10
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public setSummary(Ljava/lang/CharSequence;)V
    .registers 6

    .line 10
    invoke-static {p1}, Le/e/a/SettingsTools;->withoutFinalStop(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Le/e/a/SettingsTools$VisibilityPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Choose the playback modes in which controls and the seek bar stay visible"

    const-string v2, "\u9078\u64c7\u6301\u7e8c\u986f\u793a\u64cd\u4f5c\u6309\u9215\u548c\u9032\u5ea6\u689d\u7684\u64ad\u653e\u6a21\u5f0f"

    const-string v3, "\u64cd\u4f5c\u30dc\u30bf\u30f3\u3068\u30b7\u30fc\u30af\u30d0\u30fc\u3092\u5e38\u6642\u8868\u793a\u3059\u308b\u518d\u751f\u30e2\u30fc\u30c9\u3092\u9078\u629e\u3057\u307e\u3059"

    invoke-static {v0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u64cd\u4f5c\u90e8\u306e\u5e38\u6642\u8868\u793a"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    const-string v1, "\uff1a"

    goto :goto_23

    :cond_21
    const-string v1, ": "

    :goto_23
    if-eqz p1, :cond_49

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2c

    goto :goto_49

    :cond_2c
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_33

    goto :goto_4a

    :cond_33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_4a

    :cond_49
    :goto_49
    move-object p1, v0

    :goto_4a
    invoke-super {p0, p1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method
