.class public Lstart/ThemeChoiceListener;
.super Ljava/lang/Object;
.source "ThemeChoiceListener.java"

.implements Landroid/content/DialogInterface$OnClickListener;

.field private final a:Landroid/app/Activity;
.field private final b:Landroid/webkit/WebView;
.field private final c:[Ljava/lang/String;

.method public constructor <init>(Landroid/app/Activity;Landroid/webkit/WebView;[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lstart/ThemeChoiceListener;->a:Landroid/app/Activity;
    iput-object p2, p0, Lstart/ThemeChoiceListener;->b:Landroid/webkit/WebView;
    iput-object p3, p0, Lstart/ThemeChoiceListener;->c:[Ljava/lang/String;
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    iget-object v0, p0, Lstart/ThemeChoiceListener;->c:[Ljava/lang/String;
    if-eqz v0, :dismiss
    if-ltz p2, :dismiss
    array-length v1, v0
    if-ge p2, v1, :dismiss

    aget-object v0, v0, p2
    iget-object v1, p0, Lstart/ThemeChoiceListener;->a:Landroid/app/Activity;
    invoke-static {v1, v0}, Lstart/WebThemePrefs;->set(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v2, p0, Lstart/ThemeChoiceListener;->b:Landroid/webkit/WebView;
    if-eqz v2, :toast
    invoke-static {v1, v2}, Lstart/WebTheme;->apply(Landroid/app/Activity;Landroid/webkit/WebView;)V
    invoke-virtual {v2}, Landroid/webkit/WebView;->reload()V

    :toast
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "Theme: "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0x0
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v1
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    :dismiss
    if-eqz p1, :done
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :done
    return-void
.end method
