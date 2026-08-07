.class public Ll/udh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qa3;
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/tantan/library/svga/SVGAnimationView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p2}, Ll/udh0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string p2, "https://fe-static.tancdn.com/v1/raw/50cc4c31-1efe-4fa0-b33c-e24651eec4c2.svga"

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p2, p0, Ll/udh0;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/udh0;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGAnimationView;->setRequestCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public b()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/udh0;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/udh0;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Ll/udh0;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Ll/udh0;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/udh0;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public d(Ljava/lang/CharSequence;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/udh0;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vdh0;->b(Ll/udh0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    return-void
.end method
