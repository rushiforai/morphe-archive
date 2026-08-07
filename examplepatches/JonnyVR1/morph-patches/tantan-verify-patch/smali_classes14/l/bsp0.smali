.class public Ll/bsp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/webkit/WebResourceRequest;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# instance fields
.field public a:Landroid/webkit/WebResourceRequest;


# direct methods
.method public constructor <init>(Landroid/webkit/WebResourceRequest;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bsp0;->a:Landroid/webkit/WebResourceRequest;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getMethod()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bsp0;->a:Landroid/webkit/WebResourceRequest;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRequestHeaders()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bsp0;->a:Landroid/webkit/WebResourceRequest;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getRequestHeaders()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getUrl()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bsp0;->a:Landroid/webkit/WebResourceRequest;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hasGesture()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bsp0;->a:Landroid/webkit/WebResourceRequest;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->hasGesture()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isForMainFrame()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bsp0;->a:Landroid/webkit/WebResourceRequest;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isRedirect()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bsp0;->a:Landroid/webkit/WebResourceRequest;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->isRedirect()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
