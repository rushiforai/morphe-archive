.class public interface abstract Ll/hul;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract a()V
.end method

.method public abstract c(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract d(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract e()Z
.end method

.method public abstract f(Ljava/lang/String;)V
.end method

.method public abstract g(Ljava/lang/String;)V
.end method

.method public abstract getBid()Ljava/lang/String;
.end method

.method public abstract getBoost()Ll/gjw;
.end method

.method public abstract getContainerScaleView()Landroid/view/ViewGroup;
.end method

.method public abstract getLogSessionKey()Ljava/lang/String;
.end method

.method public abstract getMkWebRebuildData()Ll/nlw;
.end method

.method public abstract getOriginURL()Ljava/lang/String;
.end method

.method public abstract getRealContext()Landroid/content/Context;
.end method

.method public abstract getResourceResponse()Ll/x4d0;
.end method

.method public abstract getView()Landroid/webkit/WebView;
.end method

.method public abstract getWebContext()Landroid/content/Context;
.end method

.method public abstract getWebViewId()Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getWebViewParent()Landroid/view/ViewParent;
.end method

.method public abstract getWebViewPkgInfoCache()Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;
.end method

.method public abstract getWebViewUrl()Ljava/lang/String;
.end method

.method public abstract getWebWorkerId()Ljava/lang/String;
.end method

.method public abstract h(Ljava/lang/String;)V
.end method

.method public abstract i(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/webkit/ValueCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract isDestroyed()Z
.end method

.method public abstract isVisible()Z
.end method

.method public abstract setWebDrawingCacheEnabled(Z)V
.end method

.method public abstract setWebViewPost(Ljava/lang/Runnable;)V
.end method
