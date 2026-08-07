.class public final Ll/d8s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroid/webkit/ValueCallback;

.field public final synthetic b:Ll/v7s0;

.field public final synthetic c:Landroid/webkit/WebView;

.field public final synthetic d:Z

.field public final synthetic e:Ll/f8s0;


# direct methods
.method public constructor <init>(Ll/f8s0;Ll/v7s0;Landroid/webkit/WebView;Z)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/d8s0;->b:Ll/v7s0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/d8s0;->c:Landroid/webkit/WebView;

    .line 4
    .line 5
    iput-boolean p4, p0, Ll/d8s0;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/d8s0;->e:Ll/f8s0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/c8s0;

    .line 13
    .line 14
    invoke-direct {p1, p0, p2, p3, p4}, Ll/c8s0;-><init>(Ll/d8s0;Ll/v7s0;Landroid/webkit/WebView;Z)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/d8s0;->a:Landroid/webkit/ValueCallback;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d8s0;->c:Landroid/webkit/WebView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getJavaScriptEnabled()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    iget-object v0, p0, Ll/d8s0;->c:Landroid/webkit/WebView;

    .line 14
    .line 15
    const-string v1, "(function() { return  {text:document.body.innerText}})();"

    .line 16
    .line 17
    iget-object v2, p0, Ll/d8s0;->a:Landroid/webkit/ValueCallback;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    iget-object p0, p0, Ll/d8s0;->a:Landroid/webkit/ValueCallback;

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    invoke-interface {p0, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
