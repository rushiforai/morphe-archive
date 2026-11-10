.class public Lstart/WebThemeInjector;
.super Ljava/lang/Object;
.source "WebThemeInjector.java"

.method public static inject(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 6

    if-eqz p1, :done

    invoke-static {p0}, Lstart/WebThemePrefs;->get(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "css"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :check_invert
    const-string v4, "(function(){if(document.getElementById('modprod-web-theme'))return;var s=document.createElement('style');s.id='modprod-web-theme';s.textContent=':root{color-scheme:dark!important}html,body{background-color:#101010!important;color:#eeeeee!important}';(document.head||document.documentElement).appendChild(s)})()"
    goto :run

    :check_invert
    const-string v1, "invert"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :done
    const-string v4, "(function(){if(document.getElementById('modprod-web-theme'))return;var s=document.createElement('style');s.id='modprod-web-theme';s.textContent='html{filter:invert(1) hue-rotate(180deg)!important;background:#fff!important}img,video,canvas,svg,picture{filter:invert(1) hue-rotate(180deg)!important}';(document.head||document.documentElement).appendChild(s)})()"

    :run
    const/4 v5, 0x0
    invoke-virtual {p1, v4, v5}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :done
    return-void
.end method
