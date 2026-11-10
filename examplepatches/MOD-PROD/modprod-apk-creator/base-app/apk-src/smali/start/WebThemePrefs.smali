.class public Lstart/WebThemePrefs;
.super Ljava/lang/Object;
.source "WebThemePrefs.java"

# Runtime web_theme preference (modprod_app / web_theme).
# Falls back to the string resource baked at build time.

.method public static get(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    const-string v0, "modprod_app"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0

    const-string v1, "web_theme"
    const-string v2, ""
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0

    if-eqz v0, :fallback
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :fallback
    return-object v0

    :fallback
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "web_theme"
    const-string v3, "string"
    invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    if-eqz v0, :default
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :default
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :default
    return-object v0

    :default
    const-string v0, "auto"
    return-object v0
.end method

.method public static set(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    if-nez p1, :done
    const-string v0, "modprod_app"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v1, "web_theme"
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :done
    return-void
.end method

.method public static showPicker(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 6

    if-eqz p0, :done

    const/4 v0, 0x4
    new-array v1, v0, [Ljava/lang/CharSequence;
    const/4 v2, 0x0
    const-string v3, "Auto (site)"
    aput-object v3, v1, v2
    const/4 v2, 0x1
    const-string v3, "Sombre natif"
    aput-object v3, v1, v2
    const/4 v2, 0x2
    const-string v3, "Sombre CSS"
    aput-object v3, v1, v2
    const/4 v2, 0x3
    const-string v3, "Inversion couleurs"
    aput-object v3, v1, v2

    new-array v0, v0, [Ljava/lang/String;
    const/4 v2, 0x0
    const-string v3, "auto"
    aput-object v3, v0, v2
    const/4 v2, 0x1
    const-string v3, "native"
    aput-object v3, v0, v2
    const/4 v2, 0x2
    const-string v3, "css"
    aput-object v3, v0, v2
    const/4 v2, 0x3
    const-string v3, "invert"
    aput-object v3, v0, v2

    invoke-static {p0}, Lstart/WebThemePrefs;->get(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0x0
    const/4 v4, 0x0

    :loop
    const/4 v5, 0x4
    if-ge v4, v5, :found
    aget-object v5, v0, v4
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :next
    move v3, v4
    goto :found
    :next
    add-int/lit8 v4, v4, 0x1
    goto :loop

    :found
    new-instance v2, Landroid/app/AlertDialog$Builder;
    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    const-string v4, "Theme des sites web"
    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    new-instance v4, Lstart/ThemeChoiceListener;
    invoke-direct {v4, p0, p1, v0}, Lstart/ThemeChoiceListener;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;[Ljava/lang/String;)V
    invoke-virtual {v2, v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    const-string v4, "Fermer"
    const/4 v5, 0x0
    invoke-virtual {v2, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :done
    return-void
.end method
