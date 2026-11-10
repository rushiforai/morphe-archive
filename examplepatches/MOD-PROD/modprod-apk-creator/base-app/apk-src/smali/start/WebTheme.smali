.class public Lstart/WebTheme;
.super Ljava/lang/Object;
.source "WebTheme.java"

# web_theme: auto | native | css | invert
# Mode native only here. CSS/invert are applied by WebThemeInjector on page load.
# Mode is read from SharedPreferences (runtime) with string-resource fallback.
.method public static apply(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 5

    if-eqz p1, :done

    invoke-static {p0}, Lstart/WebThemePrefs;->get(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "native"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :clear_native

    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v2
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v4, 0x21
    if-lt v3, v4, :legacy

    const/4 v3, 0x1
    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setAlgorithmicDarkeningAllowed(Z)V
    goto :done

    :legacy
    const/16 v4, 0x1d
    if-lt v3, v4, :done
    const/4 v3, 0x2
    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setForceDark(I)V
    goto :done

    :clear_native
    # When leaving native mode, disable force-dark if API allows.
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v2
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v4, 0x21
    if-lt v3, v4, :clear_legacy
    const/4 v3, 0x0
    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setAlgorithmicDarkeningAllowed(Z)V
    goto :done

    :clear_legacy
    const/16 v4, 0x1d
    if-lt v3, v4, :done
    const/4 v3, 0x0
    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setForceDark(I)V

    :done
    return-void
.end method
