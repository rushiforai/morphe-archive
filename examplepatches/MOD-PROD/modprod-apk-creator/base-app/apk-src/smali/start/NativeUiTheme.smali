.class public Lstart/NativeUiTheme;
.super Ljava/lang/Object;
.source "NativeUiTheme.java"

# Fond noir de la WebView seulement si un thème sombre est choisi (native, css, invert).
# En mode auto, le fond défini par le patch « ModProd Réglages » reste visible.
.method public static applyDarkBackground(Landroid/webkit/WebView;)V
    .locals 2

    if-eqz p0, :done

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0}, Lstart/WebThemePrefs;->get(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "auto"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :done

    const/high16 v0, -0x1000000
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    :done
    return-void
.end method
