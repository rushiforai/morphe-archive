.class public Lstart/ThemeLongClick;
.super Ljava/lang/Object;
.source "ThemeLongClick.java"

.implements Landroid/view/View$OnLongClickListener;

.field private final a:Lstart/MainActivity;

.method public constructor <init>(Lstart/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lstart/ThemeLongClick;->a:Lstart/MainActivity;
    return-void
.end method

# Appui long sur une zone vide de la page : menu du thème.
# Sur un lien, une image ou un champ de saisie : comportement normal (renvoie false).
.method public onLongClick(Landroid/view/View;)Z
    .locals 3

    iget-object v0, p0, Lstart/ThemeLongClick;->a:Lstart/MainActivity;
    if-eqz v0, :pass

    iget-object v1, v0, Lstart/MainActivity;->x:Landroid/webkit/WebView;
    if-eqz v1, :pass

    invoke-virtual {v1}, Landroid/webkit/WebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;
    move-result-object v2
    if-eqz v2, :show

    invoke-virtual {v2}, Landroid/webkit/WebView$HitTestResult;->getType()I
    move-result v2
    if-nez v2, :pass

    :show
    invoke-static {v0, v1}, Lstart/WebThemePrefs;->showPicker(Landroid/app/Activity;Landroid/webkit/WebView;)V
    const/4 v0, 0x1
    return v0

    :pass
    const/4 v0, 0x0
    return v0
.end method
