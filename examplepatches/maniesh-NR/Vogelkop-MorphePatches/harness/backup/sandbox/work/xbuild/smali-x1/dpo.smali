.class public final Ldpo;
.super Lsxo;
.source "SourceFile"


# instance fields
.field public final d:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;Ljava/lang/String;Lmzo;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lsxo;-><init>(Landroid/view/View;Ljava/lang/String;Lmzo;)V

    iput-object p1, p0, Ldpo;->d:Landroid/webkit/WebView;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 1

    return-void
.end method

.method public final c()V
    .registers 3

    const-string v0, "window.__operaOm && window.__operaOm.impression();"

    const/4 v1, 0x0

    iget-object p0, p0, Ldpo;->d:Landroid/webkit/WebView;

    invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method
